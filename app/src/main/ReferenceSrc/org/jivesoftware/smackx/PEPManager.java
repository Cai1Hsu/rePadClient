package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.packet.PEPEvent;
import org.jivesoftware.smackx.packet.PEPItem;
import org.jivesoftware.smackx.packet.PEPPubSub;

/* loaded from: classes.jar:org/jivesoftware/smackx/PEPManager.class */
public class PEPManager {
    private Connection connection;
    private PacketListener packetListener;
    private List<PEPListener> pepListeners = new ArrayList();
    private PacketFilter packetFilter = new PacketExtensionFilter("event", "http://jabber.org/protocol/pubsub#event");

    public PEPManager(Connection connection) {
        this.connection = connection;
        init();
    }

    public void firePEPListeners(String str, PEPEvent pEPEvent) {
        PEPListener[] pEPListenerArr;
        synchronized (this.pepListeners) {
            pEPListenerArr = new PEPListener[this.pepListeners.size()];
            this.pepListeners.toArray(pEPListenerArr);
        }
        for (PEPListener pEPListener : pEPListenerArr) {
            pEPListener.eventReceived(str, pEPEvent);
        }
    }

    private void init() {
        this.packetListener = new PacketListener() { // from class: org.jivesoftware.smackx.PEPManager.1
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Message message = (Message) packet;
                PEPManager.this.firePEPListeners(message.getFrom(), (PEPEvent) message.getExtension("event", "http://jabber.org/protocol/pubsub#event"));
            }
        };
        this.connection.addPacketListener(this.packetListener, this.packetFilter);
    }

    public void addPEPListener(PEPListener pEPListener) {
        synchronized (this.pepListeners) {
            if (!this.pepListeners.contains(pEPListener)) {
                this.pepListeners.add(pEPListener);
            }
        }
    }

    public void destroy() {
        if (this.connection != null) {
            this.connection.removePacketListener(this.packetListener);
        }
    }

    protected void finalize() throws Throwable {
        destroy();
        super.finalize();
    }

    public void publish(PEPItem pEPItem) {
        PEPPubSub pEPPubSub = new PEPPubSub(pEPItem);
        pEPPubSub.setType(IQ.Type.SET);
        this.connection.sendPacket(pEPPubSub);
    }

    public void removePEPListener(PEPListener pEPListener) {
        synchronized (this.pepListeners) {
            this.pepListeners.remove(pEPListener);
        }
    }
}
