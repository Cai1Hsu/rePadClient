package org.apache.tools.ant.taskdefs.cvslib;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.AbstractCvsTask;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.util.DateUtils;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/cvslib/ChangeLogTask.class */
public class ChangeLogTask extends AbstractCvsTask {
    private File destFile;
    private Date endDate;
    private String endTag;
    private File inputDir;
    private Date startDate;
    private String startTag;
    private File usersFile;
    private Vector cvsUsers = new Vector();
    private boolean remote = false;
    private final Vector filesets = new Vector();

    private CVSEntry[] filterEntrySet(CVSEntry[] cVSEntryArr) {
        Vector vector = new Vector();
        for (CVSEntry cVSEntry : cVSEntryArr) {
            Date date = cVSEntry.getDate();
            if (date != null && ((this.startDate == null || !this.startDate.after(date)) && (this.endDate == null || !this.endDate.before(date)))) {
                vector.addElement(cVSEntry);
            }
        }
        CVSEntry[] cVSEntryArr2 = new CVSEntry[vector.size()];
        vector.copyInto(cVSEntryArr2);
        return cVSEntryArr2;
    }

    private void loadUserlist(Properties properties) throws BuildException {
        if (this.usersFile != null) {
            try {
                properties.load(new FileInputStream(this.usersFile));
            } catch (IOException e) {
                throw new BuildException(e.toString(), e);
            }
        }
    }

    private void replaceAuthorIdWithName(Properties properties, CVSEntry[] cVSEntryArr) {
        for (CVSEntry cVSEntry : cVSEntryArr) {
            if (properties.containsKey(cVSEntry.getAuthor())) {
                cVSEntry.setAuthor(properties.getProperty(cVSEntry.getAuthor()));
            }
        }
    }

    private void validate() throws BuildException {
        if (this.inputDir == null) {
            this.inputDir = getProject().getBaseDir();
        }
        if (this.destFile == null) {
            throw new BuildException("Destfile must be set.");
        }
        if (!this.inputDir.exists()) {
            throw new BuildException(new StringBuffer().append("Cannot find base dir ").append(this.inputDir.getAbsolutePath()).toString());
        }
        if (this.usersFile != null && !this.usersFile.exists()) {
            throw new BuildException(new StringBuffer().append("Cannot find user lookup list ").append(this.usersFile.getAbsolutePath()).toString());
        }
        if (this.startTag == null && this.endTag == null) {
            return;
        }
        if (this.startDate != null || this.endDate != null) {
            throw new BuildException("Specify either a tag or date range, not both");
        }
    }

