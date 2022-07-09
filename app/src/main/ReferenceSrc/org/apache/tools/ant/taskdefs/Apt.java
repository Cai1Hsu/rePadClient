package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.JavaEnvUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Apt.class */
public class Apt extends Javac {
    public static final String ERROR_IGNORING_COMPILER_OPTION = "Ignoring compiler attribute for the APT task, as it is fixed";
    public static final String ERROR_WRONG_JAVA_VERSION = "Apt task requires Java 1.5+";
    public static final String EXECUTABLE_NAME = "apt";
    public static final String WARNING_IGNORING_FORK = "Apt only runs in its own JVM; fork=false option ignored";
    static Class class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter;
    private String factory;
    private Path factoryPath;
    private File preprocessDir;
    private boolean compile = true;
    private Vector options = new Vector();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Apt$Option.class */
    public static final class Option {
        private String name;
        private String value;

        public String getName() {
            return this.name;
        }

        public String getValue() {
            return this.value;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    public Apt() {
        Class cls;
        if (class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter == null) {
            cls = class$("org.apache.tools.ant.taskdefs.compilers.AptExternalCompilerAdapter");
            class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter;
        }
        super.setCompiler(cls.getName());
        super.setFork(true);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public Path createFactoryPath() {
        if (this.factoryPath == null) {
            this.factoryPath = new Path(getProject());
        }
        return this.factoryPath.createPath();
    }

    public Option createOption() {
        Option option = new Option();
        this.options.add(option);
        return option;
    }

    @Override // org.apache.tools.ant.taskdefs.Javac, org.apache.tools.ant.Task
    public void execute() throws BuildException {
        super.execute();
    }

    public String getAptExecutable() {
        String executable = getExecutable();
        if (executable == null) {
            executable = JavaEnvUtils.getJdkExecutable(EXECUTABLE_NAME);
        }
        return executable;
    }

    @Override // org.apache.tools.ant.taskdefs.Javac
    public String getCompiler() {
        return super.getCompiler();
    }

    public String getFactory() {
        return this.factory;
    }

    public Path getFactoryPath() {
        return this.factoryPath;
    }

    public Vector getOptions() {
        return this.options;
    }

    public File getPreprocessDir() {
        return this.preprocessDir;
    }

    public boolean isCompile() {
        return this.compile;
    }

    public void setCompile(boolean z) {
        this.compile = z;
    }

    @Override // org.apache.tools.ant.taskdefs.Javac
    public void setCompiler(String str) {
        log(ERROR_IGNORING_COMPILER_OPTION, 1);
    }

    public void setFactory(String str) {
        this.factory = str;
    }

    public void setFactoryPathRef(Reference reference) {
        createFactoryPath().setRefid(reference);
    }

    @Override // org.apache.tools.ant.taskdefs.Javac
    public void setFork(boolean z) {
        if (!z) {
            log(WARNING_IGNORING_FORK, 1);
        }
    }

    public void setPreprocessDir(File file) {
        this.preprocessDir = file;
    }
}
