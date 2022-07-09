package org.apache.tools.ant.filters;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/ConcatFilter.class */
public final class ConcatFilter extends BaseParamFilterReader implements ChainableReader {
    private File append;
    private File prepend;
    private Reader prependReader = null;
    private Reader appendReader = null;

    public ConcatFilter() {
    }

    public ConcatFilter(Reader reader) {
        super(reader);
    }

    private void initialize() throws IOException {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if ("prepend".equals(parameters[i].getName())) {
                    setPrepend(new File(parameters[i].getValue()));
                } else if ("append".equals(parameters[i].getName())) {
                    setAppend(new File(parameters[i].getValue()));
                }
            }
        }
        if (this.prepend != null) {
            if (!this.prepend.isAbsolute()) {
                this.prepend = new File(getProject().getBaseDir(), this.prepend.getPath());
            }
            this.prependReader = new BufferedReader(new FileReader(this.prepend));
        }
        if (this.append != null) {
            if (!this.append.isAbsolute()) {
                this.append = new File(getProject().getBaseDir(), this.append.getPath());
            }
            this.appendReader = new BufferedReader(new FileReader(this.append));
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        ConcatFilter concatFilter = new ConcatFilter(reader);
        concatFilter.setPrepend(getPrepend());
        concatFilter.setAppend(getAppend());
        return concatFilter;
    }

    public File getAppend() {
        return this.append;
    }

    public File getPrepend() {
        return this.prepend;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        int i = -1;
        if (this.prependReader != null) {
            int read = this.prependReader.read();
            i = read;
            if (read == -1) {
                this.prependReader.close();
                this.prependReader = null;
                i = read;
            }
        }
        int i2 = i;
        if (i == -1) {
            i2 = super.read();
        }
        int i3 = i2;
        if (i2 == -1) {
            i3 = i2;
            if (this.appendReader != null) {
                int read2 = this.appendReader.read();
                i3 = read2;
                if (read2 == -1) {
                    this.appendReader.close();
                    this.appendReader = null;
                    i3 = read2;
                }
            }
        }
        return i3;
    }

    public void setAppend(File file) {
        this.append = file;
    }

    public void setPrepend(File file) {
        this.prepend = file;
    }
}
