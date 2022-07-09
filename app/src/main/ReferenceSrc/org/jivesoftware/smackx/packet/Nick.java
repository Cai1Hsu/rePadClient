package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/Nick.class */
public class Nick implements PacketExtension {
    public static final String ELEMENT_NAME = "nick";
    public static final String NAMESPACE = "http://jabber.org/protocol/nick";
    private String name;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/Nick$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            xmlPullParser.next();
            String text = xmlPullParser.getText();
            while (xmlPullParser.getEventType() != 3) {
                xmlPullParser.next();
            }
            return new Nick(text);
        }
    }

    public Nick(String str) {
        this.name = null;
        this.name = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    public String getName() {
        return this.name;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    public void setName(String str) {
        this.name = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append(NAMESPACE).append("\">");
        sb.append(getName());
        sb.append("</").append(ELEMENT_NAME).append('>');
        return sb.toString();
    }
}
