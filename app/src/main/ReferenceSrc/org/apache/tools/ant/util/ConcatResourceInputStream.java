package org.apache.tools.ant.util;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/util/ConcatResourceInputStream.class */
public class ConcatResourceInputStream extends InputStream {
    private static final int EOF = -1;
    private InputStream currentStream;
    private boolean eof = false;
    private boolean ignoreErrors = false;
    private Iterator iter;
    private ProjectComponent managingPc;

    public ConcatResourceInputStream(ResourceCollection resourceCollection) {
        this.iter = resourceCollection.iterator();
    }

    private void closeCurrent() {
        FileUtils.close(this.currentStream);
        this.currentStream = null;
    }

    private void nextResource() throws IOException {
        closeCurrent();
        while (this.iter.hasNext()) {
            Resource resource = (Resource) this.iter.next();
            if (resource.isExists()) {
                log(new StringBuffer().append("Concating ").append(resource.toLongString()).toString(), 3);
                try {
                    this.currentStream = new BufferedInputStream(resource.getInputStream());
                    return;
                } catch (IOException e) {
                    if (!this.ignoreErrors) {
                        log(new StringBuffer().append("Failed to get input stream for ").append(resource).toString(), 0);
                        throw e;
                    }
                }
            }
        }
        this.eof = true;
    }

    private int readCurrent() throws IOException {
        return (this.eof || this.currentStream == null) ? -1 : this.currentStream.read();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        closeCurrent();
        this.eof = true;
    }

    public boolean isIgnoreErrors() {
        return this.ignoreErrors;
    }

    public void log(String str, int i) {
        if (this.managingPc != null) {
            this.managingPc.log(str, i);
        } else {
            (i > 1 ? System.out : System.err).println(str);
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int i;
        if (this.eof) {
            i = -1;
        } else {
            int readCurrent = readCurrent();
            i = readCurrent;
            if (readCurrent == -1) {
                nextResource();
                i = readCurrent();
            }
        }
        return i;
    }

    public void setIgnoreErrors(boolean z) {
        this.ignoreErrors = z;
    }

    public void setManagingComponent(ProjectComponent projectComponent) {
        this.managingPc = projectComponent;
    }
}
