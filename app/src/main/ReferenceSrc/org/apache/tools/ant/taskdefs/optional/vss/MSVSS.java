package org.apache.tools.ant.taskdefs.optional.vss;

import android.support.v4.widget.ExploreByTouchHelper;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.GregorianCalendar;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSS.class */
public abstract class MSVSS extends Task implements MSVSSConstants {
    private String ssDir = null;
    private String vssLogin = null;
    private String vssPath = null;
    private String serverPath = null;
    private String version = null;
    private String date = null;
    private String label = null;
    private String autoResponse = null;
    private String localPath = null;
    private String comment = null;
    private String fromLabel = null;
    private String toLabel = null;
    private String outputFileName = null;
    private String user = null;
    private String fromDate = null;
    private String toDate = null;
    private String style = null;
    private boolean quiet = false;
    private boolean recursive = false;
    private boolean writable = false;
    private boolean failOnError = true;
    private boolean getLocalCopy = true;
    private int numDays = ExploreByTouchHelper.INVALID_ID;
    private DateFormat dateFormat = DateFormat.getDateInstance(3);
    private CurrentModUpdated timestamp = null;
    private WritableFiles writableFiles = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated.class */
    public static class CurrentModUpdated extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{MSVSSConstants.TIME_CURRENT, MSVSSConstants.TIME_MODIFIED, MSVSSConstants.TIME_UPDATED};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles.class */
    public static class WritableFiles extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{MSVSSConstants.WRITABLE_REPLACE, MSVSSConstants.WRITABLE_SKIP, "fail"};
        }
    }

    private String calcDate(String str, int i) throws ParseException {
        GregorianCalendar gregorianCalendar = new GregorianCalendar();
        gregorianCalendar.setTime(this.dateFormat.parse(str));
        gregorianCalendar.add(5, i);
        return this.dateFormat.format(gregorianCalendar.getTime());
    }

    private String formatCommandLine(Commandline commandline) {
        StringBuffer stringBuffer = new StringBuffer(commandline.toString());
        int indexOf = stringBuffer.substring(0).indexOf("-Y");
        if (indexOf > 0) {
            int indexOf2 = stringBuffer.substring(0).indexOf(",", indexOf);
            int indexOf3 = stringBuffer.substring(0).indexOf(" ", indexOf2);
            while (true) {
                indexOf2++;
                if (indexOf2 >= indexOf3) {
                    break;
                }
                stringBuffer.setCharAt(indexOf2, '*');
            }
        }
        return stringBuffer.toString();
    }

    private boolean getFailOnError() {
        return getWritableFiles().equals(MSVSSConstants.WRITABLE_SKIP) ? false : this.failOnError;
    }

    private String getShortLabel() {
        String str;
        if (this.label == null || this.label.length() <= 31) {
            str = this.label;
        } else {
            str = this.label.substring(0, 30);
            log(new StringBuffer().append("Label is longer than 31 characters, truncated to: ").append(str).toString(), 1);
        }
        return str;
    }

    private int run(Commandline commandline) {
        try {
            Execute execute = new Execute(new LogStreamHandler((Task) this, 2, 1));
            if (this.serverPath != null) {
                String[] environment = execute.getEnvironment();
                String[] strArr = environment;
                if (environment == null) {
                    strArr = new String[0];
                }
                String[] strArr2 = new String[strArr.length + 1];
                System.arraycopy(strArr, 0, strArr2, 0, strArr.length);
                strArr2[strArr.length] = new StringBuffer().append("SSDIR=").append(this.serverPath).toString();
                execute.setEnvironment(strArr2);
            }
            execute.setAntRun(getProject());
            execute.setWorkingDirectory(getProject().getBaseDir());
            execute.setCommandline(commandline.getCommandline());
            execute.setVMLauncher(false);
            return execute.execute();
        } catch (IOException e) {
            throw new BuildException(e, getLocation());
        }
    }

    abstract Commandline buildCmdLine();

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Commandline buildCmdLine = buildCmdLine();
        int run = run(buildCmdLine);
        if (!Execute.isFailure(run) || !getFailOnError()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Failed executing: ").append(formatCommandLine(buildCmdLine)).append(" With a return code of ").append(run).toString(), getLocation());
    }

    protected String getAutoresponse() {
        return this.autoResponse == null ? MSVSSConstants.FLAG_AUTORESPONSE_DEF : this.autoResponse.equalsIgnoreCase("Y") ? MSVSSConstants.FLAG_AUTORESPONSE_YES : this.autoResponse.equalsIgnoreCase("N") ? MSVSSConstants.FLAG_AUTORESPONSE_NO : MSVSSConstants.FLAG_AUTORESPONSE_DEF;
    }

    protected String getComment() {
        return this.comment != null ? new StringBuffer().append(MSVSSConstants.FLAG_COMMENT).append(this.comment).toString() : "-C-";
    }

    public String getFileTimeStamp() {
        return this.timestamp == null ? "" : this.timestamp.getValue().equals(MSVSSConstants.TIME_MODIFIED) ? MSVSSConstants.FLAG_FILETIME_MODIFIED : this.timestamp.getValue().equals(MSVSSConstants.TIME_UPDATED) ? MSVSSConstants.FLAG_FILETIME_UPDATED : MSVSSConstants.FLAG_FILETIME_DEF;
    }

    protected String getGetLocalCopy() {
        return !this.getLocalCopy ? MSVSSConstants.FLAG_NO_GET : "";
    }

    protected String getLabel() {
        String str = "";
        if (this.label != null) {
            str = "";
            if (this.label.length() > 0) {
                str = new StringBuffer().append(MSVSSConstants.FLAG_LABEL).append(getShortLabel()).toString();
            }
        }
        return str;
    }

    protected String getLocalpath() {
        String str = "";
        if (this.localPath != null) {
            File resolveFile = getProject().resolveFile(this.localPath);
            if (!resolveFile.exists()) {
                if (!resolveFile.mkdirs()) {
                    throw new BuildException(new StringBuffer().append("Directory ").append(this.localPath).append(" creation was not ").append("successful for an unknown reason").toString(), getLocation());
                }
                getProject().log(new StringBuffer().append("Created dir: ").append(resolveFile.getAbsolutePath()).toString());
            }
            str = new StringBuffer().append(MSVSSConstants.FLAG_OVERRIDE_WORKING_DIR).append(this.localPath).toString();
        }
        return str;
    }

    protected String getLogin() {
        return this.vssLogin != null ? new StringBuffer().append("-Y").append(this.vssLogin).toString() : "";
    }

    protected String getOutput() {
        return this.outputFileName != null ? new StringBuffer().append(MSVSSConstants.FLAG_OUTPUT).append(this.outputFileName).toString() : "";
    }

    protected String getQuiet() {
        return this.quiet ? MSVSSConstants.FLAG_QUIET : "";
    }

    protected String getRecursive() {
        return this.recursive ? MSVSSConstants.FLAG_RECURSION : "";
    }

    protected String getSSCommand() {
        return this.ssDir == null ? MSVSSConstants.SS_EXE : this.ssDir.endsWith(File.separator) ? new StringBuffer().append(this.ssDir).append(MSVSSConstants.SS_EXE).toString() : new StringBuffer().append(this.ssDir).append(File.separator).append(MSVSSConstants.SS_EXE).toString();
    }

    protected String getStyle() {
        return this.style != null ? this.style : "";
    }

    protected String getUser() {
        return this.user != null ? new StringBuffer().append(MSVSSConstants.FLAG_USER).append(this.user).toString() : "";
    }

    protected String getVersion() {
        return this.version != null ? new StringBuffer().append(MSVSSConstants.FLAG_VERSION).append(this.version).toString() : "";
    }

    protected String getVersionDate() throws BuildException {
        String stringBuffer;
        if (this.fromDate == null && this.toDate == null && this.numDays == Integer.MIN_VALUE) {
            stringBuffer = "";
        } else if (this.fromDate != null && this.toDate != null) {
            stringBuffer = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_DATE).append(this.toDate).append(MSVSSConstants.VALUE_FROMDATE).append(this.fromDate).toString();
        } else if (this.toDate != null && this.numDays != Integer.MIN_VALUE) {
            try {
                stringBuffer = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_DATE).append(this.toDate).append(MSVSSConstants.VALUE_FROMDATE).append(calcDate(this.toDate, this.numDays)).toString();
            } catch (ParseException e) {
                throw new BuildException(new StringBuffer().append("Error parsing date: ").append(this.toDate).toString(), getLocation());
            }
        } else if (this.fromDate == null || this.numDays == Integer.MIN_VALUE) {
            stringBuffer = this.fromDate != null ? new StringBuffer().append("-V~d").append(this.fromDate).toString() : new StringBuffer().append(MSVSSConstants.FLAG_VERSION_DATE).append(this.toDate).toString();
        } else {
            try {
                stringBuffer = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_DATE).append(calcDate(this.fromDate, this.numDays)).append(MSVSSConstants.VALUE_FROMDATE).append(this.fromDate).toString();
            } catch (ParseException e2) {
                throw new BuildException(new StringBuffer().append("Error parsing date: ").append(this.fromDate).toString(), getLocation());
            }
        }
        return stringBuffer;
    }

    protected String getVersionDateLabel() {
        String str;
        if (this.version != null) {
            str = new StringBuffer().append(MSVSSConstants.FLAG_VERSION).append(this.version).toString();
        } else if (this.date != null) {
            str = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_DATE).append(this.date).toString();
        } else {
            String shortLabel = getShortLabel();
            str = "";
            if (shortLabel != null) {
                str = "";
                if (!shortLabel.equals("")) {
                    str = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_LABEL).append(shortLabel).toString();
                }
            }
        }
        return str;
    }

    protected String getVersionLabel() {
        String stringBuffer;
        if (this.fromLabel == null && this.toLabel == null) {
            stringBuffer = "";
        } else if (this.fromLabel != null && this.toLabel != null) {
            if (this.fromLabel.length() > 31) {
                this.fromLabel = this.fromLabel.substring(0, 30);
                log(new StringBuffer().append("FromLabel is longer than 31 characters, truncated to: ").append(this.fromLabel).toString(), 1);
            }
            if (this.toLabel.length() > 31) {
                this.toLabel = this.toLabel.substring(0, 30);
                log(new StringBuffer().append("ToLabel is longer than 31 characters, truncated to: ").append(this.toLabel).toString(), 1);
            }
            stringBuffer = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_LABEL).append(this.toLabel).append(MSVSSConstants.VALUE_FROMLABEL).append(this.fromLabel).toString();
        } else if (this.fromLabel != null) {
            if (this.fromLabel.length() > 31) {
                this.fromLabel = this.fromLabel.substring(0, 30);
                log(new StringBuffer().append("FromLabel is longer than 31 characters, truncated to: ").append(this.fromLabel).toString(), 1);
            }
            stringBuffer = new StringBuffer().append("-V~L").append(this.fromLabel).toString();
        } else {
            if (this.toLabel.length() > 31) {
                this.toLabel = this.toLabel.substring(0, 30);
                log(new StringBuffer().append("ToLabel is longer than 31 characters, truncated to: ").append(this.toLabel).toString(), 1);
            }
            stringBuffer = new StringBuffer().append(MSVSSConstants.FLAG_VERSION_LABEL).append(this.toLabel).toString();
        }
        return stringBuffer;
    }

    protected String getVsspath() {
        return this.vssPath;
    }

    protected String getWritable() {
        return this.writable ? MSVSSConstants.FLAG_WRITABLE : "";
    }

    public String getWritableFiles() {
        String str;
        if (this.writableFiles == null) {
            str = "";
        } else if (this.writableFiles.getValue().equals(MSVSSConstants.WRITABLE_REPLACE)) {
            str = MSVSSConstants.FLAG_REPLACE_WRITABLE;
        } else if (this.writableFiles.getValue().equals(MSVSSConstants.WRITABLE_SKIP)) {
            this.failOnError = false;
            str = MSVSSConstants.FLAG_SKIP_WRITABLE;
        } else {
            str = "";
        }
        return str;
    }

    public final void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    protected void setInternalAutoResponse(String str) {
        this.autoResponse = str;
    }

    protected void setInternalComment(String str) {
        this.comment = str;
    }

    protected void setInternalDate(String str) {
        this.date = str;
    }

    protected void setInternalDateFormat(DateFormat dateFormat) {
        this.dateFormat = dateFormat;
    }

    protected void setInternalFailOnError(boolean z) {
        this.failOnError = z;
    }

    protected void setInternalFileTimeStamp(CurrentModUpdated currentModUpdated) {
        this.timestamp = currentModUpdated;
    }

    protected void setInternalFromDate(String str) {
        this.fromDate = str;
    }

    protected void setInternalFromLabel(String str) {
        this.fromLabel = str;
    }

    protected void setInternalGetLocalCopy(boolean z) {
        this.getLocalCopy = z;
    }

    protected void setInternalLabel(String str) {
        this.label = str;
    }

    protected void setInternalLocalPath(String str) {
        this.localPath = str;
    }

    protected void setInternalNumDays(int i) {
        this.numDays = i;
    }

    protected void setInternalOutputFilename(String str) {
        this.outputFileName = str;
    }

    protected void setInternalQuiet(boolean z) {
        this.quiet = z;
    }

    protected void setInternalRecursive(boolean z) {
        this.recursive = z;
    }

    protected void setInternalStyle(String str) {
        this.style = str;
    }

    protected void setInternalToDate(String str) {
        this.toDate = str;
    }

    protected void setInternalToLabel(String str) {
        this.toLabel = str;
    }

    protected void setInternalUser(String str) {
        this.user = str;
    }

    protected void setInternalVersion(String str) {
        this.version = str;
    }

    protected void setInternalWritable(boolean z) {
        this.writable = z;
    }

    protected void setInternalWritableFiles(WritableFiles writableFiles) {
        this.writableFiles = writableFiles;
    }

    public final void setLogin(String str) {
        this.vssLogin = str;
    }

    public final void setServerpath(String str) {
        this.serverPath = str;
    }

    public final void setSsdir(String str) {
        this.ssDir = FileUtils.translatePath(str);
    }

    public final void setVsspath(String str) {
        if (str.startsWith("vss://")) {
            str = str.substring(5);
        }
        if (str.startsWith("$")) {
            this.vssPath = str;
        } else {
            this.vssPath = new StringBuffer().append("$").append(str).toString();
        }
    }
}
