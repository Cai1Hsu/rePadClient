package org.apache.tools.ant.taskdefs.optional.javacc;

import java.io.File;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/javacc/JavaCC.class */
public class JavaCC extends Task {
    protected static final String[] ARCHIVE_LOCATIONS = {"JavaCC.zip", "bin/lib/JavaCC.zip", "bin/lib/javacc.jar", "javacc.jar"};
    protected static final int[] ARCHIVE_LOCATIONS_VS_MAJOR_VERSION = {1, 2, 3, 3};
    private static final String BUILD_PARSER = "BUILD_PARSER";
    private static final String BUILD_TOKEN_MANAGER = "BUILD_TOKEN_MANAGER";
    private static final String CACHE_TOKENS = "CACHE_TOKENS";
    private static final String CHOICE_AMBIGUITY_CHECK = "CHOICE_AMBIGUITY_CHECK";
    private static final String COMMON_TOKEN_ACTION = "COMMON_TOKEN_ACTION";
    protected static final String COM_JAVACC_CLASS = "javacc.Main";
    protected static final String COM_JJDOC_CLASS = "jjdoc.JJDocMain";
    protected static final String COM_JJTREE_CLASS = "jjtree.Main";
    protected static final String COM_PACKAGE = "COM.sun.labs.";
    private static final String DEBUG_LOOKAHEAD = "DEBUG_LOOKAHEAD";
    private static final String DEBUG_PARSER = "DEBUG_PARSER";
    private static final String DEBUG_TOKEN_MANAGER = "DEBUG_TOKEN_MANAGER";
    private static final String ERROR_REPORTING = "ERROR_REPORTING";
    private static final String FORCE_LA_CHECK = "FORCE_LA_CHECK";
    private static final String IGNORE_CASE = "IGNORE_CASE";
    private static final String JAVA_UNICODE_ESCAPE = "JAVA_UNICODE_ESCAPE";
    private static final String JDK_VERSION = "JDK_VERSION";
    private static final String KEEP_LINE_COLUMN = "KEEP_LINE_COLUMN";
    private static final String LOOKAHEAD = "LOOKAHEAD";
    private static final String OPTIMIZE_TOKEN_MANAGER = "OPTIMIZE_TOKEN_MANAGER";
    protected static final String ORG_JAVACC_CLASS = "parser.Main";
    protected static final String ORG_JJDOC_CLASS = "jjdoc.JJDocMain";
    protected static final String ORG_JJTREE_CLASS = "jjtree.Main";
    protected static final String ORG_PACKAGE_3_0 = "org.netbeans.javacc.";
    protected static final String ORG_PACKAGE_3_1 = "org.javacc.";
    private static final String OTHER_AMBIGUITY_CHECK = "OTHER_AMBIGUITY_CHECK";
    private static final String SANITY_CHECK = "SANITY_CHECK";
    private static final String STATIC = "STATIC";
    protected static final int TASKDEF_TYPE_JAVACC = 1;
    protected static final int TASKDEF_TYPE_JJDOC = 3;
    protected static final int TASKDEF_TYPE_JJTREE = 2;
    private static final String UNICODE_INPUT = "UNICODE_INPUT";
    private static final String USER_CHAR_STREAM = "USER_CHAR_STREAM";
    private static final String USER_TOKEN_MANAGER = "USER_TOKEN_MANAGER";
    private final Hashtable optionalAttrs = new Hashtable();
    private File outputDirectory = null;
    private File targetFile = null;
    private File javaccHome = null;
    private CommandlineJava cmdl = new CommandlineJava();
    private String maxMemory = null;

    public JavaCC() {
        this.cmdl.setVm(JavaEnvUtils.getJreExecutable("java"));
    }

    protected static File getArchiveFile(File file) throws BuildException {
        return new File(file, ARCHIVE_LOCATIONS[getArchiveLocationIndex(file)]);
    }

    private static int getArchiveLocationIndex(File file) throws BuildException {
        if (file == null || !file.isDirectory()) {
            throw new BuildException("JavaCC home must be a valid directory.");
        }
        for (int i = 0; i < ARCHIVE_LOCATIONS.length; i++) {
            if (new File(file, ARCHIVE_LOCATIONS[i]).exists()) {
                return i;
            }
        }
        throw new BuildException(new StringBuffer().append("Could not find a path to JavaCC.zip or javacc.jar from '").append(file).append("'.").toString());
    }

