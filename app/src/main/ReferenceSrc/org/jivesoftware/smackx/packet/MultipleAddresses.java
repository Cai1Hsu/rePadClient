package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/MultipleAddresses.class */
public class MultipleAddresses implements PacketExtension {
    public static final String BCC = "bcc";
    public static final String CC = "cc";
    public static final String NO_REPLY = "noreply";
    public static final String REPLY_ROOM = "replyroom";
    public static final String REPLY_TO = "replyto";
    public static final String TO = "to";
    private List<Address> addresses = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MultipleAddresses$Address.class */
    public static class Address {
        private boolean delivered;
        private String description;
        private String jid;
        private String node;
        private String type;
        private String uri;

        private Address(String str) {
            this.type = str;
        }

        public void setDelivered(boolean z) {
            this.delivered = z;
        }

        public void setDescription(String str) {
            this.description = str;
        }

        public void setJid(String str) {
            this.jid = str;
        }

        public void setNode(String str) {
            this.node = str;
        }

        public void setUri(String str) {
            this.uri = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<address type=\"");
            sb.append(this.type).append("\"");
            if (this.jid != null) {
                sb.append(" jid=\"");
                sb.append(this.jid).append("\"");
            }
            if (this.node != null) {
                sb.append(" node=\"");
                sb.append(this.node).append("\"");
            }
            if (this.description != null && this.description.trim().length() > 0) {
                sb.append(" desc=\"");
                sb.append(this.description).append("\"");
            }
            if (this.delivered) {
                sb.append(" delivered=\"true\"");
            }
            if (this.uri != null) {
                sb.append(" uri=\"");
                sb.append(this.uri).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }

        public String getDescription() {
            return this.description;
        }

        public String getJid() {
            return this.jid;
        }

        public String getNode() {
            return this.node;
        }

        public String getType() {
            return this.type;
        }

        public String getUri() {
            return this.uri;
        }

        public boolean isDelivered() {
            return this.delivered;
        }
    }

    public void addAddress(String str, String str2, String str3, String str4, boolean z, String str5) {
        Address address = new Address(str);
        address.setJid(str2);
        address.setNode(str3);
        address.setDescription(str4);
        address.setDelivered(z);
        address.setUri(str5);
        this.addresses.add(address);
    }

    public List<Address> getAddressesOfType(String str) {
        ArrayList arrayList = new ArrayList(this.addresses.size());
        for (Address address : this.addresses) {
            if (address.getType().equals(str)) {
                arrayList.add(address);
            }
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "addresses";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/address";
    }

    public void setNoReply() {
        this.addresses.add(new Address(NO_REPLY));
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName());
        sb.append(" xmlns=\"").append(getNamespace()).append("\">");
        for (Address address : this.addresses) {
            sb.append(address.toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
