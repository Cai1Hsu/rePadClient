package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute.class */
public class Execute {
    public static final int INVALID = Integer.MAX_VALUE;
    private static final int ONE_SECOND = 1000;
    static Class class$java$lang$System;
    private static boolean environmentCaseInSensitive;
    private static CommandLauncher shellLauncher;
    private static CommandLauncher vmLauncher;
    private String[] cmdl;
    private String[] env;
    private int exitValue;
    private boolean newEnvironment;
    private Project project;
    private ExecuteStreamHandler streamHandler;
    private boolean useVMLauncher;
    private ExecuteWatchdog watchdog;
    private File workingDirectory;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static String antWorkingDirectory = System.getProperty("user.dir");
    private static Map procEnvironment = null;
    private static ProcessDestroyer processDestroyer = new ProcessDestroyer();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$CommandLauncher.class */
    private static class CommandLauncher {
        private CommandLauncher() {
        }

        CommandLauncher(AnonymousClass1 anonymousClass1) {
            this();
        }

        public Process exec(Project project, String[] strArr, String[] strArr2) throws IOException {
            if (project != null) {
                project.log(new StringBuffer().append("Execute:CommandLauncher: ").append(Commandline.describeCommand(strArr)).toString(), 4);
            }
            return Runtime.getRuntime().exec(strArr, strArr2);
        }

        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            if (file == null) {
                return exec(project, strArr, strArr2);
            }
            throw new IOException("Cannot execute a process in different directory under this JVM");
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy.class */
    private static class CommandLauncherProxy extends CommandLauncher {
        private CommandLauncher myLauncher;

