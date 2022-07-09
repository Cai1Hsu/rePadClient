package org.apache.tools.ant;

import java.lang.reflect.Method;
import org.apache.tools.ant.dispatch.DispatchUtils;

/* loaded from: classes.jar:org/apache/tools/ant/TaskAdapter.class */
public class TaskAdapter extends Task implements TypeAdapter {
    static Class class$org$apache$tools$ant$Location;
    static Class class$org$apache$tools$ant$Project;
    static Class class$org$apache$tools$ant$dispatch$Dispatchable;
    private Object proxy;

    public TaskAdapter() {
    }

    public TaskAdapter(Object obj) {
        this();
        setProxy(obj);
    }

    public static void checkTaskClass(Class cls, Project project) {
        Class cls2;
        if (class$org$apache$tools$ant$dispatch$Dispatchable == null) {
            cls2 = class$("org.apache.tools.ant.dispatch.Dispatchable");
            class$org$apache$tools$ant$dispatch$Dispatchable = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$dispatch$Dispatchable;
        }
        if (!cls2.isAssignableFrom(cls)) {
            try {
                Method method = cls.getMethod("execute", null);
                if (Void.TYPE.equals(method.getReturnType())) {
                    return;
                }
                project.log(new StringBuffer().append("return type of execute() should be void but was \"").append(method.getReturnType()).append("\" in ").append(cls).toString(), 1);
            } catch (LinkageError e) {
                String stringBuffer = new StringBuffer().append("Could not load ").append(cls).append(": ").append(e).toString();
                project.log(stringBuffer, 0);
                throw new BuildException(stringBuffer, e);
            } catch (NoSuchMethodException e2) {
                String stringBuffer2 = new StringBuffer().append("No public execute() in ").append(cls).toString();
                project.log(stringBuffer2, 0);
                throw new BuildException(stringBuffer2);
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public void checkProxyClass(Class cls) {
        checkTaskClass(cls, getProject());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class<?> cls;
        Class<?> cls2;
        try {
            Class<?> cls3 = this.proxy.getClass();
            if (class$org$apache$tools$ant$Location == null) {
                cls2 = class$("org.apache.tools.ant.Location");
                class$org$apache$tools$ant$Location = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$Location;
            }
            Method method = cls3.getMethod("setLocation", cls2);
            if (method != null) {
                method.invoke(this.proxy, getLocation());
            }
        } catch (NoSuchMethodException e) {
        } catch (Exception e2) {
            log(new StringBuffer().append("Error setting location in ").append(this.proxy.getClass()).toString(), 0);
            throw new BuildException(e2);
        }
        try {
            Class<?> cls4 = this.proxy.getClass();
            if (class$org$apache$tools$ant$Project == null) {
                cls = class$("org.apache.tools.ant.Project");
                class$org$apache$tools$ant$Project = cls;
            } else {
                cls = class$org$apache$tools$ant$Project;
            }
            Method method2 = cls4.getMethod("setProject", cls);
            if (method2 != null) {
                method2.invoke(this.proxy, getProject());
            }
        } catch (NoSuchMethodException e3) {
        } catch (Exception e4) {
            log(new StringBuffer().append("Error setting project in ").append(this.proxy.getClass()).toString(), 0);
            throw new BuildException(e4);
        }
        try {
            DispatchUtils.execute(this.proxy);
        } catch (BuildException e5) {
            throw e5;
        } catch (Exception e6) {
            log(new StringBuffer().append("Error in ").append(this.proxy.getClass()).toString(), 3);
            throw new BuildException(e6);
        }
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public Object getProxy() {
        return this.proxy;
    }

    @Override // org.apache.tools.ant.TypeAdapter
    public void setProxy(Object obj) {
        this.proxy = obj;
    }
}
