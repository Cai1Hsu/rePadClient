package org.jivesoftware.smackx.jingle.listeners;

import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/listeners/JingleTransportListener.class */
public interface JingleTransportListener extends JingleListener {
    void transportClosed(TransportCandidate transportCandidate);

    void transportClosedOnError(XMPPException xMPPException);

    void transportEstablished(TransportCandidate transportCandidate, TransportCandidate transportCandidate2);
}
