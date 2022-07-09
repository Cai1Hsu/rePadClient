package org.apache.tools.mail;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.taskdefs.Manifest;

/* loaded from: classes.jar:org/apache/tools/mail/MailMessage.class */
public class MailMessage {
    public static final String DEFAULT_HOST = "localhost";
    public static final int DEFAULT_PORT = 25;
    private static final int OK_DATA = 354;
    private static final int OK_DOT = 250;
    private static final int OK_FROM = 250;
    private static final int OK_HELO = 250;
    private static final int OK_QUIT = 221;
    private static final int OK_RCPT_1 = 250;
    private static final int OK_RCPT_2 = 251;
    private static final int OK_READY = 220;
    private Vector cc;
    private String from;
    private Vector headersKeys;
    private Vector headersValues;
    private String host;
    private SmtpResponseReader in;
    private MailPrintStream out;
    private int port;
    private Vector replyto;
    private Socket socket;
    private Vector to;

    public MailMessage() throws IOException {
        this(DEFAULT_HOST, 25);
    }

    public MailMessage(String str) throws IOException {
        this(str, 25);
    }

    public MailMessage(String str, int i) throws IOException {
        this.port = 25;
        this.port = i;
        this.host = str;
        this.replyto = new Vector();
        this.to = new Vector();
        this.cc = new Vector();
        this.headersKeys = new Vector();
        this.headersValues = new Vector();
        connect();
        sendHelo();
    }

    static String sanitizeAddress(String str) {
        int i;
        int i2;
        int i3;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int length = str.length();
        int i7 = 0;
        while (i7 < length) {
            char charAt = str.charAt(i7);
            if (charAt == '(') {
                int i8 = i4 + 1;
                i = i6;
                i2 = i8;
                i3 = i5;
                if (i5 == 0) {
                    i = i7;
                    i3 = i5;
                    i2 = i8;
                }
            } else if (charAt == ')') {
                int i9 = i4 - 1;
                i = i6;
                i2 = i9;
                i3 = i5;
                if (i6 == 0) {
                    i3 = i7 + 1;
                    i = i6;
                    i2 = i9;
                }
            } else if (i4 == 0 && charAt == '<') {
                i3 = i7 + 1;
                i = i6;
                i2 = i4;
            } else {
                i = i6;
                i2 = i4;
                i3 = i5;
                if (i4 == 0) {
                    i = i6;
                    i2 = i4;
                    i3 = i5;
                    if (charAt == '>') {
                        i = i7;
                        i2 = i4;
                        i3 = i5;
                    }
                }
            }
            i7++;
            i6 = i;
            i4 = i2;
            i5 = i3;
        }
        int i10 = i6;
        if (i6 == 0) {
            i10 = length;
        }
        return str.substring(i5, i10);
    }

    public void bcc(String str) throws IOException {
        sendRcpt(str);
    }

    public void cc(String str) throws IOException {
        sendRcpt(str);
        this.cc.addElement(str);
    }

    void connect() throws IOException {
        this.socket = new Socket(this.host, this.port);
        this.out = new MailPrintStream(new BufferedOutputStream(this.socket.getOutputStream()));
        this.in = new SmtpResponseReader(this.socket.getInputStream());
        getReady();
    }

    void disconnect() throws IOException {
        if (this.out != null) {
            this.out.close();
        }
        if (this.in != null) {
            try {
                this.in.close();
            } catch (IOException e) {
            }
        }
        if (this.socket != null) {
            try {
                this.socket.close();
            } catch (IOException e2) {
            }
        }
    }

    void flushHeaders() throws IOException {
        int size = this.headersKeys.size();
        for (int i = 0; i < size; i++) {
            this.out.println(new StringBuffer().append((String) this.headersKeys.elementAt(i)).append(": ").append((String) this.headersValues.elementAt(i)).toString());
        }
        this.out.println();
        this.out.flush();
    }

    public void from(String str) throws IOException {
        sendFrom(str);
        this.from = str;
    }

    public PrintStream getPrintStream() throws IOException {
        setFromHeader();
        setReplyToHeader();
        setToHeader();
        setCcHeader();
        setHeader("X-Mailer", "org.apache.tools.mail.MailMessage (ant.apache.org)");
        sendData();
        flushHeaders();
        return this.out;
    }

    void getReady() throws IOException {
        String response = this.in.getResponse();
        if (!isResponseOK(response, new int[]{220})) {
            throw new IOException(new StringBuffer().append("Didn't get introduction from server: ").append(response).toString());
        }
    }

    boolean isResponseOK(String str, int[] iArr) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= iArr.length) {
                z = false;
                break;
            } else if (str.startsWith(new StringBuffer().append("").append(iArr[i]).toString())) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    public void replyto(String str) {
        this.replyto.addElement(str);
    }

    void send(String str, int[] iArr) throws IOException {
        this.out.rawPrint(new StringBuffer().append(str).append("\r\n").toString());
        String response = this.in.getResponse();
        if (!isResponseOK(response, iArr)) {
            throw new IOException(new StringBuffer().append("Unexpected reply to command: ").append(str).append(": ").append(response).toString());
        }
    }

    public void sendAndClose() throws IOException {
        try {
            sendDot();
            sendQuit();
        } finally {
            disconnect();
        }
    }

    void sendData() throws IOException {
        send("DATA", new int[]{354});
    }

    void sendDot() throws IOException {
        send("\r\n.", new int[]{250});
    }

    void sendFrom(String str) throws IOException {
        send(new StringBuffer().append("MAIL FROM: <").append(sanitizeAddress(str)).append(">").toString(), new int[]{250});
    }

    void sendHelo() throws IOException {
        send(new StringBuffer().append("HELO ").append(InetAddress.getLocalHost().getHostName()).toString(), new int[]{250});
    }

    void sendQuit() throws IOException {
        try {
            send("QUIT", new int[]{221});
        } catch (IOException e) {
            throw new ErrorInQuitException(e);
        }
    }

    void sendRcpt(String str) throws IOException {
        send(new StringBuffer().append("RCPT TO: <").append(sanitizeAddress(str)).append(">").toString(), new int[]{250, 251});
    }

    void setCcHeader() {
        if (!this.cc.isEmpty()) {
            setHeader("Cc", vectorToList(this.cc));
        }
    }

    void setFromHeader() {
        setHeader(Manifest.ATTRIBUTE_FROM, this.from);
    }

    public void setHeader(String str, String str2) {
        this.headersKeys.add(str);
        this.headersValues.add(str2);
    }

    public void setPort(int i) {
        this.port = i;
    }

    void setReplyToHeader() {
        if (!this.replyto.isEmpty()) {
            setHeader("Reply-To", vectorToList(this.replyto));
        }
    }

    public void setSubject(String str) {
        setHeader("Subject", str);
    }

    void setToHeader() {
        if (!this.to.isEmpty()) {
            setHeader("To", vectorToList(this.to));
        }
    }

    public void to(String str) throws IOException {
        sendRcpt(str);
        this.to.addElement(str);
    }

    String vectorToList(Vector vector) {
        StringBuffer stringBuffer = new StringBuffer();
        Enumeration elements = vector.elements();
        while (elements.hasMoreElements()) {
            stringBuffer.append(elements.nextElement());
            if (elements.hasMoreElements()) {
                stringBuffer.append(", ");
            }
        }
        return stringBuffer.toString();
    }
}
