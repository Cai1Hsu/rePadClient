package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.CommandlineJava;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Permissions;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.TimeoutObserver;
import org.apache.tools.ant.util.Watchdog;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ExecuteJava.class */
public class ExecuteJava implements Runnable, TimeoutObserver {
    static Class array$Ljava$lang$String;
    private Commandline javaCommand = null;
    private Path classpath = null;
    private CommandlineJava.SysProperties sysProperties = null;
    private Permissions perm = null;
    private Method main = null;
    private Long timeout = null;
    private volatile Throwable caught = null;
    private volatile boolean timedOut = false;
    private Thread thread = null;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static void setupCommandLineForVMS(Execute execute, String[] strArr) {
        execute.setVMLauncher(true);
        try {
            String[] strArr2 = new String[strArr.length - 1];
            System.arraycopy(strArr, 1, strArr2, 0, strArr.length - 1);
            File createVmsJavaOptionFile = JavaEnvUtils.createVmsJavaOptionFile(strArr2);
            createVmsJavaOptionFile.deleteOnExit();
            execute.setCommandline(new String[]{strArr[0], MSVSSConstants.FLAG_VERSION, createVmsJavaOptionFile.getPath()});
        } catch (IOException e) {
            throw new BuildException("Failed to create a temporary file for \"-V\" switch");
        }
    }

    public void execute(Project project) throws BuildException {
        AntClassLoader antClassLoader;
        Class<?> cls;
        Class<?> cls2;
        String executable = this.javaCommand.getExecutable();
        AntClassLoader antClassLoader2 = null;
        try {
            try {
                try {
                    if (this.sysProperties != null) {
                        this.sysProperties.setSystem();
                    }
                    try {
                        if (this.classpath == null) {
                            cls = Class.forName(executable);
                            antClassLoader = null;
                        } else {
                            AntClassLoader createClassLoader = project.createClassLoader(this.classpath);
                            createClassLoader.setParent(project.getCoreLoader());
                            createClassLoader.setParentFirst(false);
                            createClassLoader.addJavaLibraries();
                            createClassLoader.setIsolated(true);
                            createClassLoader.setThreadContextLoader();
                            createClassLoader.forceLoadClass(executable);
                            antClassLoader = createClassLoader;
                            cls = Class.forName(executable, true, createClassLoader);
                        }
                        if (array$Ljava$lang$String == null) {
                            AntClassLoader antClassLoader3 = antClassLoader;
                            cls2 = class$("[Ljava.lang.String;");
                            AntClassLoader antClassLoader4 = antClassLoader;
                            array$Ljava$lang$String = cls2;
                        } else {
                            AntClassLoader antClassLoader5 = antClassLoader;
                            cls2 = array$Ljava$lang$String;
                        }
                        AntClassLoader antClassLoader6 = antClassLoader;
                        this.main = cls.getMethod("main", cls2);
                        AntClassLoader antClassLoader7 = antClassLoader;
                        if (this.main == null) {
                            AntClassLoader antClassLoader8 = antClassLoader;
                            AntClassLoader antClassLoader9 = antClassLoader;
                            AntClassLoader antClassLoader10 = antClassLoader;
                            AntClassLoader antClassLoader11 = antClassLoader;
                            BuildException buildException = new BuildException(new StringBuffer().append("Could not find main() method in ").append(executable).toString());
                            AntClassLoader antClassLoader12 = antClassLoader;
                            throw buildException;
                        } else if ((this.main.getModifiers() & 8) == 0) {
                            AntClassLoader antClassLoader13 = antClassLoader;
                            AntClassLoader antClassLoader14 = antClassLoader;
                            AntClassLoader antClassLoader15 = antClassLoader;
                            AntClassLoader antClassLoader16 = antClassLoader;
                            BuildException buildException2 = new BuildException(new StringBuffer().append("main() method in ").append(executable).append(" is not declared static").toString());
                            AntClassLoader antClassLoader17 = antClassLoader;
                            throw buildException2;
                        } else {
                            AntClassLoader antClassLoader18 = antClassLoader;
                            if (this.timeout == null) {
                                AntClassLoader antClassLoader19 = antClassLoader;
                                run();
                            } else {
                                AntClassLoader antClassLoader20 = antClassLoader;
                                AntClassLoader antClassLoader21 = antClassLoader;
                                AntClassLoader antClassLoader22 = antClassLoader;
                                this.thread = new Thread(this, "ExecuteJava");
                                AntClassLoader antClassLoader23 = antClassLoader;
                                AntClassLoader antClassLoader24 = antClassLoader;
                                project.registerThreadTask(this.thread, project.getThreadTask(Thread.currentThread()));
                                AntClassLoader antClassLoader25 = antClassLoader;
                                this.thread.setDaemon(true);
                                AntClassLoader antClassLoader26 = antClassLoader;
                                AntClassLoader antClassLoader27 = antClassLoader;
                                Watchdog watchdog = new Watchdog(this.timeout.longValue());
                                AntClassLoader antClassLoader28 = antClassLoader;
                                watchdog.addTimeoutObserver(this);
                                AntClassLoader antClassLoader29 = antClassLoader;
                                synchronized (this) {
                                    try {
                                        this.thread.start();
                                        watchdog.start();
                                        try {
                                            wait();
                                        } catch (InterruptedException e) {
                                        }
                                        if (this.timedOut) {
                                            project.log("Timeout: sub-process interrupted", 1);
                                        } else {
                                            this.thread = null;
                                            watchdog.stop();
                                        }
                                    } catch (Throwable th) {
                                        AntClassLoader antClassLoader30 = antClassLoader;
                                        throw th;
                                    }
                                }
                            }
                            AntClassLoader antClassLoader31 = antClassLoader;
                            if (this.caught != null) {
                                AntClassLoader antClassLoader32 = antClassLoader;
                                throw this.caught;
                            }
                            if (antClassLoader != null) {
                                antClassLoader.resetThreadContextLoader();
                                antClassLoader.cleanup();
                            }
                            if (this.sysProperties == null) {
                                return;
                            }
                            this.sysProperties.restoreSystem();
                        }
                    } catch (ClassNotFoundException e2) {
                        throw new BuildException(new StringBuffer().append("Could not find ").append(executable).append(".").append(" Make sure you have it in your").append(" classpath").toString());
                    }
                } catch (Throwable th2) {
                    if (0 != 0) {
                        antClassLoader2.resetThreadContextLoader();
                        antClassLoader2.cleanup();
                    }
                    if (this.sysProperties != null) {
                        this.sysProperties.restoreSystem();
                    }
                    throw th2;
                }
            } catch (SecurityException e3) {
                throw e3;
            }
        } catch (ThreadDeath e4) {
            throw e4;
        } catch (BuildException e5) {
            throw e5;
        }
    }

