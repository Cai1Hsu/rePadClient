package org.apache.tools.ant.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/util/ConcatFileInputStream.class */
public class ConcatFileInputStream extends InputStream {
    private static final int EOF = -1;
    private InputStream currentStream;
    private File[] file;
    private ProjectComponent managingPc;
    private int currentIndex = -1;
    private boolean eof = false;

    public ConcatFileInputStream(File[] fileArr) throws IOException {
        this.file = fileArr;
    }

    private void closeCurrent() {
        FileUtils.close(this.currentStream);
        this.currentStream = null;
    }

    private void openFile(int i) throws IOException {
        closeCurrent();
        if (this.file == null || i >= this.file.length) {
            this.eof = true;
            return;
        }
        log(new StringBuffer().append("Opening ").append(this.file[i]).toString(), 3);
        try {
            this.currentStream = new BufferedInputStream(new FileInputStream(this.file[i]));
        } catch (IOException e) {
            log(new StringBuffer().append("Failed to open ").append(this.file[i]).toString(), 0);
            throw e;
        }
    }

    private int readCurrent() throws IOException {
        return (this.eof || this.currentStream == null) ? -1 : this.currentStream.read();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        closeCurrent();
        this.eof = true;
    }

    public void log(String str, int i) {
        if (this.managingPc != null) {
            this.managingPc.log(str, i);
        } else if (i > 1) {
            System.out.println(str);
        } else {
            System.err.println(str);
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int readCurrent = readCurrent();
        int i = readCurrent;
        if (readCurrent == -1) {
            i = readCurrent;
            if (!this.eof) {
                int i2 = this.currentIndex + 1;
                this.currentIndex = i2;
                openFile(i2);
                i = readCurrent();
            }
        }
        return i;
    }

    public void setManagingComponent(ProjectComponent projectComponent) {
        this.managingPc = projectComponent;
    }

    public void setManagingTask(Task task) {
        setManagingComponent(task);
    }
}
