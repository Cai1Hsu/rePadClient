package org.jivesoftware.smackx;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.MessageListener;

/* loaded from: classes.jar:org/jivesoftware/smackx/ChatStateListener.class */
public interface ChatStateListener extends MessageListener {
    void stateChanged(Chat chat, ChatState chatState);
}
