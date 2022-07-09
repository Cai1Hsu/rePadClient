package org.apache.tools.ant;

import android.support.v4.os.EnvironmentCompat;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Properties;
import java.util.TimeZone;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import org.apache.tools.ant.launch.Launcher;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.ProxySetup;

/* loaded from: classes.jar:org/apache/tools/ant/Diagnostics.class */
public final class Diagnostics {
    private static final int BIG_DRIFT_LIMIT = 10000;
    protected static final String ERROR_PROPERTY_ACCESS_BLOCKED = "Access to this property blocked by a security manager";
    private static final int JAVA_1_5_NUMBER = 15;
    private static final int KILOBYTE = 1024;
    private static final int MINUTES_PER_HOUR = 60;
    private static final int SECONDS_PER_MILLISECOND = 1000;
    private static final int SECONDS_PER_MINUTE = 60;
    private static final int TEST_FILE_SIZE = 32;
    static Class array$Ljava$lang$String;
    static Class class$org$apache$tools$ant$Main;

    private Diagnostics() {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static void doReport(PrintStream printStream) {
        doReport(printStream, 2);
    }

    public static void doReport(PrintStream printStream, int i) {
        Class cls;
        Class cls2;
        printStream.println("------- Ant diagnostics report -------");
        printStream.println(Main.getAntVersion());
        header(printStream, "Implementation Version");
        StringBuffer append = new StringBuffer().append("core tasks     : ");
        if (class$org$apache$tools$ant$Main == null) {
            cls = class$("org.apache.tools.ant.Main");
            class$org$apache$tools$ant$Main = cls;
        } else {
            cls = class$org$apache$tools$ant$Main;
        }
        StringBuffer append2 = append.append(getImplementationVersion(cls)).append(" in ");
        if (class$org$apache$tools$ant$Main == null) {
            cls2 = class$("org.apache.tools.ant.Main");
            class$org$apache$tools$ant$Main = cls2;
        } else {
            cls2 = class$org$apache$tools$ant$Main;
        }
        printStream.println(append2.append(getClassLocation(cls2)).toString());
        header(printStream, "ANT PROPERTIES");
        doReportAntProperties(printStream);
        header(printStream, "ANT_HOME/lib jar listing");
        doReportAntHomeLibraries(printStream);
        header(printStream, "USER_HOME/.ant/lib jar listing");
        doReportUserHomeLibraries(printStream);
        header(printStream, "Tasks availability");
        doReportTasksAvailability(printStream);
        header(printStream, "org.apache.env.Which diagnostics");
        doReportWhich(printStream);
        header(printStream, "XML Parser information");
        doReportParserInfo(printStream);
        header(printStream, "XSLT Processor information");
        doReportXSLTProcessorInfo(printStream);
        header(printStream, "System properties");
        doReportSystemProperties(printStream);
        header(printStream, "Temp dir");
        doReportTempDir(printStream);
        header(printStream, "Locale information");
        doReportLocale(printStream);
        header(printStream, "Proxy information");
        doReportProxy(printStream);
        printStream.println();
    }

    private static void doReportAntHomeLibraries(PrintStream printStream) {
        printStream.println(new StringBuffer().append("ant.home: ").append(System.getProperty(MagicNames.ANT_HOME)).toString());
        printLibraries(listLibraries(), printStream);
    }

    private static void doReportAntProperties(PrintStream printStream) {
        Project project = new Project();
        project.initProperties();
        printStream.println(new StringBuffer().append("ant.version: ").append(project.getProperty(MagicNames.ANT_VERSION)).toString());
        printStream.println(new StringBuffer().append("ant.java.version: ").append(project.getProperty(MagicNames.ANT_JAVA_VERSION)).toString());
        printStream.println(new StringBuffer().append("Is this the Apache Harmony VM? ").append(JavaEnvUtils.isApacheHarmony() ? "yes" : "no").toString());
        printStream.println(new StringBuffer().append("Is this the Kaffe VM? ").append(JavaEnvUtils.isKaffe() ? "yes" : "no").toString());
        printStream.println(new StringBuffer().append("Is this gij/gcj? ").append(JavaEnvUtils.isGij() ? "yes" : "no").toString());
        printStream.println(new StringBuffer().append("ant.core.lib: ").append(project.getProperty(MagicNames.ANT_LIB)).toString());
        printStream.println(new StringBuffer().append("ant.home: ").append(project.getProperty(MagicNames.ANT_HOME)).toString());
    }

    private static void doReportLocale(PrintStream printStream) {
        Calendar calendar = Calendar.getInstance();
        TimeZone timeZone = calendar.getTimeZone();
        printStream.println(new StringBuffer().append("Timezone ").append(timeZone.getDisplayName()).append(" offset=").append(timeZone.getOffset(calendar.get(0), calendar.get(1), calendar.get(2), calendar.get(5), calendar.get(7), (((((calendar.get(11) * 60) + calendar.get(12)) * 60) + calendar.get(13)) * 1000) + calendar.get(14))).toString());
    }

    private static void doReportParserInfo(PrintStream printStream) {
        printParserInfo(printStream, "XML Parser", getXMLParserName(), getXMLParserLocation());
        printParserInfo(printStream, "Namespace-aware parser", getNamespaceParserName(), getNamespaceParserLocation());
    }

    private static void doReportProxy(PrintStream printStream) {
        printProperty(printStream, ProxySetup.HTTP_PROXY_HOST);
        printProperty(printStream, ProxySetup.HTTP_PROXY_PORT);
        printProperty(printStream, ProxySetup.HTTP_PROXY_USERNAME);
        printProperty(printStream, ProxySetup.HTTP_PROXY_PASSWORD);
        printProperty(printStream, ProxySetup.HTTP_NON_PROXY_HOSTS);
        printProperty(printStream, ProxySetup.HTTPS_PROXY_HOST);
        printProperty(printStream, ProxySetup.HTTPS_PROXY_PORT);
        printProperty(printStream, ProxySetup.HTTPS_NON_PROXY_HOSTS);
        printProperty(printStream, ProxySetup.FTP_PROXY_HOST);
        printProperty(printStream, ProxySetup.FTP_PROXY_PORT);
        printProperty(printStream, ProxySetup.FTP_NON_PROXY_HOSTS);
        printProperty(printStream, ProxySetup.SOCKS_PROXY_HOST);
        printProperty(printStream, ProxySetup.SOCKS_PROXY_PORT);
        printProperty(printStream, ProxySetup.SOCKS_PROXY_USERNAME);
        printProperty(printStream, ProxySetup.SOCKS_PROXY_PASSWORD);
        if (JavaEnvUtils.getJavaVersionNumber() < 15) {
            return;
        }
        printProperty(printStream, ProxySetup.USE_SYSTEM_PROXIES);
        try {
            Object newInstance = Class.forName("org.apache.tools.ant.util.java15.ProxyDiagnostics").newInstance();
            printStream.println("Java1.5+ proxy settings:");
            printStream.println(newInstance.toString());
        } catch (ClassNotFoundException e) {
        } catch (IllegalAccessException e2) {
        } catch (InstantiationException e3) {
        } catch (NoClassDefFoundError e4) {
        }
    }

    private static void doReportSystemProperties(PrintStream printStream) {
        try {
            Enumeration<?> propertyNames = System.getProperties().propertyNames();
            while (propertyNames.hasMoreElements()) {
                String str = (String) propertyNames.nextElement();
                printStream.println(new StringBuffer().append(str).append(" : ").append(getProperty(str)).toString());
            }
        } catch (SecurityException e) {
            ignoreThrowable(e);
            printStream.println("Access to System.getProperties() blocked by a security manager");
        }
    }

    private static void doReportTasksAvailability(PrintStream printStream) {
        Class cls;
        if (class$org$apache$tools$ant$Main == null) {
            cls = class$("org.apache.tools.ant.Main");
            class$org$apache$tools$ant$Main = cls;
        } else {
            cls = class$org$apache$tools$ant$Main;
        }
        InputStream resourceAsStream = cls.getResourceAsStream(MagicNames.TASKDEF_PROPERTIES_RESOURCE);
        if (resourceAsStream == null) {
            printStream.println("None available");
            return;
        }
        Properties properties = new Properties();
        try {
            properties.load(resourceAsStream);
            Enumeration keys = properties.keys();
            while (keys.hasMoreElements()) {
                String str = (String) keys.nextElement();
                try {
                    Class.forName(properties.getProperty(str));
                    properties.remove(str);
                } catch (ClassNotFoundException e) {
                    printStream.println(new StringBuffer().append(str).append(" : Not Available ").append("(the implementation class is not present)").toString());
                } catch (NoClassDefFoundError e2) {
                    printStream.println(new StringBuffer().append(str).append(" : Missing dependency ").append(e2.getMessage().replace('/', '.')).toString());
                } catch (LinkageError e3) {
                    printStream.println(new StringBuffer().append(str).append(" : Initialization error").toString());
                }
            }
            if (properties.size() == 0) {
                printStream.println("All defined tasks are available");
            } else {
                printStream.println("A task being missing/unavailable should only matter if you are trying to use it");
            }
        } catch (IOException e4) {
            printStream.println(e4.getMessage());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v30, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v46, types: [java.lang.Throwable] */
    private static void doReportTempDir(PrintStream printStream) {
        File file;
        Throwable th;
        Object obj;
        FileInputStream fileInputStream;
        FileOutputStream fileOutputStream;
        Object obj2;
        FileInputStream fileInputStream2;
        FileOutputStream fileOutputStream2;
        int i;
        String property = System.getProperty("java.io.tmpdir");
        if (property == null) {
            printStream.println("Warning: java.io.tmpdir is undefined");
            return;
        }
        printStream.println(new StringBuffer().append("Temp dir is ").append(property).toString());
        File file2 = new File(property);
        if (!file2.exists()) {
            printStream.println(new StringBuffer().append("Warning, java.io.tmpdir directory does not exist: ").append(property).toString());
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        File file3 = null;
        File file4 = null;
        FileInputStream fileInputStream3 = null;
        PrintStream printStream2 = null;
        FileOutputStream fileOutputStream3 = null;
        try {
            try {
                file = File.createTempFile("diag", "txt", file2);
                FileOutputStream fileOutputStream4 = new FileOutputStream(file);
                try {
                    byte[] bArr = new byte[1024];
                    for (int i2 = 0; i2 < 32; i2++) {
                        fileOutputStream4.write(bArr);
                    }
                    fileOutputStream4.close();
                    Thread.sleep(1000L);
                    FileInputStream fileInputStream4 = new FileInputStream(file);
                    int i3 = 0;
                    while (true) {
                        try {
                            i = i3;
                            int read = fileInputStream4.read(bArr, 0, 1024);
                            if (read <= 0) {
                                break;
                            }
                            i3 = i + read;
                        } catch (IOException e) {
                            fileInputStream2 = fileInputStream4;
                            obj2 = e;
                            fileOutputStream2 = null;
                            ignoreThrowable(obj2);
                            FileInputStream fileInputStream5 = fileInputStream2;
                            FileInputStream fileInputStream6 = fileInputStream2;
                            FileInputStream fileInputStream7 = fileInputStream2;
                            printStream.println(new StringBuffer().append("Failed to create a temporary file in the temp dir ").append(property).toString());
                            FileInputStream fileInputStream8 = fileInputStream2;
                            FileInputStream fileInputStream9 = fileInputStream2;
                            FileInputStream fileInputStream10 = fileInputStream2;
                            printStream.println(new StringBuffer().append("File  ").append(file).append(" could not be created/written to").toString());
                            FileUtils.close(fileOutputStream2);
                            FileUtils.close(fileInputStream2);
                            if (file == null || !file.exists()) {
                                return;
                            }
                            file.delete();
                        } catch (InterruptedException e2) {
                            fileInputStream = fileInputStream4;
                            obj = e2;
                            fileOutputStream = null;
                            ignoreThrowable(obj);
                            FileInputStream fileInputStream11 = fileInputStream;
                            printStream.println("Failed to check whether tempdir is writable");
                            FileUtils.close(fileOutputStream);
                            FileUtils.close(fileInputStream);
                            if (file == null || !file.exists()) {
                                return;
                            }
                            file.delete();
                        } catch (Throwable th2) {
                            th = th2;
                            fileInputStream3 = fileInputStream4;
                            fileOutputStream3 = null;
                            FileUtils.close(fileOutputStream3);
                            FileUtils.close(fileInputStream3);
                            if (file != null && file.exists()) {
                                file.delete();
                            }
                            throw th;
                        }
                    }
                    fileInputStream4.close();
                    long lastModified = file.lastModified() - currentTimeMillis;
                    file.delete();
                    printStream.print("Temp dir is writeable");
                    if (i != 32768) {
                        printStream.println(new StringBuffer().append(", but seems to be full.  Wrote 32768but could only read ").append(i).append(" bytes.").toString());
                    } else {
                        printStream.println();
                    }
                    printStream.println(new StringBuffer().append("Temp dir alignment with system clock is ").append(lastModified).append(" ms").toString());
                    if (Math.abs(lastModified) > 10000) {
                        file4 = file;
                        file3 = file;
                        printStream2 = printStream;
                        printStream2.println("Warning: big clock drift -maybe a network filesystem");
                    }
                    FileUtils.close((OutputStream) null);
                    FileUtils.close((InputStream) null);
                    if (file == null || !file.exists()) {
                        return;
                    }
                } catch (IOException e3) {
                    fileOutputStream2 = fileOutputStream4;
                    obj2 = e3;
                    fileInputStream2 = null;
                } catch (InterruptedException e4) {
                    fileOutputStream = fileOutputStream4;
                    obj = e4;
                    fileInputStream = null;
                } catch (Throwable th3) {
                    th = th3;
                    fileOutputStream3 = fileOutputStream4;
                    fileInputStream3 = null;
                }
            } catch (Throwable th4) {
                th = th4;
                file = null;
            }
        } catch (IOException unused) {
            fileOutputStream2 = null;
            obj2 = printStream2;
            file = file4;
            fileInputStream2 = null;
        } catch (InterruptedException unused2) {
            fileInputStream = null;
            obj = printStream2;
            file = file3;
            fileOutputStream = null;
        }
        file.delete();
    }

    private static void doReportUserHomeLibraries(PrintStream printStream) {
        String property = System.getProperty("user.home");
        printStream.println(new StringBuffer().append("user.home: ").append(property).toString());
        printLibraries(listJarFiles(new File(property, Launcher.USER_LIBDIR)), printStream);
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:20:0x0079 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v0, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r10v1, types: [java.lang.reflect.InvocationTargetException] */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v4 */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r10v8 */
    private static void doReportWhich(PrintStream printStream) {
        Class<?> cls;
        try {
            Class<?> cls2 = Class.forName("org.apache.env.Which");
            if (array$Ljava$lang$String == null) {
                cls = class$("[Ljava.lang.String;");
                array$Ljava$lang$String = cls;
            } else {
                cls = array$Ljava$lang$String;
            }
            cls2.getMethod("main", cls).invoke(null, new String[0]);
            e = 0;
        } catch (ClassNotFoundException e) {
            printStream.println("Not available.");
            printStream.println("Download it at http://xml.apache.org/commons/");
            e = 0;
        } catch (InvocationTargetException e2) {
            e = e2;
            if (e.getTargetException() != null) {
                e = e.getTargetException();
            }
        } catch (Throwable th) {
            e = th;
        }
        if (e == true) {
            printStream.println("Error while running org.apache.env.Which");
            e.printStackTrace();
        }
    }

    private static void doReportXSLTProcessorInfo(PrintStream printStream) {
        printParserInfo(printStream, "XSLT Processor", getXSLTProcessorName(), getXSLTProcessorLocation());
    }

    private static URL getClassLocation(Class cls) {
        return cls.getProtectionDomain().getCodeSource() == null ? null : cls.getProtectionDomain().getCodeSource().getLocation();
    }

    private static String getImplementationVersion(Class cls) {
        return cls.getPackage().getImplementationVersion();
    }

    private static String getNamespaceParserLocation() {
        String str;
        try {
            URL classLocation = getClassLocation(JAXPUtils.getNamespaceXMLReader().getClass());
            str = null;
            if (classLocation != null) {
                str = classLocation.toString();
            }
        } catch (BuildException e) {
            ignoreThrowable(e);
            str = null;
        }
        return str;
    }

    private static String getNamespaceParserName() {
        String str;
        try {
            str = JAXPUtils.getNamespaceXMLReader().getClass().getName();
        } catch (BuildException e) {
            ignoreThrowable(e);
            str = null;
        }
        return str;
    }

    private static String getProperty(String str) {
        String str2;
        try {
            str2 = System.getProperty(str);
        } catch (SecurityException e) {
            str2 = ERROR_PROPERTY_ACCESS_BLOCKED;
        }
        return str2;
    }

    private static SAXParser getSAXParser() {
        SAXParser sAXParser;
        SAXParserFactory newInstance = SAXParserFactory.newInstance();
        if (newInstance == null) {
            sAXParser = null;
        } else {
            sAXParser = null;
            try {
                sAXParser = newInstance.newSAXParser();
            } catch (Exception e) {
                ignoreThrowable(e);
            }
        }
        return sAXParser;
    }

    private static String getXMLParserLocation() {
        URL classLocation;
        String str = null;
        SAXParser sAXParser = getSAXParser();
        if (sAXParser != null && (classLocation = getClassLocation(sAXParser.getClass())) != null) {
            str = classLocation.toString();
        }
        return str;
    }

    private static String getXMLParserName() {
        SAXParser sAXParser = getSAXParser();
        return sAXParser == null ? "Could not create an XML Parser" : sAXParser.getClass().getName();
    }

    private static Transformer getXSLTProcessor() {
        Transformer transformer;
        TransformerFactory newInstance = TransformerFactory.newInstance();
        if (newInstance == null) {
            transformer = null;
        } else {
            transformer = null;
            try {
                transformer = newInstance.newTransformer();
            } catch (Exception e) {
                ignoreThrowable(e);
            }
        }
        return transformer;
    }

    private static String getXSLTProcessorLocation() {
        URL classLocation;
        String str = null;
        Transformer xSLTProcessor = getXSLTProcessor();
        if (xSLTProcessor != null && (classLocation = getClassLocation(xSLTProcessor.getClass())) != null) {
            str = classLocation.toString();
        }
        return str;
    }

    private static String getXSLTProcessorName() {
        Transformer xSLTProcessor = getXSLTProcessor();
        return xSLTProcessor == null ? "Could not create an XSLT Processor" : xSLTProcessor.getClass().getName();
    }

    private static void header(PrintStream printStream, String str) {
        printStream.println();
        printStream.println("-------------------------------------------");
        printStream.print(" ");
        printStream.println(str);
        printStream.println("-------------------------------------------");
    }

    private static void ignoreThrowable(Throwable th) {
    }

    public static boolean isOptionalAvailable() {
        return true;
    }

    private static File[] listJarFiles(File file) {
        return file.listFiles(new FilenameFilter() { // from class: org.apache.tools.ant.Diagnostics.1
            @Override // java.io.FilenameFilter
            public boolean accept(File file2, String str) {
                return str.endsWith(".jar");
            }
        });
    }

    public static File[] listLibraries() {
        String property = System.getProperty(MagicNames.ANT_HOME);
        return property == null ? null : listJarFiles(new File(property, "lib"));
    }

    public static void main(String[] strArr) {
        doReport(System.out);
    }

    private static void printLibraries(File[] fileArr, PrintStream printStream) {
        if (fileArr == null) {
            printStream.println("No such directory.");
            return;
        }
        for (int i = 0; i < fileArr.length; i++) {
            printStream.println(new StringBuffer().append(fileArr[i].getName()).append(" (").append(fileArr[i].length()).append(" bytes)").toString());
        }
    }

    private static void printParserInfo(PrintStream printStream, String str, String str2, String str3) {
        String str4 = str2;
        if (str2 == null) {
            str4 = EnvironmentCompat.MEDIA_UNKNOWN;
        }
        String str5 = str3;
        if (str3 == null) {
            str5 = EnvironmentCompat.MEDIA_UNKNOWN;
        }
        printStream.println(new StringBuffer().append(str).append(" : ").append(str4).toString());
        printStream.println(new StringBuffer().append(str).append(" Location: ").append(str5).toString());
    }

    private static void printProperty(PrintStream printStream, String str) {
        String property = getProperty(str);
        if (property != null) {
            printStream.print(str);
            printStream.print(" = ");
            printStream.print('\"');
            printStream.print(property);
            printStream.println('\"');
        }
    }

    public static void validateVersion() throws BuildException {
    }
}
