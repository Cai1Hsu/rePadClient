package org.apache.tools.ant.util;

/* loaded from: classes.jar:org/apache/tools/ant/util/ReflectWrapper.class */
public class ReflectWrapper {
    private Object obj;

    public ReflectWrapper(ClassLoader classLoader, String str) {
        try {
            this.obj = Class.forName(str, true, classLoader).getConstructor(null).newInstance(null);
        } catch (Exception e) {
            ReflectUtil.throwBuildException(e);
        }
    }

    public ReflectWrapper(Object obj) {
        this.obj = obj;
    }

    public Object getObject() {
        return this.obj;
    }

    public Object invoke(String str) {
        return ReflectUtil.invoke(this.obj, str);
    }

    public Object invoke(String str, Class cls, Object obj) {
        return ReflectUtil.invoke(this.obj, str, cls, obj);
    }

    public Object invoke(String str, Class cls, Object obj, Class cls2, Object obj2) {
        return ReflectUtil.invoke(this.obj, str, cls, obj, cls2, obj2);
    }
}
