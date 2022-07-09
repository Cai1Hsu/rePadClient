package org.jivesoftware.smackx.jingle.mediaimpl.multi;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager.class */
public class MultiMediaManager extends JingleMediaManager {
    public static final String MEDIA_NAME = "Multi";
    private List<JingleMediaManager> managers = new ArrayList();
    private PayloadType preferredPayloadType = null;

    public MultiMediaManager(JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
    }

    public void addMediaManager(JingleMediaManager jingleMediaManager) {
        this.managers.add(jingleMediaManager);
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        JingleMediaSession jingleMediaSession;
        Iterator<JingleMediaManager> it = this.managers.iterator();
        while (true) {
            if (!it.hasNext()) {
                jingleMediaSession = null;
                break;
            }
            JingleMediaManager next = it.next();
            if (next.getPayloads().contains(payloadType)) {
                jingleMediaSession = next.createMediaSession(payloadType, transportCandidate, transportCandidate2, jingleSession);
                break;
            }
        }
        return jingleMediaSession;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public String getName() {
        return MEDIA_NAME;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public List<PayloadType> getPayloads() {
        ArrayList arrayList = new ArrayList();
        if (this.preferredPayloadType != null) {
            arrayList.add(this.preferredPayloadType);
        }
        for (JingleMediaManager jingleMediaManager : this.managers) {
            for (PayloadType payloadType : jingleMediaManager.getPayloads()) {
                if (!arrayList.contains(payloadType) && !payloadType.equals(this.preferredPayloadType)) {
                    arrayList.add(payloadType);
                }
            }
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public PayloadType getPreferredPayloadType() {
        return this.preferredPayloadType != null ? this.preferredPayloadType : super.getPreferredPayloadType();
    }

    public void removeMediaManager(JingleMediaManager jingleMediaManager) {
        this.managers.remove(jingleMediaManager);
    }

    public void setPreferredPayloadType(PayloadType payloadType) {
        this.preferredPayloadType = payloadType;
    }
}
