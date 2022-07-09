package org.apache.tools.ant.taskdefs.email;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/Message.class */
public class Message extends ProjectComponent {
    private StringBuffer buffer;
    private String charset;
    private File messageSource;
    private String mimeType;
    private boolean specified;

    public Message() {
        this.messageSource = null;
        this.buffer = new StringBuffer();
        this.mimeType = "text/plain";
        this.specified = false;
        this.charset = null;
    }

    public Message(File file) {
        this.messageSource = null;
        this.buffer = new StringBuffer();
        this.mimeType = "text/plain";
        this.specified = false;
        this.charset = null;
        this.messageSource = file;
    }

    public Message(String str) {
        this.messageSource = null;
        this.buffer = new StringBuffer();
        this.mimeType = "text/plain";
        this.specified = false;
        this.charset = null;
        addText(str);
    }

    public void addText(String str) {
        this.buffer.append(str);
    }

    public String getCharset() {
        return this.charset;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public boolean isMimeTypeSpecified() {
        return this.specified;
    }

    public void print(PrintStream printStream) throws IOException {
        BufferedWriter bufferedWriter = this.charset != null ? new BufferedWriter(new OutputStreamWriter(printStream, this.charset)) : new BufferedWriter(new OutputStreamWriter(printStream));
        if (this.messageSource != null) {
            FileReader fileReader = new FileReader(this.messageSource);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                bufferedWriter.write(getProject().replaceProperties(readLine));
                bufferedWriter.newLine();
            }
            fileReader.close();
        } else {
            bufferedWriter.write(getProject().replaceProperties(this.buffer.substring(0)));
            bufferedWriter.newLine();
        }
        bufferedWriter.flush();
    }

    public void setCharset(String str) {
        this.charset = str;
    }

    public void setMimeType(String str) {
        this.mimeType = str;
        this.specified = true;
    }

    public void setSrc(File file) {
        this.messageSource = file;
    }
}
