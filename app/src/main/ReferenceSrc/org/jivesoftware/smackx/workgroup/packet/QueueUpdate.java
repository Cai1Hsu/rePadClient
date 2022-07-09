package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueUpdate.class */
public class QueueUpdate implements PacketExtension {
    public static final String ELEMENT_NAME = "queue-status";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private int position;
    private int remainingTime;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueUpdate$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            boolean z = false;
            int i = -1;
            int i2 = -1;
            while (!z) {
                xmlPullParser.next();
                String name = xmlPullParser.getName();
                if (xmlPullParser.getEventType() == 2 && "position".equals(name)) {
                    try {
                        i = Integer.parseInt(xmlPullParser.nextText());
                    } catch (NumberFormatException e) {
                    }
                } else if (xmlPullParser.getEventType() == 2 && "time".equals(name)) {
                    try {
                        i2 = Integer.parseInt(xmlPullParser.nextText());
                    } catch (NumberFormatException e2) {
                    }
                } else if (xmlPullParser.getEventType() == 3 && QueueUpdate.ELEMENT_NAME.equals(name)) {
                    z = true;
                }
            }
            return new QueueUpdate(i, i2);
        }
    }

    public QueueUpdate(int i, int i2) {
        this.position = i;
        this.remainingTime = i2;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/workgroup";
    }

    public int getPosition() {
        return this.position;
    }

    public int getRemaingTime() {
        return this.remainingTime;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<queue-status xmlns=\"http://jabber.org/protocol/workgroup\">");
        if (this.position != -1) {
            sb.append("<position>").append(this.position).append("</position>");
        }
        if (this.remainingTime != -1) {
            sb.append("<time>").append(this.remainingTime).append("</time>");
        }
        sb.append("</queue-status>");
        return sb.toString();
    }
}
