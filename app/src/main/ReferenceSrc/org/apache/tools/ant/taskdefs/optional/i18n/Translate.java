package org.apache.tools.ant.taskdefs.optional.i18n;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.LineTokenizer;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/i18n/Translate.class */
public class Translate extends MatchingTask {
    private static final int BUNDLE_DEFAULT_LANGUAGE = 6;
    private static final int BUNDLE_DEFAULT_LANGUAGE_COUNTRY = 5;
    private static final int BUNDLE_DEFAULT_LANGUAGE_COUNTRY_VARIANT = 4;
    private static final int BUNDLE_MAX_ALTERNATIVES = 7;
    private static final int BUNDLE_NOMATCH = 3;
    private static final int BUNDLE_SPECIFIED_LANGUAGE = 2;
    private static final int BUNDLE_SPECIFIED_LANGUAGE_COUNTRY = 1;
    private static final int BUNDLE_SPECIFIED_LANGUAGE_COUNTRY_VARIANT = 0;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private String bundle;
    private String bundleCountry;
    private String bundleEncoding;
    private String bundleLanguage;
    private String bundleVariant;
    private String destEncoding;
    private long destLastModified;
    private String endToken;
    private boolean forceOverwrite;
    private String srcEncoding;
    private long srcLastModified;
    private String startToken;
    private File toDir;
    private Vector filesets = new Vector();
    private Hashtable resourceMap = new Hashtable();
    private long[] bundleLastModified = new long[7];
    private boolean loaded = false;

