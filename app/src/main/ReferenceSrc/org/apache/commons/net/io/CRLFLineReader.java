package org.apache.commons.net.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

/* loaded from: classes.jar:org/apache/commons/net/io/CRLFLineReader.class */
public final class CRLFLineReader extends BufferedReader {
    private static final char CR = '\r';
    private static final char LF = '\n';

    public CRLFLineReader(Reader reader) {
        super(reader);
    }

    @Override // java.io.BufferedReader
    public String readLine() throws IOException {
        String str;
        StringBuilder sb = new StringBuilder();
        boolean z = false;
        synchronized (this.lock) {
            while (true) {
                int read = read();
                if (read == -1) {
                    String sb2 = sb.toString();
                    str = sb2;
                    if (sb2.length() == 0) {
                        str = null;
                    }
                } else if (z && read == 10) {
                    str = sb.substring(0, sb.length() - 1);
                    break;
                } else {
                    z = read == 13;
                    sb.append((char) read);
                }
            }
        }
        return str;
    }
}
