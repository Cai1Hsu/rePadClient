package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/util/StringTokenizer.class */
public class StringTokenizer extends ProjectComponent implements Tokenizer {
    private static final int NOT_A_CHAR = -2;
    private String intraString = "";
    private int pushed = -2;
    private char[] delims = null;
    private boolean delimsAreTokens = false;
    private boolean suppressDelims = false;
    private boolean includeDelims = false;

    private boolean isDelim(char c) {
        boolean z;
        if (this.delims != null) {
            int i = 0;
            while (true) {
                if (i >= this.delims.length) {
                    z = false;
                    break;
                } else if (this.delims[i] == c) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
        } else {
            z = Character.isWhitespace(c);
        }
        return z;
    }

    @Override // org.apache.tools.ant.util.Tokenizer
    public String getPostToken() {
        return (this.suppressDelims || this.includeDelims) ? "" : this.intraString;
    }

    @Override // org.apache.tools.ant.util.Tokenizer
    public String getToken(Reader reader) throws IOException {
        int read;
        String stringBuffer;
        if (this.pushed != -2) {
            read = this.pushed;
            this.pushed = -2;
        } else {
            read = reader.read();
        }
        if (read == -1) {
            stringBuffer = null;
        } else {
            boolean z = true;
            this.intraString = "";
            StringBuffer stringBuffer2 = new StringBuffer();
            StringBuffer stringBuffer3 = new StringBuffer();
            while (true) {
                if (read == -1) {
                    break;
                }
                char c = (char) read;
                boolean isDelim = isDelim(c);
                if (!z) {
                    if (!isDelim) {
                        this.pushed = read;
                        break;
                    }
                    stringBuffer3.append(c);
                    read = reader.read();
                } else {
                    if (!isDelim) {
                        stringBuffer2.append(c);
                    } else if (!this.delimsAreTokens) {
                        stringBuffer3.append(c);
                        z = false;
                    } else if (stringBuffer2.length() == 0) {
                        stringBuffer2.append(c);
                    } else {
                        this.pushed = read;
                    }
                    read = reader.read();
                }
            }
            this.intraString = stringBuffer3.toString();
            if (this.includeDelims) {
                stringBuffer2.append(this.intraString);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    public void setDelims(String str) {
        this.delims = StringUtils.resolveBackSlash(str).toCharArray();
    }

    public void setDelimsAreTokens(boolean z) {
        this.delimsAreTokens = z;
    }

    public void setIncludeDelims(boolean z) {
        this.includeDelims = z;
    }

    public void setSuppressDelims(boolean z) {
        this.suppressDelims = z;
    }
}