    private void loadResourceMap(FileInputStream fileInputStream) throws BuildException {
        String str;
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream, this.bundleEncoding));
            while (true) {
                try {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        break;
                    } else if (readLine.trim().length() > 1 && '#' != readLine.charAt(0) && '!' != readLine.charAt(0)) {
                        int indexOf = readLine.indexOf(61);
                        int i = indexOf;
                        if (-1 == indexOf) {
                            i = readLine.indexOf(58);
                        }
                        int i2 = i;
                        if (-1 == i) {
                            int i3 = 0;
                            while (true) {
                                i2 = i;
                                if (i3 >= readLine.length()) {
                                    break;
                                } else if (Character.isSpaceChar(readLine.charAt(i3))) {
                                    i2 = i3;
                                    break;
                                } else {
                                    i3++;
                                }
                            }
                        }
                        if (-1 != i2) {
                            String trim = readLine.substring(0, i2).trim();
                            String trim2 = readLine.substring(i2 + 1).trim();
                            while (true) {
                                str = trim2;
                                if (!trim2.endsWith("\\")) {
                                    break;
                                }
                                String substring = trim2.substring(0, trim2.length() - 1);
                                String readLine2 = bufferedReader.readLine();
                                str = substring;
                                if (readLine2 == null) {
                                    break;
                                }
                                trim2 = new StringBuffer().append(substring).append(readLine2.trim()).toString();
                            }
                            if (trim.length() > 0 && this.resourceMap.get(trim) == null) {
                                this.resourceMap.put(trim, str);
                            }
                        }
                    }
                } catch (IOException e) {
                    e = e;
                    throw new BuildException(e.getMessage(), getLocation());
                }
            }
            if (bufferedReader == null) {
                return;
            }
            bufferedReader.close();
        } catch (IOException e2) {
            e = e2;
        }
    }

    private void loadResourceMaps() throws BuildException {
        Locale locale = new Locale(this.bundleLanguage, this.bundleCountry, this.bundleVariant);
        String stringBuffer = locale.getLanguage().length() > 0 ? new StringBuffer().append("_").append(locale.getLanguage()).toString() : "";
        String stringBuffer2 = locale.getCountry().length() > 0 ? new StringBuffer().append("_").append(locale.getCountry()).toString() : "";
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer).append(stringBuffer2).append(locale.getVariant().length() > 0 ? new StringBuffer().append("_").append(locale.getVariant()).toString() : "").toString(), 0, false);
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer).append(stringBuffer2).toString(), 1, false);
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer).toString(), 2, false);
        processBundle(this.bundle, 3, false);
        Locale locale2 = Locale.getDefault();
        String stringBuffer3 = locale2.getLanguage().length() > 0 ? new StringBuffer().append("_").append(locale2.getLanguage()).toString() : "";
        String stringBuffer4 = locale2.getCountry().length() > 0 ? new StringBuffer().append("_").append(locale2.getCountry()).toString() : "";
        String stringBuffer5 = locale2.getVariant().length() > 0 ? new StringBuffer().append("_").append(locale2.getVariant()).toString() : "";
        this.bundleEncoding = System.getProperty("file.encoding");
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer3).append(stringBuffer4).append(stringBuffer5).toString(), 4, false);
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer3).append(stringBuffer4).toString(), 5, false);
        processBundle(new StringBuffer().append(this.bundle).append(stringBuffer3).toString(), 6, true);
    }

    private void processBundle(String str, int i, boolean z) throws BuildException {
        IOException e;
        FileInputStream fileInputStream;
        File resolveFile = getProject().resolveFile(new StringBuffer().append(str).append(".properties").toString());
        try {
            fileInputStream = new FileInputStream(resolveFile);
        } catch (IOException e2) {
            e = e2;
        }
        try {
            this.loaded = true;
            this.bundleLastModified[i] = resolveFile.lastModified();
            log(new StringBuffer().append("Using ").append(resolveFile).toString(), 4);
            loadResourceMap(fileInputStream);
        } catch (IOException e3) {
            e = e3;
            log(new StringBuffer().append(resolveFile).append(" not found.").toString(), 4);
            if (!this.loaded && z) {
                throw new BuildException(e.getMessage(), getLocation());
            }
        }
    }

    private void translate() throws BuildException {
        int i = 0;
        int size = this.filesets.size();
        for (int i2 = 0; i2 < size; i2++) {
            DirectoryScanner directoryScanner = ((FileSet) this.filesets.elementAt(i2)).getDirectoryScanner(getProject());
            String[] includedFiles = directoryScanner.getIncludedFiles();
            for (int i3 = 0; i3 < includedFiles.length; i3++) {
                try {
                    File resolveFile = FILE_UTILS.resolveFile(this.toDir, includedFiles[i3]);
                    try {
                        File file = new File(resolveFile.getParent());
                        if (!file.exists()) {
                            file.mkdirs();
                        }
                    } catch (Exception e) {
                        log(new StringBuffer().append("Exception occurred while trying to check/create  parent directory.  ").append(e.getMessage()).toString(), 4);
                    }
                    this.destLastModified = resolveFile.lastModified();
                    File resolveFile2 = FILE_UTILS.resolveFile(directoryScanner.getBasedir(), includedFiles[i3]);
                    this.srcLastModified = resolveFile2.lastModified();
                    boolean z = this.forceOverwrite || this.destLastModified < this.srcLastModified;
                    boolean z2 = z;
                    if (!z) {
                        int i4 = 0;
                        while (true) {
                            z2 = z;
                            if (i4 >= 7) {
                                break;
                            }
                            z = this.destLastModified < this.bundleLastModified[i4];
                            if (z) {
                                z2 = z;
                                break;
                            }
                            i4++;
                        }
                    }
                    if (z2) {
                        log(new StringBuffer().append("Processing ").append(includedFiles[i3]).toString(), 4);
                        translateOneFile(resolveFile2, resolveFile);
                        i++;
                    } else {
                        log(new StringBuffer().append("Skipping ").append(includedFiles[i3]).append(" as destination file is up to date").toString(), 3);
                    }
                } catch (IOException e2) {
                    throw new BuildException(e2.getMessage(), getLocation());
                }
            }
        }
        log(new StringBuffer().append("Translation performed on ").append(i).append(" file(s).").toString(), 4);
    }

    private void translateOneFile(File file, File file2) throws IOException {
        BufferedReader bufferedReader;
        Throwable th;
        BufferedWriter bufferedWriter;
        String stringBuffer;
        int length;
        try {
            BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file2), this.destEncoding));
            try {
                bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file), this.srcEncoding));
                try {
                    LineTokenizer lineTokenizer = new LineTokenizer();
                    lineTokenizer.setIncludeDelims(true);
                    String token = lineTokenizer.getToken(bufferedReader);
                    while (token != null) {
                        int indexOf = token.indexOf(this.startToken);
                        while (indexOf >= 0 && this.startToken.length() + indexOf <= token.length()) {
                            int indexOf2 = token.indexOf(this.endToken, this.startToken.length() + indexOf);
                            if (indexOf2 < 0) {
                                length = indexOf + 1;
                            } else {
                                String substring = token.substring(this.startToken.length() + indexOf, indexOf2);
                                boolean z = true;
                                for (int i = 0; i < substring.length() && z; i++) {
                                    char charAt = substring.charAt(i);
                                    if (charAt == ':' || charAt == '=' || Character.isSpaceChar(charAt)) {
                                        z = false;
                                    }
                                }
                                if (!z) {
                                    length = indexOf + 1;
                                } else {
                                    if (this.resourceMap.containsKey(substring)) {
                                        stringBuffer = (String) this.resourceMap.get(substring);
                                    } else {
                                        log(new StringBuffer().append("Replacement string missing for: ").append(substring).toString(), 3);
                                        stringBuffer = new StringBuffer().append(this.startToken).append(substring).append(this.endToken).toString();
                                    }
                                    token = new StringBuffer().append(token.substring(0, indexOf)).append(stringBuffer).append(token.substring(this.endToken.length() + indexOf2)).toString();
                                    length = indexOf + stringBuffer.length();
                                }
                            }
                            indexOf = token.indexOf(this.startToken, length);
                        }
                        bufferedWriter2.write(token);
                        token = lineTokenizer.getToken(bufferedReader);
                    }
                    FileUtils.close(bufferedReader);
                    FileUtils.close(bufferedWriter2);
                } catch (Throwable th2) {
                    bufferedWriter = bufferedWriter2;
                    th = th2;
                    FileUtils.close(bufferedReader);
                    FileUtils.close(bufferedWriter);
                    throw th;
                }
            } catch (Throwable th3) {
                bufferedWriter = bufferedWriter2;
                bufferedReader = null;
                th = th3;
            }
        } catch (Throwable th4) {
            th = th4;
            bufferedWriter = null;
            bufferedReader = null;
        }
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.bundle == null) {
            throw new BuildException("The bundle attribute must be set.", getLocation());
        }
        if (this.startToken == null) {
            throw new BuildException("The starttoken attribute must be set.", getLocation());
        }
        if (this.endToken == null) {
            throw new BuildException("The endtoken attribute must be set.", getLocation());
        }
        if (this.bundleLanguage == null) {
            this.bundleLanguage = Locale.getDefault().getLanguage();
        }
        if (this.bundleCountry == null) {
            this.bundleCountry = Locale.getDefault().getCountry();
        }
        if (this.bundleVariant == null) {
            this.bundleVariant = new Locale(this.bundleLanguage, this.bundleCountry).getVariant();
        }
        if (this.toDir == null) {
            throw new BuildException("The todir attribute must be set.", getLocation());
        }
        if (!this.toDir.exists()) {
            this.toDir.mkdirs();
        } else if (this.toDir.isFile()) {
            throw new BuildException(new StringBuffer().append(this.toDir).append(" is not a directory").toString());
        }
        if (this.srcEncoding == null) {
            this.srcEncoding = System.getProperty("file.encoding");
        }
        if (this.destEncoding == null) {
            this.destEncoding = this.srcEncoding;
        }
        if (this.bundleEncoding == null) {
            this.bundleEncoding = this.srcEncoding;
        }
        loadResourceMaps();
        translate();
    }

    public void setBundle(String str) {
        this.bundle = str;
    }

    public void setBundleCountry(String str) {
        this.bundleCountry = str;
    }

    public void setBundleEncoding(String str) {
        this.bundleEncoding = str;
    }

    public void setBundleLanguage(String str) {
        this.bundleLanguage = str;
    }

    public void setBundleVariant(String str) {
        this.bundleVariant = str;
    }

    public void setDestEncoding(String str) {
        this.destEncoding = str;
    }

    public void setEndToken(String str) {
        this.endToken = str;
    }

    public void setForceOverwrite(boolean z) {
        this.forceOverwrite = z;
    }

    public void setSrcEncoding(String str) {
        this.srcEncoding = str;
    }

    public void setStartToken(String str) {
        this.startToken = str;
    }

    public void setToDir(File file) {
        this.toDir = file;
    }
}
