package org.jivesoftware.smackx.jingle.listeners;

import org.jivesoftware.smackx.jingle.media.PayloadType;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/listeners/JingleMediaListener.class */
public interface JingleMediaListener extends JingleListener {
    void mediaClosed(PayloadType payloadType);

    void mediaEstablished(PayloadType payloadType);
}
