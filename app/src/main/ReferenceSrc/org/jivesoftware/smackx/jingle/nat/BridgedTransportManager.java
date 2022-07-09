package org.jivesoftware.smackx.jingle.nat;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.listeners.CreatedJingleSessionListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionListener;
import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/BridgedTransportManager.class */
public class BridgedTransportManager extends JingleTransportManager implements JingleSessionListener, CreatedJingleSessionListener {
    Connection xmppConnection;

    public BridgedTransportManager(Connection connection) {
        this.xmppConnection = connection;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.JingleTransportManager
    protected TransportResolver createResolver(JingleSession jingleSession) {
        return new BridgedResolver(this.xmppConnection);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosed(String str, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosedOnError(XMPPException xMPPException, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.CreatedJingleSessionListener
    public void sessionCreated(JingleSession jingleSession) {
        jingleSession.addListener(this);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionDeclined(String str, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionEstablished(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        RTPBridge.relaySession(transportCandidate2.getConnection(), transportCandidate2.getSessionId(), transportCandidate2.getPassword(), transportCandidate, transportCandidate2);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionMediaReceived(JingleSession jingleSession, String str) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionRedirected(String str, JingleSession jingleSession) {
    }
}
