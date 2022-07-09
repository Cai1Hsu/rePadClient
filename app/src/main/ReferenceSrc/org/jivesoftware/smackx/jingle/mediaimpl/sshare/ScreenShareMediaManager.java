package org.jivesoftware.smackx.jingle.mediaimpl.sshare;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageDecoder;
import org.jivesoftware.smackx.jingle.mediaimpl.sshare.api.ImageEncoder;
import org.jivesoftware.smackx.jingle.nat.JingleTransportManager;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager.class */
public class ScreenShareMediaManager extends JingleMediaManager {
    public static final String MEDIA_NAME = "ScreenShare";
    private List<PayloadType> payloads = new ArrayList();
    private ImageDecoder decoder = null;
    private ImageEncoder encoder = null;

    public ScreenShareMediaManager(JingleTransportManager jingleTransportManager) {
        super(jingleTransportManager);
        setupPayloads();
    }

    private void setupPayloads() {
        this.payloads.add(new PayloadType.Audio(30, "sshare"));
    }

    @Override // org.jivesoftware.smackx.jingle.media.JingleMediaManager
    public JingleMediaSession createMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
        ScreenShareSession screenShareSession = new ScreenShareSession(payloadType, transportCandidate, transportCandidate2, "Screen", jingleSession);
        if (this.encoder != null) {
            screenShareSession.setEncoder(this.encoder);
        }
        if (this.decoder != null) {
            screenShareSession.setDecoder(this.decoder);
        }
        return screenShareSession;
    }

    public ImageDecoder getDecoder() {
        return this.decoder;
    }

    public ImageEncoder getEncoder() {
        return this.encoder;
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
        return super.getPreferredPayloadType();
    }

    public void setDecoder(ImageDecoder imageDecoder) {
        this.decoder = imageDecoder;
    }

    public void setEncoder(ImageEncoder imageEncoder) {
        this.encoder = imageEncoder;
    }
}
