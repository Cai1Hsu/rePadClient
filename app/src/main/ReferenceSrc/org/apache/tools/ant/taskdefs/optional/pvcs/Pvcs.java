package org.apache.tools.ant.taskdefs.optional.pvcs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.MessageFormat;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.Random;
import java.util.Vector;
import org.apache.http.message.BasicHeaderValueFormatter;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.taskdefs.ExecuteStreamHandler;
import org.apache.tools.ant.taskdefs.LogOutputStream;
import org.apache.tools.ant.taskdefs.LogStreamHandler;
import org.apache.tools.ant.taskdefs.PumpStreamHandler;
import org.apache.tools.ant.taskdefs.optional.vss.MSVSSConstants;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/pvcs/Pvcs.class */
public class Pvcs extends Task {
    private static final String GET_EXE = "get";
    private static final String PCLI_EXE = "pcli";
    private static final int POS_1 = 1;
    private static final int POS_2 = 2;
    private static final int POS_3 = 3;
    private String config;
    private String revision;
    private String userId;
    private String pvcsProject = null;
    private Vector pvcsProjects = new Vector();
    private String workspace = null;
    private String repository = null;
    private String pvcsbin = null;
    private String force = null;
    private String promotiongroup = null;
    private String label = null;
    private boolean ignorerc = false;
    private boolean updateOnly = false;
    private String lineStart = "\"P:";
    private String filenameFormat = "{0}-arc({1})";

