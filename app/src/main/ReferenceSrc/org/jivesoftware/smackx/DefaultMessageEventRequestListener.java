package org.jivesoftware.smackx;

/* loaded from: classes.jar:org/jivesoftware/smackx/DefaultMessageEventRequestListener.class */
public class DefaultMessageEventRequestListener implements MessageEventRequestListener {
    @Override // org.jivesoftware.smackx.MessageEventRequestListener
    public void composingNotificationRequested(String str, String str2, MessageEventManager messageEventManager) {
    }

    @Override // org.jivesoftware.smackx.MessageEventRequestListener
    public void deliveredNotificationRequested(String str, String str2, MessageEventManager messageEventManager) {
        messageEventManager.sendDeliveredNotification(str, str2);
    }

    @Override // org.jivesoftware.smackx.MessageEventRequestListener
    public void displayedNotificationRequested(String str, String str2, MessageEventManager messageEventManager) {
    }

    @Override // org.jivesoftware.smackx.MessageEventRequestListener
    public void offlineNotificationRequested(String str, String str2, MessageEventManager messageEventManager) {
    }
}
