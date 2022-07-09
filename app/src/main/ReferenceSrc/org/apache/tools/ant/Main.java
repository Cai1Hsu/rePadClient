package org.apache.tools.ant;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Vector;
import org.apache.tools.ant.input.DefaultInputHandler;
import org.apache.tools.ant.input.InputHandler;
import org.apache.tools.ant.launch.AntMain;
import org.apache.tools.ant.property.ResolvePropertyMap;
import org.apache.tools.ant.taskdefs.optional.sos.SOSCmd;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.util.ClasspathUtils;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.ProxySetup;

/* loaded from: classes.jar:org/apache/tools/ant/Main.class */
public class Main implements AntMain {
    public static final String DEFAULT_BUILD_FILENAME = "build.xml";
    static Class class$org$apache$tools$ant$BuildListener;
    static Class class$org$apache$tools$ant$BuildLogger;
    static Class class$org$apache$tools$ant$Main;
    static Class class$org$apache$tools$ant$input$InputHandler;
    private File buildFile;
    private static final Set LAUNCH_COMMANDS = new HashSet();
    private static PrintStream out = System.out;
    private static PrintStream err = System.err;
    private static boolean isLogFileUsed = false;
    private static String antVersion = null;
    private int msgOutputLevel = 2;
    private Vector targets = new Vector();
    private Properties definedProps = new Properties();
    private Vector listeners = new Vector(1);
    private Vector propertyFiles = new Vector(1);
    private boolean allowInput = true;
    private boolean keepGoingMode = false;
    private String loggerClassname = null;
    private String inputHandlerClassname = null;
    private boolean emacsMode = false;
    private boolean readyToRun = false;
    private boolean projectHelp = false;
    private Integer threadPriority = null;
    private boolean proxy = false;

    static {
        LAUNCH_COMMANDS.add("-lib");
        LAUNCH_COMMANDS.add("-cp");
        LAUNCH_COMMANDS.add("-noclasspath");
        LAUNCH_COMMANDS.add("--noclasspath");
        LAUNCH_COMMANDS.add("-nouserlib");
        LAUNCH_COMMANDS.add("-main");
    }

    public Main() {
    }

    protected Main(String[] strArr) throws BuildException {
        processArgs(strArr);
    }

