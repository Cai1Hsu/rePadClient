package org.jivesoftware.smackx.jingle.mediaimpl.test;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager.class */
public class TestMediaManager extends JingleMediaManager {
    public static final String MEDIA_NAME = "TestMedia";
    private List<PayloadType> payloads = new ArrayList();
    private PayloadType preferredPayloadType = null;

    public TestMediaManager(JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        return new TestMediaSession(payloadType, transportCandidate, transportCandidate2, "", jingleSession);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public String getName() {
        return MEDIA_NAME;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public List<PayloadType> getPayloads() {
        return this.payloads;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public PayloadType getPreferredPayloadType() {
        return this.preferredPayloadType != null ? this.preferredPayloadType : super.getPreferredPayloadType();
    }

    public void setPayloads(List<PayloadType> list) {
        this.payloads.addAll(list);
    }

    public void setPreferredPayloadType(PayloadType payloadType) {
        this.preferredPayloadType = payloadType;
    }
}
