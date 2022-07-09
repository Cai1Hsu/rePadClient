package org.jivesoftware.smackx.jingle.mediaimpl.test;

import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession.class */
public class TestMediaSession extends JingleMediaSession {
    public TestMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, String str, JingleSession jingleSession) {
        super(payloadType, transportCandidate, transportCandidate2, "Test", jingleSession);
        initialize();
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void initialize() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void setTrasmit(boolean z) {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void startTrasmit() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopReceive() {
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaSession
    public void stopTrasmit() {
    }
}