    public int fork(ProjectComponent projectComponent) throws BuildException {
        CommandlineJava commandlineJava = new CommandlineJava();
        commandlineJava.setClassname(this.javaCommand.getExecutable());
        for (String str : this.javaCommand.getArguments()) {
            commandlineJava.createArgument().setValue(str);
        }
        if (this.classpath != null) {
            commandlineJava.createClasspath(projectComponent.getProject()).append(this.classpath);
        }
        if (this.sysProperties != null) {
            commandlineJava.addSysproperties(this.sysProperties);
        }
        Redirector redirector = new Redirector(projectComponent);
        Execute execute = new Execute(redirector.createHandler(), this.timeout == null ? null : new ExecuteWatchdog(this.timeout.longValue()));
        execute.setAntRun(projectComponent.getProject());
        if (Os.isFamily(Os.FAMILY_VMS)) {
            setupCommandLineForVMS(execute, commandlineJava.getCommandline());
        } else {
            execute.setCommandline(commandlineJava.getCommandline());
        }
        try {
            try {
                int execute2 = execute.execute();
                redirector.complete();
                return execute2;
            } catch (IOException e) {
                throw new BuildException(e);
            }
        } finally {
            this.timedOut = execute.killedProcess();
        }
    }

    public boolean killedProcess() {
        boolean z;
        synchronized (this) {
            z = this.timedOut;
        }
        return z;
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    @Override // java.lang.Runnable
    public void run() {
        String[] arguments = this.javaCommand.getArguments();
        try {
            try {
                if (this.perm != null) {
                    this.perm.setSecurityManager();
                }
                this.main.invoke(null, arguments);
                if (this.perm != null) {
                    this.perm.restoreSecurityManager();
                }
                synchronized (this) {
                    notifyAll();
                }
            } catch (InvocationTargetException e) {
                Throwable targetException = e.getTargetException();
                if (!(targetException instanceof InterruptedException)) {
                    this.caught = targetException;
                }
                if (this.perm != null) {
                    this.perm.restoreSecurityManager();
                }
                synchronized (this) {
                    notifyAll();
                }
            }
        } catch (Throwable th) {
            if (this.perm != null) {
                this.perm.restoreSecurityManager();
            }
            synchronized (this) {
                notifyAll();
                throw th;
            }
        }
    }

    public void setClasspath(Path path) {
        this.classpath = path;
    }

    public void setJavaCommand(Commandline commandline) {
        this.javaCommand = commandline;
    }

    public void setOutput(PrintStream printStream) {
    }

    public void setPermissions(Permissions permissions) {
        this.perm = permissions;
    }

    public void setSystemProperties(CommandlineJava.SysProperties sysProperties) {
        this.sysProperties = sysProperties;
    }

    public void setTimeout(Long l) {
        this.timeout = l;
    }

    @Override // org.apache.tools.ant.util.TimeoutObserver
    public void timeoutOccured(Watchdog watchdog) {
        synchronized (this) {
            if (this.thread != null) {
                this.timedOut = true;
                this.thread.interrupt();
            }
            notifyAll();
        }
    }
}
