package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.jivesoftware.smackx.packet.MessageEvent;
import org.jivesoftware.smackx.packet.OfflineMessageInfo;
import org.jivesoftware.smackx.packet.OfflineMessageRequest;

/* loaded from: classes.jar:org/jivesoftware/smackx/OfflineMessageManager.class */
public class OfflineMessageManager {
    private static final String namespace = "http://jabber.org/protocol/offline";
    private Connection connection;
    private PacketFilter packetFilter = new AndFilter(new PacketExtensionFilter(MessageEvent.OFFLINE, namespace), new PacketTypeFilter(Message.class));

    public OfflineMessageManager(Connection connection) {
        this.connection = connection;
    }

    public void deleteMessages() throws XMPPException {
        OfflineMessageRequest offlineMessageRequest = new OfflineMessageRequest();
        offlineMessageRequest.setPurge(true);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(offlineMessageRequest.getPacketID()));
        this.connection.sendPacket(offlineMessageRequest);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void deleteMessages(List<String> list) throws XMPPException {
        OfflineMessageRequest offlineMessageRequest = new OfflineMessageRequest();
        for (String str : list) {
            OfflineMessageRequest.Item item = new OfflineMessageRequest.Item(str);
            item.setAction(DiscoverItems.Item.REMOVE_ACTION);
            offlineMessageRequest.addItem(item);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(offlineMessageRequest.getPacketID()));
        this.connection.sendPacket(offlineMessageRequest);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public Iterator<OfflineMessageHeader> getHeaders() throws XMPPException {
        ArrayList arrayList = new ArrayList();
        Iterator<DiscoverItems.Item> items = ServiceDiscoveryManager.getInstanceFor(this.connection).discoverItems(null, namespace).getItems();
        while (items.hasNext()) {
            arrayList.add(new OfflineMessageHeader(items.next()));
        }
        return arrayList.iterator();
    }

    public int getMessageCount() throws XMPPException {
        Form formFrom = Form.getFormFrom(ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(null, namespace));
        return formFrom != null ? Integer.parseInt(formFrom.getField("number_of_messages").getValues().next()) : 0;
    }

    public Iterator<Message> getMessages() throws XMPPException {
        ArrayList arrayList = new ArrayList();
        OfflineMessageRequest offlineMessageRequest = new OfflineMessageRequest();
        offlineMessageRequest.setFetch(true);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(offlineMessageRequest.getPacketID()));
        PacketCollector createPacketCollector2 = this.connection.createPacketCollector(this.packetFilter);
        this.connection.sendPacket(offlineMessageRequest);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        Packet nextResult = createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        while (true) {
            Message message = (Message) nextResult;
            if (message == null) {
                createPacketCollector2.cancel();
                return arrayList.iterator();
            }
            arrayList.add(message);
            nextResult = createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        }
    }

    public Iterator<Message> getMessages(final List<String> list) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        OfflineMessageRequest offlineMessageRequest = new OfflineMessageRequest();
        for (String str : list) {
            OfflineMessageRequest.Item item = new OfflineMessageRequest.Item(str);
            item.setAction("view");
            offlineMessageRequest.addItem(item);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(offlineMessageRequest.getPacketID()));
        PacketCollector createPacketCollector2 = this.connection.createPacketCollector(new AndFilter(this.packetFilter, new PacketFilter() { // from class: org.jivesoftware.smackx.OfflineMessageManager.1
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                return list.contains(((OfflineMessageInfo) packet.getExtension(MessageEvent.OFFLINE, OfflineMessageManager.namespace)).getNode());
            }
        }));
        this.connection.sendPacket(offlineMessageRequest);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        Packet nextResult = createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        while (true) {
            Message message = (Message) nextResult;
            if (message == null) {
                createPacketCollector2.cancel();
                return arrayList.iterator();
            }
            arrayList.add(message);
            nextResult = createPacketCollector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        }
    }

    public boolean supportsFlexibleRetrieval() throws XMPPException {
        return ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(null).containsFeature(namespace);
    }
}
