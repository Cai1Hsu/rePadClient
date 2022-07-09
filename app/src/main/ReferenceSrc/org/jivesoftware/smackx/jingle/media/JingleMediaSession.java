package org.jivesoftware.smackx.jingle.media;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/media/JingleMediaSession.class */
public abstract class JingleMediaSession {
    private JingleSession jingleSession;
    private TransportCandidate local;
    private String mediaLocator;
    private List<MediaReceivedListener> mediaReceivedListeners = new ArrayList();
    private PayloadType payloadType;
    private TransportCandidate remote;

    public JingleMediaSession(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, String str, JingleSession jingleSession) {
        this.local = transportCandidate2;
        this.remote = transportCandidate;
        this.payloadType = payloadType;
        this.mediaLocator = str;
        this.jingleSession = jingleSession;
    }

    public void addMediaReceivedListener(MediaReceivedListener mediaReceivedListener) {
        this.mediaReceivedListeners.add(mediaReceivedListener);
    }

    public JingleSession getJingleSession() {
        return this.jingleSession;
    }

    public TransportCandidate getLocal() {
        return this.local;
    }

    public String getMediaLocator() {
        return this.mediaLocator;
    }

    public PayloadType getPayloadType() {
        return this.payloadType;
    }

    public TransportCandidate getRemote() {
        return this.remote;
    }

    public abstract void initialize();

    public void mediaReceived(String str) {
        for (MediaReceivedListener mediaReceivedListener : this.mediaReceivedListeners) {
            mediaReceivedListener.mediaReceived(str);
        }
    }

    public void removeAllMediaReceivedListener() {
        this.mediaReceivedListeners.clear();
    }

    public void removeMediaReceivedListener(MediaReceivedListener mediaReceivedListener) {
        this.mediaReceivedListeners.remove(mediaReceivedListener);
    }

    public void setMediaLocator(String str) {
        this.mediaLocator = str;
    }

    public abstract void setTrasmit(boolean z);

    public abstract void startReceive();

    public abstract void startTrasmit();

    public abstract void stopReceive();

    public abstract void stopTrasmit();
}
