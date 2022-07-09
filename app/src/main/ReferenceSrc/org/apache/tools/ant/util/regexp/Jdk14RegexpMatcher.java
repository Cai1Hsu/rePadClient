package org.apache.tools.ant.util.regexp;

import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/Jdk14RegexpMatcher.class */
public class Jdk14RegexpMatcher implements RegexpMatcher {
    private String pattern;

    protected Pattern getCompiledPattern(int i) throws BuildException {
        try {
            return Pattern.compile(this.pattern, getCompilerOptions(i));
        } catch (PatternSyntaxException e) {
            throw new BuildException(e);
        }
    }

    protected int getCompilerOptions(int i) {
        int i2 = 1;
        if (RegexpUtil.hasFlag(i, 256)) {
            i2 = 1 | 2;
        }
        int i3 = i2;
        if (RegexpUtil.hasFlag(i, 4096)) {
            i3 = i2 | 8;
        }
        int i4 = i3;
        if (RegexpUtil.hasFlag(i, 65536)) {
            i4 = i3 | 32;
        }
        return i4;
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public Vector getGroups(String str) throws BuildException {
        return getGroups(str, 0);
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public Vector getGroups(String str, int i) throws BuildException {
        Vector vector;
        Matcher matcher = getCompiledPattern(i).matcher(str);
        if (matcher.find()) {
            Vector vector2 = new Vector();
            int groupCount = matcher.groupCount();
            int i2 = 0;
            while (true) {
                vector = vector2;
                if (i2 > groupCount) {
                    break;
                }
                String group = matcher.group(i2);
                String str2 = group;
                if (group == null) {
                    str2 = "";
                }
                vector2.addElement(str2);
                i2++;
            }
        } else {
            vector = null;
        }
        return vector;
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public String getPattern() {
        return this.pattern;
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public boolean matches(String str) throws BuildException {
        return matches(str, 0);
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public boolean matches(String str, int i) throws BuildException {
        try {
            return getCompiledPattern(i).matcher(str).find();
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    @Override // org.apache.tools.ant.util.regexp.RegexpMatcher
    public void setPattern(String str) {
        this.pattern = str;
    }
}
