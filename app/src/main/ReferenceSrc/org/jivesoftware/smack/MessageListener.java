package org.jivesoftware.smack;

import org.jivesoftware.smack.packet.Message;

/* loaded from: classes.jar:org/jivesoftware/smack/MessageListener.class */
public interface MessageListener {
    void processMessage(Chat chat, Message message);
}
