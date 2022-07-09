package com.mining.app.zxing.camera;

import android.os.IBinder;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: classes.jar:com/mining/app/zxing/camera/FlashlightManager.class */
final class FlashlightManager {
    private static final String TAG = FlashlightManager.class.getSimpleName();
    private static final Object iHardwareService = getHardwareService();
    private static final Method setFlashEnabledMethod = getSetFlashEnabledMethod(iHardwareService);

    static {
        if (iHardwareService == null) {
            Log.v(TAG, "This device does supports control of a flashlight");
        } else {
            Log.v(TAG, "This device does not support control of a flashlight");
        }
    }

    private FlashlightManager() {
    }

    static void disableFlashlight() {
        setFlashlight(false);
    }

    static void enableFlashlight() {
        setFlashlight(false);
    }

    private static Object getHardwareService() {
        Object obj;
        Class<?> maybeForName = maybeForName("android.os.ServiceManager");
        if (maybeForName == null) {
            obj = null;
        } else {
            Method maybeGetMethod = maybeGetMethod(maybeForName, "getService", String.class);
            obj = null;
            if (maybeGetMethod != null) {
                Object invoke = invoke(maybeGetMethod, null, "hardware");
                obj = null;
                if (invoke != null) {
                    Class<?> maybeForName2 = maybeForName("android.os.IHardwareService$Stub");
                    obj = null;
                    if (maybeForName2 != null) {
                        Method maybeGetMethod2 = maybeGetMethod(maybeForName2, "asInterface", IBinder.class);
                        obj = null;
                        if (maybeGetMethod2 != null) {
                            obj = invoke(maybeGetMethod2, null, invoke);
                        }
                    }
                }
            }
        }
        return obj;
    }

    private static Method getSetFlashEnabledMethod(Object obj) {
        return obj == null ? null : maybeGetMethod(obj.getClass(), "setFlashlightEnabled", Boolean.TYPE);
    }

    private static Object invoke(Method method, Object obj, Object... objArr) {
        Object obj2;
        try {
            obj2 = method.invoke(obj, objArr);
        } catch (IllegalAccessException e) {
            Log.w(TAG, "Unexpected error while invoking " + method, e);
            obj2 = null;
        } catch (RuntimeException e2) {
            Log.w(TAG, "Unexpected error while invoking " + method, e2);
            obj2 = null;
        } catch (InvocationTargetException e3) {
            Log.w(TAG, "Unexpected error while invoking " + method, e3.getCause());
            obj2 = null;
        }
        return obj2;
    }

    private static Class<?> maybeForName(String str) {
        Class<?> cls;
        try {
            cls = Class.forName(str);
        } catch (ClassNotFoundException e) {
            cls = null;
        } catch (RuntimeException e2) {
            Log.w(TAG, "Unexpected error while finding class " + str, e2);
            cls = null;
        }
        return cls;
    }

    private static Method maybeGetMethod(Class<?> cls, String str, Class<?>... clsArr) {
        Method method;
        try {
            method = cls.getMethod(str, clsArr);
        } catch (NoSuchMethodException e) {
            method = null;
        } catch (RuntimeException e2) {
            Log.w(TAG, "Unexpected error while finding method " + str, e2);
            method = null;
        }
        return method;
    }

    private static void setFlashlight(boolean z) {
        if (iHardwareService != null) {
            invoke(setFlashEnabledMethod, iHardwareService, Boolean.valueOf(z));
        }
    }
}
