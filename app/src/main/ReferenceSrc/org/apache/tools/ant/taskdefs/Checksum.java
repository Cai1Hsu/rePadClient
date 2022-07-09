package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.condition.Condition;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.types.resources.selectors.Type;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Checksum.class */
public class Checksum extends MatchingTask implements Condition {
    private static final int BUFFER_SIZE = 8192;
    private static final int BYTE_MASK = 255;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final int NIBBLE = 4;
    private static final int WORD = 16;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String fileext;
    private boolean forceOverwrite;
    private boolean isCondition;
    private MessageDigest messageDigest;
    private String property;
    private File todir;
    private String totalproperty;
    private String verifyProperty;
    private File file = null;
    private String algorithm = "MD5";
    private String provider = null;
    private Map allDigests = new HashMap();
    private Map relativeFilePaths = new HashMap();
    private FileUnion resources = null;
    private Hashtable includeFileMap = new Hashtable();
    private int readBufferSize = 8192;
    private MessageFormat format = FormatElement.getDefault().getFormat();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Checksum$FileUnion.class */
    private static class FileUnion extends Restrict {
        private Union u = new Union();

        FileUnion() {
            super.add(this.u);
            super.add(Type.FILE);
        }

        @Override // org.apache.tools.ant.types.resources.Restrict
        public void add(ResourceCollection resourceCollection) {
            this.u.add(resourceCollection);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Checksum$FormatElement.class */
    public static class FormatElement extends EnumeratedAttribute {
        private static final String CHECKSUM = "CHECKSUM";
        private static final String MD5SUM = "MD5SUM";
        private static final String SVF = "SVF";
        private static HashMap formatMap = new HashMap();

        static {
            formatMap.put(CHECKSUM, new MessageFormat("{0}"));
            formatMap.put(MD5SUM, new MessageFormat("{0} *{1}"));
            formatMap.put(SVF, new MessageFormat("MD5 ({1}) = {0}"));
        }

        public static FormatElement getDefault() {
            FormatElement formatElement = new FormatElement();
            formatElement.setValue(CHECKSUM);
            return formatElement;
        }

        public MessageFormat getFormat() {
            return (MessageFormat) formatMap.get(getValue());
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{CHECKSUM, MD5SUM, SVF};
        }
    }

    private void addToIncludeFileMap(File file) throws BuildException {
        if (!file.exists()) {
            String stringBuffer = new StringBuffer().append("Could not find file ").append(file.getAbsolutePath()).append(" to generate checksum for.").toString();
            log(stringBuffer);
            throw new BuildException(stringBuffer, getLocation());
        } else if (this.property != null) {
            this.includeFileMap.put(file, this.property);
        } else {
            File checksumFile = getChecksumFile(file);
            if (this.forceOverwrite || this.isCondition || file.lastModified() > checksumFile.lastModified()) {
                this.includeFileMap.put(file, checksumFile);
                return;
            }
            log(new StringBuffer().append(file).append(" omitted as ").append(checksumFile).append(" is up to date.").toString(), 3);
            if (this.totalproperty == null) {
                return;
            }
            this.allDigests.put(file, decodeHex(readChecksum(checksumFile).toCharArray()));
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private String createDigestString(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & 255);
            if (hexString.length() < 2) {
                stringBuffer.append("0");
            }
            stringBuffer.append(hexString);
        }
        return stringBuffer.toString();
    }

    public static byte[] decodeHex(char[] cArr) throws BuildException {
        int i;
        int length = cArr.length;
        if ((length & 1) != 0) {
            throw new BuildException("odd number of characters.");
        }
        byte[] bArr = new byte[length >> 1];
        int i2 = 0;
        int i3 = 0;
        while (i3 < length) {
            int digit = Character.digit(cArr[i3], 16);
            i3 = i3 + 1 + 1;
            bArr[i2] = (byte) (((digit << 4) | Character.digit(cArr[i], 16)) & 255);
            i2++;
        }
        return bArr;
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:66:0x01a1 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Throwable] */
    private boolean generateChecksums() throws BuildException {
        FileInputStream fileInputStream;
        Object obj;
        Throwable th;
        boolean z = true;
        FileInputStream fileInputStream2 = null;
        FileOutputStream fileOutputStream = null;
        FileOutputStream fileOutputStream2 = null;
        byte[] bArr = new byte[this.readBufferSize];
        try {
            try {
                Enumeration keys = this.includeFileMap.keys();
                FileOutputStream fileOutputStream3 = null;
                while (keys.hasMoreElements()) {
                    try {
                        this.messageDigest.reset();
                        File file = (File) keys.nextElement();
                        if (!this.isCondition) {
                            log(new StringBuffer().append("Calculating ").append(this.algorithm).append(" checksum for ").append(file).toString(), 3);
                        }
                        FileInputStream fileInputStream3 = new FileInputStream(file);
                        fileInputStream = fileInputStream3;
                        try {
                            DigestInputStream digestInputStream = new DigestInputStream(fileInputStream3, this.messageDigest);
                            do {
                            } while (digestInputStream.read(bArr, 0, this.readBufferSize) != -1);
                            digestInputStream.close();
                            fileInputStream3.close();
                            byte[] digest = this.messageDigest.digest();
                            if (this.totalproperty != null) {
                                this.allDigests.put(file, digest);
                            }
                            String createDigestString = createDigestString(digest);
                            Object obj2 = this.includeFileMap.get(file);
                            if (obj2 instanceof String) {
                                String str = (String) obj2;
                                if (this.isCondition) {
                                    z = z && createDigestString.equals(this.property);
                                } else {
                                    getProject().setNewProperty(str, createDigestString);
                                }
                            } else if (!(obj2 instanceof File)) {
                                continue;
                            } else if (this.isCondition) {
                                File file2 = (File) obj2;
                                if (file2.exists()) {
                                    try {
                                        z = z && createDigestString.equals(readChecksum(file2));
                                    } catch (BuildException e) {
                                        z = false;
                                    }
                                } else {
                                    z = false;
                                }
                            } else {
                                File file3 = (File) obj2;
                                FileOutputStream fileOutputStream4 = new FileOutputStream(file3);
                                fileOutputStream = fileOutputStream4;
                                fileOutputStream4.write(this.format.format(new Object[]{createDigestString, file.getName(), FileUtils.getRelativePath(file3.getParentFile(), file), FileUtils.getRelativePath(getProject().getBaseDir(), file), file.getAbsolutePath()}).getBytes());
                                fileOutputStream4.write(StringUtils.LINE_SEP.getBytes());
                                fileOutputStream4.close();
                                fileOutputStream3 = null;
                            }
                        } catch (Exception e2) {
                            fileOutputStream = fileOutputStream3;
                            obj = e2;
                            FileInputStream fileInputStream4 = fileInputStream;
                            fileInputStream2 = fileInputStream;
                            fileOutputStream2 = fileOutputStream;
                            throw new BuildException((Throwable) obj, getLocation());
                        } catch (Throwable th2) {
                            th = th2;
                            FileOutputStream fileOutputStream5 = fileOutputStream3;
                            fileInputStream2 = fileInputStream3;
                            fileOutputStream2 = fileOutputStream5;
                            FileUtils.close(fileInputStream2);
                            FileUtils.close(fileOutputStream2);
                            throw th;
                        }
                    } catch (Exception e3) {
                        fileInputStream = null;
                        fileOutputStream = fileOutputStream3;
                        obj = e3;
                    } catch (Throwable th3) {
                        th = th3;
                        fileOutputStream2 = fileOutputStream3;
                        fileInputStream2 = null;
                    }
                }
                if (this.totalproperty != null) {
                    Object[] array = this.allDigests.keySet().toArray();
                    Arrays.sort(array, new Comparator(this) { // from class: org.apache.tools.ant.taskdefs.Checksum.1
                        private final Checksum this$0;

                        {
                            this.this$0 = this;
                        }

                        @Override // java.util.Comparator
                        public int compare(Object obj3, Object obj4) {
                            File file4 = (File) obj3;
                            File file5 = (File) obj4;
                            return file4 == null ? file5 == null ? 0 : -1 : file5 == null ? 1 : this.this$0.getRelativeFilePath(file4).compareTo(this.this$0.getRelativeFilePath(file5));
                        }
                    });
                    this.messageDigest.reset();
                    for (Object obj3 : array) {
                        File file4 = (File) obj3;
                        this.messageDigest.update((byte[]) this.allDigests.get(file4));
                        this.messageDigest.update(getRelativeFilePath(file4).getBytes());
                    }
                    getProject().setNewProperty(this.totalproperty, createDigestString(this.messageDigest.digest()));
                }
                FileUtils.close((InputStream) null);
                FileUtils.close(fileOutputStream3);
                return z;
            } catch (Exception unused) {
                fileInputStream = null;
                obj = bArr;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    private File getChecksumFile(File file) {
        File parentFile;
        if (this.todir != null) {
            parentFile = new File(this.todir, getRelativeFilePath(file)).getParentFile();
            parentFile.mkdirs();
        } else {
            parentFile = file.getParentFile();
        }
        return new File(parentFile, new StringBuffer().append(file.getName()).append(this.fileext).toString());
    }

    public String getRelativeFilePath(File file) {
        String str = (String) this.relativeFilePaths.get(file);
        if (str == null) {
            throw new BuildException(new StringBuffer().append("Internal error: relativeFilePaths could not match file ").append(file).append("\n").append("please file a bug report on this").toString());
        }
        return str;
    }

    private String readChecksum(File file) {
        BufferedReader bufferedReader;
        ParseException e;
        Throwable th;
        BufferedReader bufferedReader2 = null;
        try {
            try {
                bufferedReader = new BufferedReader(new FileReader(file));
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedReader = null;
        } catch (ParseException e3) {
            e = e3;
            bufferedReader = null;
        }
        try {
            Object[] parse = this.format.parse(bufferedReader.readLine());
            if (parse == null || parse.length == 0 || parse[0] == null) {
                throw new BuildException("failed to find a checksum");
            }
            String str = (String) parse[0];
            FileUtils.close(bufferedReader);
            return str;
        } catch (IOException e4) {
            e = e4;
            BufferedReader bufferedReader3 = bufferedReader;
            BufferedReader bufferedReader4 = bufferedReader;
            BufferedReader bufferedReader5 = bufferedReader;
            BufferedReader bufferedReader6 = bufferedReader;
            throw new BuildException(new StringBuffer().append("Couldn't read checksum file ").append(file).toString(), e);
        } catch (ParseException e5) {
            e = e5;
            BufferedReader bufferedReader7 = bufferedReader;
            BufferedReader bufferedReader8 = bufferedReader;
            BufferedReader bufferedReader9 = bufferedReader;
            BufferedReader bufferedReader10 = bufferedReader;
            throw new BuildException(new StringBuffer().append("Couldn't read checksum file ").append(file).toString(), e);
        } catch (Throwable th3) {
            th = th3;
            bufferedReader2 = bufferedReader;
            FileUtils.close(bufferedReader2);
            throw th;
        }
    }

    private boolean validateAndExecute() throws BuildException {
        Class cls;
        String str = this.fileext;
        if (this.file == null && (this.resources == null || this.resources.size() == 0)) {
            throw new BuildException("Specify at least one source - a file or a resource collection.");
        }
        if (this.resources != null && !this.resources.isFilesystemOnly()) {
            throw new BuildException("Can only calculate checksums for file-based resources.");
        }
        if (this.file != null && this.file.exists() && this.file.isDirectory()) {
            throw new BuildException("Checksum cannot be generated for directories");
        }
        if (this.file != null && this.totalproperty != null) {
            throw new BuildException("File and Totalproperty cannot co-exist.");
        }
        if (this.property != null && this.fileext != null) {
            throw new BuildException("Property and FileExt cannot co-exist.");
        }
        if (this.property != null) {
            if (this.forceOverwrite) {
                throw new BuildException("ForceOverwrite cannot be used when Property is specified");
            }
            int i = 0;
            if (this.resources != null) {
                i = 0 + this.resources.size();
            }
            int i2 = i;
            if (this.file != null) {
                i2 = i + 1;
            }
            if (i2 > 1) {
                throw new BuildException("Multiple files cannot be used when Property is specified");
            }
        }
        if (this.verifyProperty != null) {
            this.isCondition = true;
        }
        if (this.verifyProperty != null && this.forceOverwrite) {
            throw new BuildException("VerifyProperty and ForceOverwrite cannot co-exist.");
        }
        if (this.isCondition && this.forceOverwrite) {
            throw new BuildException("ForceOverwrite cannot be used when conditions are being used.");
        }
        this.messageDigest = null;
        if (this.provider != null) {
            try {
                this.messageDigest = MessageDigest.getInstance(this.algorithm, this.provider);
            } catch (NoSuchAlgorithmException e) {
                throw new BuildException(e, getLocation());
            } catch (NoSuchProviderException e2) {
                throw new BuildException(e2, getLocation());
            }
        } else {
            try {
                this.messageDigest = MessageDigest.getInstance(this.algorithm);
            } catch (NoSuchAlgorithmException e3) {
                throw new BuildException(e3, getLocation());
            }
        }
        if (this.messageDigest == null) {
            throw new BuildException("Unable to create Message Digest", getLocation());
        }
        if (this.fileext == null) {
            this.fileext = new StringBuffer().append(".").append(this.algorithm).toString();
        } else if (this.fileext.trim().length() == 0) {
            throw new BuildException("File extension when specified must not be an empty string");
        }
        try {
            if (this.resources != null) {
                Iterator it = this.resources.iterator();
                while (it.hasNext()) {
                    Resource resource = (Resource) it.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    File file = ((FileProvider) resource.as(cls)).getFile();
                    if (this.totalproperty != null || this.todir != null) {
                        this.relativeFilePaths.put(file, resource.getName().replace(File.separatorChar, '/'));
                    }
                    addToIncludeFileMap(file);
                }
            }
            if (this.file != null) {
                if (this.totalproperty != null || this.todir != null) {
                    this.relativeFilePaths.put(this.file, this.file.getName().replace(File.separatorChar, '/'));
                }
                addToIncludeFileMap(this.file);
            }
            return generateChecksums();
        } finally {
            this.fileext = str;
            this.includeFileMap.clear();
        }
    }

    public void add(ResourceCollection resourceCollection) {
        if (resourceCollection == null) {
            return;
        }
        this.resources = this.resources == null ? new FileUnion() : this.resources;
        this.resources.add(resourceCollection);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        this.isCondition = true;
        return validateAndExecute();
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        this.isCondition = false;
        boolean validateAndExecute = validateAndExecute();
        if (this.verifyProperty != null) {
            getProject().setNewProperty(this.verifyProperty, validateAndExecute ? Boolean.TRUE.toString() : Boolean.FALSE.toString());
        }
    }

    public void setAlgorithm(String str) {
        this.algorithm = str;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFileext(String str) {
        this.fileext = str;
    }

    public void setForceOverwrite(boolean z) {
        this.forceOverwrite = z;
    }

    public void setFormat(FormatElement formatElement) {
        this.format = formatElement.getFormat();
    }

    public void setPattern(String str) {
        this.format = new MessageFormat(str);
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setProvider(String str) {
        this.provider = str;
    }

    public void setReadBufferSize(int i) {
        this.readBufferSize = i;
    }

    public void setTodir(File file) {
        this.todir = file;
    }

    public void setTotalproperty(String str) {
        this.totalproperty = str;
    }

    public void setVerifyproperty(String str) {
        this.verifyProperty = str;
    }
}