    protected static String getMainClass(File file, int i) throws BuildException {
        Path path = new Path(null);
        path.createPathElement().setLocation(getArchiveFile(file));
        path.addJavaRuntime();
        return getMainClass(path, i);
    }

    protected static String getMainClass(Path path, int i) throws BuildException {
        String str;
        String str2;
        String str3;
        AntClassLoader antClassLoader = null;
        try {
            AntClassLoader newAntClassLoader = AntClassLoader.newAntClassLoader(null, null, path.concatSystemClasspath(Definer.OnError.POLICY_IGNORE), true);
            if (newAntClassLoader.getResourceAsStream(new StringBuffer().append("COM.sun.labs.javacc.Main".replace('.', '/')).append(".class").toString()) == null) {
                InputStream resourceAsStream = newAntClassLoader.getResourceAsStream(new StringBuffer().append("org.javacc.parser.Main".replace('.', '/')).append(".class").toString());
                if (resourceAsStream != null) {
                    str = ORG_PACKAGE_3_1;
                } else {
                    InputStream resourceAsStream2 = newAntClassLoader.getResourceAsStream(new StringBuffer().append("org.netbeans.javacc.parser.Main".replace('.', '/')).append(".class").toString());
                    resourceAsStream = resourceAsStream2;
                    str = null;
                    if (resourceAsStream2 != null) {
                        str = ORG_PACKAGE_3_0;
                        resourceAsStream = resourceAsStream2;
                    }
                }
                str2 = null;
                str3 = str;
                if (resourceAsStream != null) {
                    switch (i) {
                        case 1:
                            str2 = ORG_JAVACC_CLASS;
                            str3 = str;
                            break;
                        case 2:
                            str2 = "jjtree.Main";
                            str3 = str;
                            break;
                        case 3:
                            str2 = "jjdoc.JJDocMain";
                            str3 = str;
                            break;
                        default:
                            str2 = null;
                            str3 = str;
                            break;
                    }
                }
            } else {
                str3 = COM_PACKAGE;
                switch (i) {
                    case 1:
                        str2 = COM_JAVACC_CLASS;
                        break;
                    case 2:
                        str2 = "jjtree.Main";
                        break;
                    case 3:
                        str2 = "jjdoc.JJDocMain";
                        break;
                    default:
                        str2 = null;
                        break;
                }
            }
            if (str3 == null) {
                throw new BuildException("failed to load JavaCC");
            }
            if (str2 == null) {
                throw new BuildException(new StringBuffer().append("unknown task type ").append(i).toString());
            }
            String stringBuffer = new StringBuffer().append(str3).append(str2).toString();
            if (newAntClassLoader != null) {
                newAntClassLoader.cleanup();
            }
            return stringBuffer;
        } catch (Throwable th) {
            if (0 != 0) {
                antClassLoader.cleanup();
            }
            throw th;
        }
    }

    protected static int getMajorVersionNumber(File file) throws BuildException {
        return ARCHIVE_LOCATIONS_VS_MAJOR_VERSION[getArchiveLocationIndex(file)];
    }

