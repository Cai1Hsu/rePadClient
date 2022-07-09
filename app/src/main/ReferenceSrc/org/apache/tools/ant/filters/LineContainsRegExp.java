package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.Vector;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.RegularExpression;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/filters/LineContainsRegExp.class */
public final class LineContainsRegExp extends BaseParamFilterReader implements ChainableReader {
    private static final String CS_KEY = "casesensitive";
    private static final String NEGATE_KEY = "negate";
    private static final String REGEXP_KEY = "regexp";
    private Vector regexps = new Vector();
    private String line = null;
    private boolean negate = false;
    private int regexpOptions = 0;

    public LineContainsRegExp() {
    }

    public LineContainsRegExp(Reader reader) {
        super(reader);
    }

    private Vector getRegexps() {
        return this.regexps;
    }

    private void initialize() {
        Parameter[] parameters = getParameters();
        if (parameters != null) {
            for (int i = 0; i < parameters.length; i++) {
                if ("regexp".equals(parameters[i].getType())) {
                    String value = parameters[i].getValue();
                    RegularExpression regularExpression = new RegularExpression();
                    regularExpression.setPattern(value);
                    this.regexps.addElement(regularExpression);
                } else if ("negate".equals(parameters[i].getType())) {
                    setNegate(Project.toBoolean(parameters[i].getValue()));
                } else if ("casesensitive".equals(parameters[i].getType())) {
                    setCaseSensitive(Project.toBoolean(parameters[i].getValue()));
                }
            }
        }
    }

    private void setRegexps(Vector vector) {
        this.regexps = vector;
    }

    public void addConfiguredRegexp(RegularExpression regularExpression) {
        this.regexps.addElement(regularExpression);
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        LineContainsRegExp lineContainsRegExp = new LineContainsRegExp(reader);
        lineContainsRegExp.setRegexps(getRegexps());
        lineContainsRegExp.setNegate(isNegated());
        lineContainsRegExp.setCaseSensitive(!RegexpUtil.hasFlag(this.regexpOptions, 256));
        return lineContainsRegExp;
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
            int size = this.regexps.size();
            this.line = readLine();
            while (this.line != null) {
                boolean z = true;
                for (int i = 0; z && i < size; i++) {
                    z = ((RegularExpression) this.regexps.elementAt(i)).getRegexp(getProject()).matches(this.line, this.regexpOptions);
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

    public void setCaseSensitive(boolean z) {
        this.regexpOptions = RegexpUtil.asOptions(z);
    }

    public void setNegate(boolean z) {
        this.negate = z;
    }
}
