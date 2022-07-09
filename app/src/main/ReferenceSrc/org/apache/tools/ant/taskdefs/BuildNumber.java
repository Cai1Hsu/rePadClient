package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/BuildNumber.class */
public class BuildNumber extends Task {
    private static final String DEFAULT_FILENAME = "build.number";
    private static final String DEFAULT_PROPERTY_NAME = "build.number";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File myFile;

    private int getBuildNumber(Properties properties) throws BuildException {
        String trim = properties.getProperty("build.number", "0").trim();
        try {
            return Integer.parseInt(trim);
        } catch (NumberFormatException e) {
            throw new BuildException(new StringBuffer().append(this.myFile).append(" contains a non integer build number: ").append(trim).toString(), e);
        }
    }

    private Properties loadProperties() throws BuildException {
        Throwable th;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2;
        IOException e;
        Properties properties;
        try {
            try {
                properties = new Properties();
                fileInputStream2 = new FileInputStream(this.myFile);
            } catch (Throwable th2) {
                th = th2;
                fileInputStream = null;
            }
        } catch (IOException e2) {
            e = e2;
            fileInputStream2 = null;
        }
        try {
            properties.load(fileInputStream2);
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e3) {
                    log(new StringBuffer().append("error closing input stream ").append(e3).toString(), 0);
                }
            }
            return properties;
        } catch (IOException e4) {
            e = e4;
            FileInputStream fileInputStream3 = fileInputStream2;
            FileInputStream fileInputStream4 = fileInputStream2;
            throw new BuildException(e);
        } catch (Throwable th3) {
            fileInputStream = fileInputStream2;
            th = th3;
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                } catch (IOException e5) {
                    log(new StringBuffer().append("error closing input stream ").append(e5).toString(), 0);
                }
            }
            throw th;
        }
    }

    private void validate() throws BuildException {
        if (this.myFile == null) {
            this.myFile = FILE_UTILS.resolveFile(getProject().getBaseDir(), "build.number");
        }
        if (!this.myFile.exists()) {
            try {
                FILE_UTILS.createNewFile(this.myFile);
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append(this.myFile).append(" doesn't exist and new file can't be created.").toString(), e);
            }
        }
        if (!this.myFile.canRead()) {
            throw new BuildException(new StringBuffer().append("Unable to read from ").append(this.myFile).append(".").toString());
        }
        if (this.myFile.canWrite()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Unable to write to ").append(this.myFile).append(".").toString());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Throwable th;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2;
        IOException e;
        File file = this.myFile;
        validate();
        Properties loadProperties = loadProperties();
        int buildNumber = getBuildNumber(loadProperties);
        loadProperties.put("build.number", String.valueOf(buildNumber + 1));
        FileOutputStream fileOutputStream3 = null;
        try {
            try {
                fileOutputStream2 = new FileOutputStream(this.myFile);
            } catch (IOException e2) {
                e = e2;
                fileOutputStream2 = null;
            }
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream = fileOutputStream3;
        }
        try {
            loadProperties.store(fileOutputStream2, "Build Number for ANT. Do not edit!");
            if (fileOutputStream2 != null) {
                try {
                    fileOutputStream2.close();
                } catch (IOException e3) {
                    log(new StringBuffer().append("error closing output stream ").append(e3).toString(), 0);
                }
            }
            this.myFile = file;
            getProject().setNewProperty("build.number", String.valueOf(buildNumber));
        } catch (IOException e4) {
            e = e4;
            FileOutputStream fileOutputStream4 = fileOutputStream2;
            FileOutputStream fileOutputStream5 = fileOutputStream2;
            FileOutputStream fileOutputStream6 = fileOutputStream2;
            FileOutputStream fileOutputStream7 = fileOutputStream2;
            fileOutputStream3 = fileOutputStream2;
            throw new BuildException(new StringBuffer().append("Error while writing ").append(this.myFile).toString(), e);
        } catch (Throwable th3) {
            fileOutputStream = fileOutputStream2;
            th = th3;
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e5) {
                    log(new StringBuffer().append("error closing output stream ").append(e5).toString(), 0);
                }
            }
            this.myFile = file;
            throw th;
        }
    }

    public void setFile(File file) {
        this.myFile = file;
    }
}
