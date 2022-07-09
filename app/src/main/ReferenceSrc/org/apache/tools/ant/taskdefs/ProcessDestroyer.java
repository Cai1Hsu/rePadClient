package org.apache.tools.ant.taskdefs;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ProcessDestroyer.class */
class ProcessDestroyer implements Runnable {
    private static final int THREAD_DIE_TIMEOUT = 20000;
    static Class class$java$lang$IllegalStateException;
    static Class class$java$lang$Runtime;
    static Class class$java$lang$Thread;
    private Method addShutdownHookMethod;
    private Method removeShutdownHookMethod;
    private HashSet processes = new HashSet();
    private ProcessDestroyerImpl destroyProcessThread = null;
    private boolean added = false;
    private boolean running = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl.class */
    private class ProcessDestroyerImpl extends Thread {
        private boolean shouldDestroy = true;
        private final ProcessDestroyer this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ProcessDestroyerImpl(ProcessDestroyer processDestroyer) {
            super("ProcessDestroyer Shutdown Hook");
            this.this$0 = processDestroyer;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            if (this.shouldDestroy) {
                this.this$0.run();
            }
        }

        public void setShouldDestroy(boolean z) {
            this.shouldDestroy = z;
        }
    }

    ProcessDestroyer() {
        Class<?> cls;
        Class cls2;
        Class cls3;
        try {
            Class<?>[] clsArr = new Class[1];
            if (class$java$lang$Thread == null) {
                cls = class$("java.lang.Thread");
                class$java$lang$Thread = cls;
            } else {
                cls = class$java$lang$Thread;
            }
            clsArr[0] = cls;
            if (class$java$lang$Runtime == null) {
                cls2 = class$("java.lang.Runtime");
                class$java$lang$Runtime = cls2;
            } else {
                cls2 = class$java$lang$Runtime;
            }
            this.addShutdownHookMethod = cls2.getMethod("addShutdownHook", clsArr);
            if (class$java$lang$Runtime == null) {
                cls3 = class$("java.lang.Runtime");
                class$java$lang$Runtime = cls3;
            } else {
                cls3 = class$java$lang$Runtime;
            }
            this.removeShutdownHookMethod = cls3.getMethod("removeShutdownHook", clsArr);
        } catch (NoSuchMethodException e) {
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    private void addShutdownHook() {
        Class<?> cls;
        if (this.addShutdownHookMethod == null || this.running) {
            return;
        }
        this.destroyProcessThread = new ProcessDestroyerImpl(this);
        try {
            this.addShutdownHookMethod.invoke(Runtime.getRuntime(), this.destroyProcessThread);
            this.added = true;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e2) {
            Throwable targetException = e2.getTargetException();
            if (targetException != null) {
                Class<?> cls2 = targetException.getClass();
                if (class$java$lang$IllegalStateException == null) {
                    cls = class$("java.lang.IllegalStateException");
                    class$java$lang$IllegalStateException = cls;
                } else {
                    cls = class$java$lang$IllegalStateException;
                }
                if (cls2 == cls) {
                    this.running = true;
                    return;
                }
            }
            e2.printStackTrace();
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void removeShutdownHook() {
        Class<?> cls;
        if (this.removeShutdownHookMethod == null || !this.added || this.running) {
            return;
        }
        try {
            if (!((Boolean) this.removeShutdownHookMethod.invoke(Runtime.getRuntime(), this.destroyProcessThread)).booleanValue()) {
                System.err.println("Could not remove shutdown hook");
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e2) {
            Throwable targetException = e2.getTargetException();
            if (targetException != null) {
                Class<?> cls2 = targetException.getClass();
                if (class$java$lang$IllegalStateException == null) {
                    cls = class$("java.lang.IllegalStateException");
                    class$java$lang$IllegalStateException = cls;
                } else {
                    cls = class$java$lang$IllegalStateException;
                }
                if (cls2 == cls) {
                    this.running = true;
                }
            }
            e2.printStackTrace();
        }
        this.destroyProcessThread.setShouldDestroy(false);
        if (!this.destroyProcessThread.getThreadGroup().isDestroyed()) {
            this.destroyProcessThread.start();
        }
        try {
            this.destroyProcessThread.join(20000L);
        } catch (InterruptedException e3) {
        }
        this.destroyProcessThread = null;
        this.added = false;
    }

    public boolean add(Process process) {
        boolean add;
        synchronized (this.processes) {
            if (this.processes.size() == 0) {
                addShutdownHook();
            }
            add = this.processes.add(process);
        }
        return add;
    }

    public boolean isAddedAsShutdownHook() {
        return this.added;
    }

    public boolean remove(Process process) {
        boolean remove;
        synchronized (this.processes) {
            remove = this.processes.remove(process);
            if (remove && this.processes.size() == 0) {
                removeShutdownHook();
            }
        }
        return remove;
    }

    @Override // java.lang.Runnable
    public void run() {
        synchronized (this.processes) {
            this.running = true;
            Iterator it = this.processes.iterator();
            while (it.hasNext()) {
                ((Process) it.next()).destroy();
            }
        }
    }
}
