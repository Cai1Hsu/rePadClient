package org.jivesoftware.smackx.jingle.media;

import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/JingleMediaManager.class */
public abstract class JingleMediaManager {
    public static final String MEDIA_NAME = "JingleMediaManager";
    private JingleTransportManager transportManager;

    public JingleMediaManager(JingleTransportManager jingleTransportManager) {
        this.transportManager = jingleTransportManager;
    }

    public abstract JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession);

    public String getName() {
        return MEDIA_NAME;
    }

    public abstract List<PayloadType> getPayloads();

    public PayloadType getPreferredPayloadType() {
        return getPayloads().size() > 0 ? getPayloads().get(0) : null;
    }

    public JingleTransportManager getTransportManager() {
        return this.transportManager;
    }
}
