package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.packet.JingleError;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleException.class */
public class JingleException extends XMPPException {
    private static final long serialVersionUID = -1521230401958103382L;
    private final JingleError error;

    public JingleException() {
        this.error = null;
    }

    public JingleException(String str) {
        super(str);
        this.error = null;
    }

    public JingleException(JingleError jingleError) {
        this.error = jingleError;
    }

    public JingleError getError() {
        return this.error;
    }
}
