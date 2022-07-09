package org.apache.tools.ant.util;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/GlobPatternMapper.class */
public class GlobPatternMapper implements FileNameMapper {
    protected int postfixLength;
    protected int prefixLength;
    protected String fromPrefix = null;
    protected String fromPostfix = null;
    protected String toPrefix = null;
    protected String toPostfix = null;
    private boolean fromContainsStar = false;
    private boolean toContainsStar = false;
    private boolean handleDirSep = false;
    private boolean caseSensitive = true;

    private String modifyName(String str) {
        String str2 = str;
        if (!this.caseSensitive) {
            str2 = str.toLowerCase();
        }
        String str3 = str2;
        if (this.handleDirSep) {
            str3 = str2;
            if (str2.indexOf(92) != -1) {
                str3 = str2.replace('\\', '/');
            }
        }
        return str3;
    }

    protected String extractVariablePart(String str) {
        return str.substring(this.prefixLength, str.length() - this.postfixLength);
    }

    public boolean getHandleDirSep() {
        return this.handleDirSep;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        String[] strArr;
        String modifyName = modifyName(str);
        if (this.fromPrefix == null || str.length() < this.prefixLength + this.postfixLength || ((!this.fromContainsStar && !modifyName.equals(modifyName(this.fromPrefix))) || (this.fromContainsStar && (!modifyName.startsWith(modifyName(this.fromPrefix)) || !modifyName.endsWith(modifyName(this.fromPostfix)))))) {
            strArr = null;
        } else {
            strArr = new String[]{new StringBuffer().append(this.toPrefix).append(this.toContainsStar ? new StringBuffer().append(extractVariablePart(str)).append(this.toPostfix).toString() : "").toString()};
        }
        return strArr;
    }

    public void setCaseSensitive(boolean z) {
        this.caseSensitive = z;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) {
        if (str != null) {
            int lastIndexOf = str.lastIndexOf("*");
            if (lastIndexOf == -1) {
                this.fromPrefix = str;
                this.fromPostfix = "";
            } else {
                this.fromPrefix = str.substring(0, lastIndexOf);
                this.fromPostfix = str.substring(lastIndexOf + 1);
                this.fromContainsStar = true;
            }
            this.prefixLength = this.fromPrefix.length();
            this.postfixLength = this.fromPostfix.length();
            return;
        }
        throw new BuildException("this mapper requires a 'from' attribute");
    }

    public void setHandleDirSep(boolean z) {
        this.handleDirSep = z;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
        if (str != null) {
            int lastIndexOf = str.lastIndexOf("*");
            if (lastIndexOf == -1) {
                this.toPrefix = str;
                this.toPostfix = "";
                return;
            }
            this.toPrefix = str.substring(0, lastIndexOf);
            this.toPostfix = str.substring(lastIndexOf + 1);
            this.toContainsStar = true;
            return;
        }
        throw new BuildException("this mapper requires a 'to' attribute");
    }
}
