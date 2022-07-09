package org.apache.tools.ant.taskdefs.email;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Enumeration;
import org.apache.http.protocol.HTTP;
import org.apache.tools.ant.BuildException;
import org.apache.tools.mail.MailMessage;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/email/PlainMailer.class */
class PlainMailer extends Mailer {
    PlainMailer() {
    }

    private void badRecipient(String str, IOException iOException) {
        String stringBuffer = new StringBuffer().append("Failed to send mail to ").append(str).toString();
        if (shouldIgnoreInvalidRecipients()) {
            String stringBuffer2 = new StringBuffer().append(stringBuffer).append(" because of :").append(iOException.getMessage()).toString();
            if (this.task != null) {
                this.task.log(stringBuffer2, 1);
                return;
            } else {
                System.err.println(stringBuffer2);
                return;
            }
        }
        throw new BuildException(stringBuffer, iOException);
    }

    protected void attach(File file, PrintStream printStream) throws IOException {
        if (!file.exists() || !file.canRead()) {
            throw new BuildException(new StringBuffer().append("File \"").append(file.getName()).append("\" does not exist or is not ").append("readable.").toString());
        }
        if (this.includeFileNames) {
            printStream.println();
            String name = file.getName();
            int length = name.length();
            printStream.println(name);
            for (int i = 0; i < length; i++) {
                printStream.print('=');
            }
            printStream.println();
        }
        byte[] bArr = new byte[1024];
        FileInputStream fileInputStream = new FileInputStream(file);
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream, bArr.length);
            while (true) {
                int read = bufferedInputStream.read(bArr);
                if (read == -1) {
                    return;
                }
                printStream.write(bArr, 0, read);
            }
        } finally {
            fileInputStream.close();
        }
    }

    @Override // org.apache.tools.ant.taskdefs.email.Mailer
    public void send() {
        try {
            MailMessage mailMessage = new MailMessage(this.host, this.port);
            mailMessage.from(this.from.toString());
            boolean z = false;
            Enumeration elements = this.replyToList.elements();
            while (elements.hasMoreElements()) {
                mailMessage.replyto(elements.nextElement().toString());
            }
            Enumeration elements2 = this.toList.elements();
            while (elements2.hasMoreElements()) {
                String obj = elements2.nextElement().toString();
                try {
                    mailMessage.to(obj);
                    z = true;
                } catch (IOException e) {
                    badRecipient(obj, e);
                }
            }
            Enumeration elements3 = this.ccList.elements();
            while (elements3.hasMoreElements()) {
                String obj2 = elements3.nextElement().toString();
                try {
                    mailMessage.cc(obj2);
                    z = true;
                } catch (IOException e2) {
                    badRecipient(obj2, e2);
                }
            }
            Enumeration elements4 = this.bccList.elements();
            while (elements4.hasMoreElements()) {
                String obj3 = elements4.nextElement().toString();
                try {
                    mailMessage.bcc(obj3);
                    z = true;
                } catch (IOException e3) {
                    badRecipient(obj3, e3);
                }
            }
            if (!z) {
                throw new BuildException("Couldn't reach any recipient");
            }
            if (this.subject != null) {
                mailMessage.setSubject(this.subject);
            }
            mailMessage.setHeader(HTTP.DATE_HEADER, getDate());
            if (this.message.getCharset() != null) {
                mailMessage.setHeader("Content-Type", new StringBuffer().append(this.message.getMimeType()).append("; charset=\"").append(this.message.getCharset()).append("\"").toString());
            } else {
                mailMessage.setHeader("Content-Type", this.message.getMimeType());
            }
            if (this.headers != null) {
                Enumeration elements5 = this.headers.elements();
                while (elements5.hasMoreElements()) {
                    Header header = (Header) elements5.nextElement();
                    mailMessage.setHeader(header.getName(), header.getValue());
                }
            }
            PrintStream printStream = mailMessage.getPrintStream();
            this.message.print(printStream);
            Enumeration elements6 = this.files.elements();
            while (elements6.hasMoreElements()) {
                attach((File) elements6.nextElement(), printStream);
            }
            mailMessage.sendAndClose();
        } catch (IOException e4) {
            throw new BuildException("IO error sending mail", e4);
        }
    }
}
