package org.apache.tools.ant.taskdefs;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Taskdef.class */
public class Taskdef extends Typedef {
    static Class class$org$apache$tools$ant$Task;
    static Class class$org$apache$tools$ant$TaskAdapter;

    public Taskdef() {
        Class cls;
        Class cls2;
        if (class$org$apache$tools$ant$TaskAdapter == null) {
            cls = class$("org.apache.tools.ant.TaskAdapter");
            class$org$apache$tools$ant$TaskAdapter = cls;
        } else {
            cls = class$org$apache$tools$ant$TaskAdapter;
        }
        setAdapterClass(cls);
        if (class$org$apache$tools$ant$Task == null) {
            cls2 = class$("org.apache.tools.ant.Task");
            class$org$apache$tools$ant$Task = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$Task;
        }
        setAdaptToClass(cls2);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }
}
