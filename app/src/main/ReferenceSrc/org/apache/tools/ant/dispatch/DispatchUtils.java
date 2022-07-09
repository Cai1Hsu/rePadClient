package org.apache.tools.ant.dispatch;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.UnknownElement;

/* loaded from: classes.jar:org/apache/tools/ant/dispatch/DispatchUtils.class */
public class DispatchUtils {
    public static final void execute(Object obj) throws BuildException {
        Dispatchable dispatchable;
        try {
            try {
                if (obj instanceof Dispatchable) {
                    dispatchable = (Dispatchable) obj;
                } else {
                    dispatchable = null;
                    if (obj instanceof UnknownElement) {
                        Object realThing = ((UnknownElement) obj).getRealThing();
                        dispatchable = null;
                        if (realThing != null) {
                            dispatchable = null;
                            if (realThing instanceof Dispatchable) {
                                dispatchable = null;
                                if (realThing instanceof Task) {
                                    dispatchable = (Dispatchable) realThing;
                                }
                            }
                        }
                    }
                }
                if (dispatchable == null) {
                    Method method = obj.getClass().getMethod("execute", new Class[0]);
                    if (method == null) {
                        throw new BuildException(new StringBuffer().append("No public ").append("execute").append("() in ").append(obj.getClass()).toString());
                    }
                    method.invoke(obj, null);
                    if (!(obj instanceof UnknownElement)) {
                        return;
                    }
                    ((UnknownElement) obj).setRealThing(null);
                    return;
                }
                try {
                    String actionParameterName = dispatchable.getActionParameterName();
                    if (actionParameterName == null || actionParameterName.trim().length() <= 0) {
                        throw new BuildException("Action Parameter Name must not be empty for Dispatchable Task.");
                    }
                    String stringBuffer = new StringBuffer().append("get").append(actionParameterName.trim().substring(0, 1).toUpperCase()).toString();
                    String str = stringBuffer;
                    if (actionParameterName.length() > 1) {
                        str = new StringBuffer().append(stringBuffer).append(actionParameterName.substring(1)).toString();
                    }
                    String str2 = str;
                    Method method2 = dispatchable.getClass().getMethod(str, new Class[0]);
                    if (method2 == null) {
                        return;
                    }
                    Object invoke = method2.invoke(dispatchable, null);
                    if (invoke == null) {
                        String str3 = str;
                        String str4 = str;
                        String str5 = str;
                        BuildException buildException = new BuildException(new StringBuffer().append("Dispatchable Task attribute '").append(actionParameterName.trim()).append("' not set or value is empty.").toString());
                        String str6 = str;
                        throw buildException;
                    }
                    String obj2 = invoke.toString();
                    if (obj2 == null || obj2.trim().length() <= 0) {
                        String str7 = str;
                        String str8 = str;
                        String str9 = str;
                        BuildException buildException2 = new BuildException(new StringBuffer().append("Dispatchable Task attribute '").append(actionParameterName.trim()).append("' not set or value is empty.").toString());
                        String str10 = str;
                        throw buildException2;
                    }
                    String str11 = str;
                    String trim = obj2.trim();
                    String str12 = str;
                    Method method3 = dispatchable.getClass().getMethod(trim, new Class[0]);
                    if (method3 == null) {
                        String str13 = str;
                        String str14 = str;
                        String str15 = str;
                        BuildException buildException3 = new BuildException(new StringBuffer().append("No public ").append(trim).append("() in ").append(dispatchable.getClass()).toString());
                        String str16 = str;
                        throw buildException3;
                    }
                    method3.invoke(dispatchable, null);
                    String str17 = str;
                    if (!(obj instanceof UnknownElement)) {
                        return;
                    }
                    String str18 = str;
                    ((UnknownElement) obj).setRealThing(null);
                } catch (NoSuchMethodException e) {
                    throw new BuildException(new StringBuffer().append("No public ").append((String) null).append("() in ").append(obj.getClass()).toString());
                }
            } catch (NoSuchMethodException e2) {
                throw new BuildException(e2);
            }
        } catch (IllegalAccessException e3) {
            throw new BuildException(e3);
        } catch (InvocationTargetException e4) {
            Throwable targetException = e4.getTargetException();
            if (!(targetException instanceof BuildException)) {
                throw new BuildException(targetException);
            }
            throw ((BuildException) targetException);
        }
    }
}
