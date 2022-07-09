package org.jivesoftware.smackx;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/GroupChatInvitation.class */
public class GroupChatInvitation implements PacketExtension {
    public static final String ELEMENT_NAME = "x";
    public static final String NAMESPACE = "jabber:x:conference";
    private String roomAddress;

    /* loaded from: classes.jar:org/jivesoftware/smackx/GroupChatInvitation$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            String attributeValue = xmlPullParser.getAttributeValue("", "jid");
            xmlPullParser.next();
            return new GroupChatInvitation(attributeValue);
        }
    }

    public GroupChatInvitation(String str) {
        this.roomAddress = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    public String getRoomAddress() {
        return this.roomAddress;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<x xmlns=\"jabber:x:conference\" jid=\"").append(this.roomAddress).append("\"/>");
        return sb.toString();
    }
}
