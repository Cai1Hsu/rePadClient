package org.jivesoftware.smackx.jingle.listeners;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/listeners/JingleSessionListener.class */
public interface JingleSessionListener extends JingleListener {
    void sessionClosed(String str, JingleSession jingleSession);

    void sessionClosedOnError(XMPPException xMPPException, JingleSession jingleSession);

    void sessionDeclined(String str, JingleSession jingleSession);

    void sessionEstablished(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession);

    void sessionMediaReceived(JingleSession jingleSession, String str);

    void sessionRedirected(String str, JingleSession jingleSession);
}
