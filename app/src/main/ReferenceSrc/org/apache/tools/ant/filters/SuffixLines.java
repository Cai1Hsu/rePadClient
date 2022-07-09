package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/SuffixLines.class */
public final class SuffixLines extends BaseParamFilterReader implements ChainableReader {
    private static final String SUFFIX_KEY = "suffix";
    private String suffix = null;
    private String queuedData = null;

    public SuffixLines() {
    }

    public SuffixLines(Reader reader) {
        super(reader);
    }

    private String getSuffix() {
        return this.suffix;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (SUFFIX_KEY.equals(parameters[i].getName())) {
                    this.suffix = parameters[i].getValue();
                    return;
                }
            }
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        SuffixLines suffixLines = new SuffixLines(reader);
        suffixLines.setSuffix(getSuffix());
        suffixLines.setInitialized(true);
        return suffixLines;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char read;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.queuedData != null && this.queuedData.length() == 0) {
            this.queuedData = null;
        }
        if (this.queuedData != null) {
            char charAt = this.queuedData.charAt(0);
            this.queuedData = this.queuedData.substring(1);
            read = charAt;
            if (this.queuedData.length() == 0) {
                this.queuedData = null;
                read = charAt;
            }
        } else {
            this.queuedData = readLine();
            if (this.queuedData == null) {
                read = -1;
            } else {
                if (this.suffix != null) {
                    String str = "";
                    if (this.queuedData.endsWith("\r\n")) {
                        str = "\r\n";
                    } else if (this.queuedData.endsWith("\n")) {
                        str = "\n";
                    }
                    this.queuedData = new StringBuffer().append(this.queuedData.substring(0, this.queuedData.length() - str.length())).append(this.suffix).append(str).toString();
                }
                read = read();
            }
        }
        return read;
    }

    public void setSuffix(String str) {
        this.suffix = str;
    }
}
