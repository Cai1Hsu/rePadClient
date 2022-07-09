package org.apache.tools.ant.types;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Environment;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/CommandlineJava.class */
public class CommandlineJava implements Cloneable {
    private String vmVersion;
    private Commandline vmCommand = new Commandline();
    private Commandline javaCommand = new Commandline();
    private SysProperties sysProperties = new SysProperties();
    private Path classpath = null;
    private Path bootclasspath = null;
    private String maxMemory = null;
    private Assertions assertions = null;
    private boolean executeJar = false;
    private boolean cloneVm = false;

    /* loaded from: classes.jar:org/apache/tools/ant/types/CommandlineJava$SysProperties.class */
    public static class SysProperties extends Environment implements Cloneable {
        Properties sys = null;
        private Vector propertySets = new Vector();

        private Properties mergePropertySets() {
            Properties properties = new Properties();
            Enumeration elements = this.propertySets.elements();
            while (elements.hasMoreElements()) {
                properties.putAll(((PropertySet) elements.nextElement()).getProperties());
            }
            return properties;
        }

        public void addDefinitionsToList(ListIterator listIterator) {
            String[] variables = super.getVariables();
            if (variables != null) {
                for (String str : variables) {
                    listIterator.add(new StringBuffer().append(MSVSSConstants.FLAG_CODEDIFF).append(str).toString());
                }
            }
            Properties mergePropertySets = mergePropertySets();
            Enumeration keys = mergePropertySets.keys();
            while (keys.hasMoreElements()) {
                String str2 = (String) keys.nextElement();
                listIterator.add(new StringBuffer().append(MSVSSConstants.FLAG_CODEDIFF).append(str2).append("=").append(mergePropertySets.getProperty(str2)).toString());
            }
        }

        public void addSysproperties(SysProperties sysProperties) {
            this.variables.addAll(sysProperties.variables);
            this.propertySets.addAll(sysProperties.propertySets);
        }

        public void addSyspropertyset(PropertySet propertySet) {
            this.propertySets.addElement(propertySet);
        }

        public Object clone() throws CloneNotSupportedException {
            SysProperties sysProperties;
            try {
                sysProperties = (SysProperties) super.clone();
                sysProperties.variables = (Vector) this.variables.clone();
                sysProperties.propertySets = (Vector) this.propertySets.clone();
            } catch (CloneNotSupportedException e) {
                sysProperties = null;
            }
            return sysProperties;
        }

        @Override // org.apache.tools.ant.types.Environment
        public String[] getVariables() throws BuildException {
            LinkedList linkedList = new LinkedList();
            addDefinitionsToList(linkedList.listIterator());
            return linkedList.size() == 0 ? null : (String[]) linkedList.toArray(new String[linkedList.size()]);
        }

        public void restoreSystem() throws BuildException {
            if (this.sys == null) {
                throw new BuildException("Unbalanced nesting of SysProperties");
            }
            try {
                System.setProperties(this.sys);
                this.sys = null;
            } catch (SecurityException e) {
                throw new BuildException("Cannot modify system properties", e);
            }
        }

        public void setSystem() throws BuildException {
            try {
                this.sys = System.getProperties();
                Properties properties = new Properties();
                Enumeration<?> propertyNames = this.sys.propertyNames();
                while (propertyNames.hasMoreElements()) {
                    String str = (String) propertyNames.nextElement();
                    String property = this.sys.getProperty(str);
                    if (str != null && property != null) {
                        properties.put(str, property);
                    }
                }
                properties.putAll(mergePropertySets());
                Enumeration elements = this.variables.elements();
                while (elements.hasMoreElements()) {
                    Environment.Variable variable = (Environment.Variable) elements.nextElement();
                    variable.validate();
                    properties.put(variable.getKey(), variable.getValue());
                }
                System.setProperties(properties);
            } catch (SecurityException e) {
                throw new BuildException("Cannot modify system properties", e);
            }
        }

        public int size() {
            return this.variables.size() + mergePropertySets().size();
        }
    }

    public CommandlineJava() {
        setVm(JavaEnvUtils.getJreExecutable("java"));
        setVmversion(JavaEnvUtils.getJavaVersion());
    }

