package org.apache.tools.ant.taskdefs.cvslib;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.AbstractCvsTask;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.DOMElementWriter;
import org.apache.tools.ant.util.DOMUtils;
import org.apache.tools.ant.util.FileUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/CvsTagDiff.class */
public class CvsTagDiff extends AbstractCvsTask {
    static final String FILE_HAS_CHANGED = " changed from revision ";
    static final String FILE_IS_NEW = " is new;";
    static final String FILE_WAS_REMOVED = " is removed";
    static final String REVISION = "revision ";
    static final String TO_STRING = " to ";
    private File mydestfile;
    private String myendDate;
    private String myendTag;
    private String mypackage;
    private String mystartDate;
    private String mystartTag;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final DOMElementWriter DOM_WRITER = new DOMElementWriter();
    static final String FILE_STRING = "File ";
    static final int FILE_STRING_LENGTH = FILE_STRING.length();
    private boolean ignoreRemoved = false;
    private List packageNames = new ArrayList();
    private String[] packageNamePrefixes = null;
    private int[] packageNamePrefixLengths = null;

    private boolean doFileHasChanged(Vector vector, String str) {
        boolean z = false;
        int indexOf = str.indexOf(FILE_HAS_CHANGED);
        if (indexOf != -1) {
            String substring = str.substring(0, indexOf);
            int indexOf2 = str.indexOf(TO_STRING, indexOf);
            CvsTagEntry cvsTagEntry = new CvsTagEntry(substring, str.substring(TO_STRING.length() + indexOf2), str.substring(FILE_HAS_CHANGED.length() + indexOf, indexOf2));
            vector.addElement(cvsTagEntry);
            log(cvsTagEntry.toString(), 3);
            z = true;
        }
        return z;
    }

    private boolean doFileIsNew(Vector vector, String str) {
        boolean z = false;
        int indexOf = str.indexOf(FILE_IS_NEW);
        if (indexOf != -1) {
            String substring = str.substring(0, indexOf);
            String str2 = null;
            int indexOf2 = str.indexOf(REVISION, indexOf);
            if (indexOf2 != -1) {
                str2 = str.substring(REVISION.length() + indexOf2);
            }
            CvsTagEntry cvsTagEntry = new CvsTagEntry(substring, str2);
            vector.addElement(cvsTagEntry);
            log(cvsTagEntry.toString(), 3);
            z = true;
        }
        return z;
    }

    private boolean doFileWasRemoved(Vector vector, String str) {
        int indexOf;
        boolean z = false;
        if (!this.ignoreRemoved && (indexOf = str.indexOf(FILE_WAS_REMOVED)) != -1) {
            String substring = str.substring(0, indexOf);
            String str2 = null;
            int indexOf2 = str.indexOf(REVISION, indexOf);
            if (indexOf2 != -1) {
                str2 = str.substring(REVISION.length() + indexOf2);
            }
            CvsTagEntry cvsTagEntry = new CvsTagEntry(substring, null, str2);
            vector.addElement(cvsTagEntry);
            log(cvsTagEntry.toString(), 3);
            z = true;
        }
        return z;
    }

    private void handlePackageNames() {
        if (this.mypackage != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(this.mypackage);
            while (stringTokenizer.hasMoreTokens()) {
                String nextToken = stringTokenizer.nextToken();
                this.packageNames.add(nextToken);
                addCommandArgument(nextToken);
            }
        }
        for (AbstractCvsTask.Module module : getModules()) {
            this.packageNames.add(module.getName());
        }
        this.packageNamePrefixes = new String[this.packageNames.size()];
        this.packageNamePrefixLengths = new int[this.packageNames.size()];
        for (int i = 0; i < this.packageNamePrefixes.length; i++) {
            this.packageNamePrefixes[i] = new StringBuffer().append(FILE_STRING).append(this.packageNames.get(i)).append("/").toString();
            this.packageNamePrefixLengths[i] = this.packageNamePrefixes[i].length();
        }
    }

