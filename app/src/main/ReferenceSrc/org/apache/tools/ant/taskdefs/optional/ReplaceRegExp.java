package org.apache.tools.ant.taskdefs.optional;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.Substitution;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.regexp.Regexp;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ReplaceRegExp.class */
public class ReplaceRegExp extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Union resources;
    private boolean preserveLastModified = false;
    private String encoding = null;
    private File file = null;
    private String flags = "";
    private boolean byline = false;
    private RegularExpression regex = null;
    private Substitution subs = null;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        if (!resourceCollection.isFilesystemOnly()) {
            throw new BuildException("only filesystem resources are supported");
        }
        if (this.resources == null) {
            this.resources = new Union();
        }
        this.resources.add(resourceCollection);
    }

    public void addFileset(FileSet fileSet) {
        addConfigured(fileSet);
    }

    public RegularExpression createRegexp() {
        if (this.regex != null) {
            throw new BuildException("Only one regular expression is allowed.");
        }
        this.regex = new RegularExpression();
        return this.regex;
    }

    public Substitution createSubstitution() {
        if (this.subs != null) {
            throw new BuildException("Only one substitution expression is allowed");
        }
        this.subs = new Substitution();
        return this.subs;
    }

    protected String doReplace(RegularExpression regularExpression, Substitution substitution, String str, int i) {
        String str2 = str;
        Regexp regexp = regularExpression.getRegexp(getProject());
        if (regexp.matches(str, i)) {
            log("Found match; substituting", 4);
            str2 = regexp.substitute(str, substitution.getExpression(getProject()), i);
        }
        return str2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:153:0x0418, code lost:
        if (r0 < 0) goto L154;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v119, types: [java.io.Writer] */
    /* JADX WARN: Type inference failed for: r0v12, types: [java.io.Writer] */
    /* JADX WARN: Type inference failed for: r0v310, types: [java.io.FileWriter] */
    /* JADX WARN: Type inference failed for: r0v36, types: [java.io.OutputStreamWriter] */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.io.Writer] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected void doReplace(File file, int i) throws IOException {
        BufferedWriter bufferedWriter;
        InputStreamReader inputStreamReader;
        InputStreamReader inputStreamReader2;
        InputStreamReader inputStreamReader3;
        String str;
        boolean z;
        File file2;
        int read;
        boolean z2;
        boolean z3;
        StringBuffer stringBuffer;
        boolean z4;
        StringBuffer stringBuffer2;
        File createTempFile = FILE_UTILS.createTempFile(MSVSSConstants.WRITABLE_REPLACE, ".txt", null, true, true);
        InputStreamReader inputStreamReader4 = null;
        InputStreamReader inputStreamReader5 = null;
        InputStreamReader inputStreamReader6 = null;
        try {
            try {
                if (this.encoding == null) {
                    inputStreamReader3 = new FileReader(file);
                    inputStreamReader4 = new FileWriter(createTempFile);
                } else {
                    inputStreamReader3 = new InputStreamReader(new FileInputStream(file), this.encoding);
                    inputStreamReader4 = new OutputStreamWriter(new FileOutputStream(createTempFile), this.encoding);
                }
                InputStreamReader inputStreamReader7 = inputStreamReader3;
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader3);
                InputStreamReader inputStreamReader8 = inputStreamReader3;
                inputStreamReader5 = inputStreamReader3;
                inputStreamReader6 = inputStreamReader4;
                BufferedWriter bufferedWriter2 = new BufferedWriter(inputStreamReader4);
                boolean z5 = false;
                InputStreamReader inputStreamReader9 = inputStreamReader3;
                InputStreamReader inputStreamReader10 = inputStreamReader4;
                try {
                    InputStreamReader inputStreamReader11 = inputStreamReader3;
                    InputStreamReader inputStreamReader12 = inputStreamReader3;
                    InputStreamReader inputStreamReader13 = inputStreamReader3;
                    StringBuffer append = new StringBuffer().append("Replacing pattern '").append(this.regex.getPattern(getProject())).append("' with '").append(this.subs.getExpression(getProject())).append("' in '").append(file.getPath()).append("'").append(this.byline ? " by line" : "");
                    InputStreamReader inputStreamReader14 = inputStreamReader3;
                    if (this.flags.length() > 0) {
                        InputStreamReader inputStreamReader15 = inputStreamReader3;
                        InputStreamReader inputStreamReader16 = inputStreamReader3;
                        InputStreamReader inputStreamReader17 = inputStreamReader3;
                        str = new StringBuffer().append(" with flags: '").append(this.flags).append("'").toString();
                    } else {
                        str = "";
                    }
                    InputStreamReader inputStreamReader18 = inputStreamReader3;
                    log(append.append(str).append(".").toString(), 3);
                    InputStreamReader inputStreamReader19 = inputStreamReader3;
                    if (this.byline) {
                        InputStreamReader inputStreamReader20 = inputStreamReader3;
                        InputStreamReader inputStreamReader21 = inputStreamReader3;
                        StringBuffer stringBuffer3 = new StringBuffer();
                        boolean z6 = false;
                        do {
                            read = bufferedReader.read();
                            if (read == 13) {
                                if (z6) {
                                    String stringBuffer4 = stringBuffer3.toString();
                                    InputStreamReader inputStreamReader22 = inputStreamReader3;
                                    String doReplace = doReplace(this.regex, this.subs, stringBuffer4, i);
                                    InputStreamReader inputStreamReader23 = inputStreamReader3;
                                    if (!doReplace.equals(stringBuffer4)) {
                                        z5 = true;
                                    }
                                    bufferedWriter2.write(doReplace);
                                    InputStreamReader inputStreamReader24 = inputStreamReader3;
                                    bufferedWriter2.write(13);
                                    InputStreamReader inputStreamReader25 = inputStreamReader3;
                                    InputStreamReader inputStreamReader26 = inputStreamReader3;
                                    stringBuffer2 = new StringBuffer();
                                    z4 = z5;
                                } else {
                                    z6 = true;
                                    z4 = z5;
                                    stringBuffer2 = stringBuffer3;
                                }
                            } else if (read == 10) {
                                String stringBuffer5 = stringBuffer3.toString();
                                InputStreamReader inputStreamReader27 = inputStreamReader3;
                                String doReplace2 = doReplace(this.regex, this.subs, stringBuffer5, i);
                                InputStreamReader inputStreamReader28 = inputStreamReader3;
                                if (!doReplace2.equals(stringBuffer5)) {
                                    z5 = true;
                                }
                                bufferedWriter2.write(doReplace2);
                                boolean z7 = z6;
                                if (z6) {
                                    bufferedWriter2.write(13);
                                    z7 = false;
                                }
                                bufferedWriter2.write(10);
                                InputStreamReader inputStreamReader29 = inputStreamReader3;
                                z4 = z5;
                                z6 = z7;
                                stringBuffer2 = new StringBuffer();
                            } else {
                                if (!z6) {
                                    z2 = z5;
                                    z3 = z6;
                                    stringBuffer = stringBuffer3;
                                }
                                String stringBuffer6 = stringBuffer3.toString();
                                InputStreamReader inputStreamReader30 = inputStreamReader3;
                                String doReplace3 = doReplace(this.regex, this.subs, stringBuffer6, i);
                                InputStreamReader inputStreamReader31 = inputStreamReader3;
                                if (!doReplace3.equals(stringBuffer6)) {
                                    z5 = true;
                                }
                                bufferedWriter2.write(doReplace3);
                                z3 = z6;
                                if (z6) {
                                    bufferedWriter2.write(13);
                                    z3 = false;
                                }
                                InputStreamReader inputStreamReader32 = inputStreamReader3;
                                stringBuffer = new StringBuffer();
                                z2 = z5;
                                z4 = z2;
                                z6 = z3;
                                stringBuffer2 = stringBuffer;
                                if (read >= 0) {
                                    stringBuffer.append((char) read);
                                    z4 = z2;
                                    z6 = z3;
                                    stringBuffer2 = stringBuffer;
                                }
                            }
                            z5 = z4;
                            stringBuffer3 = stringBuffer2;
                        } while (read >= 0);
                        z = z4;
                    } else {
                        String safeReadFully = FileUtils.safeReadFully(bufferedReader);
                        InputStreamReader inputStreamReader33 = inputStreamReader3;
                        String doReplace4 = doReplace(this.regex, this.subs, safeReadFully, i);
                        InputStreamReader inputStreamReader34 = inputStreamReader3;
                        z = false;
                        if (!doReplace4.equals(safeReadFully)) {
                            z = true;
                        }
                        bufferedWriter2.write(doReplace4);
                    }
                    bufferedWriter2.flush();
                    InputStreamReader inputStreamReader35 = inputStreamReader3;
                    inputStreamReader3.close();
                    inputStreamReader4.close();
                    if (z) {
                        log("File has changed; saving the updated file", 3);
                        inputStreamReader9 = null;
                        inputStreamReader10 = null;
                        try {
                            long lastModified = file.lastModified();
                            FILE_UTILS.rename(createTempFile, file);
                            if (this.preserveLastModified) {
                                inputStreamReader9 = null;
                                inputStreamReader10 = null;
                                FILE_UTILS.setFileLastModified(file, lastModified);
                            }
                            file2 = null;
                        } catch (IOException e) {
                            throw new BuildException(new StringBuffer().append("Couldn't rename temporary file ").append(createTempFile).toString(), e, getLocation());
                        }
                    } else {
                        log("No change made", 4);
                        file2 = createTempFile;
                    }
                    FileUtils.close((Reader) null);
                    FileUtils.close(bufferedWriter2);
                    FileUtils.close((Writer) null);
                    if (file2 == null) {
                        return;
                    }
                    file2.delete();
                } catch (Throwable th) {
                    th = th;
                    bufferedWriter = bufferedWriter2;
                    inputStreamReader = inputStreamReader10;
                    inputStreamReader2 = inputStreamReader9;
                    FileUtils.close(inputStreamReader2);
                    FileUtils.close(bufferedWriter);
                    FileUtils.close((Writer) inputStreamReader);
                    if (createTempFile != null) {
                        createTempFile.delete();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                bufferedWriter = null;
                inputStreamReader2 = inputStreamReader4;
                inputStreamReader = null;
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedWriter = null;
            inputStreamReader = inputStreamReader6;
            inputStreamReader2 = inputStreamReader5;
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        if (this.regex == null) {
            throw new BuildException("No expression to match.");
        }
        if (this.subs == null) {
            throw new BuildException("Nothing to replace expression with.");
        }
        if (this.file != null && this.resources != null) {
            throw new BuildException("You cannot supply the 'file' attribute and resource collections at the same time.");
        }
        int asOptions = RegexpUtil.asOptions(this.flags);
        if (this.file != null && this.file.exists()) {
            try {
                doReplace(this.file, asOptions);
            } catch (IOException e) {
                log(new StringBuffer().append("An error occurred processing file: '").append(this.file.getAbsolutePath()).append("': ").append(e.toString()).toString(), 0);
            }
        } else if (this.file != null) {
            log(new StringBuffer().append("The following file is missing: '").append(this.file.getAbsolutePath()).append("'").toString(), 0);
        }
        if (this.resources == null) {
            return;
        }
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
            if (file.exists()) {
                try {
                    doReplace(file, asOptions);
                } catch (Exception e2) {
                    log(new StringBuffer().append("An error occurred processing file: '").append(file.getAbsolutePath()).append("': ").append(e2.toString()).toString(), 0);
                }
            } else {
                log(new StringBuffer().append("The following file is missing: '").append(file.getAbsolutePath()).append("'").toString(), 0);
            }
        }
    }

    public void setByLine(String str) {
        Boolean valueOf = Boolean.valueOf(str);
        Boolean bool = valueOf;
        if (valueOf == null) {
            bool = Boolean.FALSE;
        }
        this.byline = bool.booleanValue();
    }

    public void setByLine(boolean z) {
        this.byline = z;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFlags(String str) {
        this.flags = str;
    }

    public void setMatch(String str) {
        if (this.regex != null) {
            throw new BuildException("Only one regular expression is allowed");
        }
        this.regex = new RegularExpression();
        this.regex.setPattern(str);
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    public void setReplace(String str) {
        if (this.subs != null) {
            throw new BuildException("Only one substitution expression is allowed");
        }
        this.subs = new Substitution();
        this.subs.setExpression(str);
    }
}
