package org.apache.tools.ant.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/ReflectUtil.class */
public class ReflectUtil {
    private ReflectUtil() {
    }

    public static Object getField(Object obj, String str) throws BuildException {
        Object obj2;
        try {
            Field declaredField = obj.getClass().getDeclaredField(str);
            declaredField.setAccessible(true);
            obj2 = declaredField.get(obj);
        } catch (Exception e) {
            throwBuildException(e);
            obj2 = null;
        }
        return obj2;
    }

    public static Object invoke(Object obj, String str) {
        Object obj2;
        try {
            obj2 = obj.getClass().getMethod(str, null).invoke(obj, null);
        } catch (Exception e) {
            throwBuildException(e);
            obj2 = null;
        }
        return obj2;
    }

    public static Object invoke(Object obj, String str, Class cls, Object obj2) {
        Object obj3;
        try {
            obj3 = obj.getClass().getMethod(str, cls).invoke(obj, obj2);
        } catch (Exception e) {
            throwBuildException(e);
            obj3 = null;
        }
        return obj3;
    }

    public static Object invoke(Object obj, String str, Class cls, Object obj2, Class cls2, Object obj3) {
        Object obj4;
        try {
            obj4 = obj.getClass().getMethod(str, cls, cls2).invoke(obj, obj2, obj3);
        } catch (Exception e) {
            throwBuildException(e);
            obj4 = null;
        }
        return obj4;
    }

    public static Object invokeStatic(Object obj, String str) {
        Object obj2;
        try {
            obj2 = ((Class) obj).getMethod(str, null).invoke(obj, null);
        } catch (Exception e) {
            throwBuildException(e);
            obj2 = null;
        }
        return obj2;
    }

    public static Object newInstance(Class cls, Class[] clsArr, Object[] objArr) {
        Object obj;
        try {
            obj = cls.getConstructor(clsArr).newInstance(objArr);
        } catch (Exception e) {
            throwBuildException(e);
            obj = null;
        }
        return obj;
    }

    public static boolean respondsTo(Object obj, String str) throws BuildException {
        boolean z;
        try {
            Method[] methods = obj.getClass().getMethods();
            int i = 0;
            while (true) {
                if (i >= methods.length) {
                    z = false;
                    break;
                } else if (methods[i].getName().equals(str)) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
            return z;
        } catch (Exception e) {
            throw toBuildException(e);
        }
    }

    public static void throwBuildException(Exception exc) throws BuildException {
        throw toBuildException(exc);
    }

    public static BuildException toBuildException(Exception exc) {
        BuildException buildException;
        if (exc instanceof InvocationTargetException) {
            Throwable targetException = ((InvocationTargetException) exc).getTargetException();
            buildException = targetException instanceof BuildException ? (BuildException) targetException : new BuildException(targetException);
        } else {
            buildException = new BuildException(exc);
        }
        return buildException;
    }
}
