package org.jivesoftware.smackx.jingle.listeners;

import org.jivesoftware.smackx.jingle.JingleSessionRequest;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/listeners/JingleSessionRequestListener.class */
public interface JingleSessionRequestListener extends JingleListener {
    void sessionRequested(JingleSessionRequest jingleSessionRequest);
}
