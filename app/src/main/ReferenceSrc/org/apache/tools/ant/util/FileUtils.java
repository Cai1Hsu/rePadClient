package org.apache.tools.ant.util;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.JarURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.channels.Channel;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.PathTokenizer;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.launch.Locator;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.resources.FileResource;

/* loaded from: classes.jar:org/apache/tools/ant/util/FileUtils.class */
public class FileUtils {
    static final int BUF_SIZE = 8192;
    private static final int DELETE_RETRY_SLEEP_MILLIS = 10;
    private static final int EXPAND_SPACE = 50;
    public static final long FAT_FILE_TIMESTAMP_GRANULARITY = 2000;
    public static final long NTFS_FILE_TIMESTAMP_GRANULARITY = 1;
    private static final String NULL_PLACEHOLDER = "null";
    public static final long UNIX_FILE_TIMESTAMP_GRANULARITY = 1000;
    private Object cacheFromUriLock = new Object();
    private String cacheFromUriRequest = null;
    private String cacheFromUriResponse = null;
    private static final FileUtils PRIMARY_INSTANCE = new FileUtils();
    private static Random rand = new Random(System.currentTimeMillis() + Runtime.getRuntime().freeMemory());
    private static final boolean ON_NETWARE = Os.isFamily(Os.FAMILY_NETWARE);
    private static final boolean ON_DOS = Os.isFamily(Os.FAMILY_DOS);
    private static final boolean ON_WIN9X = Os.isFamily(Os.FAMILY_9X);
    private static final boolean ON_WINDOWS = Os.isFamily(Os.FAMILY_WINDOWS);

    protected FileUtils() {
    }

