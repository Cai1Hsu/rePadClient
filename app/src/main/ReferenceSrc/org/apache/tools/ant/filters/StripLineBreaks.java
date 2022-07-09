package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/StripLineBreaks.class */
public final class StripLineBreaks extends BaseParamFilterReader implements ChainableReader {
    private static final String DEFAULT_LINE_BREAKS = "\r\n";
    private static final String LINE_BREAKS_KEY = "linebreaks";
    private String lineBreaks = "\r\n";

    public StripLineBreaks() {
    }

    public StripLineBreaks(Reader reader) {
        super(reader);
    }

    private String getLineBreaks() {
        return this.lineBreaks;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        String str = null;
        if (parameters != null) {
            int i = 0;
            while (true) {
                str = null;
                if (i >= parameters.length) {
                    break;
                } else if (LINE_BREAKS_KEY.equals(parameters[i].getName())) {
                    str = parameters[i].getValue();
                    break;
                } else {
                    i++;
                }
            }
        }
        if (str != null) {
            this.lineBreaks = str;
        }
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        StripLineBreaks stripLineBreaks = new StripLineBreaks(reader);
        stripLineBreaks.setLineBreaks(getLineBreaks());
        stripLineBreaks.setInitialized(true);
        return stripLineBreaks;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        int i;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        int read = this.in.read();
        while (true) {
            i = read;
            if (i == -1 || this.lineBreaks.indexOf(i) == -1) {
                break;
            }
            read = this.in.read();
        }
        return i;
    }

    public void setLineBreaks(String str) {
        this.lineBreaks = str;
    }
}
