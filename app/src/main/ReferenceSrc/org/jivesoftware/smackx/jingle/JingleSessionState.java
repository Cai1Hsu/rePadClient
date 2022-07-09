package org.jivesoftware.smackx.jingle;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.packet.Jingle;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSessionState.class */
public abstract class JingleSessionState {
    public static JingleSessionState getInstance() {
        return null;
    }

    public abstract void enter();

    public abstract void exit();

    public abstract IQ processJingle(JingleSession jingleSession, Jingle jingle, JingleActionEnum jingleActionEnum);

    public String toString() {
        return getClass().getSimpleName();
    }
}
