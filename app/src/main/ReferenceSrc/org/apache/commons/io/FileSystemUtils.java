package org.apache.commons.io;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.condition.Os;

/* loaded from: classes.jar:org/apache/commons/io/FileSystemUtils.class */
public class FileSystemUtils {
    private static final String DF;
    private static final int INIT_PROBLEM = -1;
    private static final FileSystemUtils INSTANCE = new FileSystemUtils();
    private static final int OS;
    private static final int OTHER = 0;
    private static final int POSIX_UNIX = 3;
    private static final int UNIX = 2;
    private static final int WINDOWS = 1;

    static {
        int i;
        String property;
        String str = "df";
        try {
            property = System.getProperty("os.name");
        } catch (Exception e) {
            i = -1;
        }
        if (property == null) {
            throw new IOException("os.name not found");
        }
        String lowerCase = property.toLowerCase(Locale.ENGLISH);
        if (lowerCase.indexOf(Os.FAMILY_WINDOWS) != -1) {
            i = 1;
        } else if (lowerCase.indexOf("linux") != -1 || lowerCase.indexOf("mpe/ix") != -1 || lowerCase.indexOf("freebsd") != -1 || lowerCase.indexOf("irix") != -1 || lowerCase.indexOf("digital unix") != -1 || lowerCase.indexOf(Os.FAMILY_UNIX) != -1 || lowerCase.indexOf("mac os x") != -1) {
            i = 2;
        } else if (lowerCase.indexOf("sun os") == -1 && lowerCase.indexOf("sunos") == -1 && lowerCase.indexOf("solaris") == -1) {
            i = (lowerCase.indexOf("hp-ux") == -1 && lowerCase.indexOf("aix") == -1) ? 0 : 3;
        } else {
            i = 3;
            str = "/usr/xpg4/bin/df";
        }
        OS = i;
        DF = str;
    }

    @Deprecated
    public static long freeSpace(String str) throws IOException {
        return INSTANCE.freeSpaceOS(str, OS, false, -1L);
    }

    public static long freeSpaceKb() throws IOException {
        return freeSpaceKb(-1L);
    }

    public static long freeSpaceKb(long j) throws IOException {
        return freeSpaceKb(new File(".").getAbsolutePath(), j);
    }

    public static long freeSpaceKb(String str) throws IOException {
        return freeSpaceKb(str, -1L);
    }

    public static long freeSpaceKb(String str, long j) throws IOException {
        return INSTANCE.freeSpaceOS(str, OS, true, j);
    }

    long freeSpaceOS(String str, int i, boolean z, long j) throws IOException {
        long freeSpaceUnix;
        if (str == null) {
            throw new IllegalArgumentException("Path must not be empty");
        }
        switch (i) {
            case 0:
                throw new IllegalStateException("Unsupported operating system");
            case 1:
                if (!z) {
                    freeSpaceUnix = freeSpaceWindows(str, j);
                    break;
                } else {
                    freeSpaceUnix = freeSpaceWindows(str, j) / 1024;
                    break;
                }
            case 2:
                freeSpaceUnix = freeSpaceUnix(str, z, false, j);
                break;
            case 3:
                freeSpaceUnix = freeSpaceUnix(str, z, true, j);
                break;
            default:
                throw new IllegalStateException("Exception caught when determining operating system");
        }
        return freeSpaceUnix;
    }

    long freeSpaceUnix(String str, boolean z, boolean z2, long j) throws IOException {
        if (str.length() == 0) {
            throw new IllegalArgumentException("Path must not be empty");
        }
        String str2 = "-";
        if (z) {
            str2 = "-k";
        }
        String str3 = str2;
        if (z2) {
            str3 = str2 + "P";
        }
        List<String> performCommand = performCommand(str3.length() > 1 ? new String[]{DF, str3, str} : new String[]{DF, str}, 3, j);
        if (performCommand.size() < 2) {
            throw new IOException("Command line '" + DF + "' did not return info as expected for path '" + str + "'- response was " + performCommand);
        }
        StringTokenizer stringTokenizer = new StringTokenizer(performCommand.get(1), " ");
        if (stringTokenizer.countTokens() >= 4) {
            stringTokenizer.nextToken();
        } else if (stringTokenizer.countTokens() != 1 || performCommand.size() < 3) {
            throw new IOException("Command line '" + DF + "' did not return data as expected for path '" + str + "'- check path is valid");
        } else {
            stringTokenizer = new StringTokenizer(performCommand.get(2), " ");
        }
        stringTokenizer.nextToken();
        stringTokenizer.nextToken();
        return parseBytes(stringTokenizer.nextToken(), str);
    }

    long freeSpaceWindows(String str, long j) throws IOException {
        String normalize = FilenameUtils.normalize(str, false);
        String str2 = normalize;
        if (normalize.length() > 0) {
            str2 = normalize;
            if (normalize.charAt(0) != '\"') {
                str2 = "\"" + normalize + "\"";
            }
        }
        List<String> performCommand = performCommand(new String[]{"cmd.exe", "/C", "dir /a /-c " + str2}, Execute.INVALID, j);
        for (int size = performCommand.size() - 1; size >= 0; size--) {
            String str3 = performCommand.get(size);
            if (str3.length() > 0) {
                return parseDir(str3, str2);
            }
        }
        throw new IOException("Command line 'dir /-c' did not return any info for path '" + str2 + "'");
    }