    private CvsTagEntry[] parseRDiff(File file) throws BuildException {
        Throwable th;
        IOException e;
        BufferedReader bufferedReader;
        BufferedReader bufferedReader2;
        BufferedReader bufferedReader3 = null;
        try {
            try {
                bufferedReader2 = new BufferedReader(new FileReader(file));
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
            bufferedReader = null;
        }
        try {
            Vector vector = new Vector();
            for (String readLine = bufferedReader2.readLine(); readLine != null; readLine = bufferedReader2.readLine()) {
                String removePackageName = removePackageName(readLine, this.packageNamePrefixes, this.packageNamePrefixLengths);
                if (removePackageName == null || doFileIsNew(vector, removePackageName) || doFileHasChanged(vector, removePackageName) || doFileWasRemoved(vector, removePackageName)) {
                }
            }
            CvsTagEntry[] cvsTagEntryArr = new CvsTagEntry[vector.size()];
            vector.copyInto(cvsTagEntryArr);
            if (bufferedReader2 != null) {
                try {
                    bufferedReader2.close();
                } catch (IOException e3) {
                    log(e3.toString(), 0);
                }
            }
            return cvsTagEntryArr;
        } catch (IOException e4) {
            bufferedReader = bufferedReader2;
            e = e4;
            BufferedReader bufferedReader4 = bufferedReader;
            BufferedReader bufferedReader5 = bufferedReader;
            throw new BuildException("Error in parsing", e);
        } catch (Throwable th3) {
            th = th3;
            bufferedReader3 = bufferedReader2;
            if (bufferedReader3 != null) {
                try {
                    bufferedReader3.close();
                } catch (IOException e5) {
                    log(e5.toString(), 0);
                }
            }
            throw th;
        }
    }

    private static String removePackageName(String str, String[] strArr, int[] iArr) {
        boolean z;
        String str2;
        String str3;
        if (str.length() < FILE_STRING_LENGTH) {
            str3 = null;
        } else {
            int i = 0;
            while (true) {
                z = false;
                str2 = str;
                if (i >= strArr.length) {
                    break;
                } else if (str.startsWith(strArr[i])) {
                    z = true;
                    str2 = str.substring(iArr[i]);
                    break;
                } else {
                    i++;
                }
            }
            str3 = str2;
            if (!z) {
                str3 = str2.substring(FILE_STRING_LENGTH);
            }
        }
        return str3;
    }

    private void validate() throws BuildException {
        if (this.mypackage == null && getModules().size() == 0) {
            throw new BuildException("Package/module must be set.");
        }
        if (this.mydestfile == null) {
            throw new BuildException("Destfile must be set.");
        }
        if (this.mystartTag == null && this.mystartDate == null) {
            throw new BuildException("Start tag or start date must be set.");
        }
        if (this.mystartTag != null && this.mystartDate != null) {
            throw new BuildException("Only one of start tag and start date must be set.");
        }
        if (this.myendTag == null && this.myendDate == null) {
            throw new BuildException("End tag or end date must be set.");
        }
        if (this.myendTag != null && this.myendDate != null) {
            throw new BuildException("Only one of end tag and end date must be set.");
        }
    }

    private void writeTagDiff(CvsTagEntry[] cvsTagEntryArr) throws BuildException {
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        Throwable th;
        FileOutputStream fileOutputStream3;
        FileOutputStream fileOutputStream4 = null;
        try {
            try {
                fileOutputStream3 = new FileOutputStream(this.mydestfile);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (UnsupportedEncodingException e) {
            e = e;
            fileOutputStream = null;
        } catch (IOException e2) {
            e = e2;
            fileOutputStream2 = null;
        }
        try {
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(fileOutputStream3, "UTF-8"));
            printWriter.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            Document newDocument = DOMUtils.newDocument();
            Element createElement = newDocument.createElement("tagdiff");
            if (this.mystartTag != null) {
                createElement.setAttribute("startTag", this.mystartTag);
            } else {
                createElement.setAttribute("startDate", this.mystartDate);
            }
            if (this.myendTag != null) {
                createElement.setAttribute("endTag", this.myendTag);
            } else {
                createElement.setAttribute("endDate", this.myendDate);
            }
            createElement.setAttribute("cvsroot", getCvsRoot());
            createElement.setAttribute("package", CollectionUtils.flattenToString(this.packageNames));
            DOM_WRITER.openElement(createElement, printWriter, 0, "\t");
            printWriter.println();
            for (CvsTagEntry cvsTagEntry : cvsTagEntryArr) {
                writeTagEntry(newDocument, printWriter, cvsTagEntry);
            }
            DOM_WRITER.closeElement(createElement, printWriter, 0, "\t", true);
            printWriter.flush();
            if (printWriter.checkError()) {
                throw new IOException("Encountered an error writing tagdiff");
            }
            printWriter.close();
            if (fileOutputStream3 != null) {
                try {
                    fileOutputStream3.close();
                } catch (IOException e3) {
                    log(e3.toString(), 0);
                }
            }
        } catch (UnsupportedEncodingException e4) {
            fileOutputStream = fileOutputStream3;
            e = e4;
            log(e.toString(), 0);
            if (fileOutputStream == null) {
                return;
            }
            try {
                fileOutputStream.close();
            } catch (IOException e5) {
                log(e5.toString(), 0);
            }
        } catch (IOException e6) {
            fileOutputStream2 = fileOutputStream3;
            e = e6;
            FileOutputStream fileOutputStream5 = fileOutputStream2;
            FileOutputStream fileOutputStream6 = fileOutputStream2;
            throw new BuildException(e.toString(), e);
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream4 = fileOutputStream3;
            if (fileOutputStream4 != null) {
                try {
                    fileOutputStream4.close();
                } catch (IOException e7) {
                    log(e7.toString(), 0);
                }
            }
            throw th;
        }
    }

    private void writeTagEntry(Document document, PrintWriter printWriter, CvsTagEntry cvsTagEntry) throws IOException {
        Element createElement = document.createElement("entry");
        Element createChildElement = DOMUtils.createChildElement(createElement, "file");
        DOMUtils.appendCDATAElement(createChildElement, "name", cvsTagEntry.getFile());
        if (cvsTagEntry.getRevision() != null) {
            DOMUtils.appendTextElement(createChildElement, "revision", cvsTagEntry.getRevision());
        }
        if (cvsTagEntry.getPreviousRevision() != null) {
            DOMUtils.appendTextElement(createChildElement, "prevrevision", cvsTagEntry.getPreviousRevision());
        }
        DOM_WRITER.write(createElement, printWriter, 1, "\t");
    }

    @Override // org.apache.tools.ant.taskdefs.AbstractCvsTask, org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        addCommandArgument("rdiff");
        addCommandArgument("-s");
        if (this.mystartTag != null) {
            addCommandArgument("-r");
            addCommandArgument(this.mystartTag);
        } else {
            addCommandArgument(MSVSSConstants.FLAG_CODEDIFF);
            addCommandArgument(this.mystartDate);
        }
        if (this.myendTag != null) {
            addCommandArgument("-r");
            addCommandArgument(this.myendTag);
        } else {
            addCommandArgument(MSVSSConstants.FLAG_CODEDIFF);
            addCommandArgument(this.myendDate);
        }
        setCommand("");
        File file = null;
        try {
            handlePackageNames();
            File createTempFile = FILE_UTILS.createTempFile("cvstagdiff", ".log", null, true, true);
            setOutput(createTempFile);
            super.execute();
            file = createTempFile;
            writeTagDiff(parseRDiff(createTempFile));
            this.packageNamePrefixes = null;
            this.packageNamePrefixLengths = null;
            this.packageNames.clear();
            if (createTempFile == null) {
                return;
            }
            createTempFile.delete();
        } catch (Throwable th) {
            this.packageNamePrefixes = null;
            this.packageNamePrefixLengths = null;
            this.packageNames.clear();
            if (file != null) {
                file.delete();
            }
            throw th;
        }
    }

    public void setDestFile(File file) {
        this.mydestfile = file;
    }

    public void setEndDate(String str) {
        this.myendDate = str;
    }

    public void setEndTag(String str) {
        this.myendTag = str;
    }

    public void setIgnoreRemoved(boolean z) {
        this.ignoreRemoved = z;
    }

    @Override // org.apache.tools.ant.taskdefs.AbstractCvsTask
    public void setPackage(String str) {
        this.mypackage = str;
    }

    public void setStartDate(String str) {
        this.mystartDate = str;
    }

    public void setStartTag(String str) {
        this.mystartTag = str;
    }
}
