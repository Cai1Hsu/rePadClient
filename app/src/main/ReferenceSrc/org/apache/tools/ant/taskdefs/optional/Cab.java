package org.apache.tools.ant.taskdefs.optional;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.ExecTask;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.taskdefs.StreamPumper;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/Cab.class */
public class Cab extends MatchingTask {
    private static final int DEFAULT_RESULT = -99;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File baseDir;
    private File cabFile;
    private String cmdOptions;
    private Vector filesets = new Vector();
    private boolean doCompress = true;
    private boolean doVerbose = false;
    protected String archiveType = "cab";

    public void addFileset(FileSet fileSet) {
        if (this.filesets.size() > 0) {
            throw new BuildException("Only one nested fileset allowed");
        }
        this.filesets.addElement(fileSet);
    }

    protected void appendFiles(Vector vector, DirectoryScanner directoryScanner) {
        for (String str : directoryScanner.getIncludedFiles()) {
            vector.addElement(str);
        }
    }

    protected void checkConfiguration() throws BuildException {
        if (this.baseDir == null && this.filesets.size() == 0) {
            throw new BuildException("basedir attribute or one nested fileset is required!", getLocation());
        }
        if (this.baseDir != null && !this.baseDir.exists()) {
            throw new BuildException("basedir does not exist!", getLocation());
        }
        if (this.baseDir != null && this.filesets.size() > 0) {
            throw new BuildException("Both basedir attribute and a nested fileset is not allowed");
        }
        if (this.cabFile != null) {
            return;
        }
        throw new BuildException("cabfile attribute must be set!", getLocation());
    }

    protected ExecTask createExec() throws BuildException {
        return new ExecTask(this);
    }

    protected File createListFile(Vector vector) throws IOException {
        Throwable th;
        BufferedWriter bufferedWriter;
        BufferedWriter bufferedWriter2;
        File createTempFile = FILE_UTILS.createTempFile("ant", "", null, true, true);
        try {
            bufferedWriter2 = new BufferedWriter(new FileWriter(createTempFile));
        } catch (Throwable th2) {
            bufferedWriter = null;
            th = th2;
        }
        try {
            int size = vector.size();
            for (int i = 0; i < size; i++) {
                bufferedWriter2.write(new StringBuffer().append('\"').append(vector.elementAt(i).toString()).append('\"').toString());
                bufferedWriter2.newLine();
            }
            FileUtils.close(bufferedWriter2);
            return createTempFile;
        } catch (Throwable th3) {
            th = th3;
            bufferedWriter = bufferedWriter2;
            FileUtils.close(bufferedWriter);
            throw th;
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        checkConfiguration();
        Vector fileList = getFileList();
        if (isUpToDate(fileList)) {
            return;
        }
        log(new StringBuffer().append("Building ").append(this.archiveType).append(": ").append(this.cabFile.getAbsolutePath()).toString());
        if (Os.isFamily(Os.FAMILY_WINDOWS)) {
            try {
                File createListFile = createListFile(fileList);
                ExecTask createExec = createExec();
                File file = null;
                createExec.setFailonerror(true);
                createExec.setDir(this.baseDir);
                if (!this.doVerbose) {
                    file = FILE_UTILS.createTempFile("ant", "", null, true, true);
                    createExec.setOutput(file);
                }
                createExec.setExecutable("cabarc");
                createExec.createArg().setValue("-r");
                createExec.createArg().setValue("-p");
                if (!this.doCompress) {
                    createExec.createArg().setValue("-m");
                    createExec.createArg().setValue("none");
                }
                if (this.cmdOptions != null) {
                    createExec.createArg().setLine(this.cmdOptions);
                }
                createExec.createArg().setValue("n");
                createExec.createArg().setFile(this.cabFile);
                createExec.createArg().setValue(new StringBuffer().append("@").append(createListFile.getAbsolutePath()).toString());
                createExec.execute();
                if (file != null) {
                    file.delete();
                }
                createListFile.delete();
                return;
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("Problem creating ").append(this.cabFile).append(" ").append(e.getMessage()).toString(), getLocation());
            }
        }
        log("Using listcab/libcabinet", 3);
        StringBuffer stringBuffer = new StringBuffer();
        Enumeration elements = fileList.elements();
        while (elements.hasMoreElements()) {
            stringBuffer.append(elements.nextElement()).append("\n");
        }
        stringBuffer.append("\n").append(this.cabFile.getAbsolutePath()).append("\n");
        try {
            Process launch = Execute.launch(getProject(), new String[]{"listcab"}, null, this.baseDir != null ? this.baseDir : getProject().getBaseDir(), true);
            OutputStream outputStream = launch.getOutputStream();
            LogOutputStream logOutputStream = new LogOutputStream((Task) this, 3);
            LogOutputStream logOutputStream2 = new LogOutputStream((Task) this, 0);
            StreamPumper streamPumper = new StreamPumper(launch.getInputStream(), logOutputStream);
            StreamPumper streamPumper2 = new StreamPumper(launch.getErrorStream(), logOutputStream2);
            new Thread(streamPumper).start();
            new Thread(streamPumper2).start();
            outputStream.write(stringBuffer.toString().getBytes());
            outputStream.flush();
            outputStream.close();
            int i = -99;
            try {
                int waitFor = launch.waitFor();
                streamPumper.waitFor();
                logOutputStream.close();
                streamPumper2.waitFor();
                i = waitFor;
                logOutputStream2.close();
                i = waitFor;
            } catch (InterruptedException e2) {
                log(new StringBuffer().append("Thread interrupted: ").append(e2).toString());
            }
            if (!Execute.isFailure(i)) {
                return;
            }
            log(new StringBuffer().append("Error executing listcab; error code: ").append(i).toString());
        } catch (IOException e3) {
            throw new BuildException(new StringBuffer().append("Problem creating ").append(this.cabFile).append(" ").append(e3.getMessage()).toString(), getLocation());
        }
    }

    protected Vector getFileList() throws BuildException {
        Vector vector = new Vector();
        if (this.baseDir != null) {
            appendFiles(vector, super.getDirectoryScanner(this.baseDir));
        } else {
            FileSet fileSet = (FileSet) this.filesets.elementAt(0);
            this.baseDir = fileSet.getDir();
            appendFiles(vector, fileSet.getDirectoryScanner(getProject()));
        }
        return vector;
    }

    protected boolean isUpToDate(Vector vector) {
        boolean z = true;
        int size = vector.size();
        for (int i = 0; i < size && z; i++) {
            if (FILE_UTILS.resolveFile(this.baseDir, vector.elementAt(i).toString()).lastModified() > this.cabFile.lastModified()) {
                z = false;
            }
        }
        return z;
    }

    public void setBasedir(File file) {
        this.baseDir = file;
    }

    public void setCabfile(File file) {
        this.cabFile = file;
    }

    public void setCompress(boolean z) {
        this.doCompress = z;
    }

    public void setOptions(String str) {
        this.cmdOptions = str;
    }

    public void setVerbose(boolean z) {
        this.doVerbose = z;
    }
}