    private void writeChangeLog(CVSEntry[] cVSEntryArr) throws BuildException {
        FileOutputStream fileOutputStream;
        Throwable th;
        IOException e;
        FileOutputStream fileOutputStream2;
        FileOutputStream fileOutputStream3;
        FileOutputStream fileOutputStream4 = null;
        try {
            try {
                fileOutputStream3 = new FileOutputStream(this.destFile);
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (UnsupportedEncodingException e2) {
            e = e2;
            fileOutputStream = null;
        } catch (IOException e3) {
            e = e3;
            fileOutputStream2 = null;
        }
        try {
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(fileOutputStream3, "UTF-8"));
            new ChangeLogWriter().printChangeLog(printWriter, cVSEntryArr);
            if (printWriter.checkError()) {
                throw new IOException("Encountered an error writing changelog");
            }
            FileUtils.close(fileOutputStream3);
        } catch (UnsupportedEncodingException e4) {
            fileOutputStream = fileOutputStream3;
            e = e4;
            getProject().log(e.toString(), 0);
            FileUtils.close(fileOutputStream);
        } catch (IOException e5) {
            fileOutputStream2 = fileOutputStream3;
            e = e5;
            FileOutputStream fileOutputStream5 = fileOutputStream2;
            FileOutputStream fileOutputStream6 = fileOutputStream2;
            throw new BuildException(e.toString(), e);
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream4 = fileOutputStream3;
            FileUtils.close(fileOutputStream4);
            throw th;
        }
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    public void addUser(CvsUser cvsUser) {
        this.cvsUsers.addElement(cvsUser);
    }

    @Override // org.apache.tools.ant.taskdefs.AbstractCvsTask, org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file = this.inputDir;
        try {
            validate();
            Properties properties = new Properties();
            loadUserlist(properties);
            int size = this.cvsUsers.size();
            for (int i = 0; i < size; i++) {
                CvsUser cvsUser = (CvsUser) this.cvsUsers.get(i);
                cvsUser.validate();
                properties.put(cvsUser.getUserID(), cvsUser.getDisplayname());
            }
            if (!this.remote) {
                setCommand("log");
                if (getTag() != null) {
                    CvsVersion cvsVersion = new CvsVersion();
                    cvsVersion.setProject(getProject());
                    cvsVersion.setTaskName("cvsversion");
                    cvsVersion.setCvsRoot(getCvsRoot());
                    cvsVersion.setCvsRsh(getCvsRsh());
                    cvsVersion.setPassfile(getPassFile());
                    cvsVersion.setDest(this.inputDir);
                    cvsVersion.execute();
                    if (cvsVersion.supportsCvsLogWithSOption()) {
                        addCommandArgument("-S");
                    }
                }
            } else {
                setCommand("");
                addCommandArgument("rlog");
                addCommandArgument("-S");
                addCommandArgument(MSVSSConstants.VALUE_NO);
            }
            if (this.startTag != null || this.endTag != null) {
                addCommandArgument(new StringBuffer().append("-r").append(this.startTag == null ? "" : this.startTag).append("::").append(this.endTag == null ? "" : this.endTag).toString());
            } else if (this.startDate != null) {
                String stringBuffer = new StringBuffer().append(">=").append(new SimpleDateFormat(DateUtils.ISO8601_DATE_PATTERN).format(this.startDate)).toString();
                addCommandArgument("-d");
                addCommandArgument(stringBuffer);
            }
            if (!this.filesets.isEmpty()) {
                Enumeration elements = this.filesets.elements();
                while (elements.hasMoreElements()) {
                    for (String str : ((FileSet) elements.nextElement()).getDirectoryScanner(getProject()).getIncludedFiles()) {
                        addCommandArgument(str);
                    }
                }
            }
            ChangeLogParser changeLogParser = new ChangeLogParser(this.remote, getPackage(), getModules());
            RedirectingStreamHandler redirectingStreamHandler = new RedirectingStreamHandler(changeLogParser);
            log(getCommand(), 3);
            setDest(this.inputDir);
            setExecuteStreamHandler(redirectingStreamHandler);
            super.execute();
            String errors = redirectingStreamHandler.getErrors();
            if (errors != null) {
                log(errors, 0);
            }
            CVSEntry[] filterEntrySet = filterEntrySet(changeLogParser.getEntrySetAsArray());
            replaceAuthorIdWithName(properties, filterEntrySet);
            writeChangeLog(filterEntrySet);
        } finally {
            this.inputDir = file;
        }
    }

    public void setDaysinpast(int i) {
        setStart(new Date(System.currentTimeMillis() - ((((i * 24) * 60) * 60) * 1000)));
    }

    public void setDestfile(File file) {
        this.destFile = file;
    }

    public void setDir(File file) {
        this.inputDir = file;
    }

    public void setEnd(Date date) {
        this.endDate = date;
    }

    public void setEndTag(String str) {
        this.endTag = str;
    }

    public void setRemote(boolean z) {
        this.remote = z;
    }

    public void setStart(Date date) {
        this.startDate = date;
    }

    public void setStartTag(String str) {
        this.startTag = str;
    }

    public void setUsersfile(File file) {
        this.usersFile = file;
    }
}
