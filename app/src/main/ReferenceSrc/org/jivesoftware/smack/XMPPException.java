package org.jivesoftware.smack;

import java.io.PrintStream;
import java.io.PrintWriter;
import org.jivesoftware.smack.packet.StreamError;
import org.jivesoftware.smack.packet.XMPPError;

/* loaded from: classes.jar:org/jivesoftware/smack/XMPPException.class */
public class XMPPException extends Exception {
    private static final long serialVersionUID = 6881651633890968625L;
    private XMPPError error;
    private SmackError smackError;
    private StreamError streamError;
    private Throwable wrappedThrowable;

    public XMPPException() {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
    }

    public XMPPException(String str) {
        super(str);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
    }

    public XMPPException(String str, Throwable th) {
        super(str);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.wrappedThrowable = th;
    }

    public XMPPException(String str, XMPPError xMPPError) {
        super(str);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.error = xMPPError;
    }

    public XMPPException(String str, XMPPError xMPPError, Throwable th) {
        super(str);
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.error = xMPPError;
        this.wrappedThrowable = th;
    }

    public XMPPException(Throwable th) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.wrappedThrowable = th;
    }

    public XMPPException(SmackError smackError) {
        super(smackError.getErrorMessage());
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.smackError = smackError;
    }

    public XMPPException(StreamError streamError) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.streamError = streamError;
    }

    public XMPPException(XMPPError xMPPError) {
        this.streamError = null;
        this.error = null;
        this.wrappedThrowable = null;
        this.smackError = null;
        this.error = xMPPError;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String str;
        String message = super.getMessage();
        if (message != null || this.error == null) {
            str = message;
            if (message == null) {
                str = message;
                if (this.streamError != null) {
                    str = this.streamError.toString();
                }
            }
        } else {
            str = this.error.toString();
        }
        return str;
    }

    public SmackError getSmackError() {
        return this.smackError;
    }

    public StreamError getStreamError() {
        return this.streamError;
    }

    public Throwable getWrappedThrowable() {
        return this.wrappedThrowable;
    }

    public XMPPError getXMPPError() {
        return this.error;
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream printStream) {
        super.printStackTrace(printStream);
        if (this.wrappedThrowable != null) {
            printStream.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(printStream);
        }
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter printWriter) {
        super.printStackTrace(printWriter);
        if (this.wrappedThrowable != null) {
            printWriter.println("Nested Exception: ");
            this.wrappedThrowable.printStackTrace(printWriter);
        }
    }

    @Override // java.lang.Throwable
    public String toString() {
        StringBuilder sb = new StringBuilder();
        String message = super.getMessage();
        if (message != null) {
            sb.append(message).append(": ");
        }
        if (this.error != null) {
            sb.append(this.error);
        }
        if (this.streamError != null) {
            sb.append(this.streamError);
        }
        if (this.wrappedThrowable != null) {
            sb.append("\n  -- caused by: ").append(this.wrappedThrowable);
        }
        return sb.toString();
    }
}
