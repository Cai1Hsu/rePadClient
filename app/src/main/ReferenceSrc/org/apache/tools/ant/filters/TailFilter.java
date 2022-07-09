package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.LinkedList;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.util.LineTokenizer;

/* loaded from: classes.jar:org/apache/tools/ant/filters/TailFilter.class */
public final class TailFilter extends BaseParamFilterReader implements ChainableReader {
    private static final int DEFAULT_NUM_LINES = 10;
    private static final String LINES_KEY = "lines";
    private static final String SKIP_KEY = "skip";
    private boolean completedReadAhead;
    private String line;
    private LinkedList lineList;
    private int linePos;
    private LineTokenizer lineTokenizer;
    private long lines;
    private long skip;

    public TailFilter() {
        this.lines = 10L;
        this.skip = 0L;
        this.completedReadAhead = false;
        this.lineTokenizer = null;
        this.line = null;
        this.linePos = 0;
        this.lineList = new LinkedList();
    }

    public TailFilter(Reader reader) {
        super(reader);
        this.lines = 10L;
        this.skip = 0L;
        this.completedReadAhead = false;
        this.lineTokenizer = null;
        this.line = null;
        this.linePos = 0;
        this.lineList = new LinkedList();
        this.lineTokenizer = new LineTokenizer();
        this.lineTokenizer.setIncludeDelims(true);
    }

    private long getLines() {
        return this.lines;
    }

    private long getSkip() {
        return this.skip;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (LINES_KEY.equals(parameters[i].getName())) {
                    setLines(Long.parseLong(parameters[i].getValue()));
                } else if ("skip".equals(parameters[i].getName())) {
                    this.skip = Long.parseLong(parameters[i].getValue());
                }
            }
        }
    }

    private String tailFilter(String str) {
        String str2;
        long j = 0;
        if (!this.completedReadAhead) {
            if (str != null) {
                this.lineList.add(str);
                if (this.lines != -1) {
                    long j2 = this.lines;
                    if (this.skip > 0) {
                        j = this.skip;
                    }
                    if (j2 + j < this.lineList.size()) {
                        this.lineList.removeFirst();
                    }
                } else if (this.lineList.size() > this.skip) {
                    str2 = (String) this.lineList.removeFirst();
                    return str2;
                }
                str2 = "";
                return str2;
            }
            this.completedReadAhead = true;
            if (this.skip > 0) {
                for (int i = 0; i < this.skip; i++) {
                    this.lineList.removeLast();
                }
            }
            if (this.lines > -1) {
                while (this.lineList.size() > this.lines) {
                    this.lineList.removeFirst();
                }
            }
        }
        str2 = this.lineList.size() > 0 ? (String) this.lineList.removeFirst() : null;
        return str2;
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        TailFilter tailFilter = new TailFilter(reader);
        tailFilter.setLines(getLines());
        tailFilter.setSkip(getSkip());
        tailFilter.setInitialized(true);
        return tailFilter;
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
                this.line = tailFilter(this.line);
                if (this.line == null) {
                    c = 65535;
                    break;
                }
                this.linePos = 0;
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
