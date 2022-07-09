package org.jivesoftware.smackx.receipts;

import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.ServiceDiscoveryManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/receipts/DeliveryReceiptManager.class */
public class DeliveryReceiptManager implements PacketListener {
    private static Map<Connection, DeliveryReceiptManager> instances = Collections.synchronizedMap(new WeakHashMap());
    private boolean auto_receipts_enabled;
    private Connection connection;
    private Set<ReceiptReceivedListener> receiptReceivedListeners;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.receipts.DeliveryReceiptManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new DeliveryReceiptManager(connection);
            }
        });
    }

    private DeliveryReceiptManager(Connection connection) {
        this.auto_receipts_enabled = false;
        this.receiptReceivedListeners = Collections.synchronizedSet(new HashSet());
        ServiceDiscoveryManager.getInstanceFor(connection).addFeature(DeliveryReceipt.NAMESPACE);
        this.connection = connection;
        instances.put(connection, this);
        connection.addPacketListener(this, new PacketExtensionFilter(DeliveryReceipt.NAMESPACE));
    }

    public static void addDeliveryReceiptRequest(Message message) {
        message.addExtension(new DeliveryReceiptRequest());
    }

    public static DeliveryReceiptManager getInstanceFor(Connection connection) {
        DeliveryReceiptManager deliveryReceiptManager;
        synchronized (DeliveryReceiptManager.class) {
            try {
                DeliveryReceiptManager deliveryReceiptManager2 = instances.get(connection);
                deliveryReceiptManager = deliveryReceiptManager2;
                if (deliveryReceiptManager2 == null) {
                    deliveryReceiptManager = new DeliveryReceiptManager(connection);
                }
            } finally {
            }
        }
        return deliveryReceiptManager;
    }

    public static boolean hasDeliveryReceiptRequest(Packet packet) {
        return packet.getExtension(DeliveryReceiptRequest.ELEMENT, DeliveryReceipt.NAMESPACE) != null;
    }

    public void addReceiptReceivedListener(ReceiptReceivedListener receiptReceivedListener) {
        this.receiptReceivedListeners.add(receiptReceivedListener);
    }

    public void disableAutoReceipts() {
        setAutoReceiptsEnabled(false);
    }

    public void enableAutoReceipts() {
        setAutoReceiptsEnabled(true);
    }

    public boolean getAutoReceiptsEnabled() {
        return this.auto_receipts_enabled;
    }

    public boolean isSupported(String str) {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(str).containsFeature(DeliveryReceipt.NAMESPACE);
        } catch (XMPPException e) {
            z = false;
        }
        return z;
    }

    @Override // org.jivesoftware.smack.PacketListener
    public void processPacket(Packet packet) {
        DeliveryReceipt deliveryReceipt = (DeliveryReceipt) packet.getExtension(DeliveryReceipt.ELEMENT, DeliveryReceipt.NAMESPACE);
        if (deliveryReceipt != null) {
            for (ReceiptReceivedListener receiptReceivedListener : this.receiptReceivedListeners) {
                receiptReceivedListener.onReceiptReceived(packet.getFrom(), packet.getTo(), deliveryReceipt.getId());
            }
        }
        if (!this.auto_receipts_enabled || ((DeliveryReceiptRequest) packet.getExtension(DeliveryReceiptRequest.ELEMENT, DeliveryReceipt.NAMESPACE)) == null) {
            return;
        }
        Message message = new Message(packet.getFrom(), Message.Type.normal);
        message.addExtension(new DeliveryReceipt(packet.getPacketID()));
        this.connection.sendPacket(message);
    }

    public void removeReceiptReceivedListener(ReceiptReceivedListener receiptReceivedListener) {
        this.receiptReceivedListeners.remove(receiptReceivedListener);
    }

    public void setAutoReceiptsEnabled(boolean z) {
        this.auto_receipts_enabled = z;
    }
}
