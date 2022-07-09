package org.apache.tools.ant.util;

import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.regexp.RegexpMatcher;
import org.apache.tools.ant.util.regexp.RegexpMatcherFactory;
import org.apache.tools.ant.util.regexp.RegexpUtil;

/* loaded from: classes.jar:org/apache/tools/ant/util/RegexpPatternMapper.class */
public class RegexpPatternMapper implements FileNameMapper {
    private static final int DECIMAL = 10;
    protected RegexpMatcher reg;
    protected char[] to = null;
    protected StringBuffer result = new StringBuffer();
    private boolean handleDirSep = false;
    private int regexpOptions = 0;

    public RegexpPatternMapper() throws BuildException {
        this.reg = null;
        this.reg = new RegexpMatcherFactory().newRegexpMatcher();
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        String str2 = str;
        if (this.handleDirSep) {
            str2 = str;
            if (str.indexOf("\\") != -1) {
                str2 = str.replace('\\', '/');
            }
        }
        return (this.reg == null || this.to == null || !this.reg.matches(str2, this.regexpOptions)) ? null : new String[]{replaceReferences(str2)};
    }

    protected String replaceReferences(String str) {
        Vector groups = this.reg.getGroups(str, this.regexpOptions);
        this.result.setLength(0);
        int i = 0;
        while (i < this.to.length) {
            if (this.to[i] == '\\') {
                i++;
                if (i < this.to.length) {
                    int digit = Character.digit(this.to[i], 10);
                    if (digit > -1) {
                        this.result.append((String) groups.elementAt(digit));
                    } else {
                        this.result.append(this.to[i]);
                    }
                } else {
                    this.result.append('\\');
                }
            } else {
                this.result.append(this.to[i]);
            }
            i++;
        }
        return this.result.substring(0);
    }

    public void setCaseSensitive(boolean z) {
        this.regexpOptions = RegexpUtil.asOptions(z);
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) throws BuildException {
        if (str != null) {
            try {
                this.reg.setPattern(str);
                return;
            } catch (NoClassDefFoundError e) {
                throw new BuildException("Cannot load regular expression matcher", e);
            }
        }
        throw new BuildException("this mapper requires a 'from' attribute");
    }

    public void setHandleDirSep(boolean z) {
        this.handleDirSep = z;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
        if (str != null) {
            this.to = str.toCharArray();
            return;
        }
        throw new BuildException("this mapper requires a 'to' attribute");
    }
}