    private File getOutputJavaFile(File file, File file2) {
        String path = file2.getPath();
        int lastIndexOf = path.lastIndexOf(File.separator);
        String str = path;
        if (lastIndexOf != -1) {
            str = path.substring(lastIndexOf + 1);
        }
        int lastIndexOf2 = str.lastIndexOf(46);
        String stringBuffer = lastIndexOf2 != -1 ? new StringBuffer().append(str.substring(0, lastIndexOf2)).append(".java").toString() : new StringBuffer().append(str).append(".java").toString();
        String str2 = stringBuffer;
        if (file != null) {
            str2 = new StringBuffer().append(file).append(File.separator).append(stringBuffer).toString();
        }
        return new File(str2);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Enumeration keys = this.optionalAttrs.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            this.cmdl.createArgument().setValue(new StringBuffer().append("-").append(str).append(":").append(this.optionalAttrs.get(str).toString()).toString());
        }
        if (this.targetFile == null || !this.targetFile.isFile()) {
            throw new BuildException(new StringBuffer().append("Invalid target: ").append(this.targetFile).toString());
        }
        if (this.outputDirectory == null) {
            this.outputDirectory = new File(this.targetFile.getParent());
        } else if (!this.outputDirectory.isDirectory()) {
            throw new BuildException("Outputdir not a directory.");
        }
        this.cmdl.createArgument().setValue(new StringBuffer().append("-OUTPUT_DIRECTORY:").append(this.outputDirectory.getAbsolutePath()).toString());
        File outputJavaFile = getOutputJavaFile(this.outputDirectory, this.targetFile);
        if (outputJavaFile.exists() && this.targetFile.lastModified() < outputJavaFile.lastModified()) {
            log(new StringBuffer().append("Target is already built - skipping (").append(this.targetFile).append(")").toString(), 3);
            return;
        }
        this.cmdl.createArgument().setValue(this.targetFile.getAbsolutePath());
        Path createClasspath = this.cmdl.createClasspath(getProject());
        createClasspath.createPathElement().setPath(getArchiveFile(this.javaccHome).getAbsolutePath());
        createClasspath.addJavaRuntime();
        this.cmdl.setClassname(getMainClass(createClasspath, 1));
        this.cmdl.setMaxmemory(this.maxMemory);
        this.cmdl.createVmArgument().setValue(new StringBuffer().append("-Dinstall.root=").append(this.javaccHome.getAbsolutePath()).toString());
        Execute.runCommand(this, this.cmdl.getCommandline());
    }

    public void setBuildparser(boolean z) {
        this.optionalAttrs.put(BUILD_PARSER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setBuildtokenmanager(boolean z) {
        this.optionalAttrs.put(BUILD_TOKEN_MANAGER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setCachetokens(boolean z) {
        this.optionalAttrs.put(CACHE_TOKENS, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setChoiceambiguitycheck(int i) {
        this.optionalAttrs.put(CHOICE_AMBIGUITY_CHECK, new Integer(i));
    }

    public void setCommontokenaction(boolean z) {
        this.optionalAttrs.put(COMMON_TOKEN_ACTION, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setDebuglookahead(boolean z) {
        this.optionalAttrs.put(DEBUG_LOOKAHEAD, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setDebugparser(boolean z) {
        this.optionalAttrs.put(DEBUG_PARSER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setDebugtokenmanager(boolean z) {
        this.optionalAttrs.put(DEBUG_TOKEN_MANAGER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setErrorreporting(boolean z) {
        this.optionalAttrs.put(ERROR_REPORTING, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setForcelacheck(boolean z) {
        this.optionalAttrs.put(FORCE_LA_CHECK, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setIgnorecase(boolean z) {
        this.optionalAttrs.put(IGNORE_CASE, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setJDKversion(String str) {
        this.optionalAttrs.put(JDK_VERSION, str);
    }

    public void setJavacchome(File file) {
        this.javaccHome = file;
    }

    public void setJavaunicodeescape(boolean z) {
        this.optionalAttrs.put(JAVA_UNICODE_ESCAPE, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setKeeplinecolumn(boolean z) {
        this.optionalAttrs.put(KEEP_LINE_COLUMN, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setLookahead(int i) {
        this.optionalAttrs.put(LOOKAHEAD, new Integer(i));
    }

    public void setMaxmemory(String str) {
        this.maxMemory = str;
    }

    public void setOptimizetokenmanager(boolean z) {
        this.optionalAttrs.put(OPTIMIZE_TOKEN_MANAGER, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setOtherambiguityCheck(int i) {
        this.optionalAttrs.put(OTHER_AMBIGUITY_CHECK, new Integer(i));
    }

    public void setOutputdirectory(File file) {
        this.outputDirectory = file;
    }

    public void setSanitycheck(boolean z) {
        this.optionalAttrs.put(SANITY_CHECK, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setStatic(boolean z) {
        this.optionalAttrs.put(STATIC, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setTarget(File file) {
        this.targetFile = file;
    }

    public void setUnicodeinput(boolean z) {
        this.optionalAttrs.put(UNICODE_INPUT, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setUsercharstream(boolean z) {
        this.optionalAttrs.put(USER_CHAR_STREAM, z ? Boolean.TRUE : Boolean.FALSE);
    }

    public void setUsertokenmanager(boolean z) {
        this.optionalAttrs.put(USER_TOKEN_MANAGER, z ? Boolean.TRUE : Boolean.FALSE);
    }
}
