package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.Cache;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.jivesoftware.smackx.packet.MultipleAddresses;

/* loaded from: classes.jar:org/jivesoftware/smackx/MultipleRecipientManager.class */
public class MultipleRecipientManager {
    private static Cache<String, String> services = new Cache<>(100, 86400000);

    /* loaded from: classes.jar:org/jivesoftware/smackx/MultipleRecipientManager$PacketCopy.class */
    private static class PacketCopy extends Packet {
        private String text;

        public PacketCopy(String str) {
            this.text = str;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            return this.text;
        }
    }

    private static String getMultipleRecipienServiceAddress(Connection connection) {
        String serviceName = connection.getServiceName();
        String str = services.get(serviceName);
        String str2 = str;
        if (str == null) {
            synchronized (services) {
                String str3 = services.get(serviceName);
                str2 = str3;
                if (str3 == null) {
                    String str4 = str3;
                    try {
                        if (!ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(serviceName).containsFeature("http://jabber.org/protocol/address")) {
                            Iterator<DiscoverItems.Item> items = ServiceDiscoveryManager.getInstanceFor(connection).discoverItems(serviceName).getItems();
                            while (true) {
                                str2 = str3;
                                if (!items.hasNext()) {
                                    break;
                                }
                                DiscoverItems.Item next = items.next();
                                if (ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(next.getEntityID(), next.getNode()).containsFeature("http://jabber.org/protocol/address")) {
                                    str2 = serviceName;
                                    break;
                                }
                            }
                        } else {
                            str2 = serviceName;
                        }
                        str4 = str2;
                        services.put(serviceName, str2 == null ? "" : str2);
                    } catch (XMPPException e) {
                        e.printStackTrace();
                        str2 = str4;
                    }
                }
            }
        }
        String str5 = str2;
        if ("".equals(str2)) {
            str5 = null;
        }
        return str5;
    }

    public static MultipleRecipientInfo getMultipleRecipientInfo(Packet packet) {
        MultipleAddresses multipleAddresses = (MultipleAddresses) packet.getExtension("addresses", "http://jabber.org/protocol/address");
        return multipleAddresses == null ? null : new MultipleRecipientInfo(multipleAddresses);
    }

    public static void reply(Connection connection, Message message, Message message2) throws XMPPException {
        MultipleRecipientInfo multipleRecipientInfo = getMultipleRecipientInfo(message);
        if (multipleRecipientInfo == null) {
            throw new XMPPException("Original message does not contain multiple recipient info");
        }
        if (multipleRecipientInfo.shouldNotReply()) {
            throw new XMPPException("Original message should not be replied");
        }
        if (multipleRecipientInfo.getReplyRoom() != null) {
            throw new XMPPException("Reply should be sent through a room");
        }
        if (message.getThread() != null) {
            message2.setThread(message.getThread());
        }
        MultipleAddresses.Address replyAddress = multipleRecipientInfo.getReplyAddress();
        if (replyAddress != null && replyAddress.getJid() != null) {
            message2.setTo(replyAddress.getJid());
            connection.sendPacket(message2);
            return;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (MultipleAddresses.Address address : multipleRecipientInfo.getTOAddresses()) {
            arrayList.add(address.getJid());
        }
        for (MultipleAddresses.Address address2 : multipleRecipientInfo.getCCAddresses()) {
            arrayList2.add(address2.getJid());
        }
        if (!arrayList.contains(message.getFrom()) && !arrayList2.contains(message.getFrom())) {
            arrayList.add(message.getFrom());
        }
        String user = connection.getUser();
        if (!arrayList.remove(user) && !arrayList2.remove(user)) {
            String parseBareAddress = StringUtils.parseBareAddress(user);
            arrayList.remove(parseBareAddress);
            arrayList2.remove(parseBareAddress);
        }
        String multipleRecipienServiceAddress = getMultipleRecipienServiceAddress(connection);
        if (multipleRecipienServiceAddress != null) {
            sendThroughService(connection, message2, arrayList, arrayList2, null, null, null, false, multipleRecipienServiceAddress);
        } else {
            sendToIndividualRecipients(connection, message2, arrayList, arrayList2, null);
        }
    }

    public static void send(Connection connection, Packet packet, List<String> list, List<String> list2, List<String> list3) throws XMPPException {
        send(connection, packet, list, list2, list3, null, null, false);
    }

    public static void send(Connection connection, Packet packet, List<String> list, List<String> list2, List<String> list3, String str, String str2, boolean z) throws XMPPException {
        String multipleRecipienServiceAddress = getMultipleRecipienServiceAddress(connection);
        if (multipleRecipienServiceAddress != null) {
            sendThroughService(connection, packet, list, list2, list3, str, str2, z, multipleRecipienServiceAddress);
        } else if (z || ((str != null && str.trim().length() > 0) || (str2 != null && str2.trim().length() > 0))) {
            throw new XMPPException("Extended Stanza Addressing not supported by server");
        } else {
            sendToIndividualRecipients(connection, packet, list, list2, list3);
        }
    }

    private static void sendThroughService(Connection connection, Packet packet, List<String> list, List<String> list2, List<String> list3, String str, String str2, boolean z, String str3) {
        MultipleAddresses multipleAddresses = new MultipleAddresses();
        if (list != null) {
            for (String str4 : list) {
                multipleAddresses.addAddress("to", str4, null, null, false, null);
            }
        }
        if (list2 != null) {
            for (String str5 : list2) {
                multipleAddresses.addAddress(MultipleAddresses.CC, str5, null, null, false, null);
            }
        }
        if (list3 != null) {
            for (String str6 : list3) {
                multipleAddresses.addAddress(MultipleAddresses.BCC, str6, null, null, false, null);
            }
        }
        if (z) {
            multipleAddresses.setNoReply();
        } else {
            if (str != null && str.trim().length() > 0) {
                multipleAddresses.addAddress(MultipleAddresses.REPLY_TO, str, null, null, false, null);
            }
            if (str2 != null && str2.trim().length() > 0) {
                multipleAddresses.addAddress(MultipleAddresses.REPLY_ROOM, str2, null, null, false, null);
            }
        }
        packet.setTo(str3);
        packet.addExtension(multipleAddresses);
        connection.sendPacket(packet);
    }

    private static void sendToIndividualRecipients(Connection connection, Packet packet, List<String> list, List<String> list2, List<String> list3) {
        if (list != null) {
            for (String str : list) {
                packet.setTo(str);
                connection.sendPacket(new PacketCopy(packet.toXML()));
            }
        }
        if (list2 != null) {
            for (String str2 : list2) {
                packet.setTo(str2);
                connection.sendPacket(new PacketCopy(packet.toXML()));
            }
        }
        if (list3 != null) {
            for (String str3 : list3) {
                packet.setTo(str3);
                connection.sendPacket(new PacketCopy(packet.toXML()));
            }
        }
    }
}
