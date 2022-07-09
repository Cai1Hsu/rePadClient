package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.BuildListener;
import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Main;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.ParserSupports;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.VectorSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Ant.class */
public class Ant extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$Project;
    private Project newProject;
    private File dir = null;
    private String antFile = null;
    private String output = null;
    private boolean inheritAll = true;
    private boolean inheritRefs = false;
    private Vector properties = new Vector();
    private Vector references = new Vector();
    private PrintStream out = null;
    private Vector propertySets = new Vector();
    private Vector targets = new Vector();
    private boolean targetAttributeSet = false;
    private boolean useNativeBasedir = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Ant$PropertyType.class */
    private static final class PropertyType {
        private static final PropertyType PLAIN = new PropertyType();
        private static final PropertyType INHERITED = new PropertyType();
        private static final PropertyType USER = new PropertyType();

        private PropertyType() {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Ant$Reference.class */
    public static class Reference extends org.apache.tools.ant.types.Reference {
        private String targetid = null;

        public String getToRefid() {
            return this.targetid;
        }

        public void setToRefid(String str) {
            this.targetid = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Ant$TargetElement.class */
    public static class TargetElement {
        private String name;

        public String getName() {
            return this.name;
        }

        public void setName(String str) {
            this.name = str;
        }
    }

    public Ant() {
    }

    public Ant(Task task) {
        bindToOwner(task);
    }

    private void addAlmostAll(Hashtable hashtable, PropertyType propertyType) {
        Enumeration keys = hashtable.keys();
        while (keys.hasMoreElements()) {
            String obj = keys.nextElement().toString();
            if (!MagicNames.PROJECT_BASEDIR.equals(obj) && !MagicNames.ANT_FILE.equals(obj)) {
                String obj2 = hashtable.get(obj).toString();
                if (propertyType == PropertyType.PLAIN) {
                    if (this.newProject.getProperty(obj) == null) {
                        this.newProject.setNewProperty(obj, obj2);
                    }
                } else if (propertyType == PropertyType.USER) {
                    this.newProject.setUserProperty(obj, obj2);
                } else if (propertyType == PropertyType.INHERITED) {
                    this.newProject.setInheritedProperty(obj, obj2);
                }
            }
        }
    }

    private void addReferences() throws BuildException {
        Hashtable hashtable = (Hashtable) getProject().getReferences().clone();
        Hashtable references = this.newProject.getReferences();
        if (this.references.size() > 0) {
            Enumeration elements = this.references.elements();
            while (elements.hasMoreElements()) {
                Reference reference = (Reference) elements.nextElement();
                String refId = reference.getRefId();
                if (refId == null) {
                    throw new BuildException("the refid attribute is required for reference elements");
                }
                if (!hashtable.containsKey(refId)) {
                    log(new StringBuffer().append("Parent project doesn't contain any reference '").append(refId).append("'").toString(), 1);
                } else {
                    hashtable.remove(refId);
                    String toRefid = reference.getToRefid();
                    String str = toRefid;
                    if (toRefid == null) {
                        str = refId;
                    }
                    copyReference(refId, str);
                }
            }
        }
        if (this.inheritRefs) {
            Enumeration keys = hashtable.keys();
            while (keys.hasMoreElements()) {
                String str2 = (String) keys.nextElement();
                if (!references.containsKey(str2)) {
                    copyReference(str2, str2);
                    this.newProject.inheritIDReferences(getProject());
                }
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void copyReference(String str, String str2) {
        Class<?> cls;
        Object reference = getProject().getReference(str);
        if (reference == null) {
            log(new StringBuffer().append("No object referenced by ").append(str).append(". Can't copy to ").append(str2).toString(), 1);
            return;
        }
        Class<?> cls2 = reference.getClass();
        Object obj = reference;
        try {
            Method method = cls2.getMethod("clone", new Class[0]);
            obj = reference;
            if (method != null) {
                Object invoke = method.invoke(reference, new Object[0]);
                obj = invoke;
                log(new StringBuffer().append("Adding clone of reference ").append(str).toString(), 4);
                obj = invoke;
            }
        } catch (Exception e) {
        }
        if (obj instanceof ProjectComponent) {
            ((ProjectComponent) obj).setProject(this.newProject);
        } else {
            try {
                if (class$org$apache$tools$ant$Project == null) {
                    cls = class$("org.apache.tools.ant.Project");
                    class$org$apache$tools$ant$Project = cls;
                } else {
                    cls = class$org$apache$tools$ant$Project;
                }
                Method method2 = cls2.getMethod("setProject", cls);
                if (method2 != null) {
                    method2.invoke(obj, this.newProject);
                }
            } catch (NoSuchMethodException e2) {
            } catch (Exception e3) {
                throw new BuildException(new StringBuffer().append("Error setting new project instance for reference with id ").append(str).toString(), e3, getLocation());
            }
        }
        this.newProject.addReference(str2, obj);
    }

    private Iterator getBuildListeners() {
        return getProject().getBuildListeners().iterator();
    }

    private void initializeProject() {
        this.newProject.setInputHandler(getProject().getInputHandler());
        Iterator buildListeners = getBuildListeners();
        while (buildListeners.hasNext()) {
            this.newProject.addBuildListener((BuildListener) buildListeners.next());
        }
        if (this.output != null) {
            try {
                this.out = new PrintStream(new FileOutputStream(this.dir != null ? FILE_UTILS.resolveFile(this.dir, this.output) : getProject().resolveFile(this.output)));
                DefaultLogger defaultLogger = new DefaultLogger();
                defaultLogger.setMessageOutputLevel(2);
                defaultLogger.setOutputPrintStream(this.out);
                defaultLogger.setErrorPrintStream(this.out);
                this.newProject.addBuildListener(defaultLogger);
            } catch (IOException e) {
                log(new StringBuffer().append("Ant: Can't set output to ").append(this.output).toString());
            }
        }
        if (this.useNativeBasedir) {
            addAlmostAll(getProject().getUserProperties(), PropertyType.USER);
        } else {
            getProject().copyUserProperties(this.newProject);
        }
        if (!this.inheritAll) {
            this.newProject.initProperties();
        } else {
            addAlmostAll(getProject().getProperties(), PropertyType.PLAIN);
        }
        Enumeration elements = this.propertySets.elements();
        while (elements.hasMoreElements()) {
            addAlmostAll(((PropertySet) elements.nextElement()).getProperties(), PropertyType.PLAIN);
        }
    }

    private void overrideProperties() throws BuildException {
        HashSet hashSet = new HashSet();
        for (int size = this.properties.size() - 1; size >= 0; size--) {
            Property property = (Property) this.properties.get(size);
            if (property.getName() != null && !property.getName().equals("")) {
                if (hashSet.contains(property.getName())) {
                    this.properties.remove(size);
                } else {
                    hashSet.add(property.getName());
                }
            }
        }
        Enumeration elements = this.properties.elements();
        while (elements.hasMoreElements()) {
            Property property2 = (Property) elements.nextElement();
            property2.setProject(this.newProject);
            property2.execute();
        }
        if (this.useNativeBasedir) {
            addAlmostAll(getProject().getInheritedProperties(), PropertyType.INHERITED);
        } else {
            getProject().copyInheritedProperties(this.newProject);
        }
    }

    private void reinit() {
        init();
    }

    public void addConfiguredTarget(TargetElement targetElement) {
        if (this.targetAttributeSet) {
            throw new BuildException("nested target is incompatible with the target attribute");
        }
        String name = targetElement.getName();
        if (name.equals("")) {
            throw new BuildException("target name must not be empty");
        }
        this.targets.add(name);
    }

    public void addPropertyset(PropertySet propertySet) {
        this.propertySets.addElement(propertySet);
    }

    public void addReference(Reference reference) {
        this.references.addElement(reference);
    }

    public Property createProperty() {
        Property property = new Property(true, getProject());
        property.setProject(getNewProject());
        property.setTaskName(ParserSupports.PROPERTY);
        this.properties.addElement(property);
        return property;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        String defaultTarget;
        File file = this.dir;
        String str = this.antFile;
        VectorSet vectorSet = new VectorSet(this.targets);
        try {
            getNewProject();
            if (this.dir == null && this.inheritAll) {
                this.dir = getProject().getBaseDir();
            }
            initializeProject();
            if (this.dir == null) {
                this.dir = getProject().getBaseDir();
            } else if (!this.useNativeBasedir) {
                this.newProject.setBaseDir(this.dir);
                if (file != null) {
                    this.newProject.setInheritedProperty(MagicNames.PROJECT_BASEDIR, this.dir.getAbsolutePath());
                }
            }
            overrideProperties();
            if (this.antFile == null) {
                this.antFile = getDefaultBuildFile();
            }
            File resolveFile = FILE_UTILS.resolveFile(this.dir, this.antFile);
            this.antFile = resolveFile.getAbsolutePath();
            log(new StringBuffer().append("calling target(s) ").append(vectorSet.size() > 0 ? vectorSet.toString() : "[default]").append(" in build file ").append(this.antFile).toString(), 3);
            this.newProject.setUserProperty(MagicNames.ANT_FILE, this.antFile);
            String property = getProject().getProperty(MagicNames.ANT_FILE);
            if (property != null && resolveFile.equals(getProject().resolveFile(property)) && getOwningTarget() != null && getOwningTarget().getName().equals("")) {
                if (!getTaskName().equals("antcall")) {
                    throw new BuildException(new StringBuffer().append(getTaskName()).append(" task at the").append(" top level must not invoke").append(" its own build file.").toString());
                }
                throw new BuildException("antcall must not be used at the top level.");
            }
            try {
                ProjectHelper.configureProject(this.newProject, resolveFile);
                if (vectorSet.size() == 0 && (defaultTarget = this.newProject.getDefaultTarget()) != null) {
                    vectorSet.add(defaultTarget);
                }
                if (this.newProject.getProperty(MagicNames.ANT_FILE).equals(getProject().getProperty(MagicNames.ANT_FILE)) && getOwningTarget() != null) {
                    String name = getOwningTarget().getName();
                    if (vectorSet.contains(name)) {
                        throw new BuildException(new StringBuffer().append(getTaskName()).append(" task calling ").append("its own parent target.").toString());
                    }
                    boolean z = false;
                    Iterator it = vectorSet.iterator();
                    while (!z && it.hasNext()) {
                        Target target = (Target) getProject().getTargets().get(it.next());
                        z |= target != null && target.dependsOn(name);
                    }
                    if (z) {
                        throw new BuildException(new StringBuffer().append(getTaskName()).append(" task calling a target").append(" that depends on").append(" its parent target '").append(name).append("'.").toString());
                    }
                }
                addReferences();
                if (vectorSet.size() > 0 && (vectorSet.size() != 1 || !"".equals(vectorSet.get(0)))) {
                    try {
                        log(new StringBuffer().append("Entering ").append(this.antFile).append("...").toString(), 3);
                        this.newProject.fireSubBuildStarted();
                        this.newProject.executeTargets(vectorSet);
                        log(new StringBuffer().append("Exiting ").append(this.antFile).append(".").toString(), 3);
                        this.newProject.fireSubBuildFinished(null);
                    } catch (BuildException e) {
                        throw ProjectHelper.addLocationToBuildException(e, getLocation());
                    }
                }
                this.newProject = null;
                Enumeration elements = this.properties.elements();
                while (elements.hasMoreElements()) {
                    ((Property) elements.nextElement()).setProject(null);
                }
                if (this.output != null && this.out != null) {
                    try {
                        this.out.close();
                    } catch (Exception e2) {
                    }
                }
                this.dir = file;
                this.antFile = str;
            } catch (BuildException e3) {
                throw ProjectHelper.addLocationToBuildException(e3, getLocation());
            }
        } catch (Throwable th) {
            this.newProject = null;
            Enumeration elements2 = this.properties.elements();
            while (elements2.hasMoreElements()) {
                ((Property) elements2.nextElement()).setProject(null);
            }
            if (this.output != null && this.out != null) {
                try {
                    this.out.close();
                } catch (Exception e4) {
                }
            }
            this.dir = file;
            this.antFile = str;
            throw th;
        }
    }

    protected String getDefaultBuildFile() {
        return Main.DEFAULT_BUILD_FILENAME;
    }

    protected Project getNewProject() {
        if (this.newProject == null) {
            reinit();
        }
        return this.newProject;
    }

    @Override // org.apache.tools.ant.Task
    public void handleErrorFlush(String str) {
        if (this.newProject != null) {
            this.newProject.demuxFlush(str, true);
        } else {
            super.handleErrorFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void handleErrorOutput(String str) {
        if (this.newProject != null) {
            this.newProject.demuxOutput(str, true);
        } else {
            super.handleErrorOutput(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void handleFlush(String str) {
        if (this.newProject != null) {
            this.newProject.demuxFlush(str, false);
        } else {
            super.handleFlush(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public int handleInput(byte[] bArr, int i, int i2) throws IOException {
        return this.newProject != null ? this.newProject.demuxInput(bArr, i, i2) : super.handleInput(bArr, i, i2);
    }

    @Override // org.apache.tools.ant.Task
    public void handleOutput(String str) {
        if (this.newProject != null) {
            this.newProject.demuxOutput(str, false);
        } else {
            super.handleOutput(str);
        }
    }

    @Override // org.apache.tools.ant.Task
    public void init() {
        this.newProject = getProject().createSubProject();
        this.newProject.setJavaVersionProperty();
    }

    public void setAntfile(String str) {
        this.antFile = str;
    }

    public void setDir(File file) {
        this.dir = file;
    }

    public void setInheritAll(boolean z) {
        this.inheritAll = z;
    }

    public void setInheritRefs(boolean z) {
        this.inheritRefs = z;
    }

    public void setOutput(String str) {
        this.output = str;
    }

    public void setTarget(String str) {
        if (str.equals("")) {
            throw new BuildException("target attribute must not be empty");
        }
        this.targets.add(str);
        this.targetAttributeSet = true;
    }

    public void setUseNativeBasedir(boolean z) {
        this.useNativeBasedir = z;
    }
}