    private void createFolders(File file) throws IOException, ParseException {
        BufferedReader bufferedReader;
        Throwable th;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            try {
                MessageFormat messageFormat = new MessageFormat(getFilenameFormat());
                for (String readLine = bufferedReader2.readLine(); readLine != null; readLine = bufferedReader2.readLine()) {
                    log(new StringBuffer().append("Considering \"").append(readLine).append("\"").toString(), 3);
                    if (readLine.startsWith(BasicHeaderValueFormatter.UNSAFE_CHARS) || readLine.startsWith("\"/") || (readLine.length() > 3 && readLine.startsWith("\"") && Character.isLetter(readLine.charAt(1)) && String.valueOf(readLine.charAt(2)).equals(":") && String.valueOf(readLine.charAt(3)).equals("\\"))) {
                        String str = (String) messageFormat.parse(readLine)[1];
                        int lastIndexOf = str.lastIndexOf(File.separator);
                        if (lastIndexOf > -1) {
                            File file2 = new File(str.substring(0, lastIndexOf));
                            if (!file2.exists()) {
                                log(new StringBuffer().append("Creating ").append(file2.getAbsolutePath()).toString(), 3);
                                if (file2.mkdirs()) {
                                    log(new StringBuffer().append("Created ").append(file2.getAbsolutePath()).toString(), 2);
                                } else {
                                    log(new StringBuffer().append("Failed to create ").append(file2.getAbsolutePath()).toString(), 2);
                                }
                            } else {
                                log(new StringBuffer().append(file2.getAbsolutePath()).append(" exists. Skipping").toString(), 3);
                            }
                        } else {
                            log(new StringBuffer().append("File separator problem with ").append(readLine).toString(), 1);
                        }
                    } else {
                        log(new StringBuffer().append("Skipped \"").append(readLine).append("\"").toString(), 3);
                    }
                }
                FileUtils.close(bufferedReader2);
            } catch (Throwable th2) {
                th = th2;
                bufferedReader = bufferedReader2;
                FileUtils.close(bufferedReader);
                throw th;
            }
        } catch (Throwable th3) {
            bufferedReader = null;
            th = th3;
        }
    }

    private String getExecutable(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        if (getPvcsbin() != null) {
            if (this.pvcsbin.endsWith(File.separator)) {
                stringBuffer.append(this.pvcsbin);
            } else {
                stringBuffer.append(this.pvcsbin).append(File.separator);
            }
        }
        return stringBuffer.append(str).toString();
    }

    private void massagePCLI(File file, File file2) throws IOException {
        BufferedReader bufferedReader;
        BufferedWriter bufferedWriter;
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new FileReader(file));
            try {
                BufferedWriter bufferedWriter2 = new BufferedWriter(new FileWriter(file2));
                while (true) {
                    try {
                        String readLine = bufferedReader2.readLine();
                        if (readLine == null) {
                            FileUtils.close(bufferedReader2);
                            FileUtils.close(bufferedWriter2);
                            return;
                        }
                        bufferedWriter2.write(readLine.replace('\\', '/'));
                        bufferedWriter2.newLine();
                    } catch (Throwable th) {
                        th = th;
                        bufferedWriter = bufferedWriter2;
                        bufferedReader = bufferedReader2;
                        FileUtils.close(bufferedReader);
                        FileUtils.close(bufferedWriter);
                        throw th;
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                bufferedReader = bufferedReader2;
                bufferedWriter = null;
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
            bufferedWriter = null;
        }
    }

    public void addPvcsproject(PvcsProject pvcsProject) {
        this.pvcsProjects.addElement(pvcsProject);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File file;
        File file2;
        File file3;
        Throwable th;
        if (this.repository == null || this.repository.trim().equals("")) {
            throw new BuildException("Required argument repository not specified");
        }
        Commandline commandline = new Commandline();
        commandline.setExecutable(getExecutable(PCLI_EXE));
        commandline.createArgument().setValue("lvf");
        commandline.createArgument().setValue("-z");
        commandline.createArgument().setValue("-aw");
        if (getWorkspace() != null) {
            commandline.createArgument().setValue(new StringBuffer().append("-sp").append(getWorkspace()).toString());
        }
        commandline.createArgument().setValue(new StringBuffer().append("-pr").append(getRepository()).toString());
        String userId = getUserId();
        if (userId != null) {
            commandline.createArgument().setValue(new StringBuffer().append("-id").append(userId).toString());
        }
        if (getPvcsproject() == null && getPvcsprojects().isEmpty()) {
            this.pvcsProject = "/";
        }
        if (getPvcsproject() != null) {
            commandline.createArgument().setValue(getPvcsproject());
        }
        if (!getPvcsprojects().isEmpty()) {
            Enumeration elements = getPvcsprojects().elements();
            while (elements.hasMoreElements()) {
                String name = ((PvcsProject) elements.nextElement()).getName();
                if (name == null || name.trim().equals("")) {
                    throw new BuildException("name is a required attribute of pvcsproject");
                }
                commandline.createArgument().setValue(name);
            }
        }
        File file4 = null;
        File file5 = null;
        File file6 = null;
        try {
            try {
                Random random = new Random(System.currentTimeMillis());
                file = new File(new StringBuffer().append("pvcs_ant_").append(random.nextLong()).append(".log").toString());
                try {
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    File file7 = new File(new StringBuffer().append("pvcs_ant_").append(random.nextLong()).append(".log").toString());
                    try {
                        log(commandline.describeCommand(), 3);
                        try {
                            int runCmd = runCmd(commandline, new PumpStreamHandler(fileOutputStream, new LogOutputStream((Task) this, 1)));
                            FileUtils.close(fileOutputStream);
                            if (Execute.isFailure(runCmd) && !this.ignorerc) {
                                throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).toString(), getLocation());
                            }
                            if (!file.exists()) {
                                throw new BuildException("Communication between ant and pvcs failed. No output generated from executing PVCS commandline interface \"pcli\" and \"get\"");
                            }
                            log("Creating folders", 2);
                            createFolders(file);
                            massagePCLI(file, file7);
                            commandline.clearArgs();
                            commandline.setExecutable(getExecutable(GET_EXE));
                            if (getConfig() != null && getConfig().length() > 0) {
                                commandline.createArgument().setValue(new StringBuffer().append("-c").append(getConfig()).toString());
                            }
                            if (getForce() == null || !getForce().equals("yes")) {
                                commandline.createArgument().setValue(MSVSSConstants.VALUE_NO);
                            } else {
                                commandline.createArgument().setValue("-Y");
                            }
                            if (getPromotiongroup() != null) {
                                commandline.createArgument().setValue(new StringBuffer().append("-G").append(getPromotiongroup()).toString());
                            } else if (getLabel() != null) {
                                commandline.createArgument().setValue(new StringBuffer().append("-v").append(getLabel()).toString());
                            } else if (getRevision() != null) {
                                commandline.createArgument().setValue(new StringBuffer().append("-r").append(getRevision()).toString());
                            }
                            if (this.updateOnly) {
                                commandline.createArgument().setValue(MSVSSConstants.FLAG_USER);
                            }
                            commandline.createArgument().setValue(new StringBuffer().append("@").append(file7.getAbsolutePath()).toString());
                            log("Getting files", 2);
                            log(new StringBuffer().append("Executing ").append(commandline.toString()).toString(), 3);
                            int runCmd2 = runCmd(commandline, new LogStreamHandler((Task) this, 2, 1));
                            if (runCmd2 != 0 && !this.ignorerc) {
                                throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).append(". Return code was ").append(runCmd2).toString(), getLocation());
                            }
                            if (file != null) {
                                file.delete();
                            }
                            if (file7 == null) {
                                return;
                            }
                            file7.delete();
                        } catch (Throwable th2) {
                            FileUtils.close(fileOutputStream);
                            throw th2;
                        }
                    } catch (FileNotFoundException e) {
                        e = e;
                        file4 = file7;
                        File file8 = file;
                        File file9 = file;
                        String stringBuffer = new StringBuffer().append("Failed executing: ").append(commandline.toString()).append(". Exception: ").append(e.getMessage()).toString();
                        File file10 = file;
                        File file11 = file;
                        BuildException buildException = new BuildException(stringBuffer, getLocation());
                        File file12 = file;
                        throw buildException;
                    } catch (IOException e2) {
                        e = e2;
                        file2 = file7;
                        File file13 = file;
                        File file14 = file;
                        String stringBuffer2 = new StringBuffer().append("Failed executing: ").append(commandline.toString()).append(". Exception: ").append(e.getMessage()).toString();
                        File file15 = file;
                        File file16 = file;
                        BuildException buildException2 = new BuildException(stringBuffer2, getLocation());
                        File file17 = file;
                        throw buildException2;
                    } catch (ParseException e3) {
                        e = e3;
                        file3 = file7;
                        File file18 = file;
                        File file19 = file;
                        String stringBuffer3 = new StringBuffer().append("Failed executing: ").append(commandline.toString()).append(". Exception: ").append(e.getMessage()).toString();
                        File file20 = file;
                        File file21 = file;
                        BuildException buildException3 = new BuildException(stringBuffer3, getLocation());
                        File file22 = file;
                        throw buildException3;
                    } catch (Throwable th3) {
                        file6 = file7;
                        file5 = file;
                        th = th3;
                        if (file5 != null) {
                            file5.delete();
                        }
                        if (file6 != null) {
                            file6.delete();
                        }
                        throw th;
                    }
                } catch (FileNotFoundException e4) {
                    e = e4;
                } catch (IOException e5) {
                    e = e5;
                    file2 = null;
                } catch (ParseException e6) {
                    e = e6;
                    file3 = null;
                } catch (Throwable th4) {
                    file5 = file;
                    file6 = null;
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        } catch (FileNotFoundException e7) {
            e = e7;
            file = null;
        } catch (IOException e8) {
            e = e8;
            file = null;
            file2 = null;
        } catch (ParseException e9) {
            e = e9;
            file = null;
            file3 = null;
        }
    }

    public String getConfig() {
        return this.config;
    }

    public String getFilenameFormat() {
        return this.filenameFormat;
    }

    public String getForce() {
        return this.force;
    }

    public boolean getIgnoreReturnCode() {
        return this.ignorerc;
    }

    public String getLabel() {
        return this.label;
    }

    public String getLineStart() {
        return this.lineStart;
    }

    public String getPromotiongroup() {
        return this.promotiongroup;
    }

    public String getPvcsbin() {
        return this.pvcsbin;
    }

    public String getPvcsproject() {
        return this.pvcsProject;
    }

    public Vector getPvcsprojects() {
        return this.pvcsProjects;
    }

    public String getRepository() {
        return this.repository;
    }

    public String getRevision() {
        return this.revision;
    }

    public boolean getUpdateOnly() {
        return this.updateOnly;
    }

    public String getUserId() {
        return this.userId;
    }

    public String getWorkspace() {
        return this.workspace;
    }

    protected int runCmd(Commandline commandline, ExecuteStreamHandler executeStreamHandler) {
        try {
            Project project = getProject();
            Execute execute = new Execute(executeStreamHandler);
            execute.setAntRun(project);
            execute.setWorkingDirectory(project.getBaseDir());
            execute.setCommandline(commandline.getCommandline());
            return execute.execute();
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Failed executing: ").append(commandline.toString()).append(". Exception: ").append(e.getMessage()).toString(), getLocation());
        }
    }

    public void setConfig(File file) {
        this.config = file.toString();
    }

    public void setFilenameFormat(String str) {
        this.filenameFormat = str;
    }

    public void setForce(String str) {
        if (str == null || !str.equalsIgnoreCase("yes")) {
            this.force = "no";
        } else {
            this.force = "yes";
        }
    }

    public void setIgnoreReturnCode(boolean z) {
        this.ignorerc = z;
    }

    public void setLabel(String str) {
        this.label = str;
    }

    public void setLineStart(String str) {
        this.lineStart = str;
    }

    public void setPromotiongroup(String str) {
        this.promotiongroup = str;
    }

    public void setPvcsbin(String str) {
        this.pvcsbin = str;
    }

    public void setPvcsproject(String str) {
        this.pvcsProject = str;
    }

    public void setRepository(String str) {
        this.repository = str;
    }

    public void setRevision(String str) {
        this.revision = str;
    }

    public void setUpdateOnly(boolean z) {
        this.updateOnly = z;
    }

    public void setUserId(String str) {
        this.userId = str;
    }

    public void setWorkspace(String str) {
        this.workspace = str;
    }
}
