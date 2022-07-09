package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/UserID.class */
public class UserID implements PacketExtension {
    public static final String ELEMENT_NAME = "user";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String userID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/UserID$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            String attributeValue = xmlPullParser.getAttributeValue("", "id");
            xmlPullParser.next();
            return new UserID(attributeValue);
        }
    }

    public UserID(String str) {
        this.userID = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jivesoftware.com/protocol/workgroup";
    }

    public String getUserID() {
        return this.userID;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\" ");
        sb.append("id=\"").append(getUserID());
        sb.append("\"/>");
        return sb.toString();
    }
}
