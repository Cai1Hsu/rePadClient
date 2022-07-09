package org.jivesoftware.smackx;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.packet.MessageEvent;

/* loaded from: classes.jar:org/jivesoftware/smackx/MessageEventManager.class */
public class MessageEventManager {
    private Connection con;
    private List<MessageEventNotificationListener> messageEventNotificationListeners = new ArrayList();
    private List<MessageEventRequestListener> messageEventRequestListeners = new ArrayList();
    private PacketFilter packetFilter = new PacketExtensionFilter("x", "jabber:x:event");
    private PacketListener packetListener;

    public MessageEventManager(Connection connection) {
        this.con = connection;
        init();
    }

    public static void addNotificationsRequests(Message message, boolean z, boolean z2, boolean z3, boolean z4) {
        MessageEvent messageEvent = new MessageEvent();
        messageEvent.setOffline(z);
        messageEvent.setDelivered(z2);
        messageEvent.setDisplayed(z3);
        messageEvent.setComposing(z4);
        message.addExtension(messageEvent);
    }

    public void fireMessageEventNotificationListeners(String str, String str2, String str3) {
        MessageEventNotificationListener[] messageEventNotificationListenerArr;
        synchronized (this.messageEventNotificationListeners) {
            messageEventNotificationListenerArr = new MessageEventNotificationListener[this.messageEventNotificationListeners.size()];
            this.messageEventNotificationListeners.toArray(messageEventNotificationListenerArr);
        }
        try {
            Method declaredMethod = MessageEventNotificationListener.class.getDeclaredMethod(str3, String.class, String.class);
            for (MessageEventNotificationListener messageEventNotificationListener : messageEventNotificationListenerArr) {
                declaredMethod.invoke(messageEventNotificationListener, str, str2);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e2) {
            e2.printStackTrace();
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
        }
    }

    public void fireMessageEventRequestListeners(String str, String str2, String str3) {
        MessageEventRequestListener[] messageEventRequestListenerArr;
        synchronized (this.messageEventRequestListeners) {
            messageEventRequestListenerArr = new MessageEventRequestListener[this.messageEventRequestListeners.size()];
            this.messageEventRequestListeners.toArray(messageEventRequestListenerArr);
        }
        try {
            Method declaredMethod = MessageEventRequestListener.class.getDeclaredMethod(str3, String.class, String.class, MessageEventManager.class);
            for (MessageEventRequestListener messageEventRequestListener : messageEventRequestListenerArr) {
                declaredMethod.invoke(messageEventRequestListener, str, str2, this);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e2) {
            e2.printStackTrace();
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
        }
    }

    private void init() {
        this.packetListener = new PacketListener() { // from class: org.jivesoftware.smackx.MessageEventManager.1
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Message message = (Message) packet;
                MessageEvent messageEvent = (MessageEvent) message.getExtension("x", "jabber:x:event");
                if (messageEvent.isMessageEventRequest()) {
                    Iterator<String> eventTypes = messageEvent.getEventTypes();
                    while (eventTypes.hasNext()) {
                        MessageEventManager.this.fireMessageEventRequestListeners(message.getFrom(), message.getPacketID(), eventTypes.next().concat("NotificationRequested"));
                    }
                    return;
                }
                Iterator<String> eventTypes2 = messageEvent.getEventTypes();
                while (eventTypes2.hasNext()) {
                    MessageEventManager.this.fireMessageEventNotificationListeners(message.getFrom(), messageEvent.getPacketID(), eventTypes2.next().concat("Notification"));
                }
            }
        };
        this.con.addPacketListener(this.packetListener, this.packetFilter);
    }

    public void addMessageEventNotificationListener(MessageEventNotificationListener messageEventNotificationListener) {
        synchronized (this.messageEventNotificationListeners) {
            if (!this.messageEventNotificationListeners.contains(messageEventNotificationListener)) {
                this.messageEventNotificationListeners.add(messageEventNotificationListener);
            }
        }
    }

    public void addMessageEventRequestListener(MessageEventRequestListener messageEventRequestListener) {
        synchronized (this.messageEventRequestListeners) {
            if (!this.messageEventRequestListeners.contains(messageEventRequestListener)) {
                this.messageEventRequestListeners.add(messageEventRequestListener);
            }
        }
    }

    public void destroy() {
        if (this.con != null) {
            this.con.removePacketListener(this.packetListener);
        }
    }

    protected void finalize() throws Throwable {
        destroy();
        super.finalize();
    }

    public void removeMessageEventNotificationListener(MessageEventNotificationListener messageEventNotificationListener) {
        synchronized (this.messageEventNotificationListeners) {
            this.messageEventNotificationListeners.remove(messageEventNotificationListener);
        }
    }

    public void removeMessageEventRequestListener(MessageEventRequestListener messageEventRequestListener) {
        synchronized (this.messageEventRequestListeners) {
            this.messageEventRequestListeners.remove(messageEventRequestListener);
        }
    }

    public void sendCancelledNotification(String str, String str2) {
        Packet message = new Message(str);
        MessageEvent messageEvent = new MessageEvent();
        messageEvent.setCancelled(true);
        messageEvent.setPacketID(str2);
        message.addExtension(messageEvent);
        this.con.sendPacket(message);
    }

    public void sendComposingNotification(String str, String str2) {
        Packet message = new Message(str);
        MessageEvent messageEvent = new MessageEvent();
        messageEvent.setComposing(true);
        messageEvent.setPacketID(str2);
        message.addExtension(messageEvent);
        this.con.sendPacket(message);
    }

    public void sendDeliveredNotification(String str, String str2) {
        Packet message = new Message(str);
        MessageEvent messageEvent = new MessageEvent();
        messageEvent.setDelivered(true);
        messageEvent.setPacketID(str2);
        message.addExtension(messageEvent);
        this.con.sendPacket(message);
    }

    public void sendDisplayedNotification(String str, String str2) {
        Packet message = new Message(str);
        MessageEvent messageEvent = new MessageEvent();
        messageEvent.setDisplayed(true);
        messageEvent.setPacketID(str2);
        message.addExtension(messageEvent);
        this.con.sendPacket(message);
    }
}
