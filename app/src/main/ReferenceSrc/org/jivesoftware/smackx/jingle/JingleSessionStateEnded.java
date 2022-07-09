package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleError;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionStateEnded.class */
public class JingleSessionStateEnded extends JingleSessionState {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleSessionStateEnded.class);
    private static JingleSessionStateEnded INSTANCE = null;

    protected JingleSessionStateEnded() {
    }

    public static JingleSessionState getInstance() {
        JingleSessionStateEnded jingleSessionStateEnded;
        synchronized (JingleSessionStateEnded.class) {
            try {
                if (INSTANCE == null) {
                    INSTANCE = new JingleSessionStateEnded();
                }
                jingleSessionStateEnded = INSTANCE;
            } finally {
            }
        }
        return jingleSessionStateEnded;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public void enter() {
        LOGGER.debug("Session Ended");
        LOGGER.debug("-------------------------------------------------------------------");
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public void exit() {
    }

    @Override // org.jivesoftware.smackx.jingle.JingleSessionState
    public IQ processJingle(JingleSession jingleSession, Jingle jingle, JingleActionEnum jingleActionEnum) {
        return jingleSession.createJingleError(jingle, JingleError.MALFORMED_STANZA);
    }
}
