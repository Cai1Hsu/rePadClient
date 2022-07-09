package org.jivesoftware.smackx;

/* loaded from: classes.jar:org/jivesoftware/smackx/MessageEventRequestListener.class */
public interface MessageEventRequestListener {
    void composingNotificationRequested(String str, String str2, MessageEventManager messageEventManager);

    void deliveredNotificationRequested(String str, String str2, MessageEventManager messageEventManager);

    void displayedNotificationRequested(String str, String str2, MessageEventManager messageEventManager);

    void offlineNotificationRequested(String str, String str2, MessageEventManager messageEventManager);
}
