package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/WorkgroupInformation.class */
public class WorkgroupInformation implements PacketExtension {
    public static final String ELEMENT_NAME = "workgroup";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private String workgroupJID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/WorkgroupInformation$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            String attributeValue = xmlPullParser.getAttributeValue("", "jid");
            xmlPullParser.next();
            return new WorkgroupInformation(attributeValue);
        }
    }

    public WorkgroupInformation(String str) {
        this.workgroupJID = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/workgroup";
    }

    public String getWorkgroupJID() {
        return this.workgroupJID;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append('<').append(ELEMENT_NAME);
        sb.append(" jid=\"").append(getWorkgroupJID()).append("\"");
        sb.append(" xmlns=\"").append("http://jabber.org/protocol/workgroup").append("\" />");
        return sb.toString();
    }
}