    public static void close(InputStream inputStream) {
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public static void close(OutputStream outputStream) {
        if (outputStream != null) {
            try {
                outputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public static void close(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
            }
        }
    }

    public static void close(Writer writer) {
        if (writer != null) {
            try {
                writer.close();
            } catch (IOException e) {
            }
        }
    }

    public static void close(URLConnection uRLConnection) {
        if (uRLConnection != null) {
            try {
                if (uRLConnection instanceof JarURLConnection) {
                    ((JarURLConnection) uRLConnection).getJarFile().close();
                } else if (uRLConnection instanceof HttpURLConnection) {
                    ((HttpURLConnection) uRLConnection).disconnect();
                }
            } catch (IOException e) {
            }
        }
    }

    public static void close(Channel channel) {
        if (channel != null) {
            try {
                channel.close();
            } catch (IOException e) {
            }
        }
    }

    public static void delete(File file) {
        if (file != null) {
            file.delete();
        }
    }

    public static FileUtils getFileUtils() {
        return PRIMARY_INSTANCE;
    }

    public static String getPath(List list) {
        return getPath(list, '/');
    }

    public static String getPath(List list, char c) {
        StringBuffer stringBuffer = new StringBuffer();
        Iterator it = list.iterator();
        if (it.hasNext()) {
            stringBuffer.append(it.next());
        }
        while (it.hasNext()) {
            stringBuffer.append(c);
            stringBuffer.append(it.next());
        }
        return stringBuffer.toString();
    }

    public static String[] getPathStack(String str) {
        return str.replace(File.separatorChar, '/').split("/");
    }

    public static String getRelativePath(File file, File file2) throws Exception {
        String path;
        String canonicalPath = file.getCanonicalPath();
        String canonicalPath2 = file2.getCanonicalPath();
        String[] pathStack = getPathStack(canonicalPath);
        String[] pathStack2 = getPathStack(canonicalPath2);
        if (pathStack2.length <= 0 || pathStack.length <= 0) {
            path = getPath(Arrays.asList(pathStack2));
        } else if (!pathStack[0].equals(pathStack2[0])) {
            path = getPath(Arrays.asList(pathStack2));
        } else {
            int min = Math.min(pathStack.length, pathStack2.length);
            int i = 1;
            while (i < min && pathStack[i].equals(pathStack2[i])) {
                i++;
            }
            ArrayList arrayList = new ArrayList();
            for (int i2 = i; i2 < pathStack.length; i2++) {
                arrayList.add("..");
            }
            while (i < pathStack2.length) {
                arrayList.add(pathStack2[i]);
                i++;
            }
            path = getPath(arrayList);
        }
        return path;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00c5, code lost:
        if (r0 > 0) goto L40;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean isAbsolutePath(String str) {
        boolean z = true;
        int length = str.length();
        if (length == 0) {
            z = false;
        } else {
            char c = File.separatorChar;
            String replace = str.replace('/', c).replace('\\', c);
            char charAt = replace.charAt(0);
            if (ON_DOS || ON_NETWARE) {
                if (charAt == c) {
                    z = false;
                    if (ON_DOS) {
                        z = false;
                        if (length > 4) {
                            z = false;
                            if (replace.charAt(1) == c) {
                                int indexOf = replace.indexOf(c, 2);
                                z = indexOf > 2 && indexOf + 1 < length;
                            }
                        }
                    }
                } else {
                    int indexOf2 = replace.indexOf(58);
                    if (!Character.isLetter(charAt) || indexOf2 != 1 || replace.length() <= 2 || replace.charAt(2) != c) {
                        z = false;
                        if (ON_NETWARE) {
                            z = false;
                        }
                    }
                    z = true;
                }
            } else if (charAt != c) {
                z = false;
            }
        }
        return z;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x007b, code lost:
        if (r0.charAt(2) != r0) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:5:0x000d, code lost:
        if (org.apache.tools.ant.util.FileUtils.ON_NETWARE != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean isContextRelativePath(String str) {
        boolean z;
        if (!ON_DOS) {
            z = false;
        }
        if (str.length() == 0) {
            z = false;
        } else {
            char c = File.separatorChar;
            String replace = str.replace('/', c).replace('\\', c);
            char charAt = replace.charAt(0);
            int length = replace.length();
            if (charAt != c || (length != 1 && replace.charAt(1) == c)) {
                z = false;
                if (Character.isLetter(charAt)) {
                    z = false;
                    if (length > 1) {
                        z = false;
                        if (replace.indexOf(58) == 1) {
                            if (length != 2) {
                                z = false;
                            }
                        }
                    }
                }
            }
            z = true;
        }
        return z;
    }

    public static FileUtils newFileUtils() {
        return new FileUtils();
    }

    public static String readFully(Reader reader) throws IOException {
        return readFully(reader, 8192);
    }

    public static String readFully(Reader reader, int i) throws IOException {
        if (i <= 0) {
            throw new IllegalArgumentException("Buffer size must be greater than 0");
        }
        char[] cArr = new char[i];
        int i2 = 0;
        StringBuffer stringBuffer = null;
        while (i2 != -1) {
            int read = reader.read(cArr);
            i2 = read;
            if (read > 0) {
                StringBuffer stringBuffer2 = stringBuffer;
                if (stringBuffer == null) {
                    stringBuffer2 = new StringBuffer();
                }
                stringBuffer2.append(new String(cArr, 0, read));
                i2 = read;
                stringBuffer = stringBuffer2;
            }
        }
        return stringBuffer == null ? null : stringBuffer.toString();
    }

    public static String safeReadFully(Reader reader) throws IOException {
        String readFully = readFully(reader);
        String str = readFully;
        if (readFully == null) {
            str = "";
        }
        return str;
    }

    public static String translatePath(String str) {
        String str2;
        if (str == null || str.length() == 0) {
            str2 = "";
        } else {
            StringBuffer stringBuffer = new StringBuffer(str.length() + 50);
            PathTokenizer pathTokenizer = new PathTokenizer(str);
            while (pathTokenizer.hasMoreTokens()) {
                String replace = pathTokenizer.nextToken().replace('/', File.separatorChar).replace('\\', File.separatorChar);
                if (stringBuffer.length() != 0) {
                    stringBuffer.append(File.pathSeparatorChar);
                }
                stringBuffer.append(replace);
            }
            str2 = stringBuffer.toString();
        }
        return str2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0046, code lost:
        if (r0.getCanonicalFile().equals(r0.getCanonicalFile()) != false) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean areSame(File file, File file2) throws IOException {
        boolean z;
        if (file == null && file2 == null) {
            z = true;
        } else {
            z = false;
            if (file != null) {
                z = false;
                if (file2 != null) {
                    File normalize = normalize(file.getAbsolutePath());
                    File normalize2 = normalize(file2.getAbsolutePath());
                    if (!normalize.equals(normalize2)) {
                        z = false;
                    }
                    z = true;
                }
            }
        }
        return z;
    }

    public boolean contentEquals(File file, File file2) throws IOException {
        return contentEquals(file, file2, false);
    }

    public boolean contentEquals(File file, File file2, boolean z) throws IOException {
        return ResourceUtils.contentEquals(new FileResource(file), new FileResource(file2), z);
    }

    public void copyFile(File file, File file2) throws IOException {
        copyFile(file, file2, (FilterSetCollection) null, false, false);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection) throws IOException {
        copyFile(file, file2, filterSetCollection, false, false);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, String str, String str2, Project project) throws IOException {
        copyFile(file, file2, filterSetCollection, vector, z, z2, false, str, str2, project);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, String str, Project project) throws IOException {
        copyFile(file, file2, filterSetCollection, vector, z, z2, str, str, project);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, boolean z3, String str, String str2, Project project) throws IOException {
        copyFile(file, file2, filterSetCollection, vector, z, z2, z3, str, str2, project, false);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, boolean z3, String str, String str2, Project project, boolean z4) throws IOException {
        ResourceUtils.copyResource(new FileResource(file), new FileResource(file2), filterSetCollection, vector, z, z2, z3, str, str2, project, z4);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, boolean z) throws IOException {
        copyFile(file, file2, filterSetCollection, z, false);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, boolean z, boolean z2) throws IOException {
        copyFile(file, file2, filterSetCollection, z, z2, (String) null);
    }

    public void copyFile(File file, File file2, FilterSetCollection filterSetCollection, boolean z, boolean z2, String str) throws IOException {
        copyFile(file, file2, filterSetCollection, (Vector) null, z, z2, str, (Project) null);
    }

    public void copyFile(String str, String str2) throws IOException {
        copyFile(new File(str), new File(str2), (FilterSetCollection) null, false, false);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, false, false);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, String str3, String str4, Project project) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, vector, z, z2, str3, str4, project);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection, Vector vector, boolean z, boolean z2, String str3, Project project) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, vector, z, z2, str3, project);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection, boolean z) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, z, false);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection, boolean z, boolean z2) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, z, z2);
    }

    public void copyFile(String str, String str2, FilterSetCollection filterSetCollection, boolean z, boolean z2, String str3) throws IOException {
        copyFile(new File(str), new File(str2), filterSetCollection, z, z2, str3);
    }

    public boolean createNewFile(File file) throws IOException {
        return file.createNewFile();
    }

    public boolean createNewFile(File file, boolean z) throws IOException {
        File parentFile = file.getParentFile();
        if (z && !parentFile.exists()) {
            parentFile.mkdirs();
        }
        return file.createNewFile();
    }

    public File createTempFile(String str, String str2, File file) {
        return createTempFile(str, str2, file, false, false);
    }

    public File createTempFile(String str, String str2, File file, boolean z) {
        return createTempFile(str, str2, file, z, false);
    }

    public File createTempFile(String str, String str2, File file, boolean z, boolean z2) {
        File createTempFile;
        String property = file == null ? System.getProperty("java.io.tmpdir") : file.getPath();
        String str3 = str;
        if (str == null) {
            str3 = NULL_PLACEHOLDER;
        }
        String str4 = str2;
        if (str2 == null) {
            str4 = NULL_PLACEHOLDER;
        }
        if (z2) {
            try {
                createTempFile = File.createTempFile(str3, str4, new File(property));
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("Could not create tempfile in ").append(property).toString(), e);
            }
        } else {
            DecimalFormat decimalFormat = new DecimalFormat("#####");
            synchronized (rand) {
                do {
                    try {
                        createTempFile = new File(property, new StringBuffer().append(str3).append(decimalFormat.format(rand.nextInt(Execute.INVALID))).append(str4).toString());
                        try {
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } while (createTempFile.exists());
            }
        }
        if (z) {
            createTempFile.deleteOnExit();
        }
        return createTempFile;
    }

    public String[] dissect(String str) {
        String str2;
        String substring;
        char c = File.separatorChar;
        String replace = str.replace('/', c).replace('\\', c);
        if (!isAbsolutePath(replace)) {
            throw new BuildException(new StringBuffer().append(replace).append(" is not an absolute path").toString());
        }
        int indexOf = replace.indexOf(58);
        if (indexOf > 0 && (ON_DOS || ON_NETWARE)) {
            int i = indexOf + 1;
            String substring2 = replace.substring(0, i);
            char[] charArray = replace.toCharArray();
            str2 = new StringBuffer().append(substring2).append(c).toString();
            int i2 = i;
            if (charArray[i] == c) {
                i2 = i + 1;
            }
            StringBuffer stringBuffer = new StringBuffer();
            while (i2 < charArray.length) {
                if (charArray[i2] != c || charArray[i2 - 1] != c) {
                    stringBuffer.append(charArray[i2]);
                }
                i2++;
            }
            substring = stringBuffer.toString();
        } else if (replace.length() <= 1 || replace.charAt(1) != c) {
            str2 = File.separator;
            substring = replace.substring(1);
        } else {
            int indexOf2 = replace.indexOf(c, replace.indexOf(c, 2) + 1);
            str2 = indexOf2 > 2 ? replace.substring(0, indexOf2 + 1) : replace;
            substring = replace.substring(str2.length());
        }
        return new String[]{str2, substring};
    }

    public boolean fileNameEquals(File file, File file2) {
        return normalize(file.getAbsolutePath()).getAbsolutePath().equals(normalize(file2.getAbsolutePath()).getAbsolutePath());
    }

    public String fromURI(String str) {
        String fromURI;
        synchronized (this.cacheFromUriLock) {
            if (str.equals(this.cacheFromUriRequest)) {
                fromURI = this.cacheFromUriResponse;
            } else {
                fromURI = Locator.fromURI(str);
                if (isAbsolutePath(fromURI)) {
                    fromURI = normalize(fromURI).getAbsolutePath();
                }
                this.cacheFromUriRequest = str;
                this.cacheFromUriResponse = fromURI;
            }
        }
        return fromURI;
    }

    public String getDefaultEncoding() {
        InputStreamReader inputStreamReader = new InputStreamReader(new InputStream(this) { // from class: org.apache.tools.ant.util.FileUtils.2
            private final FileUtils this$0;

            {
                this.this$0 = this;
            }

            @Override // java.io.InputStream
            public int read() {
                return -1;
            }
        });
        try {
            return inputStreamReader.getEncoding();
        } finally {
            close(inputStreamReader);
        }
    }

    public long getFileTimestampGranularity() {
        long j = 2000;
        if (!ON_WIN9X) {
            if (ON_WINDOWS) {
                j = 1;
            } else if (!ON_DOS) {
                j = 1000;
            }
        }
        return j;
    }

    public URL getFileURL(File file) throws MalformedURLException {
        return new URL(toURI(file.getAbsolutePath()));
    }

    public File getParentFile(File file) {
        return file == null ? null : file.getParentFile();
    }

    public boolean hasErrorInCase(File file) {
        boolean z = true;
        File normalize = normalize(file.getAbsolutePath());
        if (!normalize.exists()) {
            z = false;
        } else {
            String[] list = normalize.getParentFile().list(new FilenameFilter(this, normalize.getName()) { // from class: org.apache.tools.ant.util.FileUtils.1
                private final FileUtils this$0;
                private final String val$localFileName;

                {
                    this.this$0 = this;
                    this.val$localFileName = r5;
                }

                @Override // java.io.FilenameFilter
                public boolean accept(File file2, String str) {
                    return str.equalsIgnoreCase(this.val$localFileName) && !str.equals(this.val$localFileName);
                }
            });
            if (list == null || list.length != 1) {
                z = false;
            }
        }
        return z;
    }

    public boolean isLeadingPath(File file, File file2) {
        boolean startsWith;
        String absolutePath = normalize(file.getAbsolutePath()).getAbsolutePath();
        String absolutePath2 = normalize(file2.getAbsolutePath()).getAbsolutePath();
        if (absolutePath.equals(absolutePath2)) {
            startsWith = true;
        } else {
            String str = absolutePath;
            if (!absolutePath.endsWith(File.separator)) {
                str = new StringBuffer().append(absolutePath).append(File.separator).toString();
            }
            startsWith = absolutePath2.startsWith(str);
        }
        return startsWith;
    }

    public boolean isSymbolicLink(File file, String str) throws IOException {
        SymbolicLinkUtils symbolicLinkUtils = SymbolicLinkUtils.getSymbolicLinkUtils();
        return file == null ? symbolicLinkUtils.isSymbolicLink(str) : symbolicLinkUtils.isSymbolicLink(file, str);
    }

    public boolean isUpToDate(long j, long j2) {
        return isUpToDate(j, j2, getFileTimestampGranularity());
    }

    public boolean isUpToDate(long j, long j2, long j3) {
        return j2 != -1 && j2 >= j + j3;
    }

    public boolean isUpToDate(File file, File file2) {
        return isUpToDate(file, file2, getFileTimestampGranularity());
    }

    public boolean isUpToDate(File file, File file2, long j) {
        return !file2.exists() ? false : isUpToDate(file.lastModified(), file2.lastModified(), j);
    }

    public File normalize(String str) {
        File file;
        Stack stack = new Stack();
        String[] dissect = dissect(str);
        stack.push(dissect[0]);
        java.util.StringTokenizer stringTokenizer = new java.util.StringTokenizer(dissect[1], File.separator);
        while (true) {
            if (stringTokenizer.hasMoreTokens()) {
                String nextToken = stringTokenizer.nextToken();
                if (!".".equals(nextToken)) {
                    if (!"..".equals(nextToken)) {
                        stack.push(nextToken);
                    } else if (stack.size() < 2) {
                        file = new File(str);
                        break;
                    } else {
                        stack.pop();
                    }
                }
            } else {
                StringBuffer stringBuffer = new StringBuffer();
                int size = stack.size();
                for (int i = 0; i < size; i++) {
                    if (i > 1) {
                        stringBuffer.append(File.separatorChar);
                    }
                    stringBuffer.append(stack.elementAt(i));
                }
                file = new File(stringBuffer.toString());
            }
        }
        return file;
    }

    public String removeLeadingPath(File file, File file2) {
        String str;
        String absolutePath = normalize(file.getAbsolutePath()).getAbsolutePath();
        String absolutePath2 = normalize(file2.getAbsolutePath()).getAbsolutePath();
        if (absolutePath.equals(absolutePath2)) {
            str = "";
        } else {
            String str2 = absolutePath;
            if (!absolutePath.endsWith(File.separator)) {
                str2 = new StringBuffer().append(absolutePath).append(File.separator).toString();
            }
            str = absolutePath2;
            if (absolutePath2.startsWith(str2)) {
                str = absolutePath2.substring(str2.length());
            }
        }
        return str;
    }

    public void rename(File file, File file2) throws IOException {
        File canonicalFile = normalize(file.getAbsolutePath()).getCanonicalFile();
        File normalize = normalize(file2.getAbsolutePath());
        if (!canonicalFile.exists()) {
            System.err.println(new StringBuffer().append("Cannot rename nonexistent file ").append(canonicalFile).toString());
        } else if (canonicalFile.getAbsolutePath().equals(normalize.getAbsolutePath())) {
            System.err.println(new StringBuffer().append("Rename of ").append(canonicalFile).append(" to ").append(normalize).append(" is a no-op.").toString());
        } else if (normalize.exists() && !areSame(canonicalFile, normalize) && !tryHardToDelete(normalize)) {
            throw new IOException(new StringBuffer().append("Failed to delete ").append(normalize).append(" while trying to rename ").append(canonicalFile).toString());
        } else {
            File parentFile = normalize.getParentFile();
            if (parentFile != null && !parentFile.exists() && !parentFile.mkdirs()) {
                throw new IOException(new StringBuffer().append("Failed to create directory ").append(parentFile).append(" while trying to rename ").append(canonicalFile).toString());
            }
            if (canonicalFile.renameTo(normalize)) {
                return;
            }
            copyFile(canonicalFile, normalize);
            if (tryHardToDelete(canonicalFile)) {
                return;
            }
            throw new IOException(new StringBuffer().append("Failed to delete ").append(canonicalFile).append(" while trying to rename it.").toString());
        }
    }

    public File resolveFile(File file, String str) {
        String str2 = str;
        if (!isAbsolutePath(str)) {
            char c = File.separatorChar;
            String replace = str.replace('/', c).replace('\\', c);
            String str3 = replace;
            if (isContextRelativePath(replace)) {
                String property = System.getProperty("user.dir");
                file = null;
                str3 = replace;
                if (replace.charAt(0) == c) {
                    file = null;
                    str3 = replace;
                    if (property.charAt(0) == c) {
                        str3 = new StringBuffer().append(dissect(property)[0]).append(replace.substring(1)).toString();
                        file = null;
                    }
                }
            }
            str2 = new File(file, str3).getAbsolutePath();
        }
        return normalize(str2);
    }

    public void setFileLastModified(File file, long j) {
        ResourceUtils.setLastModified(new FileResource(file), j);
    }

    public String toURI(String str) {
        return new File(str).getAbsoluteFile().toURI().toASCIIString();
    }

    public String toVMSPath(File file) {
        String stringBuffer;
        String path = normalize(file.getAbsolutePath()).getPath();
        String name = file.getName();
        boolean z = path.charAt(0) == File.separatorChar;
        boolean z2 = file.isDirectory() && !name.regionMatches(true, name.length() - 4, ".DIR", 0, 4);
        String str = null;
        StringBuffer stringBuffer2 = null;
        String str2 = null;
        int i = 0;
        if (z) {
            int indexOf = path.indexOf(File.separatorChar, 1);
            if (indexOf == -1) {
                stringBuffer = new StringBuffer().append(path.substring(1)).append(":[000000]").toString();
                return stringBuffer;
            }
            str = path.substring(1, indexOf);
            i = indexOf + 1;
        }
        if (z2) {
            stringBuffer2 = new StringBuffer(path.substring(i).replace(File.separatorChar, '.'));
        } else {
            int lastIndexOf = path.lastIndexOf(File.separatorChar, path.length());
            if (lastIndexOf == -1 || lastIndexOf < i) {
                str2 = path.substring(i);
            } else {
                StringBuffer stringBuffer3 = new StringBuffer(path.substring(i, lastIndexOf).replace(File.separatorChar, '.'));
                int i2 = lastIndexOf + 1;
                stringBuffer2 = stringBuffer3;
                if (path.length() > i2) {
                    str2 = path.substring(i2);
                    stringBuffer2 = stringBuffer3;
                }
            }
        }
        if (!z && stringBuffer2 != null) {
            stringBuffer2.insert(0, '.');
        }
        StringBuffer append = new StringBuffer().append(str != null ? new StringBuffer().append(str).append(":").toString() : "").append(stringBuffer2 != null ? new StringBuffer().append("[").append((Object) stringBuffer2).append("]").toString() : "");
        if (str2 == null) {
            str2 = "";
        }
        stringBuffer = append.append(str2).toString();
        return stringBuffer;
    }

    public boolean tryHardToDelete(File file) {
        return tryHardToDelete(file, ON_WINDOWS);
    }

    public boolean tryHardToDelete(File file, boolean z) {
        boolean z2;
        if (!file.delete()) {
            if (z) {
                System.gc();
            }
            try {
                Thread.sleep(10L);
            } catch (InterruptedException e) {
            }
            z2 = file.delete();
        } else {
            z2 = true;
        }
        return z2;
    }
}
