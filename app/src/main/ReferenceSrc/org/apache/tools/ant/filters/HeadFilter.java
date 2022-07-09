package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.util.LineTokenizer;

/* loaded from: classes.jar:org/apache/tools/ant/filters/HeadFilter.class */
public final class HeadFilter extends BaseParamFilterReader implements ChainableReader {
    private static final int DEFAULT_NUM_LINES = 10;
    private static final String LINES_KEY = "lines";
    private static final String SKIP_KEY = "skip";
    private boolean eof;
    private String line;
    private int linePos;
    private LineTokenizer lineTokenizer;
    private long lines;
    private long linesRead;
    private long skip;

    public HeadFilter() {
        this.linesRead = 0L;
        this.lines = 10L;
        this.skip = 0L;
        this.lineTokenizer = null;
        this.line = null;
        this.linePos = 0;
    }

    public HeadFilter(Reader reader) {
        super(reader);
        this.linesRead = 0L;
        this.lines = 10L;
        this.skip = 0L;
        this.lineTokenizer = null;
        this.line = null;
        this.linePos = 0;
        this.lineTokenizer = new LineTokenizer();
        this.lineTokenizer.setIncludeDelims(true);
    }

    private long getLines() {
        return this.lines;
    }

    private long getSkip() {
        return this.skip;
    }

    private String headFilter(String str) {
        String str2;
        this.linesRead++;
        if (this.skip <= 0 || this.linesRead - 1 >= this.skip) {
            str2 = str;
            if (this.lines > 0) {
                str2 = str;
                if (this.linesRead > this.lines + this.skip) {
                    this.eof = true;
                    str2 = null;
                }
            }
        } else {
            str2 = null;
        }
        return str2;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (LINES_KEY.equals(parameters[i].getName())) {
                    this.lines = Long.parseLong(parameters[i].getValue());
                } else if ("skip".equals(parameters[i].getName())) {
                    this.skip = Long.parseLong(parameters[i].getValue());
                }
            }
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        HeadFilter headFilter = new HeadFilter(reader);
        headFilter.setLines(getLines());
        headFilter.setSkip(getSkip());
        headFilter.setInitialized(true);
        return headFilter;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        while (true) {
            if (this.line == null || this.line.length() == 0) {
                this.line = this.lineTokenizer.getToken(this.in);
                if (this.line != null) {
                    this.line = headFilter(this.line);
                    c = 65535;
                    if (this.eof) {
                        break;
                    }
                    this.linePos = 0;
                } else {
                    c = 65535;
                    break;
                }
            } else {
                char charAt = this.line.charAt(this.linePos);
                this.linePos++;
                c = charAt;
                if (this.linePos == this.line.length()) {
                    this.line = null;
                    c = charAt;
                }
            }
        }
        return c;
    }

    public void setLines(long j) {
        this.lines = j;
    }

    public void setSkip(long j) {
        this.skip = j;
    }
}