    private void addInputHandler(Project project) throws BuildException {
        Class cls;
        Class cls2;
        DefaultInputHandler defaultInputHandler;
        if (this.inputHandlerClassname == null) {
            defaultInputHandler = new DefaultInputHandler();
        } else {
            String str = this.inputHandlerClassname;
            if (class$org$apache$tools$ant$Main == null) {
                cls = class$("org.apache.tools.ant.Main");
                class$org$apache$tools$ant$Main = cls;
            } else {
                cls = class$org$apache$tools$ant$Main;
            }
            ClassLoader classLoader = cls.getClassLoader();
            if (class$org$apache$tools$ant$input$InputHandler == null) {
                cls2 = class$("org.apache.tools.ant.input.InputHandler");
                class$org$apache$tools$ant$input$InputHandler = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$input$InputHandler;
            }
            defaultInputHandler = (InputHandler) ClasspathUtils.newInstance(str, classLoader, cls2);
            project.setProjectReference(defaultInputHandler);
        }
        project.setInputHandler(defaultInputHandler);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private BuildLogger createLogger() {
        Class cls;
        Class cls2;
        DefaultLogger defaultLogger;
        if (this.loggerClassname != null) {
            try {
                String str = this.loggerClassname;
                if (class$org$apache$tools$ant$Main == null) {
                    cls = class$("org.apache.tools.ant.Main");
                    class$org$apache$tools$ant$Main = cls;
                } else {
                    cls = class$org$apache$tools$ant$Main;
                }
                ClassLoader classLoader = cls.getClassLoader();
                if (class$org$apache$tools$ant$BuildLogger == null) {
                    cls2 = class$("org.apache.tools.ant.BuildLogger");
                    class$org$apache$tools$ant$BuildLogger = cls2;
                } else {
                    cls2 = class$org$apache$tools$ant$BuildLogger;
                }
                defaultLogger = (BuildLogger) ClasspathUtils.newInstance(str, classLoader, cls2);
            } catch (BuildException e) {
                System.err.println(new StringBuffer().append("The specified logger class ").append(this.loggerClassname).append(" could not be used because ").append(e.getMessage()).toString());
                throw new RuntimeException();
            }
        } else {
            defaultLogger = new DefaultLogger();
        }
        defaultLogger.setMessageOutputLevel(this.msgOutputLevel);
        defaultLogger.setOutputPrintStream(out);
        defaultLogger.setErrorPrintStream(err);
        defaultLogger.setEmacsMode(this.emacsMode);
        return defaultLogger;
    }

    private File findBuildFile(String str, String str2) {
        File file;
        if (this.msgOutputLevel >= 2) {
            System.out.println(new StringBuffer().append("Searching for ").append(str2).append(" ...").toString());
        }
        File file2 = new File(new File(str).getAbsolutePath());
        File file3 = new File(file2, str2);
        while (true) {
            File file4 = file3;
            file = file4;
            if (file4.exists()) {
                break;
            }
            file2 = getParentFile(file2);
            if (file2 == null) {
                file = null;
                break;
            }
            file3 = new File(file2, str2);
        }
        return file;
    }

    private static int findTargetPosition(Vector vector, String str) {
        int size = vector.size();
        int i = size;
        for (int i2 = 0; i2 < size && i == size; i2++) {
            if (str.compareTo((String) vector.elementAt(i2)) < 0) {
                i = i2;
            }
        }
        return i;
    }

    public static String getAntVersion() throws BuildException {
        Class cls;
        String str;
        synchronized (Main.class) {
            try {
                if (antVersion == null) {
                    try {
                        Properties properties = new Properties();
                        if (class$org$apache$tools$ant$Main == null) {
                            cls = class$("org.apache.tools.ant.Main");
                            class$org$apache$tools$ant$Main = cls;
                        } else {
                            cls = class$org$apache$tools$ant$Main;
                        }
                        InputStream resourceAsStream = cls.getResourceAsStream("/org/apache/tools/ant/version.txt");
                        properties.load(resourceAsStream);
                        resourceAsStream.close();
                        StringBuffer stringBuffer = new StringBuffer();
                        stringBuffer.append("Apache Ant(TM) version ");
                        stringBuffer.append(properties.getProperty("VERSION"));
                        stringBuffer.append(" compiled on ");
                        stringBuffer.append(properties.getProperty("DATE"));
                        antVersion = stringBuffer.toString();
                    } catch (IOException e) {
                        throw new BuildException(new StringBuffer().append("Could not load the version information:").append(e.getMessage()).toString());
                    } catch (NullPointerException e2) {
                        throw new BuildException("Could not load the version information.");
                    }
                }
                str = antVersion;
            } finally {
            }
        }
        return str;
    }

    private File getParentFile(File file) {
        File parentFile = file.getParentFile();
        if (parentFile != null && this.msgOutputLevel >= 3) {
            System.out.println(new StringBuffer().append("Searching in ").append(parentFile.getAbsolutePath()).toString());
        }
        return parentFile;
    }

    private int handleArgBuildFile(String[] strArr, int i) {
        try {
            int i2 = i + 1;
            this.buildFile = new File(strArr[i2].replace('/', File.separatorChar));
            return i2;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must specify a buildfile when using the -buildfile argument");
        }
    }

    private int handleArgDefine(String[] strArr, int i) {
        String str;
        String str2;
        String str3 = strArr[i];
        String substring = str3.substring(2, str3.length());
        int indexOf = substring.indexOf("=");
        if (indexOf > 0) {
            str2 = substring.substring(indexOf + 1);
            str = substring.substring(0, indexOf);
        } else if (i >= strArr.length - 1) {
            throw new BuildException(new StringBuffer().append("Missing value for property ").append(substring).toString());
        } else {
            i++;
            String str4 = strArr[i];
            str = substring;
            str2 = str4;
        }
        this.definedProps.put(str, str2);
        return i;
    }

    private int handleArgInputHandler(String[] strArr, int i) {
        if (this.inputHandlerClassname != null) {
            throw new BuildException("Only one input handler class may be specified.");
        }
        int i2 = i + 1;
        try {
            this.inputHandlerClassname = strArr[i2];
            return i2;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must specify a classname when using the -inputhandler argument");
        }
    }

    private int handleArgListener(String[] strArr, int i) {
        try {
            this.listeners.addElement(strArr[i + 1]);
            return i + 1;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must specify a classname when using the -listener argument");
        }
    }

    private int handleArgLogger(String[] strArr, int i) {
        if (this.loggerClassname != null) {
            throw new BuildException("Only one logger class may be specified.");
        }
        int i2 = i + 1;
        try {
            this.loggerClassname = strArr[i2];
            return i2;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must specify a classname when using the -logger argument");
        }
    }

    private int handleArgNice(String[] strArr, int i) {
        int i2 = i + 1;
        try {
            this.threadPriority = Integer.decode(strArr[i2]);
            if (this.threadPriority.intValue() >= 1 && this.threadPriority.intValue() <= 10) {
                return i2;
            }
            throw new BuildException("Niceness value is out of the range 1-10");
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must supply a niceness value (1-10) after the -nice option");
        } catch (NumberFormatException e2) {
            throw new BuildException(new StringBuffer().append("Unrecognized niceness value: ").append(strArr[i2]).toString());
        }
    }

    private int handleArgPropertyFile(String[] strArr, int i) {
        try {
            int i2 = i + 1;
            this.propertyFiles.addElement(strArr[i2]);
            return i2;
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new BuildException("You must specify a property filename when using the -propertyfile argument");
        }
    }

    private static void handleLogfile() {
        if (isLogFileUsed) {
            FileUtils.close(out);
            FileUtils.close(err);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0055  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void loadPropertyFiles() {
        Throwable th;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2;
        IOException e;
        Enumeration<?> propertyNames;
        for (int i = 0; i < this.propertyFiles.size(); i++) {
            String str = (String) this.propertyFiles.elementAt(i);
            Properties properties = new Properties();
            try {
                try {
                    fileInputStream2 = new FileInputStream(str);
                } catch (IOException e2) {
                    e = e2;
                    fileInputStream2 = null;
                }
            } catch (Throwable th2) {
                th = th2;
                fileInputStream = null;
            }
            try {
                properties.load(fileInputStream2);
                FileUtils.close(fileInputStream2);
            } catch (IOException e3) {
                e = e3;
                FileInputStream fileInputStream3 = fileInputStream2;
                FileInputStream fileInputStream4 = fileInputStream2;
                FileInputStream fileInputStream5 = fileInputStream2;
                System.out.println(new StringBuffer().append("Could not load property file ").append(str).append(": ").append(e.getMessage()).toString());
                FileUtils.close(fileInputStream2);
                propertyNames = properties.propertyNames();
                while (propertyNames.hasMoreElements()) {
                }
            } catch (Throwable th3) {
                fileInputStream = fileInputStream2;
                th = th3;
                FileUtils.close(fileInputStream);
                throw th;
            }
            propertyNames = properties.propertyNames();
            while (propertyNames.hasMoreElements()) {
                String str2 = (String) propertyNames.nextElement();
                if (this.definedProps.getProperty(str2) == null) {
                    this.definedProps.put(str2, properties.getProperty(str2));
                }
            }
        }
    }

    public static void main(String[] strArr) {
        start(strArr, null, null);
    }

    private static void printDescription(Project project) {
        if (project.getDescription() != null) {
            project.log(project.getDescription());
        }
    }

    private static void printMessage(Throwable th) {
        String message = th.getMessage();
        if (message != null) {
            System.err.println(message);
        }
    }

    private static void printTargets(Project project, Vector vector, Vector vector2, Vector vector3, String str, int i) {
        String str2;
        String property = System.getProperty("line.separator");
        String str3 = "    ";
        while (true) {
            str2 = str3;
            if (str2.length() > i) {
                break;
            }
            str3 = new StringBuffer().append(str2).append(str2).toString();
        }
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(new StringBuffer().append(str).append(property).append(property).toString());
        int size = vector.size();
        for (int i2 = 0; i2 < size; i2++) {
            stringBuffer.append(" ");
            stringBuffer.append(vector.elementAt(i2));
            if (vector2 != null) {
                stringBuffer.append(str2.substring(0, (i - ((String) vector.elementAt(i2)).length()) + 2));
                stringBuffer.append(vector2.elementAt(i2));
            }
            stringBuffer.append(property);
            if (!vector3.isEmpty()) {
                Enumeration enumeration = (Enumeration) vector3.elementAt(i2);
                if (enumeration.hasMoreElements()) {
                    stringBuffer.append("   depends on: ");
                    while (enumeration.hasMoreElements()) {
                        stringBuffer.append(enumeration.nextElement());
                        if (enumeration.hasMoreElements()) {
                            stringBuffer.append(", ");
                        }
                    }
                    stringBuffer.append(property);
                }
            }
        }
        project.log(stringBuffer.toString(), 1);
    }

    private static void printTargets(Project project, boolean z, boolean z2) {
        int i = 0;
        Map removeDuplicateTargets = removeDuplicateTargets(project.getTargets());
        Vector vector = new Vector();
        Vector vector2 = new Vector();
        Vector vector3 = new Vector();
        Vector vector4 = new Vector();
        Vector vector5 = new Vector();
        for (Target target : removeDuplicateTargets.values()) {
            String name = target.getName();
            if (!name.equals("")) {
                String description = target.getDescription();
                if (description == null) {
                    int findTargetPosition = findTargetPosition(vector4, name);
                    vector4.insertElementAt(name, findTargetPosition);
                    if (z2) {
                        vector5.insertElementAt(target.getDependencies(), findTargetPosition);
                    }
                } else {
                    int findTargetPosition2 = findTargetPosition(vector, name);
                    vector.insertElementAt(name, findTargetPosition2);
                    vector2.insertElementAt(description, findTargetPosition2);
                    int i2 = i;
                    if (name.length() > i) {
                        i2 = name.length();
                    }
                    i = i2;
                    if (z2) {
                        vector3.insertElementAt(target.getDependencies(), findTargetPosition2);
                        i = i2;
                    }
                }
            }
        }
        printTargets(project, vector, vector2, vector3, "Main targets:", i);
        if (vector.size() == 0) {
            z = true;
        }
        if (z) {
            printTargets(project, vector4, null, vector5, "Other targets:", 0);
        }
        String defaultTarget = project.getDefaultTarget();
        if (defaultTarget == null || "".equals(defaultTarget)) {
            return;
        }
        project.log(new StringBuffer().append("Default target: ").append(defaultTarget).toString());
    }

    private static void printUsage() {
        String property = System.getProperty("line.separator");
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(new StringBuffer().append("ant [options] [target [target2 [target3] ...]]").append(property).toString());
        stringBuffer.append(new StringBuffer().append("Options: ").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -help, -h              print this message").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -projecthelp, -p       print project help information").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -version               print the version information and exit").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -diagnostics           print information that might be helpful to").append(property).toString());
        stringBuffer.append(new StringBuffer().append("                         diagnose or report problems.").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -quiet, -q             be extra quiet").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -verbose, -v           be extra verbose").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -debug, -d             print debugging information").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -emacs, -e             produce logging information without adornments").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -lib <path>            specifies a path to search for jars and classes").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -logfile <file>        use given file for log").append(property).toString());
        stringBuffer.append(new StringBuffer().append("    -l     <file>                ''").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -logger <classname>    the class which is to perform logging").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -listener <classname>  add an instance of class as a project listener").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -noinput               do not allow interactive input").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -buildfile <file>      use given buildfile").append(property).toString());
        stringBuffer.append(new StringBuffer().append("    -file    <file>              ''").append(property).toString());
        stringBuffer.append(new StringBuffer().append("    -f       <file>              ''").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -D<property>=<value>   use value for given property").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -keep-going, -k        execute all targets that do not depend").append(property).toString());
        stringBuffer.append(new StringBuffer().append("                         on failed target(s)").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -propertyfile <name>   load all properties from file with -D").append(property).toString());
        stringBuffer.append(new StringBuffer().append("                         properties taking precedence").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -inputhandler <class>  the class which will handle input requests").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -find <file>           (s)earch for buildfile towards the root of").append(property).toString());
        stringBuffer.append(new StringBuffer().append("    -s  <file>           the filesystem and use it").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -nice  number          A niceness value for the main thread:").append(property).append("                         1 (lowest) to 10 (highest); 5 is the default").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -nouserlib             Run ant without using the jar files from").append(property).append("                         ${user.home}/.ant/lib").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -noclasspath           Run ant without using CLASSPATH").append(property).toString());
        stringBuffer.append(new StringBuffer().append("  -autoproxy             Java1.5+: use the OS proxy settings").append(property).toString());
        stringBuffer.append("  -main <class>          override Ant's normal entry point");
        System.out.println(stringBuffer.toString());
    }

    private static void printVersion(int i) throws BuildException {
        System.out.println(getAntVersion());
    }

    private void processArgs(String[] strArr) {
        int i;
        boolean z;
        boolean z2;
        boolean z3;
        PrintStream printStream;
        String str = null;
        boolean z4 = false;
        PrintStream printStream2 = null;
        boolean z5 = false;
        boolean z6 = false;
        boolean z7 = false;
        int i2 = 0;
        while (i2 < strArr.length) {
            String str2 = strArr[i2];
            if (str2.equals("-help") || str2.equals("-h")) {
                z3 = true;
                printStream = printStream2;
                z2 = z6;
                z = z7;
                i = i2;
            } else if (str2.equals("-version")) {
                z2 = true;
                i = i2;
                z = z7;
                z3 = z5;
                printStream = printStream2;
            } else if (str2.equals("-diagnostics")) {
                z = true;
                i = i2;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-quiet") || str2.equals("-q")) {
                this.msgOutputLevel = 1;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals(SOSCmd.FLAG_VERBOSE) || str2.equals("-v")) {
                this.msgOutputLevel = 3;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-debug") || str2.equals("-d")) {
                this.msgOutputLevel = 4;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-noinput")) {
                this.allowInput = false;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-logfile") || str2.equals("-l")) {
                try {
                    i = i2 + 1;
                    printStream = new PrintStream(new FileOutputStream(new File(strArr[i2 + 1])));
                } catch (IOException e) {
                } catch (ArrayIndexOutOfBoundsException e2) {
                }
                try {
                    isLogFileUsed = true;
                    z = z7;
                    z3 = z5;
                    z2 = z6;
                } catch (IOException e3) {
                    throw new BuildException("Cannot write on the specified log file. Make sure the path exists and you have write permissions.");
                } catch (ArrayIndexOutOfBoundsException e4) {
                    throw new BuildException("You must specify a log file when using the -log argument");
                }
            } else if (str2.equals("-buildfile") || str2.equals(SOSCmd.FLAG_FILE) || str2.equals("-f")) {
                i = handleArgBuildFile(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-listener")) {
                i = handleArgListener(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.startsWith(MSVSSConstants.FLAG_CODEDIFF)) {
                i = handleArgDefine(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-logger")) {
                i = handleArgLogger(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-inputhandler")) {
                i = handleArgInputHandler(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-emacs") || str2.equals("-e")) {
                this.emacsMode = true;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-projecthelp") || str2.equals("-p")) {
                this.projectHelp = true;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-find") || str2.equals("-s")) {
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
                z4 = true;
                if (i2 < strArr.length - 1) {
                    i = i2 + 1;
                    str = strArr[i];
                    z = z7;
                    z3 = z5;
                    z2 = z6;
                    printStream = printStream2;
                    z4 = true;
                }
            } else if (str2.startsWith("-propertyfile")) {
                i = handleArgPropertyFile(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-k") || str2.equals("-keep-going")) {
                this.keepGoingMode = true;
                i = i2;
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (str2.equals("-nice")) {
                i = handleArgNice(strArr, i2);
                z = z7;
                z3 = z5;
                z2 = z6;
                printStream = printStream2;
            } else if (LAUNCH_COMMANDS.contains(str2)) {
                throw new BuildException(new StringBuffer().append("Ant's Main method is being handed an option ").append(str2).append(" that is only for the launcher class.").append("\nThis can be caused by a version mismatch between ").append("the ant script/.bat file and Ant itself.").toString());
            } else {
                if (str2.equals("-autoproxy")) {
                    this.proxy = true;
                    i = i2;
                    z = z7;
                    z3 = z5;
                    z2 = z6;
                    printStream = printStream2;
                } else if (str2.startsWith("-")) {
                    System.err.println(new StringBuffer().append("Unknown argument: ").append(str2).toString());
                    printUsage();
                    throw new BuildException("");
                } else {
                    this.targets.addElement(str2);
                    i = i2;
                    z = z7;
                    z3 = z5;
                    z2 = z6;
                    printStream = printStream2;
                }
            }
            i2 = i + 1;
            z7 = z;
            z5 = z3;
            z6 = z2;
            printStream2 = printStream;
        }
        if (this.msgOutputLevel >= 3 || z6) {
            printVersion(this.msgOutputLevel);
        }
        if (z5 || z6 || z7) {
            if (z5) {
                printUsage();
            }
            if (!z7) {
                return;
            }
            Diagnostics.doReport(System.out, this.msgOutputLevel);
            return;
        }
        if (this.buildFile == null) {
            if (!z4) {
                Iterator helpers = ProjectHelperRepository.getInstance().getHelpers();
                do {
                    this.buildFile = new File(((ProjectHelper) helpers.next()).getDefaultBuildFile());
                    if (this.msgOutputLevel >= 3) {
                        System.out.println(new StringBuffer().append("Trying the default build file: ").append(this.buildFile).toString());
                    }
                    if (this.buildFile.exists()) {
                        break;
                    }
                } while (helpers.hasNext());
            } else if (str != null) {
                this.buildFile = findBuildFile(System.getProperty("user.dir"), str);
                if (this.buildFile == null) {
                    throw new BuildException("Could not locate a build file!");
                }
            } else {
                Iterator helpers2 = ProjectHelperRepository.getInstance().getHelpers();
                do {
                    String defaultBuildFile = ((ProjectHelper) helpers2.next()).getDefaultBuildFile();
                    if (this.msgOutputLevel >= 3) {
                        System.out.println(new StringBuffer().append("Searching the default build file: ").append(defaultBuildFile).toString());
                    }
                    this.buildFile = findBuildFile(System.getProperty("user.dir"), defaultBuildFile);
                    if (this.buildFile != null) {
                        break;
                    }
                } while (helpers2.hasNext());
                if (this.buildFile == null) {
                    throw new BuildException("Could not locate a build file!");
                }
            }
        }
        if (!this.buildFile.exists()) {
            System.out.println(new StringBuffer().append("Buildfile: ").append(this.buildFile).append(" does not exist!").toString());
            throw new BuildException("Build failed");
        }
        if (this.buildFile.isDirectory()) {
            File file = new File(this.buildFile, DEFAULT_BUILD_FILENAME);
            if (!file.isFile()) {
                System.out.println(new StringBuffer().append("What? Buildfile: ").append(this.buildFile).append(" is a dir!").toString());
                throw new BuildException("Build failed");
            }
            this.buildFile = file;
        }
        this.buildFile = FileUtils.getFileUtils().normalize(this.buildFile.getAbsolutePath());
        loadPropertyFiles();
        if (this.msgOutputLevel >= 2) {
            System.out.println(new StringBuffer().append("Buildfile: ").append(this.buildFile).toString());
        }
        if (printStream2 != null) {
            out = printStream2;
            err = printStream2;
            System.setOut(out);
            System.setErr(err);
        }
        this.readyToRun = true;
    }

    private static Map removeDuplicateTargets(Map map) {
        HashMap hashMap = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            Target target = (Target) entry.getValue();
            Target target2 = (Target) hashMap.get(target.getLocation());
            if (target2 == null || target2.getName().length() > str.length()) {
                hashMap.put(target.getLocation(), target);
            }
        }
        HashMap hashMap2 = new HashMap();
        for (Target target3 : hashMap.values()) {
            hashMap2.put(target3.getName(), target3);
        }
        return hashMap2;
    }

    /* JADX DEBUG: Finally have unexpected throw blocks count: 2, expect 1 */
    private void runBuild(ClassLoader classLoader) throws BuildException {
        if (!this.readyToRun) {
            return;
        }
        Project project = new Project();
        project.setCoreLoader(classLoader);
        Throwable th = null;
        try {
            try {
                addBuildListeners(project);
                addInputHandler(project);
                PrintStream printStream = System.err;
                PrintStream printStream2 = System.out;
                InputStream inputStream = System.in;
                SecurityManager securityManager = System.getSecurityManager();
                try {
                    if (this.allowInput) {
                        project.setDefaultInputStream(System.in);
                    }
                    System.setIn(new DemuxInputStream(project));
                    System.setOut(new PrintStream(new DemuxOutputStream(project, false)));
                    System.setErr(new PrintStream(new DemuxOutputStream(project, true)));
                    if (!this.projectHelp) {
                        project.fireBuildStarted();
                    }
                    if (this.threadPriority != null) {
                        try {
                            project.log(new StringBuffer().append("Setting Ant's thread priority to ").append(this.threadPriority).toString(), 3);
                            Thread.currentThread().setPriority(this.threadPriority.intValue());
                        } catch (SecurityException e) {
                            project.log("A security manager refused to set the -nice value");
                        }
                    }
                    project.init();
                    PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(project);
                    HashMap hashMap = new HashMap(this.definedProps);
                    new ResolvePropertyMap(project, propertyHelper, propertyHelper.getExpanders()).resolveAllProperties(hashMap, null, false);
                    for (Map.Entry entry : hashMap.entrySet()) {
                        project.setUserProperty((String) entry.getKey(), String.valueOf(entry.getValue()));
                    }
                    project.setUserProperty(MagicNames.ANT_FILE, this.buildFile.getAbsolutePath());
                    project.setUserProperty(MagicNames.ANT_FILE_TYPE, "file");
                    project.setKeepGoingMode(this.keepGoingMode);
                    if (this.proxy) {
                        new ProxySetup(project).enableProxies();
                    }
                    ProjectHelper.configureProject(project, this.buildFile);
                    if (this.projectHelp) {
                        printDescription(project);
                        printTargets(project, this.msgOutputLevel > 2, this.msgOutputLevel > 3);
                        if (securityManager != null) {
                            System.setSecurityManager(securityManager);
                        }
                        System.setOut(printStream2);
                        System.setErr(printStream);
                        System.setIn(inputStream);
                        if (this.projectHelp) {
                            if (0 == 0) {
                                return;
                            }
                            throw new NullPointerException();
                        }
                        try {
                            project.fireBuildFinished(null);
                            return;
                        } catch (Throwable th2) {
                            System.err.println("Caught an exception while logging the end of the build.  Exception was:");
                            th2.printStackTrace();
                            if (0 == 0) {
                                throw new BuildException(th2);
                            }
                            System.err.println("There has been an error prior to that:");
                            throw new NullPointerException();
                        }
                    }
                    if (this.targets.size() == 0 && project.getDefaultTarget() != null) {
                        this.targets.addElement(project.getDefaultTarget());
                    }
                    project.executeTargets(this.targets);
                    if (securityManager != null) {
                        System.setSecurityManager(securityManager);
                    }
                    System.setOut(printStream2);
                    System.setErr(printStream);
                    System.setIn(inputStream);
                    if (this.projectHelp) {
                        if (0 == 0) {
                            return;
                        }
                        throw new NullPointerException();
                    }
                    try {
                        project.fireBuildFinished(null);
                    } catch (Throwable th3) {
                        System.err.println("Caught an exception while logging the end of the build.  Exception was:");
                        th3.printStackTrace();
                        if (0 == 0) {
                            throw new BuildException(th3);
                        }
                        System.err.println("There has been an error prior to that:");
                        throw new NullPointerException();
                    }
                } catch (Throwable th4) {
                    if (securityManager != null) {
                        System.setSecurityManager(securityManager);
                    }
                    System.setOut(printStream2);
                    System.setErr(printStream);
                    System.setIn(inputStream);
                    throw th4;
                }
            } catch (Throwable th5) {
                if (!this.projectHelp) {
                    try {
                        project.fireBuildFinished(null);
                    } catch (Throwable th6) {
                        System.err.println("Caught an exception while logging the end of the build.  Exception was:");
                        th6.printStackTrace();
                        if (0 != 0) {
                            System.err.println("There has been an error prior to that:");
                            th.printStackTrace();
                        }
                        throw new BuildException(th6);
                    }
                } else if (0 != 0) {
                    project.log(th.toString(), 0);
                }
                throw th5;
            }
        } catch (Error e2) {
            throw e2;
        } catch (RuntimeException e3) {
            throw e3;
        }
    }

    public static void start(String[] strArr, Properties properties, ClassLoader classLoader) {
        new Main().startAnt(strArr, properties, classLoader);
    }

    protected void addBuildListeners(Project project) {
        Class cls;
        Class cls2;
        project.addBuildListener(createLogger());
        int size = this.listeners.size();
        for (int i = 0; i < size; i++) {
            String str = (String) this.listeners.elementAt(i);
            if (class$org$apache$tools$ant$Main == null) {
                cls = class$("org.apache.tools.ant.Main");
                class$org$apache$tools$ant$Main = cls;
            } else {
                cls = class$org$apache$tools$ant$Main;
            }
            ClassLoader classLoader = cls.getClassLoader();
            if (class$org$apache$tools$ant$BuildListener == null) {
                cls2 = class$("org.apache.tools.ant.BuildListener");
                class$org$apache$tools$ant$BuildListener = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$BuildListener;
            }
            BuildListener buildListener = (BuildListener) ClasspathUtils.newInstance(str, classLoader, cls2);
            project.setProjectReference(buildListener);
            project.addBuildListener(buildListener);
        }
    }

    protected void exit(int i) {
        System.exit(i);
    }

    public void startAnt(String[] strArr, Properties properties, ClassLoader classLoader) {
        try {
            processArgs(strArr);
            if (properties != null) {
                Enumeration keys = properties.keys();
                while (keys.hasMoreElements()) {
                    String str = (String) keys.nextElement();
                    this.definedProps.put(str, properties.getProperty(str));
                }
            }
            int i = 1;
            try {
                try {
                    runBuild(classLoader);
                    i = 0;
                } catch (BuildException e) {
                    if (err != System.err) {
                        printMessage(e);
                    }
                } finally {
                    handleLogfile();
                }
            } catch (ExitStatusException e2) {
                int status = e2.getStatus();
                i = status;
                if (status != 0) {
                    throw e2;
                }
            }
            exit(i);
        } catch (Throwable th) {
            handleLogfile();
            printMessage(th);
            exit(1);
        }
    }
}
