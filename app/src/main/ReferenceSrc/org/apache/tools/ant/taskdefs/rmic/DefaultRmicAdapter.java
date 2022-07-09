package org.apache.tools.ant.taskdefs.rmic;

import java.io.File;
import java.util.ArrayList;
import java.util.Random;
import java.util.Vector;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.taskdefs.Rmic;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter.class */
public abstract class DefaultRmicAdapter implements RmicAdapter {
    private static final Random RAND = new Random();
    public static final String RMI_SKEL_SUFFIX = "_Skel";
    public static final String RMI_STUB_SUFFIX = "_Stub";
    public static final String RMI_TIE_SUFFIX = "_Tie";
    public static final String STUB_1_1 = "-v1.1";
    public static final String STUB_1_2 = "-v1.2";
    public static final String STUB_COMPAT = "-vcompat";
    public static final String STUB_OPTION_1_1 = "1.1";
    public static final String STUB_OPTION_1_2 = "1.2";
    public static final String STUB_OPTION_COMPAT = "compat";
    private Rmic attributes;
    private FileNameMapper mapper;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper.class */
    private class RmicFileNameMapper implements FileNameMapper {
        private final DefaultRmicAdapter this$0;

        RmicFileNameMapper(DefaultRmicAdapter defaultRmicAdapter) {
            this.this$0 = defaultRmicAdapter;
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public String[] mapFileName(String str) {
            String[] strArr;
            int i;
            int i2;
            if (str == null || !str.endsWith(".class") || str.endsWith(new StringBuffer().append(this.this$0.getStubClassSuffix()).append(".class").toString()) || str.endsWith(new StringBuffer().append(this.this$0.getSkelClassSuffix()).append(".class").toString()) || str.endsWith(new StringBuffer().append(this.this$0.getTieClassSuffix()).append(".class").toString())) {
                strArr = null;
            } else {
                String removeSuffix = StringUtils.removeSuffix(str, ".class");
                String replace = removeSuffix.replace(File.separatorChar, '.');
                if (!this.this$0.attributes.getVerify() || this.this$0.attributes.isValidRmiRemote(replace)) {
                    String[] strArr2 = {new StringBuffer().append(str).append(".tmp.").append(DefaultRmicAdapter.RAND.nextLong()).toString()};
                    if (this.this$0.attributes.getIiop() || this.this$0.attributes.getIdl()) {
                        strArr = strArr2;
                        if (!this.this$0.attributes.getIdl()) {
                            int lastIndexOf = removeSuffix.lastIndexOf(File.separatorChar);
                            String str2 = "";
                            if (lastIndexOf == -1) {
                                i = 0;
                            } else {
                                i = lastIndexOf + 1;
                                str2 = removeSuffix.substring(0, i);
                            }
                            String substring = removeSuffix.substring(i);
                            try {
                                Class<?> loadClass = this.this$0.attributes.getLoader().loadClass(replace);
                                if (loadClass.isInterface()) {
                                    strArr = new String[]{new StringBuffer().append(str2).append("_").append(substring).append(this.this$0.getStubClassSuffix()).append(".class").toString()};
                                } else {
                                    String name = this.this$0.attributes.getRemoteInterface(loadClass).getName();
                                    String str3 = "";
                                    int lastIndexOf2 = name.lastIndexOf(".");
                                    if (lastIndexOf2 == -1) {
                                        i2 = 0;
                                    } else {
                                        i2 = lastIndexOf2 + 1;
                                        str3 = name.substring(0, i2).replace('.', File.separatorChar);
                                    }
                                    strArr = new String[]{new StringBuffer().append(str2).append("_").append(substring).append(this.this$0.getTieClassSuffix()).append(".class").toString(), new StringBuffer().append(str3).append("_").append(name.substring(i2)).append(this.this$0.getStubClassSuffix()).append(".class").toString()};
                                }
                            } catch (ClassNotFoundException e) {
                                this.this$0.attributes.log(new StringBuffer().append(Rmic.ERROR_UNABLE_TO_VERIFY_CLASS).append(replace).append(Rmic.ERROR_NOT_FOUND).toString(), 1);
                                strArr = strArr2;
                            } catch (NoClassDefFoundError e2) {
                                this.this$0.attributes.log(new StringBuffer().append(Rmic.ERROR_UNABLE_TO_VERIFY_CLASS).append(replace).append(Rmic.ERROR_NOT_DEFINED).toString(), 1);
                                strArr = strArr2;
                            } catch (Throwable th) {
                                this.this$0.attributes.log(new StringBuffer().append(Rmic.ERROR_UNABLE_TO_VERIFY_CLASS).append(replace).append(Rmic.ERROR_LOADING_CAUSED_EXCEPTION).append(th.getMessage()).toString(), 1);
                                strArr = strArr2;
                            }
                        }
                    } else {
                        strArr = "1.2".equals(this.this$0.attributes.getStubVersion()) ? new String[]{new StringBuffer().append(removeSuffix).append(this.this$0.getStubClassSuffix()).append(".class").toString()} : new String[]{new StringBuffer().append(removeSuffix).append(this.this$0.getStubClassSuffix()).append(".class").toString(), new StringBuffer().append(removeSuffix).append(this.this$0.getSkelClassSuffix()).append(".class").toString()};
                    }
                } else {
                    strArr = null;
                }
            }
            return strArr;
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setFrom(String str) {
        }

        @Override // org.apache.tools.ant.util.FileNameMapper
        public void setTo(String str) {
        }
    }

    protected String addStubVersionOptions() {
        String stubVersion = this.attributes.getStubVersion();
        String str = null;
        if (stubVersion != null) {
            if ("1.1".equals(stubVersion)) {
                str = STUB_1_1;
            } else if ("1.2".equals(stubVersion)) {
                str = STUB_1_2;
            } else if (STUB_OPTION_COMPAT.equals(stubVersion)) {
                str = STUB_COMPAT;
            } else {
                this.attributes.log(new StringBuffer().append("Unknown stub option ").append(stubVersion).toString());
                str = null;
            }
        }
        String str2 = str;
        if (str == null) {
            str2 = str;
            if (!this.attributes.getIiop()) {
                str2 = str;
                if (!this.attributes.getIdl()) {
                    str2 = STUB_COMPAT;
                }
            }
        }
        return str2;
    }

    protected String[] filterJvmCompilerArgs(String[] strArr) {
        ArrayList arrayList = new ArrayList(strArr.length);
        for (String str : strArr) {
            if (!str.startsWith("-J")) {
                arrayList.add(str);
            } else {
                this.attributes.log(new StringBuffer().append("Dropping ").append(str).append(" from compiler arguments").toString());
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public Path getClasspath() {
        return getCompileClasspath();
    }

    protected Path getCompileClasspath() {
        Path path = new Path(this.attributes.getProject());
        path.setLocation(this.attributes.getBase());
        Path classpath = this.attributes.getClasspath();
        Path path2 = classpath;
        if (classpath == null) {
            path2 = new Path(this.attributes.getProject());
        }
        if (this.attributes.getIncludeantruntime()) {
            path.addExisting(path2.concatSystemClasspath("last"));
        } else {
            path.addExisting(path2.concatSystemClasspath(Definer.OnError.POLICY_IGNORE));
        }
        if (this.attributes.getIncludejavaruntime()) {
            path.addJavaRuntime();
        }
        return path;
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public FileNameMapper getMapper() {
        return this.mapper;
    }

    public Rmic getRmic() {
        return this.attributes;
    }

    protected String getSkelClassSuffix() {
        return RMI_SKEL_SUFFIX;
    }

    protected String getStubClassSuffix() {
        return RMI_STUB_SUFFIX;
    }

    protected String getTieClassSuffix() {
        return RMI_TIE_SUFFIX;
    }

    protected void logAndAddFilesToCompile(Commandline commandline) {
        Vector compileList = this.attributes.getCompileList();
        this.attributes.log(new StringBuffer().append("Compilation ").append(commandline.describeArguments()).toString(), 3);
        StringBuffer stringBuffer = new StringBuffer("File");
        int size = compileList.size();
        if (size != 1) {
            stringBuffer.append("s");
        }
        stringBuffer.append(" to be compiled:");
        for (int i = 0; i < size; i++) {
            String str = (String) compileList.elementAt(i);
            commandline.createArgument().setValue(str);
            stringBuffer.append("    ");
            stringBuffer.append(str);
        }
        this.attributes.log(stringBuffer.toString(), 3);
    }

    protected String[] preprocessCompilerArgs(String[] strArr) {
        return strArr;
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public void setRmic(Rmic rmic) {
        this.attributes = rmic;
        this.mapper = new RmicFileNameMapper(this);
    }

    protected Commandline setupRmicCommand() {
        return setupRmicCommand(null);
    }

    protected Commandline setupRmicCommand(String[] strArr) {
        Commandline commandline = new Commandline();
        if (strArr != null) {
            for (String str : strArr) {
                commandline.createArgument().setValue(str);
            }
        }
        Path compileClasspath = getCompileClasspath();
        commandline.createArgument().setValue("-d");
        commandline.createArgument().setFile(this.attributes.getOutputDir());
        if (this.attributes.getExtdirs() != null) {
            commandline.createArgument().setValue("-extdirs");
            commandline.createArgument().setPath(this.attributes.getExtdirs());
        }
        commandline.createArgument().setValue("-classpath");
        commandline.createArgument().setPath(compileClasspath);
        String addStubVersionOptions = addStubVersionOptions();
        if (addStubVersionOptions != null) {
            commandline.createArgument().setValue(addStubVersionOptions);
        }
        if (this.attributes.getSourceBase() != null) {
            commandline.createArgument().setValue("-keepgenerated");
        }
        if (this.attributes.getIiop()) {
            this.attributes.log("IIOP has been turned on.", 2);
            commandline.createArgument().setValue("-iiop");
            if (this.attributes.getIiopopts() != null) {
                this.attributes.log(new StringBuffer().append("IIOP Options: ").append(this.attributes.getIiopopts()).toString(), 2);
                commandline.createArgument().setValue(this.attributes.getIiopopts());
            }
        }
        if (this.attributes.getIdl()) {
            commandline.createArgument().setValue("-idl");
            this.attributes.log("IDL has been turned on.", 2);
            if (this.attributes.getIdlopts() != null) {
                commandline.createArgument().setValue(this.attributes.getIdlopts());
                this.attributes.log(new StringBuffer().append("IDL Options: ").append(this.attributes.getIdlopts()).toString(), 2);
            }
        }
        if (this.attributes.getDebug()) {
            commandline.createArgument().setValue("-g");
        }
        commandline.addArguments(preprocessCompilerArgs(this.attributes.getCurrentCompilerArgs()));
        logAndAddFilesToCompile(commandline);
        return commandline;
    }
}