        CommandLauncherProxy(CommandLauncher commandLauncher) {
            super(null);
            this.myLauncher = commandLauncher;
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2) throws IOException {
            return this.myLauncher.exec(project, strArr, strArr2);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher.class */
    private static class Java13CommandLauncher extends CommandLauncher {
        public Java13CommandLauncher() throws NoSuchMethodException {
            super(null);
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            if (project != null) {
                try {
                    project.log(new StringBuffer().append("Execute:Java13CommandLauncher: ").append(Commandline.describeCommand(strArr)).toString(), 4);
                } catch (IOException e) {
                    throw e;
                } catch (Exception e2) {
                    throw new BuildException("Unable to execute command", e2);
                }
            }
            return Runtime.getRuntime().exec(strArr, strArr2, file);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$MacCommandLauncher.class */
    private static class MacCommandLauncher extends CommandLauncherProxy {
        MacCommandLauncher(CommandLauncher commandLauncher) {
            super(commandLauncher);
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            Process exec;
            if (file == null) {
                exec = exec(project, strArr, strArr2);
            } else {
                System.getProperties().put("user.dir", file.getAbsolutePath());
                try {
                    exec = exec(project, strArr, strArr2);
                    System.getProperties().put("user.dir", Execute.antWorkingDirectory);
                } catch (Throwable th) {
                    System.getProperties().put("user.dir", Execute.antWorkingDirectory);
                    throw th;
                }
            }
            return exec;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher.class */
    private static class OS2CommandLauncher extends CommandLauncherProxy {
        OS2CommandLauncher(CommandLauncher commandLauncher) {
            super(commandLauncher);
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            Process process;
            File file2 = file;
            if (file == null) {
                if (project == null) {
                    process = exec(project, strArr, strArr2);
                    return process;
                }
                file2 = project.getBaseDir();
            }
            String absolutePath = file2.getAbsolutePath();
            String[] strArr3 = new String[strArr.length + 7];
            strArr3[0] = "cmd";
            strArr3[1] = "/c";
            strArr3[2] = absolutePath.substring(0, 2);
            strArr3[3] = "&&";
            strArr3[4] = "cd";
            strArr3[5] = absolutePath.substring(2);
            strArr3[6] = "&&";
            System.arraycopy(strArr, 0, strArr3, 7, strArr.length);
            process = exec(project, strArr3, strArr2);
            return process;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$PerlScriptCommandLauncher.class */
    private static class PerlScriptCommandLauncher extends CommandLauncherProxy {
        private String myScript;

        PerlScriptCommandLauncher(String str, CommandLauncher commandLauncher) {
            super(commandLauncher);
            this.myScript = str;
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            Process exec;
            if (project != null) {
                String property = project.getProperty(MagicNames.ANT_HOME);
                if (property == null) {
                    throw new IOException("Cannot locate antRun script: Property 'ant.home' not found");
                }
                String file2 = Execute.FILE_UTILS.resolveFile(project.getBaseDir(), new StringBuffer().append(property).append(File.separator).append(this.myScript).toString()).toString();
                File file3 = file;
                if (file == null) {
                    file3 = project.getBaseDir();
                }
                String[] strArr3 = new String[strArr.length + 3];
                strArr3[0] = "perl";
                strArr3[1] = file2;
                strArr3[2] = file3.getAbsolutePath();
                System.arraycopy(strArr, 0, strArr3, 3, strArr.length);
                exec = exec(project, strArr3, strArr2);
            } else if (file != null) {
                throw new IOException("Cannot locate antRun script: No project provided");
            } else {
                exec = exec(project, strArr, strArr2);
            }
            return exec;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher.class */
    private static class ScriptCommandLauncher extends CommandLauncherProxy {
        private String myScript;

        ScriptCommandLauncher(String str, CommandLauncher commandLauncher) {
            super(commandLauncher);
            this.myScript = str;
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            Process exec;
            if (project != null) {
                String property = project.getProperty(MagicNames.ANT_HOME);
                if (property == null) {
                    throw new IOException("Cannot locate antRun script: Property 'ant.home' not found");
                }
                String file2 = Execute.FILE_UTILS.resolveFile(project.getBaseDir(), new StringBuffer().append(property).append(File.separator).append(this.myScript).toString()).toString();
                File file3 = file;
                if (file == null) {
                    file3 = project.getBaseDir();
                }
                String[] strArr3 = new String[strArr.length + 2];
                strArr3[0] = file2;
                strArr3[1] = file3.getAbsolutePath();
                System.arraycopy(strArr, 0, strArr3, 2, strArr.length);
                exec = exec(project, strArr3, strArr2);
            } else if (file != null) {
                throw new IOException("Cannot locate antRun script: No project provided");
            } else {
                exec = exec(project, strArr, strArr2);
            }
            return exec;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher.class */
    private static class VmsCommandLauncher extends Java13CommandLauncher {
        private File createCommandFile(String[] strArr, String[] strArr2) throws IOException {
            BufferedWriter bufferedWriter;
            Throwable th;
            File createTempFile = Execute.FILE_UTILS.createTempFile("ANT", ".COM", null, true, true);
            try {
                BufferedWriter bufferedWriter2 = new BufferedWriter(new FileWriter(createTempFile));
                if (strArr2 != null) {
                    for (int i = 0; i < strArr2.length; i++) {
                        try {
                            int indexOf = strArr2[i].indexOf(61);
                            if (indexOf != -1) {
                                bufferedWriter2.write("$ DEFINE/NOLOG ");
                                bufferedWriter2.write(strArr2[i].substring(0, indexOf));
                                bufferedWriter2.write(" \"");
                                bufferedWriter2.write(strArr2[i].substring(indexOf + 1));
                                bufferedWriter2.write(34);
                                bufferedWriter2.newLine();
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            bufferedWriter = bufferedWriter2;
                            FileUtils.close(bufferedWriter);
                            throw th;
                        }
                    }
                }
                bufferedWriter2.write(new StringBuffer().append("$ ").append(strArr[0]).toString());
                for (int i2 = 1; i2 < strArr.length; i2++) {
                    bufferedWriter2.write(" -");
                    bufferedWriter2.newLine();
                    bufferedWriter2.write(strArr[i2]);
                }
                FileUtils.close(bufferedWriter2);
                return createTempFile;
            } catch (Throwable th3) {
                th = th3;
                bufferedWriter = null;
            }
        }

        /* JADX WARN: Type inference failed for: r0v0, types: [org.apache.tools.ant.taskdefs.Execute$2] */
        private void deleteAfter(File file, Process process) {
            new Thread(this, process, file) { // from class: org.apache.tools.ant.taskdefs.Execute.2
                private final VmsCommandLauncher this$0;
                private final File val$f;
                private final Process val$p;

                {
                    this.this$0 = this;
                    this.val$p = process;
                    this.val$f = file;
                }

                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    try {
                        this.val$p.waitFor();
                    } catch (InterruptedException e) {
                    }
                    FileUtils.delete(this.val$f);
                }
            }.start();
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2) throws IOException {
            File createCommandFile = createCommandFile(strArr, strArr2);
            Process exec = super.exec(project, new String[]{createCommandFile.getPath()}, strArr2);
            deleteAfter(createCommandFile, exec);
            return exec;
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.Java13CommandLauncher, org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            File createCommandFile = createCommandFile(strArr, strArr2);
            Process exec = super.exec(project, new String[]{createCommandFile.getPath()}, strArr2, file);
            deleteAfter(createCommandFile, exec);
            return exec;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher.class */
    private static class WinNTCommandLauncher extends CommandLauncherProxy {
        WinNTCommandLauncher(CommandLauncher commandLauncher) {
            super(commandLauncher);
        }

        @Override // org.apache.tools.ant.taskdefs.Execute.CommandLauncher
        public Process exec(Project project, String[] strArr, String[] strArr2, File file) throws IOException {
            Process process;
            File file2 = file;
            if (file == null) {
                if (project == null) {
                    process = exec(project, strArr, strArr2);
                    return process;
                }
                file2 = project.getBaseDir();
            }
            String[] strArr3 = new String[strArr.length + 6];
            strArr3[0] = "cmd";
            strArr3[1] = "/c";
            strArr3[2] = "cd";
            strArr3[3] = "/d";
            strArr3[4] = file2.getAbsolutePath();
            strArr3[5] = "&&";
            System.arraycopy(strArr, 0, strArr3, 6, strArr.length);
            process = exec(project, strArr3, strArr2);
            return process;
        }
    }

    static {
        vmLauncher = null;
        shellLauncher = null;
        environmentCaseInSensitive = false;
        try {
            if (!Os.isFamily(Os.FAMILY_OS2)) {
                vmLauncher = new Java13CommandLauncher();
            }
        } catch (NoSuchMethodException e) {
        }
        if (Os.isFamily(Os.FAMILY_MAC) && !Os.isFamily(Os.FAMILY_UNIX)) {
            shellLauncher = new MacCommandLauncher(new CommandLauncher(null));
        } else if (Os.isFamily(Os.FAMILY_OS2)) {
            shellLauncher = new OS2CommandLauncher(new CommandLauncher(null));
        } else if (Os.isFamily(Os.FAMILY_WINDOWS)) {
            environmentCaseInSensitive = true;
            CommandLauncher commandLauncher = new CommandLauncher(null);
            if (!Os.isFamily(Os.FAMILY_9X)) {
                shellLauncher = new WinNTCommandLauncher(commandLauncher);
            } else {
                shellLauncher = new ScriptCommandLauncher("bin/antRun.bat", commandLauncher);
            }
        } else if (Os.isFamily(Os.FAMILY_NETWARE)) {
            shellLauncher = new PerlScriptCommandLauncher("bin/antRun.pl", new CommandLauncher(null));
        } else if (!Os.isFamily(Os.FAMILY_VMS)) {
            shellLauncher = new ScriptCommandLauncher("bin/antRun", new CommandLauncher(null));
        } else {
            try {
                shellLauncher = new VmsCommandLauncher();
            } catch (NoSuchMethodException e2) {
            }
        }
    }

    public Execute() {
        this(new PumpStreamHandler(), null);
    }

    public Execute(ExecuteStreamHandler executeStreamHandler) {
        this(executeStreamHandler, null);
    }

    public Execute(ExecuteStreamHandler executeStreamHandler, ExecuteWatchdog executeWatchdog) {
        this.cmdl = null;
        this.env = null;
        this.exitValue = INVALID;
        this.workingDirectory = null;
        this.project = null;
        this.newEnvironment = false;
        this.useVMLauncher = true;
        setStreamHandler(executeStreamHandler);
        this.watchdog = executeWatchdog;
        if (Os.isFamily(Os.FAMILY_VMS)) {
            this.useVMLauncher = false;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static void closeStreams(Process process) {
        FileUtils.close(process.getInputStream());
        FileUtils.close(process.getOutputStream());
        FileUtils.close(process.getErrorStream());
    }

    public static Map getEnvironmentVariables() {
        Map map;
        BufferedReader bufferedReader;
        Class cls;
        synchronized (Execute.class) {
            try {
                if (procEnvironment != null) {
                    map = procEnvironment;
                } else {
                    if (JavaEnvUtils.isAtLeastJavaVersion(JavaEnvUtils.JAVA_1_5) && !Os.isFamily(Os.FAMILY_VMS)) {
                        try {
                            if (class$java$lang$System == null) {
                                cls = class$("java.lang.System");
                                class$java$lang$System = cls;
                            } else {
                                cls = class$java$lang$System;
                            }
                            procEnvironment = (Map) cls.getMethod("getenv", new Class[0]).invoke(null, new Object[0]);
                            map = procEnvironment;
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    procEnvironment = new LinkedHashMap();
                    try {
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        Execute execute = new Execute(new PumpStreamHandler(byteArrayOutputStream));
                        execute.setCommandline(getProcEnvCommand());
                        execute.setNewenvironment(true);
                        if (execute.execute() != 0) {
                        }
                        bufferedReader = new BufferedReader(new StringReader(toString(byteArrayOutputStream)));
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                    if (Os.isFamily(Os.FAMILY_VMS)) {
                        procEnvironment = getVMSLogicals(bufferedReader);
                        map = procEnvironment;
                    } else {
                        String str = null;
                        String str2 = StringUtils.LINE_SEP;
                        while (true) {
                            String readLine = bufferedReader.readLine();
                            if (readLine == null) {
                                break;
                            } else if (readLine.indexOf(61) == -1) {
                                str = str == null ? new StringBuffer().append(str2).append(readLine).toString() : new StringBuffer().append(str).append(str2).append(readLine).toString();
                            } else {
                                if (str != null) {
                                    int indexOf = str.indexOf("=");
                                    procEnvironment.put(str.substring(0, indexOf), str.substring(indexOf + 1));
                                }
                                str = readLine;
                            }
                        }
                        if (str != null) {
                            int indexOf2 = str.indexOf("=");
                            procEnvironment.put(str.substring(0, indexOf2), str.substring(indexOf2 + 1));
                        }
                        map = procEnvironment;
                    }
                }
            } finally {
            }
        }
        return map;
    }

    private static String[] getProcEnvCommand() {
        String[] strArr;
        if (Os.isFamily(Os.FAMILY_OS2)) {
            strArr = new String[]{"cmd", "/c", "set"};
        } else if (Os.isFamily(Os.FAMILY_WINDOWS)) {
            strArr = Os.isFamily(Os.FAMILY_9X) ? new String[]{"command.com", "/c", "set"} : new String[]{"cmd", "/c", "set"};
        } else if (Os.isFamily(Os.FAMILY_ZOS) || Os.isFamily(Os.FAMILY_UNIX)) {
            strArr = new String[1];
            if (new File("/bin/env").canRead()) {
                strArr[0] = "/bin/env";
            } else if (new File("/usr/bin/env").canRead()) {
                strArr[0] = "/usr/bin/env";
            } else {
                strArr[0] = "env";
            }
        } else {
            strArr = (Os.isFamily(Os.FAMILY_NETWARE) || Os.isFamily(Os.FAMILY_OS400)) ? new String[]{"env"} : Os.isFamily(Os.FAMILY_VMS) ? new String[]{"show", "logical"} : null;
        }
        return strArr;
    }

    public static Vector getProcEnvironment() {
        Vector vector;
        synchronized (Execute.class) {
            try {
                vector = new Vector();
                for (Map.Entry entry : getEnvironmentVariables().entrySet()) {
                    vector.add(new StringBuffer().append(entry.getKey()).append("=").append(entry.getValue()).toString());
                }
            } finally {
            }
        }
        return vector;
    }

    private static Map getVMSLogicals(BufferedReader bufferedReader) throws IOException {
        HashMap hashMap = new HashMap();
        String str = null;
        String str2 = null;
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                break;
            } else if (readLine.startsWith("\t=")) {
                if (str != null) {
                    str2 = new StringBuffer().append(str2).append(",").append(readLine.substring(4, readLine.length() - 1)).toString();
                }
            } else if (readLine.startsWith("  \"")) {
                if (str != null) {
                    hashMap.put(str, str2);
                }
                int indexOf = readLine.indexOf(61);
                str = readLine.substring(3, indexOf - 2);
                if (hashMap.containsKey(str)) {
                    str = null;
                } else {
                    str2 = readLine.substring(indexOf + 3, readLine.length() - 1);
                }
            }
        }
        if (str != null) {
            hashMap.put(str, str2);
        }
        return hashMap;
    }

    public static boolean isFailure(int i) {
        boolean z = true;
        if (Os.isFamily(Os.FAMILY_VMS)) {
            if (i % 2 != 0) {
                z = false;
            }
        } else if (i == 0) {
            z = false;
        }
        return z;
    }

    public static Process launch(Project project, String[] strArr, String[] strArr2, File file, boolean z) throws IOException {
        if (file == null || file.exists()) {
            return ((!z || vmLauncher == null) ? shellLauncher : vmLauncher).exec(project, strArr, strArr2, file);
        }
        throw new BuildException(new StringBuffer().append(file).append(" doesn't exist.").toString());
    }

    private String[] patchEnvironment() {
        String[] strArr;
        if (Os.isFamily(Os.FAMILY_VMS)) {
            strArr = this.env;
        } else {
            LinkedHashMap linkedHashMap = new LinkedHashMap(getEnvironmentVariables());
            for (int i = 0; i < this.env.length; i++) {
                String str = this.env[i];
                String substring = str.substring(0, str.indexOf(61));
                String str2 = substring;
                if (linkedHashMap.remove(substring) == null) {
                    str2 = substring;
                    if (environmentCaseInSensitive) {
                        Iterator it = linkedHashMap.keySet().iterator();
                        do {
                            str2 = substring;
                            if (it.hasNext()) {
                                str2 = (String) it.next();
                            }
                        } while (!str2.toLowerCase().equals(substring.toLowerCase()));
                    }
                }
                linkedHashMap.put(str2, str.substring(str2.length() + 1));
            }
            ArrayList arrayList = new ArrayList();
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                arrayList.add(new StringBuffer().append(entry.getKey()).append("=").append(entry.getValue()).toString());
            }
            strArr = (String[]) arrayList.toArray(new String[linkedHashMap.size()]);
        }
        return strArr;
    }

    public static void runCommand(Task task, String[] strArr) throws BuildException {
        try {
            task.log(Commandline.describeCommand(strArr), 3);
            Execute execute = new Execute(new LogStreamHandler(task, 2, 0));
            execute.setAntRun(task.getProject());
            execute.setCommandline(strArr);
            int execute2 = execute.execute();
            if (!isFailure(execute2)) {
                return;
            }
            throw new BuildException(new StringBuffer().append(strArr[0]).append(" failed with return code ").append(execute2).toString(), task.getLocation());
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Could not launch ").append(strArr[0]).append(": ").append(e).toString(), task.getLocation());
        }
    }

    public static String toString(ByteArrayOutputStream byteArrayOutputStream) {
        String byteArrayOutputStream2;
        if (Os.isFamily(Os.FAMILY_ZOS)) {
            try {
                byteArrayOutputStream2 = byteArrayOutputStream.toString("Cp1047");
            } catch (UnsupportedEncodingException e) {
            }
        } else {
            if (Os.isFamily(Os.FAMILY_OS400)) {
                try {
                    byteArrayOutputStream2 = byteArrayOutputStream.toString("Cp500");
                } catch (UnsupportedEncodingException e2) {
                }
            }
            byteArrayOutputStream2 = byteArrayOutputStream.toString();
        }
        return byteArrayOutputStream2;
    }

    public int execute() throws IOException {
        if (this.workingDirectory == null || this.workingDirectory.exists()) {
            Process launch = launch(this.project, getCommandline(), getEnvironment(), this.workingDirectory, this.useVMLauncher);
            try {
                this.streamHandler.setProcessInputStream(launch.getOutputStream());
                this.streamHandler.setProcessOutputStream(launch.getInputStream());
                this.streamHandler.setProcessErrorStream(launch.getErrorStream());
                this.streamHandler.start();
                try {
                    try {
                        processDestroyer.add(launch);
                        if (this.watchdog != null) {
                            this.watchdog.start(launch);
                        }
                        waitFor(launch);
                        if (this.watchdog != null) {
                            this.watchdog.stop();
                        }
                        this.streamHandler.stop();
                        closeStreams(launch);
                        if (this.watchdog != null) {
                            this.watchdog.checkException();
                        }
                        int exitValue = getExitValue();
                        processDestroyer.remove(launch);
                        return exitValue;
                    } catch (ThreadDeath e) {
                        launch.destroy();
                        throw e;
                    }
                } catch (Throwable th) {
                    processDestroyer.remove(launch);
                    throw th;
                }
            } catch (IOException e2) {
                launch.destroy();
                throw e2;
            }
        }
        throw new BuildException(new StringBuffer().append(this.workingDirectory).append(" doesn't exist.").toString());
    }

    public String[] getCommandline() {
        return this.cmdl;
    }

    public String[] getEnvironment() {
        return (this.env == null || this.newEnvironment) ? this.env : patchEnvironment();
    }

    public int getExitValue() {
        return this.exitValue;
    }

    public File getWorkingDirectory() {
        return this.workingDirectory == null ? new File(antWorkingDirectory) : this.workingDirectory;
    }

    public boolean isFailure() {
        return isFailure(getExitValue());
    }

    public boolean killedProcess() {
        return this.watchdog != null && this.watchdog.killedProcess();
    }

    public void setAntRun(Project project) throws BuildException {
        this.project = project;
    }

    public void setCommandline(String[] strArr) {
        this.cmdl = strArr;
    }

    public void setEnvironment(String[] strArr) {
        this.env = strArr;
    }

    protected void setExitValue(int i) {
        this.exitValue = i;
    }

    public void setNewenvironment(boolean z) {
        this.newEnvironment = z;
    }

    public void setSpawn(boolean z) {
    }

    public void setStreamHandler(ExecuteStreamHandler executeStreamHandler) {
        this.streamHandler = executeStreamHandler;
    }

    public void setVMLauncher(boolean z) {
        this.useVMLauncher = z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0010, code lost:
        if (r4.getAbsolutePath().equals(org.apache.tools.ant.taskdefs.Execute.antWorkingDirectory) != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void setWorkingDirectory(File file) {
        File file2;
        if (file != null) {
            file2 = file;
        }
        file2 = null;
        this.workingDirectory = file2;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x00a8 -> B:11:0x0056). Please submit an issue!!! */
    public void spawn() throws IOException {
        if (this.workingDirectory == null || this.workingDirectory.exists()) {
            Process launch = launch(this.project, getCommandline(), getEnvironment(), this.workingDirectory, this.useVMLauncher);
            if (Os.isFamily(Os.FAMILY_WINDOWS)) {
                try {
                    Thread.sleep(1000L);
                } catch (InterruptedException e) {
                    this.project.log("interruption in the sleep after having spawned a process", 3);
                }
            }
            PumpStreamHandler pumpStreamHandler = new PumpStreamHandler(new OutputStream(this) { // from class: org.apache.tools.ant.taskdefs.Execute.1
                private final Execute this$0;

                {
                    this.this$0 = this;
                }

                @Override // java.io.OutputStream
                public void write(int i) throws IOException {
                }
            });
            pumpStreamHandler.setProcessErrorStream(launch.getErrorStream());
            pumpStreamHandler.setProcessOutputStream(launch.getInputStream());
            pumpStreamHandler.start();
            launch.getOutputStream().close();
            this.project.log(new StringBuffer().append("spawned process ").append(launch.toString()).toString(), 3);
            return;
        }
        throw new BuildException(new StringBuffer().append(this.workingDirectory).append(" doesn't exist.").toString());
    }

    protected void waitFor(Process process) {
        try {
            process.waitFor();
            setExitValue(process.exitValue());
        } catch (InterruptedException e) {
            process.destroy();
        }
    }
}
