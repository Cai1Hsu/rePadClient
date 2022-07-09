package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.ExecTask;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteStreamHandler;
import org.apache.tools.ant.taskdefs.Java;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool.class */
public class BorlandDeploymentTool extends GenericDeploymentTool implements ExecuteStreamHandler {
    static final int BAS = 4;
    protected static final String BAS_DD = "ejb-inprise.xml";
    static final int BES = 5;
    protected static final String BES_DD = "ejb-borland.xml";
    protected static final String DEFAULT_BAS45_EJB11_DTD_LOCATION = "/com/inprise/j2ee/xml/dtds/ejb-jar.dtd";
    protected static final String DEFAULT_BAS_DTD_LOCATION = "/com/inprise/j2ee/xml/dtds/ejb-inprise.dtd";
    protected static final String JAVA2IIOP = "java2iiop";
    public static final String PUBLICID_BORLAND_EJB = "-//Inprise Corporation//DTD Enterprise JavaBeans 1.1//EN";
    protected static final String VERIFY = "com.inprise.ejb.util.Verify";
    static Class class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient;
    private String borlandDTD;
    private String jarSuffix = "-ejb.jar";
    private boolean java2iiopdebug = false;
    private String java2iioparams = null;
    private boolean generateclient = false;
    private int version = 4;
    private boolean verify = true;
    private String verifyArgs = "";
    private Hashtable genfiles = new Hashtable();

