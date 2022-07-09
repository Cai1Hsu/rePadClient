package org.jivesoftware.smack;

/* loaded from: classes.jar:org/jivesoftware/smack/ConnectionListener.class */
public interface ConnectionListener {
    void connectionClosed();

    void connectionClosedOnError(Exception exc);

    void reconnectingIn(int i);

    void reconnectionFailed(Exception exc);

    void reconnectionSuccessful();
}
