package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/util/LineTokenizer.class */
public class LineTokenizer extends ProjectComponent implements Tokenizer {
    private static final int NOT_A_CHAR = -2;
    private String lineEnd = "";
    private int pushed = -2;
    private boolean includeDelims = false;

    @Override // org.apache.tools.ant.util.Tokenizer
    public String getPostToken() {
        return this.includeDelims ? "" : this.lineEnd;
    }

    @Override // org.apache.tools.ant.util.Tokenizer
    public String getToken(Reader reader) throws IOException {
        int read;
        boolean z;
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
            this.lineEnd = "";
            StringBuffer stringBuffer2 = new StringBuffer();
            boolean z2 = false;
            while (true) {
                z = z2;
                if (read == -1) {
                    break;
                } else if (!z2) {
                    if (read == 13) {
                        z2 = true;
                    } else if (read == 10) {
                        this.lineEnd = "\n";
                        z = z2;
                        break;
                    } else {
                        stringBuffer2.append((char) read);
                    }
                    read = reader.read();
                } else {
                    z = false;
                    if (read == 10) {
                        this.lineEnd = "\r\n";
                    } else {
                        this.pushed = read;
                        this.lineEnd = "\r";
                    }
                }
            }
            if (read == -1 && z) {
                this.lineEnd = "\r";
            }
            if (this.includeDelims) {
                stringBuffer2.append(this.lineEnd);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }

    public void setIncludeDelims(boolean z) {
        this.includeDelims = z;
    }
}
