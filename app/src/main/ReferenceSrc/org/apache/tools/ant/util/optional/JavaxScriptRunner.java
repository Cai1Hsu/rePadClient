package org.apache.tools.ant.util.optional;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.ReflectWrapper;
import org.apache.tools.ant.util.ScriptRunnerBase;

/* loaded from: classes.jar:org/apache/tools/ant/util/optional/JavaxScriptRunner.class */
public class JavaxScriptRunner extends ScriptRunnerBase {
    static Class class$java$lang$Object;
    static Class class$java$lang$String;
    private ReflectWrapper engine;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private ReflectWrapper createEngine() throws Exception {
        Class cls;
        ReflectWrapper reflectWrapper;
        if (this.engine != null) {
            reflectWrapper = this.engine;
        } else {
            ReflectWrapper reflectWrapper2 = new ReflectWrapper(getClass().getClassLoader(), "javax.script.ScriptEngineManager");
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            Object invoke = reflectWrapper2.invoke("getEngineByName", cls, getLanguage());
            if (invoke == null) {
                reflectWrapper = null;
            } else {
                ReflectWrapper reflectWrapper3 = new ReflectWrapper(invoke);
                reflectWrapper = reflectWrapper3;
                if (getKeepEngine()) {
                    this.engine = reflectWrapper3;
                    reflectWrapper = reflectWrapper3;
                }
            }
        }
        return reflectWrapper;
    }

    private static BuildException unwrap(Throwable th) {
        BuildException buildException = th instanceof BuildException ? (BuildException) th : null;
        while (th.getCause() != null) {
            Throwable cause = th.getCause();
            th = cause;
            if (cause instanceof BuildException) {
                buildException = (BuildException) cause;
                th = cause;
            }
        }
        return buildException;
    }

    @Override // org.apache.tools.ant.util.ScriptRunnerBase
    public Object evaluateScript(String str) throws BuildException {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        checkLanguage();
        ClassLoader replaceContextLoader = replaceContextLoader();
        try {
            try {
                ReflectWrapper createEngine = createEngine();
                if (createEngine == null) {
                    throw new BuildException(new StringBuffer().append("Unable to create javax script engine for ").append(getLanguage()).toString());
                }
                for (String str2 : getBeans().keySet()) {
                    Object obj = getBeans().get(str2);
                    if ("FX".equalsIgnoreCase(getLanguage())) {
                        if (class$java$lang$String == null) {
                            cls2 = class$("java.lang.String");
                            class$java$lang$String = cls2;
                        } else {
                            cls2 = class$java$lang$String;
                        }
                        String stringBuffer = new StringBuffer().append(str2).append(":").append(obj.getClass().getName()).toString();
                        if (class$java$lang$Object == null) {
                            cls3 = class$("java.lang.Object");
                            class$java$lang$Object = cls3;
                        } else {
                            cls3 = class$java$lang$Object;
                        }
                        createEngine.invoke("put", cls2, stringBuffer, cls3, obj);
                    } else {
                        if (class$java$lang$String == null) {
                            cls4 = class$("java.lang.String");
                            class$java$lang$String = cls4;
                        } else {
                            cls4 = class$java$lang$String;
                        }
                        if (class$java$lang$Object == null) {
                            cls5 = class$("java.lang.Object");
                            class$java$lang$Object = cls5;
                        } else {
                            cls5 = class$java$lang$Object;
                        }
                        createEngine.invoke("put", cls4, str2, cls5, obj);
                    }
                }
                if (class$java$lang$String == null) {
                    cls = class$("java.lang.String");
                    class$java$lang$String = cls;
                } else {
                    cls = class$java$lang$String;
                }
                return createEngine.invoke("eval", cls, getScript());
            } catch (BuildException e) {
                throw unwrap(e);
            } catch (Exception e2) {
                Throwable th = e2;
                Throwable cause = e2.getCause();
                if (cause != null) {
                    if (cause instanceof BuildException) {
                        throw ((BuildException) cause);
                    }
                    th = cause;
                }
                throw new BuildException(th);
            }
        } finally {
            restoreContextLoader(replaceContextLoader);
        }
    }

    @Override // org.apache.tools.ant.util.ScriptRunnerBase
    public void executeScript(String str) throws BuildException {
        evaluateScript(str);
    }

    @Override // org.apache.tools.ant.util.ScriptRunnerBase
    public String getManagerName() {
        return "javax";
    }

    @Override // org.apache.tools.ant.util.ScriptRunnerBase
    public boolean supportsLanguage() {
        boolean z = true;
        if (this.engine == null) {
            checkLanguage();
            ClassLoader replaceContextLoader = replaceContextLoader();
            try {
                z = createEngine() != null;
                restoreContextLoader(replaceContextLoader);
            } catch (Exception e) {
                restoreContextLoader(replaceContextLoader);
                z = false;
            } catch (Throwable th) {
                restoreContextLoader(replaceContextLoader);
                throw th;
            }
        }
        return z;
    }
}
