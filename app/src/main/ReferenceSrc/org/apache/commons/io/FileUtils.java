package org.apache.commons.io;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import java.util.zip.Checksum;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.commons.io.filefilter.FileFilterUtils;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.apache.commons.io.filefilter.TrueFileFilter;
import org.apache.commons.io.output.NullOutputStream;

/* loaded from: classes.jar:org/apache/commons/io/FileUtils.class */
public class FileUtils {
    private static final long FILE_COPY_BUFFER_SIZE = 31457280;
    public static final long ONE_GB = 1073741824;
    public static final long ONE_KB = 1024;
    public static final long ONE_MB = 1048576;
    public static final long ONE_PB = 1125899906842624L;
    public static final long ONE_TB = 1099511627776L;
    public static final BigInteger ONE_KB_BI = BigInteger.valueOf(1024);
    public static final BigInteger ONE_MB_BI = ONE_KB_BI.multiply(ONE_KB_BI);
    public static final BigInteger ONE_GB_BI = ONE_KB_BI.multiply(ONE_MB_BI);
    public static final BigInteger ONE_TB_BI = ONE_KB_BI.multiply(ONE_GB_BI);
    public static final BigInteger ONE_PB_BI = ONE_KB_BI.multiply(ONE_TB_BI);
    public static final BigInteger ONE_EB_BI = ONE_KB_BI.multiply(ONE_PB_BI);
    public static final long ONE_EB = 1152921504606846976L;
    public static final BigInteger ONE_ZB = BigInteger.valueOf(1024).multiply(BigInteger.valueOf(ONE_EB));
    public static final BigInteger ONE_YB = ONE_KB_BI.multiply(ONE_ZB);
    public static final File[] EMPTY_FILE_ARRAY = new File[0];
    private static final Charset UTF8 = Charset.forName("UTF-8");

    public static String byteCountToDisplaySize(long j) {
        return byteCountToDisplaySize(BigInteger.valueOf(j));
    }

