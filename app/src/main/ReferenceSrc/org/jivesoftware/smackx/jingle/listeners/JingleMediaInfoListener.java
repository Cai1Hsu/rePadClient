package org.jivesoftware.smackx.jingle.listeners;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/listeners/JingleMediaInfoListener.class */
public interface JingleMediaInfoListener extends JingleListener {
    void mediaInfoBusy();

    void mediaInfoHold();

    void mediaInfoMute();

    void mediaInfoQueued();

    void mediaInfoRinging();
}
