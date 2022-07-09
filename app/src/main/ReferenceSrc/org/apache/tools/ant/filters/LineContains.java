package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.Vector;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;

/* loaded from: classes.jar:org/apache/tools/ant/filters/LineContains.class */
public final class LineContains extends BaseParamFilterReader implements ChainableReader {
    private static final String CONTAINS_KEY = "contains";
    private static final String NEGATE_KEY = "negate";
    private Vector contains = new Vector();
    private String line = null;
    private boolean negate = false;

    /* loaded from: classes.jar:org/apache/tools/ant/filters/LineContains$Contains.class */
    public static class Contains {
        private String value;

        public final String getValue() {
            return this.value;
        }

        public final void setValue(String str) {
            this.value = str;
        }
    }

    public LineContains() {
    }

    public LineContains(Reader reader) {
        super(reader);
    }

    private Vector getContains() {
        return this.contains;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if (CONTAINS_KEY.equals(parameters[i].getType())) {
                    this.contains.addElement(parameters[i].getValue());
                } else if ("negate".equals(parameters[i].getType())) {
                    setNegate(Project.toBoolean(parameters[i].getValue()));
                }
            }
        }
    }

    private void setContains(Vector vector) {
        this.contains = vector;
    }

    public void addConfiguredContains(Contains contains) {
        this.contains.addElement(contains.getValue());
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        LineContains lineContains = new LineContains(reader);
        lineContains.setContains(getContains());
        lineContains.setNegate(isNegated());
        return lineContains;
    }

    public boolean isNegated() {
        return this.negate;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c;
        if (!getInitialized()) {
            initialize();
            setInitialized(true);
        }
        if (this.line != null) {
            c = this.line.charAt(0);
            if (this.line.length() == 1) {
                this.line = null;
            } else {
                this.line = this.line.substring(1);
            }
        } else {
            int size = this.contains.size();
            this.line = readLine();
            while (this.line != null) {
                boolean z = true;
                for (int i = 0; z && i < size; i++) {
                    z = this.line.indexOf((String) this.contains.elementAt(i)) >= 0;
                }
                if (isNegated() ^ z) {
                    break;
                }
                this.line = readLine();
            }
            c = 65535;
            if (this.line != null) {
                c = read();
            }
        }
        return c;
    }

    public void setNegate(boolean z) {
        this.negate = z;
    }
}
