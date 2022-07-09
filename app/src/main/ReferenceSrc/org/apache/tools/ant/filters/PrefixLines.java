package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/PrefixLines.class */
public final class PrefixLines extends BaseParamFilterReader implements ChainableReader {
    private static final String PREFIX_KEY = "prefix";
    private String prefix = null;
    private String queuedData = null;

    public PrefixLines() {
    }

    public PrefixLines(Reader reader) {
        super(reader);
    }

    private String getPrefix() {
        return this.prefix;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (PREFIX_KEY.equals(parameters[i].getName())) {
                    this.prefix = parameters[i].getValue();
                    return;
                }
            }
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        PrefixLines prefixLines = new PrefixLines(reader);
        prefixLines.setPrefix(getPrefix());
        prefixLines.setInitialized(true);
        return prefixLines;
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
                if (this.prefix != null) {
                    this.queuedData = new StringBuffer().append(this.prefix).append(this.queuedData).toString();
                }
                read = read();
            }
        }
        return read;
    }

    public void setPrefix(String str) {
        this.prefix = str;
    }
}