    public static String byteCountToDisplaySize(BigInteger bigInteger) {
        return bigInteger.divide(ONE_EB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_EB_BI)) + " EB" : bigInteger.divide(ONE_PB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_PB_BI)) + " PB" : bigInteger.divide(ONE_TB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_TB_BI)) + " TB" : bigInteger.divide(ONE_GB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_GB_BI)) + " GB" : bigInteger.divide(ONE_MB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_MB_BI)) + " MB" : bigInteger.divide(ONE_KB_BI).compareTo(BigInteger.ZERO) > 0 ? String.valueOf(bigInteger.divide(ONE_KB_BI)) + " KB" : String.valueOf(bigInteger) + " bytes";
    }

    private static void checkDirectory(File file) {
        if (!file.exists()) {
            throw new IllegalArgumentException(file + " does not exist");
        }
        if (file.isDirectory()) {
            return;
        }
        throw new IllegalArgumentException(file + " is not a directory");
    }

    public static Checksum checksum(File file, Checksum checksum) throws IOException {
        CheckedInputStream checkedInputStream;
        Throwable th;
        if (file.isDirectory()) {
            throw new IllegalArgumentException("Checksums can't be computed on directories");
        }
        try {
            CheckedInputStream checkedInputStream2 = new CheckedInputStream(new FileInputStream(file), checksum);
            try {
                IOUtils.copy(checkedInputStream2, new NullOutputStream());
                IOUtils.closeQuietly((InputStream) checkedInputStream2);
                return checksum;
            } catch (Throwable th2) {
                th = th2;
                checkedInputStream = checkedInputStream2;
                IOUtils.closeQuietly((InputStream) checkedInputStream);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            checkedInputStream = null;
        }
    }

    public static long checksumCRC32(File file) throws IOException {
        CRC32 crc32 = new CRC32();
        checksum(file, crc32);
        return crc32.getValue();
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0084 -> B:19:0x007e). Please submit an issue!!! */
    public static void cleanDirectory(File file) throws IOException {
        if (!file.exists()) {
            throw new IllegalArgumentException(file + " does not exist");
        }
        if (!file.isDirectory()) {
            throw new IllegalArgumentException(file + " is not a directory");
        }
        File[] listFiles = file.listFiles();
        if (listFiles == null) {
            throw new IOException("Failed to list contents of " + file);
        }
        IOException e = null;
        for (File file2 : listFiles) {
            try {
                forceDelete(file2);
            } catch (IOException e2) {
                e = e2;
            }
        }
        if (e == null) {
            return;
        }
        throw e;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0084 -> B:19:0x007e). Please submit an issue!!! */
    private static void cleanDirectoryOnExit(File file) throws IOException {
        if (!file.exists()) {
            throw new IllegalArgumentException(file + " does not exist");
        }
        if (!file.isDirectory()) {
            throw new IllegalArgumentException(file + " is not a directory");
        }
        File[] listFiles = file.listFiles();
        if (listFiles == null) {
            throw new IOException("Failed to list contents of " + file);
        }
        IOException e = null;
        for (File file2 : listFiles) {
            try {
                forceDeleteOnExit(file2);
            } catch (IOException e2) {
                e = e2;
            }
        }
        if (e == null) {
            return;
        }
        throw e;
    }

    public static boolean contentEquals(File file, File file2) throws IOException {
        FileInputStream fileInputStream;
        Throwable th;
        FileInputStream fileInputStream2;
        FileInputStream fileInputStream3;
        boolean z = false;
        boolean exists = file.exists();
        if (exists == file2.exists()) {
            if (!exists) {
                z = true;
            } else if (file.isDirectory() || file2.isDirectory()) {
                throw new IOException("Can't compare directories, only files");
            } else {
                if (file.length() == file2.length()) {
                    if (file.getCanonicalFile().equals(file2.getCanonicalFile())) {
                        z = true;
                    } else {
                        try {
                            FileInputStream fileInputStream4 = new FileInputStream(file);
                            try {
                                fileInputStream3 = new FileInputStream(file2);
                            } catch (Throwable th2) {
                                th = th2;
                                fileInputStream2 = fileInputStream4;
                                fileInputStream = null;
                            }
                            try {
                                z = IOUtils.contentEquals(fileInputStream4, fileInputStream3);
                                IOUtils.closeQuietly((InputStream) fileInputStream4);
                                IOUtils.closeQuietly((InputStream) fileInputStream3);
                            } catch (Throwable th3) {
                                th = th3;
                                fileInputStream2 = fileInputStream4;
                                fileInputStream = fileInputStream3;
                                IOUtils.closeQuietly((InputStream) fileInputStream2);
                                IOUtils.closeQuietly((InputStream) fileInputStream);
                                throw th;
                            }
                        } catch (Throwable th4) {
                            th = th4;
                            fileInputStream = null;
                            fileInputStream2 = null;
                        }
                    }
                }
            }
        }
        return z;
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:52:0x011c */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v21, types: [java.io.Reader] */
    /* JADX WARN: Type inference failed for: r0v22, types: [java.io.Reader] */
    /* JADX WARN: Type inference failed for: r0v38, types: [java.io.InputStreamReader] */
    /* JADX WARN: Type inference failed for: r0v46, types: [java.io.Reader] */
    /* JADX WARN: Type inference failed for: r0v60, types: [java.io.InputStreamReader] */
    /* JADX WARN: Type inference failed for: r1v9, types: [java.io.Reader] */
    public static boolean contentEqualsIgnoreEOL(File file, File file2, String str) throws IOException {
        boolean z;
        Reader reader;
        File file3;
        Reader reader2;
        boolean exists = file.exists();
        if (exists != file2.exists()) {
            z = false;
        } else {
            z = true;
            if (exists) {
                if (file.isDirectory() || file2.isDirectory()) {
                    throw new IOException("Can't compare directories, only files");
                }
                z = true;
                if (!file.getCanonicalFile().equals(file2.getCanonicalFile())) {
                    try {
                        try {
                            if (str == null) {
                                Reader inputStreamReader = new InputStreamReader(new FileInputStream(file));
                                file = new InputStreamReader(new FileInputStream(file2));
                                reader2 = inputStreamReader;
                            } else {
                                Reader inputStreamReader2 = new InputStreamReader(new FileInputStream(file), str);
                                file = new InputStreamReader(new FileInputStream(file2), str);
                                reader2 = inputStreamReader2;
                            }
                            reader = reader2;
                            file3 = file;
                            z = IOUtils.contentEqualsIgnoreEOL(reader2, file);
                            IOUtils.closeQuietly(reader2);
                            IOUtils.closeQuietly((Reader) file);
                        } catch (Throwable th) {
                            th = th;
                            reader = file;
                            file3 = null;
                            IOUtils.closeQuietly((Reader) reader);
                            IOUtils.closeQuietly((Reader) file3);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        IOUtils.closeQuietly((Reader) reader);
                        IOUtils.closeQuietly((Reader) file3);
                        throw th;
                    }
                }
            }
        }
        return z;
    }

    public static File[] convertFileCollectionToFileArray(Collection<File> collection) {
        return (File[]) collection.toArray(new File[collection.size()]);
    }

    public static void copyDirectory(File file, File file2) throws IOException {
        copyDirectory(file, file2, true);
    }

    public static void copyDirectory(File file, File file2, FileFilter fileFilter) throws IOException {
        copyDirectory(file, file2, fileFilter, true);
    }

    public static void copyDirectory(File file, File file2, FileFilter fileFilter, boolean z) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!file.exists()) {
            throw new FileNotFoundException("Source '" + file + "' does not exist");
        }
        if (!file.isDirectory()) {
            throw new IOException("Source '" + file + "' exists but is not a directory");
        }
        if (file.getCanonicalPath().equals(file2.getCanonicalPath())) {
            throw new IOException("Source '" + file + "' and destination '" + file2 + "' are the same");
        }
        ArrayList arrayList = null;
        if (file2.getCanonicalPath().startsWith(file.getCanonicalPath())) {
            File[] listFiles = fileFilter == null ? file.listFiles() : file.listFiles(fileFilter);
            arrayList = null;
            if (listFiles != null) {
                arrayList = null;
                if (listFiles.length > 0) {
                    ArrayList arrayList2 = new ArrayList(listFiles.length);
                    int length = listFiles.length;
                    int i = 0;
                    while (true) {
                        arrayList = arrayList2;
                        if (i >= length) {
                            break;
                        }
                        arrayList2.add(new File(file2, listFiles[i].getName()).getCanonicalPath());
                        i++;
                    }
                }
            }
        }
        doCopyDirectory(file, file2, fileFilter, z, arrayList);
    }

    public static void copyDirectory(File file, File file2, boolean z) throws IOException {
        copyDirectory(file, file2, null, z);
    }

    public static void copyDirectoryToDirectory(File file, File file2) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file.exists() && !file.isDirectory()) {
            throw new IllegalArgumentException("Source '" + file2 + "' is not a directory");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (file2.exists() && !file2.isDirectory()) {
            throw new IllegalArgumentException("Destination '" + file2 + "' is not a directory");
        }
        copyDirectory(file, new File(file2, file.getName()), true);
    }

    public static long copyFile(File file, OutputStream outputStream) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            return IOUtils.copyLarge(fileInputStream, outputStream);
        } finally {
            fileInputStream.close();
        }
    }

    public static void copyFile(File file, File file2) throws IOException {
        copyFile(file, file2, true);
    }

    public static void copyFile(File file, File file2, boolean z) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!file.exists()) {
            throw new FileNotFoundException("Source '" + file + "' does not exist");
        }
        if (file.isDirectory()) {
            throw new IOException("Source '" + file + "' exists but is a directory");
        }
        if (file.getCanonicalPath().equals(file2.getCanonicalPath())) {
            throw new IOException("Source '" + file + "' and destination '" + file2 + "' are the same");
        }
        File parentFile = file2.getParentFile();
        if (parentFile != null && !parentFile.mkdirs() && !parentFile.isDirectory()) {
            throw new IOException("Destination '" + parentFile + "' directory cannot be created");
        }
        if (file2.exists() && !file2.canWrite()) {
            throw new IOException("Destination '" + file2 + "' exists but is read-only");
        }
        doCopyFile(file, file2, z);
    }

    public static void copyFileToDirectory(File file, File file2) throws IOException {
        copyFileToDirectory(file, file2, true);
    }

    public static void copyFileToDirectory(File file, File file2, boolean z) throws IOException {
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (file2.exists() && !file2.isDirectory()) {
            throw new IllegalArgumentException("Destination '" + file2 + "' is not a directory");
        }
        copyFile(file, new File(file2, file.getName()), z);
    }

    public static void copyInputStreamToFile(InputStream inputStream, File file) throws IOException {
        try {
            FileOutputStream openOutputStream = openOutputStream(file);
            IOUtils.copy(inputStream, openOutputStream);
            openOutputStream.close();
            IOUtils.closeQuietly((OutputStream) openOutputStream);
        } finally {
            IOUtils.closeQuietly(inputStream);
        }
    }

    public static void copyURLToFile(URL url, File file) throws IOException {
        copyInputStreamToFile(url.openStream(), file);
    }

    public static void copyURLToFile(URL url, File file, int i, int i2) throws IOException {
        URLConnection openConnection = url.openConnection();
        openConnection.setConnectTimeout(i);
        openConnection.setReadTimeout(i2);
        copyInputStreamToFile(openConnection.getInputStream(), file);
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[INVOKE]}, finally: {[INVOKE, INVOKE, SGET, INVOKE, INVOKE, INVOKE, INVOKE, INVOKE, SGET, INVOKE, INVOKE, INVOKE, INVOKE, IF] complete} */
    static String decodeUrl(String str) {
        int i;
        String str2 = str;
        if (str != null) {
            str2 = str;
            if (str.indexOf(37) >= 0) {
                int length = str.length();
                StringBuffer stringBuffer = new StringBuffer();
                ByteBuffer allocate = ByteBuffer.allocate(length);
                int i2 = 0;
                while (i2 < length) {
                    int i3 = i2;
                    if (str.charAt(i2) == '%') {
                        int i4 = i2;
                        do {
                            int i5 = i4;
                            try {
                                allocate.put((byte) Integer.parseInt(str.substring(i4 + 1, i4 + 3), 16));
                                i = i4 + 3;
                                if (i >= length) {
                                    break;
                                }
                                i4 = i;
                            } catch (RuntimeException e) {
                                i3 = i5;
                                if (allocate.position() > 0) {
                                    allocate.flip();
                                    stringBuffer.append(UTF8.decode(allocate).toString());
                                    allocate.clear();
                                    i3 = i5;
                                }
                            } catch (Throwable th) {
                                if (allocate.position() > 0) {
                                    allocate.flip();
                                    stringBuffer.append(UTF8.decode(allocate).toString());
                                    allocate.clear();
                                }
                                throw th;
                            }
                        } while (str.charAt(i) == '%');
                        i2 = i;
                        if (allocate.position() > 0) {
                            allocate.flip();
                            stringBuffer.append(UTF8.decode(allocate).toString());
                            allocate.clear();
                            i2 = i;
                        }
                    }
                    stringBuffer.append(str.charAt(i3));
                    i2 = i3 + 1;
                }
                str2 = stringBuffer.toString();
            }
        }
        return str2;
    }

    public static void deleteDirectory(File file) throws IOException {
        if (!file.exists()) {
            return;
        }
        if (!isSymlink(file)) {
            cleanDirectory(file);
        }
        if (file.delete()) {
            return;
        }
        throw new IOException("Unable to delete directory " + file + ".");
    }

    private static void deleteDirectoryOnExit(File file) throws IOException {
        if (!file.exists()) {
            return;
        }
        file.deleteOnExit();
        if (isSymlink(file)) {
            return;
        }
        cleanDirectoryOnExit(file);
    }

    public static boolean deleteQuietly(File file) {
        boolean z = false;
        if (file != null) {
            try {
                if (file.isDirectory()) {
                    cleanDirectory(file);
                }
            } catch (Exception e) {
            }
            try {
                z = file.delete();
            } catch (Exception e2) {
            }
        }
        return z;
    }

    public static boolean directoryContains(File file, File file2) throws IOException {
        boolean z;
        if (file == null) {
            throw new IllegalArgumentException("Directory must not be null");
        }
        if (!file.isDirectory()) {
            throw new IllegalArgumentException("Not a directory: " + file);
        }
        if (file2 == null) {
            z = false;
        } else {
            z = false;
            if (file.exists()) {
                z = false;
                if (file2.exists()) {
                    z = FilenameUtils.directoryContains(file.getCanonicalPath(), file2.getCanonicalPath());
                }
            }
        }
        return z;
    }

    private static void doCopyDirectory(File file, File file2, FileFilter fileFilter, boolean z, List<String> list) throws IOException {
        File[] listFiles = fileFilter == null ? file.listFiles() : file.listFiles(fileFilter);
        if (listFiles == null) {
            throw new IOException("Failed to list contents of " + file);
        }
        if (file2.exists()) {
            if (!file2.isDirectory()) {
                throw new IOException("Destination '" + file2 + "' exists but is not a directory");
            }
        } else if (!file2.mkdirs() && !file2.isDirectory()) {
            throw new IOException("Destination '" + file2 + "' directory cannot be created");
        }
        if (!file2.canWrite()) {
            throw new IOException("Destination '" + file2 + "' cannot be written to");
        }
        for (File file3 : listFiles) {
            File file4 = new File(file2, file3.getName());
            if (list == null || !list.contains(file3.getCanonicalPath())) {
                if (file3.isDirectory()) {
                    doCopyDirectory(file3, file4, fileFilter, z, list);
                } else {
                    doCopyFile(file3, file4, z);
                }
            }
        }
        if (!z) {
            return;
        }
        file2.setLastModified(file.lastModified());
    }

    private static void doCopyFile(File file, File file2, boolean z) throws IOException {
        FileOutputStream fileOutputStream;
        Throwable th;
        FileInputStream fileInputStream;
        if (!file2.exists() || !file2.isDirectory()) {
            FileChannel fileChannel = null;
            FileChannel fileChannel2 = null;
            try {
                FileInputStream fileInputStream2 = new FileInputStream(file);
                try {
                    FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
                    fileChannel2 = null;
                    fileChannel = null;
                    try {
                        FileChannel channel = fileInputStream2.getChannel();
                        FileChannel channel2 = fileOutputStream2.getChannel();
                        long size = channel.size();
                        long j = 0;
                        while (true) {
                            long j2 = j;
                            if (j2 >= size) {
                                break;
                            }
                            fileChannel2 = channel2;
                            fileChannel = channel;
                            j = j2 + channel2.transferFrom(channel, j2, size - j2 > FILE_COPY_BUFFER_SIZE ? 31457280L : size - j2);
                        }
                        IOUtils.closeQuietly(channel2);
                        IOUtils.closeQuietly((OutputStream) fileOutputStream2);
                        IOUtils.closeQuietly(channel);
                        IOUtils.closeQuietly((InputStream) fileInputStream2);
                        if (file.length() != file2.length()) {
                            throw new IOException("Failed to copy full contents from '" + file + "' to '" + file2 + "'");
                        }
                        if (!z) {
                            return;
                        }
                        file2.setLastModified(file.lastModified());
                    } catch (Throwable th2) {
                        th = th2;
                        fileInputStream = fileInputStream2;
                        fileOutputStream = fileOutputStream2;
                        IOUtils.closeQuietly(fileChannel2);
                        IOUtils.closeQuietly((OutputStream) fileOutputStream);
                        IOUtils.closeQuietly(fileChannel);
                        IOUtils.closeQuietly((InputStream) fileInputStream);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    fileInputStream = fileInputStream2;
                    fileOutputStream = null;
                }
            } catch (Throwable th4) {
                th = th4;
                fileOutputStream = null;
                fileInputStream = null;
            }
        } else {
            throw new IOException("Destination '" + file2 + "' exists but is a directory");
        }
    }

    public static void forceDelete(File file) throws IOException {
        if (file.isDirectory()) {
            deleteDirectory(file);
            return;
        }
        boolean exists = file.exists();
        if (file.delete()) {
            return;
        }
        if (exists) {
            throw new IOException("Unable to delete file: " + file);
        }
        throw new FileNotFoundException("File does not exist: " + file);
    }

    public static void forceDeleteOnExit(File file) throws IOException {
        if (file.isDirectory()) {
            deleteDirectoryOnExit(file);
        } else {
            file.deleteOnExit();
        }
    }

    public static void forceMkdir(File file) throws IOException {
        if (file.exists()) {
            if (file.isDirectory()) {
                return;
            }
            throw new IOException("File " + file + " exists and is not a directory. Unable to create directory.");
        } else if (!file.mkdirs() && !file.isDirectory()) {
            throw new IOException("Unable to create directory " + file);
        }
    }

    public static File getFile(File file, String... strArr) {
        if (file == null) {
            throw new NullPointerException("directorydirectory must not be null");
        }
        if (strArr == null) {
            throw new NullPointerException("names must not be null");
        }
        for (String str : strArr) {
            file = new File(file, str);
        }
        return file;
    }

    public static File getFile(String... strArr) {
        if (strArr == null) {
            throw new NullPointerException("names must not be null");
        }
        File file = null;
        for (String str : strArr) {
            file = file == null ? new File(str) : new File(file, str);
        }
        return file;
    }

    public static File getTempDirectory() {
        return new File(getTempDirectoryPath());
    }

    public static String getTempDirectoryPath() {
        return System.getProperty("java.io.tmpdir");
    }

    public static File getUserDirectory() {
        return new File(getUserDirectoryPath());
    }

    public static String getUserDirectoryPath() {
        return System.getProperty("user.home");
    }

    private static void innerListFiles(Collection<File> collection, File file, IOFileFilter iOFileFilter, boolean z) {
        File[] listFiles = file.listFiles((FileFilter) iOFileFilter);
        if (listFiles != null) {
            for (File file2 : listFiles) {
                if (file2.isDirectory()) {
                    if (z) {
                        collection.add(file2);
                    }
                    innerListFiles(collection, file2, iOFileFilter, z);
                } else {
                    collection.add(file2);
                }
            }
        }
    }

    public static boolean isFileNewer(File file, long j) {
        boolean z = false;
        if (file == null) {
            throw new IllegalArgumentException("No specified file");
        }
        if (file.exists() && file.lastModified() > j) {
            z = true;
        }
        return z;
    }

    public static boolean isFileNewer(File file, File file2) {
        if (file2 == null) {
            throw new IllegalArgumentException("No specified reference file");
        }
        if (file2.exists()) {
            return isFileNewer(file, file2.lastModified());
        }
        throw new IllegalArgumentException("The reference file '" + file2 + "' doesn't exist");
    }

    public static boolean isFileNewer(File file, Date date) {
        if (date == null) {
            throw new IllegalArgumentException("No specified date");
        }
        return isFileNewer(file, date.getTime());
    }

    public static boolean isFileOlder(File file, long j) {
        boolean z = false;
        if (file == null) {
            throw new IllegalArgumentException("No specified file");
        }
        if (file.exists() && file.lastModified() < j) {
            z = true;
        }
        return z;
    }

    public static boolean isFileOlder(File file, File file2) {
        if (file2 == null) {
            throw new IllegalArgumentException("No specified reference file");
        }
        if (file2.exists()) {
            return isFileOlder(file, file2.lastModified());
        }
        throw new IllegalArgumentException("The reference file '" + file2 + "' doesn't exist");
    }

    public static boolean isFileOlder(File file, Date date) {
        if (date == null) {
            throw new IllegalArgumentException("No specified date");
        }
        return isFileOlder(file, date.getTime());
    }

    public static boolean isSymlink(File file) throws IOException {
        boolean z = false;
        if (file == null) {
            throw new NullPointerException("File must not be null");
        }
        if (!FilenameUtils.isSystemWindows()) {
            if (file.getParent() != null) {
                file = new File(file.getParentFile().getCanonicalFile(), file.getName());
            }
            if (!file.getCanonicalFile().equals(file.getAbsoluteFile())) {
                z = true;
            }
        }
        return z;
    }

    public static Iterator<File> iterateFiles(File file, IOFileFilter iOFileFilter, IOFileFilter iOFileFilter2) {
        return listFiles(file, iOFileFilter, iOFileFilter2).iterator();
    }

    public static Iterator<File> iterateFiles(File file, String[] strArr, boolean z) {
        return listFiles(file, strArr, z).iterator();
    }

    public static Iterator<File> iterateFilesAndDirs(File file, IOFileFilter iOFileFilter, IOFileFilter iOFileFilter2) {
        return listFilesAndDirs(file, iOFileFilter, iOFileFilter2).iterator();
    }

    public static LineIterator lineIterator(File file) throws IOException {
        return lineIterator(file, null);
    }

    public static LineIterator lineIterator(File file, String str) throws IOException {
        FileInputStream fileInputStream = null;
        FileInputStream fileInputStream2 = null;
        try {
            FileInputStream openInputStream = openInputStream(file);
            fileInputStream2 = openInputStream;
            fileInputStream = openInputStream;
            return IOUtils.lineIterator(openInputStream, str);
        } catch (IOException e) {
            IOUtils.closeQuietly((InputStream) fileInputStream2);
            throw e;
        } catch (RuntimeException e2) {
            IOUtils.closeQuietly((InputStream) fileInputStream);
            throw e2;
        }
    }

    public static Collection<File> listFiles(File file, IOFileFilter iOFileFilter, IOFileFilter iOFileFilter2) {
        validateListFilesParameters(file, iOFileFilter);
        IOFileFilter upEffectiveFileFilter = setUpEffectiveFileFilter(iOFileFilter);
        IOFileFilter upEffectiveDirFilter = setUpEffectiveDirFilter(iOFileFilter2);
        LinkedList linkedList = new LinkedList();
        innerListFiles(linkedList, file, FileFilterUtils.or(upEffectiveFileFilter, upEffectiveDirFilter), false);
        return linkedList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v7, types: [org.apache.commons.io.filefilter.IOFileFilter] */
    public static Collection<File> listFiles(File file, String[] strArr, boolean z) {
        return listFiles(file, strArr == null ? TrueFileFilter.INSTANCE : new SuffixFileFilter(toSuffixes(strArr)), z ? TrueFileFilter.INSTANCE : FalseFileFilter.INSTANCE);
    }

    public static Collection<File> listFilesAndDirs(File file, IOFileFilter iOFileFilter, IOFileFilter iOFileFilter2) {
        validateListFilesParameters(file, iOFileFilter);
        IOFileFilter upEffectiveFileFilter = setUpEffectiveFileFilter(iOFileFilter);
        IOFileFilter upEffectiveDirFilter = setUpEffectiveDirFilter(iOFileFilter2);
        LinkedList linkedList = new LinkedList();
        if (file.isDirectory()) {
            linkedList.add(file);
        }
        innerListFiles(linkedList, file, FileFilterUtils.or(upEffectiveFileFilter, upEffectiveDirFilter), true);
        return linkedList;
    }

    public static void moveDirectory(File file, File file2) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!file.exists()) {
            throw new FileNotFoundException("Source '" + file + "' does not exist");
        }
        if (!file.isDirectory()) {
            throw new IOException("Source '" + file + "' is not a directory");
        }
        if (file2.exists()) {
            throw new FileExistsException("Destination '" + file2 + "' already exists");
        }
        if (file.renameTo(file2)) {
            return;
        }
        if (file2.getCanonicalPath().startsWith(file.getCanonicalPath())) {
            throw new IOException("Cannot move directory: " + file + " to a subdirectory of itself: " + file2);
        }
        copyDirectory(file, file2);
        deleteDirectory(file);
        if (!file.exists()) {
            return;
        }
        throw new IOException("Failed to delete original directory '" + file + "' after copy to '" + file2 + "'");
    }

    public static void moveDirectoryToDirectory(File file, File file2, boolean z) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination directory must not be null");
        }
        if (!file2.exists() && z) {
            file2.mkdirs();
        }
        if (!file2.exists()) {
            throw new FileNotFoundException("Destination directory '" + file2 + "' does not exist [createDestDir=" + z + "]");
        }
        if (!file2.isDirectory()) {
            throw new IOException("Destination '" + file2 + "' is not a directory");
        }
        moveDirectory(file, new File(file2, file.getName()));
    }

    public static void moveFile(File file, File file2) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!file.exists()) {
            throw new FileNotFoundException("Source '" + file + "' does not exist");
        }
        if (file.isDirectory()) {
            throw new IOException("Source '" + file + "' is a directory");
        }
        if (file2.exists()) {
            throw new FileExistsException("Destination '" + file2 + "' already exists");
        }
        if (file2.isDirectory()) {
            throw new IOException("Destination '" + file2 + "' is a directory");
        }
        if (file.renameTo(file2)) {
            return;
        }
        copyFile(file, file2);
        if (file.delete()) {
            return;
        }
        deleteQuietly(file2);
        throw new IOException("Failed to delete original file '" + file + "' after copy to '" + file2 + "'");
    }

    public static void moveFileToDirectory(File file, File file2, boolean z) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination directory must not be null");
        }
        if (!file2.exists() && z) {
            file2.mkdirs();
        }
        if (!file2.exists()) {
            throw new FileNotFoundException("Destination directory '" + file2 + "' does not exist [createDestDir=" + z + "]");
        }
        if (!file2.isDirectory()) {
            throw new IOException("Destination '" + file2 + "' is not a directory");
        }
        moveFile(file, new File(file2, file.getName()));
    }

    public static void moveToDirectory(File file, File file2, boolean z) throws IOException {
        if (file == null) {
            throw new NullPointerException("Source must not be null");
        }
        if (file2 == null) {
            throw new NullPointerException("Destination must not be null");
        }
        if (!file.exists()) {
            throw new FileNotFoundException("Source '" + file + "' does not exist");
        }
        if (file.isDirectory()) {
            moveDirectoryToDirectory(file, file2, z);
        } else {
            moveFileToDirectory(file, file2, z);
        }
    }

    public static FileInputStream openInputStream(File file) throws IOException {
        if (file.exists()) {
            if (file.isDirectory()) {
                throw new IOException("File '" + file + "' exists but is a directory");
            }
            if (file.canRead()) {
                return new FileInputStream(file);
            }
            throw new IOException("File '" + file + "' cannot be read");
        }
        throw new FileNotFoundException("File '" + file + "' does not exist");
    }

    public static FileOutputStream openOutputStream(File file) throws IOException {
        return openOutputStream(file, false);
    }

    public static FileOutputStream openOutputStream(File file, boolean z) throws IOException {
        if (!file.exists()) {
            File parentFile = file.getParentFile();
            if (parentFile != null && !parentFile.mkdirs() && !parentFile.isDirectory()) {
                throw new IOException("Directory '" + parentFile + "' could not be created");
            }
        } else if (file.isDirectory()) {
            throw new IOException("File '" + file + "' exists but is a directory");
        } else {
            if (!file.canWrite()) {
                throw new IOException("File '" + file + "' cannot be written to");
            }
        }
        return new FileOutputStream(file, z);
    }

    public static byte[] readFileToByteArray(File file) throws IOException {
        FileInputStream fileInputStream = null;
        try {
            FileInputStream openInputStream = openInputStream(file);
            fileInputStream = openInputStream;
            byte[] byteArray = IOUtils.toByteArray(openInputStream, file.length());
            IOUtils.closeQuietly((InputStream) openInputStream);
            return byteArray;
        } catch (Throwable th) {
            IOUtils.closeQuietly((InputStream) fileInputStream);
            throw th;
        }
    }

    public static String readFileToString(File file) throws IOException {
        return readFileToString(file, Charset.defaultCharset());
    }

    public static String readFileToString(File file, String str) throws IOException {
        return readFileToString(file, Charsets.toCharset(str));
    }

    public static String readFileToString(File file, Charset charset) throws IOException {
        FileInputStream fileInputStream = null;
        try {
            FileInputStream openInputStream = openInputStream(file);
            fileInputStream = openInputStream;
            String iOUtils = IOUtils.toString(openInputStream, Charsets.toCharset(charset));
            IOUtils.closeQuietly((InputStream) openInputStream);
            return iOUtils;
        } catch (Throwable th) {
            IOUtils.closeQuietly((InputStream) fileInputStream);
            throw th;
        }
    }

    public static List<String> readLines(File file) throws IOException {
        return readLines(file, Charset.defaultCharset());
    }

    public static List<String> readLines(File file, String str) throws IOException {
        return readLines(file, Charsets.toCharset(str));
    }

    public static List<String> readLines(File file, Charset charset) throws IOException {
        FileInputStream fileInputStream = null;
        try {
            FileInputStream openInputStream = openInputStream(file);
            fileInputStream = openInputStream;
            List<String> readLines = IOUtils.readLines(openInputStream, Charsets.toCharset(charset));
            IOUtils.closeQuietly((InputStream) openInputStream);
            return readLines;
        } catch (Throwable th) {
            IOUtils.closeQuietly((InputStream) fileInputStream);
            throw th;
        }
    }

    private static IOFileFilter setUpEffectiveDirFilter(IOFileFilter iOFileFilter) {
        return iOFileFilter == null ? FalseFileFilter.INSTANCE : FileFilterUtils.and(iOFileFilter, DirectoryFileFilter.INSTANCE);
    }

    private static IOFileFilter setUpEffectiveFileFilter(IOFileFilter iOFileFilter) {
        return FileFilterUtils.and(iOFileFilter, FileFilterUtils.notFileFilter(DirectoryFileFilter.INSTANCE));
    }

    public static long sizeOf(File file) {
        if (!file.exists()) {
            throw new IllegalArgumentException(file + " does not exist");
        }
        return file.isDirectory() ? sizeOfDirectory(file) : file.length();
    }

    public static BigInteger sizeOfAsBigInteger(File file) {
        if (!file.exists()) {
            throw new IllegalArgumentException(file + " does not exist");
        }
        return file.isDirectory() ? sizeOfDirectoryAsBigInteger(file) : BigInteger.valueOf(file.length());
    }

    public static long sizeOfDirectory(File file) {
        long j;
        checkDirectory(file);
        File[] listFiles = file.listFiles();
        if (listFiles != null) {
            long j2 = 0;
            int length = listFiles.length;
            int i = 0;
            while (true) {
                j = j2;
                if (i >= length) {
                    break;
                }
                File file2 = listFiles[i];
                long j3 = j2;
                try {
                    if (!isSymlink(file2)) {
                        long sizeOf = j2 + sizeOf(file2);
                        j = sizeOf;
                        if (sizeOf < 0) {
                            break;
                        }
                        j3 = sizeOf;
                    } else {
                        continue;
                    }
                } catch (IOException e) {
                    j3 = j2;
                }
                i++;
                j2 = j3;
            }
        } else {
            j = 0;
        }
        return j;
    }

    public static BigInteger sizeOfDirectoryAsBigInteger(File file) {
        BigInteger bigInteger;
        checkDirectory(file);
        File[] listFiles = file.listFiles();
        if (listFiles != null) {
            BigInteger bigInteger2 = BigInteger.ZERO;
            int length = listFiles.length;
            int i = 0;
            while (true) {
                bigInteger = bigInteger2;
                if (i >= length) {
                    break;
                }
                File file2 = listFiles[i];
                BigInteger bigInteger3 = bigInteger2;
                try {
                    if (!isSymlink(file2)) {
                        bigInteger3 = bigInteger2.add(BigInteger.valueOf(sizeOf(file2)));
                    }
                } catch (IOException e) {
                    bigInteger3 = bigInteger2;
                }
                i++;
                bigInteger2 = bigInteger3;
            }
        } else {
            bigInteger = BigInteger.ZERO;
        }
        return bigInteger;
    }

    public static File toFile(URL url) {
        return (url == null || !"file".equalsIgnoreCase(url.getProtocol())) ? null : new File(decodeUrl(url.getFile().replace('/', File.separatorChar)));
    }

    public static File[] toFiles(URL[] urlArr) {
        File[] fileArr;
        if (urlArr != null && urlArr.length != 0) {
            File[] fileArr2 = new File[urlArr.length];
            int i = 0;
            while (true) {
                fileArr = fileArr2;
                if (i >= urlArr.length) {
                    break;
                }
                URL url = urlArr[i];
                if (url != null) {
                    if (!url.getProtocol().equals("file")) {
                        throw new IllegalArgumentException("URL could not be converted to a File: " + url);
                    }
                    fileArr2[i] = toFile(url);
                }
                i++;
            }
        } else {
            fileArr = EMPTY_FILE_ARRAY;
        }
        return fileArr;
    }

    private static String[] toSuffixes(String[] strArr) {
        String[] strArr2 = new String[strArr.length];
        for (int i = 0; i < strArr.length; i++) {
            strArr2[i] = "." + strArr[i];
        }
        return strArr2;
    }

    public static URL[] toURLs(File[] fileArr) throws IOException {
        URL[] urlArr = new URL[fileArr.length];
        for (int i = 0; i < urlArr.length; i++) {
            urlArr[i] = fileArr[i].toURI().toURL();
        }
        return urlArr;
    }

    public static void touch(File file) throws IOException {
        if (!file.exists()) {
            IOUtils.closeQuietly((OutputStream) openOutputStream(file));
        }
        if (!file.setLastModified(System.currentTimeMillis())) {
            throw new IOException("Unable to set the last modification time for " + file);
        }
    }

    private static void validateListFilesParameters(File file, IOFileFilter iOFileFilter) {
        if (!file.isDirectory()) {
            throw new IllegalArgumentException("Parameter 'directory' is not a directory");
        }
        if (iOFileFilter != null) {
            return;
        }
        throw new NullPointerException("Parameter 'fileFilter' is null");
    }

    public static boolean waitFor(File file, int i) {
        boolean z;
        int i2 = 0;
        int i3 = 0;
        while (!file.exists()) {
            if (i3 >= 10) {
                i3 = 0;
                if (i2 > i) {
                    z = false;
                    break;
                }
                i2++;
            } else {
                i3++;
            }
            try {
                Thread.sleep(100L);
            } catch (InterruptedException e) {
            } catch (Exception e2) {
            }
        }
        z = true;
        return z;
    }

    public static void write(File file, CharSequence charSequence) throws IOException {
        write(file, charSequence, Charset.defaultCharset(), false);
    }

    public static void write(File file, CharSequence charSequence, String str) throws IOException {
        write(file, charSequence, str, false);
    }

    public static void write(File file, CharSequence charSequence, String str, boolean z) throws IOException {
        write(file, charSequence, Charsets.toCharset(str), z);
    }

    public static void write(File file, CharSequence charSequence, Charset charset) throws IOException {
        write(file, charSequence, charset, false);
    }

    public static void write(File file, CharSequence charSequence, Charset charset, boolean z) throws IOException {
        writeStringToFile(file, charSequence == null ? null : charSequence.toString(), charset, z);
    }

    public static void write(File file, CharSequence charSequence, boolean z) throws IOException {
        write(file, charSequence, Charset.defaultCharset(), z);
    }

    public static void writeByteArrayToFile(File file, byte[] bArr) throws IOException {
        writeByteArrayToFile(file, bArr, false);
    }

    public static void writeByteArrayToFile(File file, byte[] bArr, boolean z) throws IOException {
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream openOutputStream = openOutputStream(file, z);
            openOutputStream.write(bArr);
            fileOutputStream = openOutputStream;
            openOutputStream.close();
            IOUtils.closeQuietly((OutputStream) openOutputStream);
        } catch (Throwable th) {
            IOUtils.closeQuietly((OutputStream) fileOutputStream);
            throw th;
        }
    }

    public static void writeLines(File file, String str, Collection<?> collection) throws IOException {
        writeLines(file, str, collection, null, false);
    }

    public static void writeLines(File file, String str, Collection<?> collection, String str2) throws IOException {
        writeLines(file, str, collection, str2, false);
    }

    public static void writeLines(File file, String str, Collection<?> collection, String str2, boolean z) throws IOException {
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream openOutputStream = openOutputStream(file, z);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(openOutputStream);
            IOUtils.writeLines(collection, str2, bufferedOutputStream, str);
            bufferedOutputStream.flush();
            fileOutputStream = openOutputStream;
            openOutputStream.close();
            IOUtils.closeQuietly((OutputStream) openOutputStream);
        } catch (Throwable th) {
            IOUtils.closeQuietly((OutputStream) fileOutputStream);
            throw th;
        }
    }

    public static void writeLines(File file, String str, Collection<?> collection, boolean z) throws IOException {
        writeLines(file, str, collection, null, z);
    }

    public static void writeLines(File file, Collection<?> collection) throws IOException {
        writeLines(file, null, collection, null, false);
    }

    public static void writeLines(File file, Collection<?> collection, String str) throws IOException {
        writeLines(file, null, collection, str, false);
    }

    public static void writeLines(File file, Collection<?> collection, String str, boolean z) throws IOException {
        writeLines(file, null, collection, str, z);
    }

    public static void writeLines(File file, Collection<?> collection, boolean z) throws IOException {
        writeLines(file, null, collection, null, z);
    }

    public static void writeStringToFile(File file, String str) throws IOException {
        writeStringToFile(file, str, Charset.defaultCharset(), false);
    }

    public static void writeStringToFile(File file, String str, String str2) throws IOException {
        writeStringToFile(file, str, str2, false);
    }

    public static void writeStringToFile(File file, String str, String str2, boolean z) throws IOException {
        writeStringToFile(file, str, Charsets.toCharset(str2), z);
    }

    public static void writeStringToFile(File file, String str, Charset charset) throws IOException {
        writeStringToFile(file, str, charset, false);
    }

    public static void writeStringToFile(File file, String str, Charset charset, boolean z) throws IOException {
        FileOutputStream fileOutputStream = null;
        try {
            FileOutputStream openOutputStream = openOutputStream(file, z);
            IOUtils.write(str, (OutputStream) openOutputStream, charset);
            fileOutputStream = openOutputStream;
            openOutputStream.close();
            IOUtils.closeQuietly((OutputStream) openOutputStream);
        } catch (Throwable th) {
            IOUtils.closeQuietly((OutputStream) fileOutputStream);
            throw th;
        }
    }

    public static void writeStringToFile(File file, String str, boolean z) throws IOException {
        writeStringToFile(file, str, Charset.defaultCharset(), z);
    }
}
