package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.packet.Jingle;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionRequest.class */
public class JingleSessionRequest {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleSessionRequest.class);
    private final Jingle jingle;
    private final JingleManager manager;

    public JingleSessionRequest(JingleManager jingleManager, Jingle jingle) {
        this.manager = jingleManager;
        this.jingle = jingle;
    }

    public JingleSession accept() throws XMPPException {
        JingleSession createIncomingJingleSession;
        synchronized (this) {
            synchronized (this.manager) {
                createIncomingJingleSession = this.manager.createIncomingJingleSession(this);
                createIncomingJingleSession.setSid(getSessionID());
                createIncomingJingleSession.updatePacketListener();
                createIncomingJingleSession.receivePacketAndRespond(getJingle());
            }
        }
        return createIncomingJingleSession;
    }

    public String getFrom() {
        return this.jingle.getFrom();
    }

    public Jingle getJingle() {
        return this.jingle;
    }

    public String getSessionID() {
        return this.jingle.getSid();
    }

    public void reject() {
        synchronized (this) {
            synchronized (this.manager) {
                try {
                    JingleSession createIncomingJingleSession = this.manager.createIncomingJingleSession(this);
                    createIncomingJingleSession.setSid(getSessionID());
                    createIncomingJingleSession.updatePacketListener();
                    createIncomingJingleSession.terminate("Declined");
                } catch (XMPPException e) {
                    LOGGER.error("", e);
                }
            }
        }
    }
}
