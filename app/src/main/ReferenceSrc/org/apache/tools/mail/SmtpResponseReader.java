package org.apache.tools.mail;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/* loaded from: classes.jar:org/apache/tools/mail/SmtpResponseReader.class */
public class SmtpResponseReader {
    protected BufferedReader reader;
    private StringBuffer result = new StringBuffer();

    public SmtpResponseReader(InputStream inputStream) {
        this.reader = null;
        this.reader = new BufferedReader(new InputStreamReader(inputStream));
    }

    private void append(String str) {
        if (str.length() > 4) {
            this.result.append(str.substring(4));
            this.result.append(" ");
        }
    }

    public void close() throws IOException {
        this.reader.close();
    }

    public String getResponse() throws IOException {
        this.result.setLength(0);
        String readLine = this.reader.readLine();
        String str = readLine;
        if (readLine != null) {
            str = readLine;
            if (readLine.length() >= 3) {
                this.result.append(readLine.substring(0, 3));
                this.result.append(" ");
                str = readLine;
            }
        }
        while (str != null) {
            append(str);
            if (!hasMoreLines(str)) {
                break;
            }
            str = this.reader.readLine();
        }
        return this.result.toString().trim();
    }

    protected boolean hasMoreLines(String str) {
        return str.length() > 3 && str.charAt(3) == '-';
    }
}
