package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Enumeration;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Manifest;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ManifestTask.class */
public class ManifestTask extends Task {
    public static final String VALID_ATTRIBUTE_CHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_";
    private String encoding;
    private File manifestFile;
    private Manifest nestedManifest = new Manifest();
    private boolean mergeClassPaths = false;
    private boolean flattenClassPaths = false;
    private Mode mode = new Mode();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ManifestTask$Mode.class */
    public static class Mode extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"update", MSVSSConstants.WRITABLE_REPLACE};
        }
    }

    public ManifestTask() {
        this.mode.setValue(MSVSSConstants.WRITABLE_REPLACE);
    }

    private void checkAttribute(Manifest.Attribute attribute) throws BuildException {
        String name = attribute.getName();
        char charAt = name.charAt(0);
        if (charAt == '-' || charAt == '_') {
            throw new BuildException(new StringBuffer().append("Manifest attribute names must not start with '").append(charAt).append("'.").toString());
        }
        for (int i = 0; i < name.length(); i++) {
            char charAt2 = name.charAt(i);
            if (VALID_ATTRIBUTE_CHARS.indexOf(charAt2) < 0) {
                throw new BuildException(new StringBuffer().append("Manifest attribute names must not contain '").append(charAt2).append("'").toString());
            }
        }
    }

    public void addConfiguredAttribute(Manifest.Attribute attribute) throws ManifestException {
        checkAttribute(attribute);
        this.nestedManifest.addConfiguredAttribute(attribute);
    }

    public void addConfiguredSection(Manifest.Section section) throws ManifestException {
        Enumeration attributeKeys = section.getAttributeKeys();
        while (attributeKeys.hasMoreElements()) {
            checkAttribute(section.getAttribute((String) attributeKeys.nextElement()));
        }
        this.nestedManifest.addConfiguredSection(section);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00cd A[LOOP:0: B:27:0x00c3->B:29:0x00cd, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x01bf A[Catch: ManifestException -> 0x01ff, TryCatch #6 {ManifestException -> 0x01ff, blocks: (B:52:0x01b0, B:54:0x01bf, B:58:0x01ce, B:60:0x01da, B:68:0x01fe), top: B:120:0x01b0 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01ce A[Catch: ManifestException -> 0x01ff, TRY_ENTER, TryCatch #6 {ManifestException -> 0x01ff, blocks: (B:52:0x01b0, B:54:0x01bf, B:58:0x01ce, B:60:0x01da, B:68:0x01fe), top: B:120:0x01b0 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x01f7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0211  */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() throws BuildException {
        Enumeration warnings;
        PrintWriter printWriter;
        PrintWriter printWriter2;
        Throwable th;
        InputStreamReader inputStreamReader;
        Throwable th2;
        IOException e;
        ManifestException e2;
        FileInputStream fileInputStream;
        if (this.manifestFile == null) {
            throw new BuildException("the file attribute is required");
        }
        Manifest defaultManifest = Manifest.getDefaultManifest();
        Manifest manifest = null;
        InputStreamReader inputStreamReader2 = null;
        if (this.manifestFile.exists()) {
            InputStreamReader inputStreamReader3 = null;
            InputStreamReader inputStreamReader4 = null;
            inputStreamReader2 = null;
            try {
                try {
                    fileInputStream = new FileInputStream(this.manifestFile);
                    inputStreamReader = null;
                    inputStreamReader3 = null;
                    inputStreamReader4 = null;
                } catch (Throwable th3) {
                    th2 = th3;
                    inputStreamReader = inputStreamReader2;
                }
            } catch (IOException e3) {
                e = e3;
            } catch (ManifestException e4) {
                e2 = e4;
            }
            try {
                InputStreamReader inputStreamReader5 = this.encoding == null ? new InputStreamReader(fileInputStream, "UTF-8") : new InputStreamReader(fileInputStream, this.encoding);
                InputStreamReader inputStreamReader6 = inputStreamReader5;
                inputStreamReader = inputStreamReader5;
                inputStreamReader3 = inputStreamReader5;
                inputStreamReader4 = inputStreamReader5;
                Manifest manifest2 = new Manifest(inputStreamReader5);
                FileUtils.close(inputStreamReader5);
                manifest = manifest2;
                inputStreamReader2 = null;
            } catch (IOException e5) {
                e = e5;
                InputStreamReader inputStreamReader7 = inputStreamReader3;
                InputStreamReader inputStreamReader8 = inputStreamReader3;
                BuildException buildException = new BuildException(new StringBuffer().append("Failed to read ").append(this.manifestFile).toString(), e, getLocation());
                FileUtils.close(inputStreamReader3);
                manifest = null;
                inputStreamReader2 = buildException;
                warnings = this.nestedManifest.getWarnings();
                while (warnings.hasMoreElements()) {
                }
                if (this.mode.getValue().equals("update")) {
                    if (manifest == null) {
                    }
                }
                defaultManifest.merge(this.nestedManifest, false, this.mergeClassPaths);
                if (defaultManifest.equals(manifest)) {
                }
            } catch (ManifestException e6) {
                e2 = e6;
                InputStreamReader inputStreamReader9 = inputStreamReader4;
                InputStreamReader inputStreamReader10 = inputStreamReader4;
                BuildException buildException2 = new BuildException(new StringBuffer().append("Existing manifest ").append(this.manifestFile).append(" is invalid").toString(), e2, getLocation());
                FileUtils.close(inputStreamReader4);
                manifest = null;
                inputStreamReader2 = buildException2;
                warnings = this.nestedManifest.getWarnings();
                while (warnings.hasMoreElements()) {
                }
                if (this.mode.getValue().equals("update")) {
                }
                defaultManifest.merge(this.nestedManifest, false, this.mergeClassPaths);
                if (defaultManifest.equals(manifest)) {
                }
            } catch (Throwable th4) {
                th2 = th4;
                FileUtils.close(inputStreamReader);
                throw th2;
            }
        }
        warnings = this.nestedManifest.getWarnings();
        while (warnings.hasMoreElements()) {
            log(new StringBuffer().append("Manifest warning: ").append((String) warnings.nextElement()).toString(), 1);
        }
        try {
            if (this.mode.getValue().equals("update") && this.manifestFile.exists()) {
                if (manifest == null) {
                    defaultManifest.merge(manifest, false, this.mergeClassPaths);
                } else if (inputStreamReader2 != null) {
                    throw inputStreamReader2;
                }
            }
            defaultManifest.merge(this.nestedManifest, false, this.mergeClassPaths);
            if (defaultManifest.equals(manifest)) {
                log("Manifest has not changed, do not recreate", 3);
                return;
            }
            PrintWriter printWriter3 = null;
            try {
                try {
                    printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(this.manifestFile), "UTF-8"));
                } catch (IOException e7) {
                    e = e7;
                    printWriter = null;
                }
            } catch (Throwable th5) {
                th = th5;
                printWriter2 = printWriter3;
            }
            try {
                defaultManifest.write(printWriter, this.flattenClassPaths);
                if (printWriter.checkError()) {
                    throw new IOException("Encountered an error writing manifest");
                }
                FileUtils.close(printWriter);
            } catch (IOException e8) {
                e = e8;
                PrintWriter printWriter4 = printWriter;
                PrintWriter printWriter5 = printWriter;
                PrintWriter printWriter6 = printWriter;
                printWriter3 = printWriter;
                throw new BuildException(new StringBuffer().append("Failed to write ").append(this.manifestFile).toString(), e, getLocation());
            } catch (Throwable th6) {
                printWriter2 = printWriter;
                th = th6;
                FileUtils.close(printWriter2);
                throw th;
            }
        } catch (ManifestException e9) {
            throw new BuildException("Manifest is invalid", e9, getLocation());
        }
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setFile(File file) {
        this.manifestFile = file;
    }

    public void setFlattenAttributes(boolean z) {
        this.flattenClassPaths = z;
    }

    public void setMergeClassPathAttributes(boolean z) {
        this.mergeClassPaths = z;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }
}