    private void buildBorlandStubs(Iterator it) {
        Execute execute = new Execute(this);
        Project project = getTask().getProject();
        execute.setAntRun(project);
        execute.setWorkingDirectory(project.getBaseDir());
        Commandline commandline = new Commandline();
        commandline.setExecutable(JAVA2IIOP);
        if (this.java2iiopdebug) {
            commandline.createArgument().setValue("-VBJdebug");
        }
        commandline.createArgument().setValue("-VBJclasspath");
        commandline.createArgument().setPath(getCombinedClasspath());
        commandline.createArgument().setValue("-list_files");
        commandline.createArgument().setValue("-no_tie");
        if (this.java2iioparams != null) {
            log(new StringBuffer().append("additional  ").append(this.java2iioparams).append(" to java2iiop ").toString(), 0);
            commandline.createArgument().setLine(this.java2iioparams);
        }
        commandline.createArgument().setValue("-root_dir");
        commandline.createArgument().setValue(getConfig().srcDir.getAbsolutePath());
        commandline.createArgument().setValue("-compile");
        while (it.hasNext()) {
            commandline.createArgument().setValue(it.next().toString());
        }
        try {
            log("Calling java2iiop", 3);
            log(commandline.describeCommand(), 4);
            execute.setCommandline(commandline.getCommandline());
            int execute2 = execute.execute();
            if (!Execute.isFailure(execute2)) {
                return;
            }
            throw new BuildException(new StringBuffer().append("Failed executing java2iiop (ret code is ").append(execute2).append(")").toString(), getTask().getLocation());
        } catch (IOException e) {
            log(new StringBuffer().append("java2iiop exception :").append(e.getMessage()).toString(), 0);
            throw new BuildException(e, getTask().getLocation());
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void generateClient(File file) {
        Class cls;
        Project project = getTask().getProject();
        if (class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient == null) {
            cls = class$("org.apache.tools.ant.taskdefs.optional.ejb.BorlandGenerateClient");
            class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$optional$ejb$BorlandGenerateClient;
        }
        project.addTaskDefinition("internal_bas_generateclient", cls);
        log(new StringBuffer().append("generate client for ").append(file).toString(), 2);
        try {
            BorlandGenerateClient borlandGenerateClient = (BorlandGenerateClient) getTask().getProject().createTask("internal_bas_generateclient");
            borlandGenerateClient.setEjbjar(file);
            borlandGenerateClient.setDebug(this.java2iiopdebug);
            Path combinedClasspath = getCombinedClasspath();
            if (combinedClasspath != null) {
                borlandGenerateClient.setClasspath(combinedClasspath);
            }
            borlandGenerateClient.setVersion(this.version);
            borlandGenerateClient.setTaskName("generate client");
            borlandGenerateClient.execute();
        } catch (Exception e) {
            throw new BuildException(new StringBuffer().append("Exception while calling com.inprise.ejb.util.Verify Details: ").append(e.toString()).toString(), e);
        }
    }

    private String toClass(String str) {
        return str.substring(0, str.lastIndexOf(".class")).replace('\\', '.');
    }

    private String toClassFile(String str) {
        return new StringBuffer().append(str.substring(0, str.lastIndexOf(".java"))).append(".class").toString();
    }

    private void verifyBorlandJar(File file) {
        if (this.version == 4) {
            verifyBorlandJarV4(file);
        } else if (this.version == 5) {
            verifyBorlandJarV5(file);
        } else {
            log(new StringBuffer().append("verify jar skipped because the version is invalid [").append(this.version).append("]").toString(), 1);
        }
    }

    private void verifyBorlandJarV4(File file) {
        Exception e;
        log(new StringBuffer().append("verify BAS ").append(file).toString(), 2);
        try {
            String stringBuffer = new StringBuffer().append(this.verifyArgs).append(" ").append(file.getPath()).toString();
            Java java = new Java(getTask());
            try {
                java.setTaskName("verify");
                java.setClassname(VERIFY);
                java.createArg().setLine(stringBuffer);
                Path combinedClasspath = getCombinedClasspath();
                if (combinedClasspath != null) {
                    java.setClasspath(combinedClasspath);
                    java.setFork(true);
                }
                log(new StringBuffer().append("Calling com.inprise.ejb.util.Verify for ").append(file.toString()).toString(), 3);
                java.execute();
            } catch (Exception e2) {
                e = e2;
                throw new BuildException(new StringBuffer().append("Exception while calling com.inprise.ejb.util.Verify Details: ").append(e.toString()).toString(), e);
            }
        } catch (Exception e3) {
            e = e3;
        }
    }

    private void verifyBorlandJarV5(File file) {
        Exception e;
        log(new StringBuffer().append("verify BES ").append(file).toString(), 2);
        try {
            ExecTask execTask = new ExecTask(getTask());
            try {
                execTask.setDir(new File("."));
                execTask.setExecutable("iastool");
                if (getCombinedClasspath() != null) {
                    execTask.createArg().setValue("-VBJclasspath");
                    execTask.createArg().setValue(getCombinedClasspath().toString());
                }
                if (this.java2iiopdebug) {
                    execTask.createArg().setValue("-debug");
                }
                execTask.createArg().setValue("-verify");
                execTask.createArg().setValue("-src");
                execTask.createArg().setValue(file.getPath());
                log("Calling iastool", 3);
                execTask.execute();
            } catch (Exception e2) {
                e = e2;
                throw new BuildException(new StringBuffer().append("Exception while calling generateclient Details: ").append(e.toString()).toString(), e);
            }
        } catch (Exception e3) {
            e = e3;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void addVendorFiles(Hashtable hashtable, String str) {
        if (this.version == 5 || this.version == 4) {
            String str2 = this.version == 5 ? BES_DD : BAS_DD;
            log(new StringBuffer().append("vendor file : ").append(str).append(str2).toString(), 4);
            File file = new File(getConfig().descriptorDir, new StringBuffer().append(str).append(str2).toString());
            if (!file.exists()) {
                log(new StringBuffer().append("Unable to locate borland deployment descriptor. It was expected to be in ").append(file.getPath()).toString(), 1);
                return;
            }
            log(new StringBuffer().append("Borland specific file found ").append(file).toString(), 3);
            hashtable.put(new StringBuffer().append("META-INF/").append(str2).toString(), file);
            return;
        }
        throw new BuildException(new StringBuffer().append("version ").append(this.version).append(" is not supported").toString());
    }

    protected DescriptorHandler getBorlandDescriptorHandler(File file) {
        DescriptorHandler descriptorHandler = new DescriptorHandler(this, getTask(), file, file) { // from class: org.apache.tools.ant.taskdefs.optional.ejb.BorlandDeploymentTool.1
            private final BorlandDeploymentTool this$0;
            private final File val$srcDir;

            {
                this.this$0 = this;
                this.val$srcDir = file;
            }

            @Override // org.apache.tools.ant.taskdefs.optional.ejb.DescriptorHandler
            protected void processElement() {
                if (this.currentElement.equals("type-storage")) {
                    String str = this.currentText;
                    this.ejbFiles.put(str, new File(this.val$srcDir, str.substring("META-INF/".length(), str.length())));
                }
            }
        };
        descriptorHandler.registerDTD(PUBLICID_BORLAND_EJB, this.borlandDTD == null ? DEFAULT_BAS_DTD_LOCATION : this.borlandDTD);
        Iterator it = getConfig().dtdLocations.iterator();
        while (it.hasNext()) {
            EjbJar.DTDLocation dTDLocation = (EjbJar.DTDLocation) it.next();
            descriptorHandler.registerDTD(dTDLocation.getPublicId(), dTDLocation.getLocation());
        }
        return descriptorHandler;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    File getVendorOutputJarFile(String str) {
        return new File(getDestDir(), new StringBuffer().append(str).append(this.jarSuffix).toString());
    }

    public void setBASdtd(String str) {
        this.borlandDTD = str;
    }

    public void setDebug(boolean z) {
        this.java2iiopdebug = z;
    }

    public void setGenerateclient(boolean z) {
        this.generateclient = z;
    }

    public void setJava2iiopParams(String str) {
        this.java2iioparams = str;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessErrorStream(InputStream inputStream) throws IOException {
        String readLine = new BufferedReader(new InputStreamReader(inputStream)).readLine();
        if (readLine != null) {
            log(new StringBuffer().append("[java2iiop] ").append(readLine).toString(), 0);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessInputStream(OutputStream outputStream) throws IOException {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void setProcessOutputStream(InputStream inputStream) throws IOException {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    bufferedReader.close();
                    return;
                } else if (readLine.endsWith(".java")) {
                    String classFile = toClassFile(readLine);
                    this.genfiles.put(classFile.substring(getConfig().srcDir.getAbsolutePath().length() + 1), new File(classFile));
                }
            }
        } catch (Exception e) {
            throw new BuildException(new StringBuffer().append("Exception while parsing  java2iiop output. Details: ").append(e.toString()).toString(), e);
        }
    }

    public void setSuffix(String str) {
        this.jarSuffix = str;
    }

    public void setVerify(boolean z) {
        this.verify = z;
    }

    public void setVerifyArgs(String str) {
        this.verifyArgs = str;
    }

    public void setVersion(int i) {
        this.version = i;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void start() throws IOException {
    }

    @Override // org.apache.tools.ant.taskdefs.ExecuteStreamHandler
    public void stop() {
    }

    @Override // org.apache.tools.ant.taskdefs.optional.ejb.GenericDeploymentTool
    protected void writeJar(String str, File file, Hashtable hashtable, String str2) throws BuildException {
        Vector vector = new Vector();
        for (String str3 : hashtable.keySet()) {
            if (str3.endsWith("Home.class")) {
                String str4 = toClass(str3);
                vector.add(str4);
                log(new StringBuffer().append(" Home ").append(str4).toString(), 3);
            }
        }
        buildBorlandStubs(vector.iterator());
        hashtable.putAll(this.genfiles);
        super.writeJar(str, file, hashtable, str2);
        if (this.verify) {
            verifyBorlandJar(file);
        }
        if (this.generateclient) {
            generateClient(file);
        }
        this.genfiles.clear();
    }
}
