package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/OfflineMessageInfo.class */
public class OfflineMessageInfo implements PacketExtension {
    private String node = null;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/OfflineMessageInfo$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            OfflineMessageInfo offlineMessageInfo = new OfflineMessageInfo();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("item")) {
                        offlineMessageInfo.setNode(xmlPullParser.getAttributeValue("", "node"));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(MessageEvent.OFFLINE)) {
                    z = true;
                }
            }
            return offlineMessageInfo;
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return MessageEvent.OFFLINE;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/offline";
    }

    public String getNode() {
        return this.node;
    }

    public void setNode(String str) {
        this.node = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        if (getNode() != null) {
            sb.append("<item node=\"").append(getNode()).append("\"/>");
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