    private void addCommandsToList(ListIterator listIterator) {
        getActualVMCommand().addCommandToList(listIterator);
        this.sysProperties.addDefinitionsToList(listIterator);
        if (isCloneVm()) {
            SysProperties sysProperties = new SysProperties();
            PropertySet propertySet = new PropertySet();
            PropertySet.BuiltinPropertySetName builtinPropertySetName = new PropertySet.BuiltinPropertySetName();
            builtinPropertySetName.setValue("system");
            propertySet.appendBuiltin(builtinPropertySetName);
            sysProperties.addSyspropertyset(propertySet);
            sysProperties.addDefinitionsToList(listIterator);
        }
        Path calculateBootclasspath = calculateBootclasspath(true);
        if (calculateBootclasspath.size() > 0) {
            listIterator.add(new StringBuffer().append("-Xbootclasspath:").append(calculateBootclasspath.toString()).toString());
        }
        if (haveClasspath()) {
            listIterator.add("-classpath");
            listIterator.add(this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE).toString());
        }
        if (getAssertions() != null) {
            getAssertions().applyAssertions(listIterator);
        }
        if (this.executeJar) {
            listIterator.add("-jar");
        }
        this.javaCommand.addCommandToList(listIterator);
    }

    private Path calculateBootclasspath(boolean z) {
        Path concatSystemBootClasspath;
        if (this.vmVersion.startsWith("1.1")) {
            if (this.bootclasspath != null && z) {
                this.bootclasspath.log("Ignoring bootclasspath as the target VM doesn't support it.");
            }
            concatSystemBootClasspath = new Path(null);
        } else {
            Path path = this.bootclasspath;
            Path path2 = path;
            if (path == null) {
                path2 = new Path(null);
            }
            concatSystemBootClasspath = path2.concatSystemBootClasspath(isCloneVm() ? "last" : Definer.OnError.POLICY_IGNORE);
        }
        return concatSystemBootClasspath;
    }

    private boolean isCloneVm() {
        return this.cloneVm || "true".equals(System.getProperty("ant.build.clonevm"));
    }

    public void addSysproperties(SysProperties sysProperties) {
        this.sysProperties.addSysproperties(sysProperties);
    }

    public void addSysproperty(Environment.Variable variable) {
        this.sysProperties.addVariable(variable);
    }

    public void addSyspropertyset(PropertySet propertySet) {
        this.sysProperties.addSyspropertyset(propertySet);
    }

    public void clearJavaArgs() {
        this.javaCommand.clearArgs();
    }

    public Object clone() throws CloneNotSupportedException {
        try {
            CommandlineJava commandlineJava = (CommandlineJava) super.clone();
            commandlineJava.vmCommand = (Commandline) this.vmCommand.clone();
            commandlineJava.javaCommand = (Commandline) this.javaCommand.clone();
            commandlineJava.sysProperties = (SysProperties) this.sysProperties.clone();
            if (this.classpath != null) {
                commandlineJava.classpath = (Path) this.classpath.clone();
            }
            if (this.bootclasspath != null) {
                commandlineJava.bootclasspath = (Path) this.bootclasspath.clone();
            }
            if (this.assertions != null) {
                commandlineJava.assertions = (Assertions) this.assertions.clone();
            }
            return commandlineJava;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    public Commandline.Argument createArgument() {
        return this.javaCommand.createArgument();
    }

    public Path createBootclasspath(Project project) {
        if (this.bootclasspath == null) {
            this.bootclasspath = new Path(project);
        }
        return this.bootclasspath;
    }

    public Path createClasspath(Project project) {
        if (this.classpath == null) {
            this.classpath = new Path(project);
        }
        return this.classpath;
    }

    public Commandline.Argument createVmArgument() {
        return this.vmCommand.createArgument();
    }

    public String describeCommand() {
        return Commandline.describeCommand(getCommandline());
    }

    public String describeJavaCommand() {
        return Commandline.describeCommand(getJavaCommand());
    }

    protected Commandline getActualVMCommand() {
        Commandline commandline = (Commandline) this.vmCommand.clone();
        if (this.maxMemory != null) {
            if (this.vmVersion.startsWith("1.1")) {
                commandline.createArgument().setValue(new StringBuffer().append("-mx").append(this.maxMemory).toString());
            } else {
                commandline.createArgument().setValue(new StringBuffer().append("-Xmx").append(this.maxMemory).toString());
            }
        }
        return commandline;
    }

    public Assertions getAssertions() {
        return this.assertions;
    }

    public Path getBootclasspath() {
        return this.bootclasspath;
    }

    public String getClassname() {
        return !this.executeJar ? this.javaCommand.getExecutable() : null;
    }

    public Path getClasspath() {
        return this.classpath;
    }

    public String[] getCommandline() {
        LinkedList linkedList = new LinkedList();
        addCommandsToList(linkedList.listIterator());
        return (String[]) linkedList.toArray(new String[linkedList.size()]);
    }

    public String getJar() {
        return this.executeJar ? this.javaCommand.getExecutable() : null;
    }

    public Commandline getJavaCommand() {
        return this.javaCommand;
    }

    public SysProperties getSystemProperties() {
        return this.sysProperties;
    }

    public Commandline getVmCommand() {
        return getActualVMCommand();
    }

    public String getVmversion() {
        return this.vmVersion;
    }

    protected boolean haveBootclasspath(boolean z) {
        return calculateBootclasspath(z).size() > 0;
    }

    public boolean haveClasspath() {
        Path concatSystemClasspath = this.classpath != null ? this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE) : null;
        return concatSystemClasspath != null && concatSystemClasspath.toString().trim().length() > 0;
    }

    public void restoreSystemProperties() throws BuildException {
        this.sysProperties.restoreSystem();
    }

    public void setAssertions(Assertions assertions) {
        this.assertions = assertions;
    }

    public void setClassname(String str) {
        this.javaCommand.setExecutable(str);
        this.executeJar = false;
    }

    public void setCloneVm(boolean z) {
        this.cloneVm = z;
    }

    public void setJar(String str) {
        this.javaCommand.setExecutable(str);
        this.executeJar = true;
    }

    public void setMaxmemory(String str) {
        this.maxMemory = str;
    }

    public void setSystemProperties() throws BuildException {
        this.sysProperties.setSystem();
    }

    public void setVm(String str) {
        this.vmCommand.setExecutable(str);
    }

    public void setVmversion(String str) {
        this.vmVersion = str;
    }

    public int size() {
        int size = getActualVMCommand().size() + this.javaCommand.size() + this.sysProperties.size();
        int i = size;
        if (isCloneVm()) {
            i = size + System.getProperties().size();
        }
        int i2 = i;
        if (haveClasspath()) {
            i2 = i + 2;
        }
        int i3 = i2;
        if (calculateBootclasspath(true).size() > 0) {
            i3 = i2 + 1;
        }
        int i4 = i3;
        if (this.executeJar) {
            i4 = i3 + 1;
        }
        int i5 = i4;
        if (getAssertions() != null) {
            i5 = i4 + getAssertions().size();
        }
        return i5;
    }

    public String toString() {
        return Commandline.toString(getCommandline());
    }
}
