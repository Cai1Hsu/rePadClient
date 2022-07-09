package org.apache.tools.ant.taskdefs.rmic;

import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Commandline;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/rmic/WLRmic.class */
public class WLRmic extends DefaultRmicAdapter {
    public static final String COMPILER_NAME = "weblogic";
    public static final String ERROR_NO_WLRMIC_ON_CLASSPATH = "Cannot use WebLogic rmic, as it is not available. Add it to Ant's classpath with the -lib option";
    public static final String ERROR_WLRMIC_FAILED = "Error starting WebLogic rmic: ";
    public static final String UNSUPPORTED_STUB_OPTION = "Unsupported stub option: ";
    public static final String WLRMIC_CLASSNAME = "weblogic.rmic";
    public static final String WL_RMI_SKEL_SUFFIX = "_WLSkel";
    public static final String WL_RMI_STUB_SUFFIX = "_WLStub";
    static Class array$Ljava$lang$String;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter
    protected String addStubVersionOptions() {
        String stubVersion = getRmic().getStubVersion();
        if (stubVersion != null) {
            getRmic().log(new StringBuffer().append(UNSUPPORTED_STUB_OPTION).append(stubVersion).toString(), 1);
            return null;
        }
        return null;
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.RmicAdapter
    public boolean execute() throws BuildException {
        Class<?> cls;
        Class<?> cls2;
        getRmic().log("Using WebLogic rmic", 3);
        Commandline commandline = setupRmicCommand(new String[]{"-noexit"});
        AntClassLoader antClassLoader = null;
        AntClassLoader antClassLoader2 = null;
        AntClassLoader antClassLoader3 = null;
        AntClassLoader antClassLoader4 = null;
        try {
            try {
                if (getRmic().getClasspath() == null) {
                    cls = Class.forName(WLRMIC_CLASSNAME);
                } else {
                    antClassLoader = getRmic().getProject().createClassLoader(getRmic().getClasspath());
                    cls = Class.forName(WLRMIC_CLASSNAME, true, antClassLoader);
                }
                AntClassLoader antClassLoader5 = antClassLoader;
                if (array$Ljava$lang$String == null) {
                    AntClassLoader antClassLoader6 = antClassLoader;
                    cls2 = class$("[Ljava.lang.String;");
                    AntClassLoader antClassLoader7 = antClassLoader;
                    array$Ljava$lang$String = cls2;
                } else {
                    cls2 = array$Ljava$lang$String;
                }
                antClassLoader2 = antClassLoader;
                antClassLoader3 = antClassLoader;
                antClassLoader4 = antClassLoader;
                cls.getMethod("main", cls2).invoke(null, commandline.getArguments());
                if (antClassLoader == null) {
                    return true;
                }
                antClassLoader.cleanup();
                return true;
            } catch (ClassNotFoundException e) {
                AntClassLoader antClassLoader8 = antClassLoader2;
                AntClassLoader antClassLoader9 = antClassLoader2;
                throw new BuildException(ERROR_NO_WLRMIC_ON_CLASSPATH, getRmic().getLocation());
            } catch (Exception e2) {
                if (e2 instanceof BuildException) {
                    AntClassLoader antClassLoader10 = antClassLoader4;
                    throw ((BuildException) e2);
                }
                AntClassLoader antClassLoader11 = antClassLoader4;
                AntClassLoader antClassLoader12 = antClassLoader4;
                AntClassLoader antClassLoader13 = antClassLoader4;
                throw new BuildException(ERROR_WLRMIC_FAILED, e2, getRmic().getLocation());
            }
        } catch (Throwable th) {
            if (antClassLoader3 != null) {
                antClassLoader3.cleanup();
            }
            throw th;
        }
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter
    public String getSkelClassSuffix() {
        return WL_RMI_SKEL_SUFFIX;
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter
    public String getStubClassSuffix() {
        return WL_RMI_STUB_SUFFIX;
    }

    @Override // org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter
    protected String[] preprocessCompilerArgs(String[] strArr) {
        return filterJvmCompilerArgs(strArr);
    }
}