    Process openProcess(String[] strArr) throws IOException {
        return Runtime.getRuntime().exec(strArr);
    }

    long parseBytes(String str, String str2) throws IOException {
        try {
            long parseLong = Long.parseLong(str);
            if (parseLong >= 0) {
                return parseLong;
            }
            throw new IOException("Command line '" + DF + "' did not find free space in response for path '" + str2 + "'- check path is valid");
        } catch (NumberFormatException e) {
            throw new IOExceptionWithCause("Command line '" + DF + "' did not return numeric data as expected for path '" + str2 + "'- check path is valid", e);
        }
    }

    long parseDir(String str, String str2) throws IOException {
        int i;
        int i2;
        int i3;
        int i4;
        int length = str.length() - 1;
        while (true) {
            i = 0;
            i2 = length;
            if (length < 0) {
                break;
            } else if (Character.isDigit(str.charAt(length))) {
                i = length + 1;
                i2 = length;
                break;
            } else {
                length--;
            }
        }
        while (true) {
            i3 = 0;
            if (i2 < 0) {
                break;
            }
            char charAt = str.charAt(i2);
            if (!Character.isDigit(charAt) && charAt != ',' && charAt != '.') {
                i3 = i2 + 1;
                break;
            }
            i2--;
        }
        if (i2 < 0) {
            throw new IOException("Command line 'dir /-c' did not return valid info for path '" + str2 + "'");
        }
        StringBuilder sb = new StringBuilder(str.substring(i3, i));
        int i5 = 0;
        while (true) {
            int i6 = i5;
            if (i6 >= sb.length()) {
                return parseBytes(sb.toString(), str2);
            }
            if (sb.charAt(i6) != ',') {
                i4 = i6;
                if (sb.charAt(i6) != '.') {
                    i5 = i4 + 1;
                }
            }
            sb.deleteCharAt(i6);
            i4 = i6 - 1;
            i5 = i4 + 1;
        }
    }

    List<String> performCommand(String[] strArr, int i, long j) throws IOException {
        InputStream inputStream;
        InterruptedException e;
        InputStream inputStream2;
        BufferedReader bufferedReader;
        OutputStream outputStream;
        Process process;
        Throwable th;
        Thread start;
        BufferedReader bufferedReader2;
        ArrayList arrayList = new ArrayList(20);
        InputStream inputStream3 = null;
        InputStream inputStream4 = null;
        BufferedReader bufferedReader3 = null;
        OutputStream outputStream2 = null;
        Process process2 = null;
        InputStream inputStream5 = null;
        InputStream inputStream6 = null;
        OutputStream outputStream3 = null;
        Process process3 = null;
        try {
            try {
                start = ThreadMonitor.start(j);
                process = openProcess(strArr);
                inputStream2 = process.getInputStream();
                outputStream = process.getOutputStream();
                inputStream = process.getErrorStream();
                inputStream5 = inputStream;
                inputStream6 = inputStream2;
                outputStream3 = outputStream;
                process3 = process;
                bufferedReader2 = new BufferedReader(new InputStreamReader(inputStream2));
            } catch (InterruptedException e2) {
                inputStream = inputStream5;
                e = e2;
                inputStream2 = inputStream6;
                bufferedReader = null;
                outputStream = outputStream3;
            }
        } catch (Throwable th2) {
            th = th2;
            process = process2;
        }
        try {
            for (String readLine = bufferedReader2.readLine(); readLine != null && arrayList.size() < i; readLine = bufferedReader2.readLine()) {
                arrayList.add(readLine.toLowerCase(Locale.ENGLISH).trim());
            }
            process.waitFor();
            ThreadMonitor.stop(start);
            if (process.exitValue() != 0) {
                throw new IOException("Command line returned OS error code '" + process.exitValue() + "' for command " + Arrays.asList(strArr));
            }
            if (arrayList.isEmpty()) {
                throw new IOException("Command line did not return any info for command " + Arrays.asList(strArr));
            }
            IOUtils.closeQuietly(inputStream2);
            IOUtils.closeQuietly(outputStream);
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly((Reader) bufferedReader2);
            if (process != null) {
                process.destroy();
            }
            return arrayList;
        } catch (InterruptedException e3) {
            e = e3;
            process3 = process;
            bufferedReader = bufferedReader2;
            InputStream inputStream7 = inputStream;
            InputStream inputStream8 = inputStream;
            InputStream inputStream9 = inputStream;
            inputStream3 = inputStream;
            inputStream4 = inputStream2;
            bufferedReader3 = bufferedReader;
            outputStream2 = outputStream;
            process2 = process3;
            throw new IOExceptionWithCause("Command line threw an InterruptedException for command " + Arrays.asList(strArr) + " timeout=" + j, e);
        } catch (Throwable th3) {
            th = th3;
            bufferedReader3 = bufferedReader2;
            inputStream3 = inputStream;
            inputStream4 = inputStream2;
            outputStream2 = outputStream;
            IOUtils.closeQuietly(inputStream4);
            IOUtils.closeQuietly(outputStream2);
            IOUtils.closeQuietly(inputStream3);
            IOUtils.closeQuietly((Reader) bufferedReader3);
            if (process != null) {
                process.destroy();
            }
            throw th;
        }
    }
}
