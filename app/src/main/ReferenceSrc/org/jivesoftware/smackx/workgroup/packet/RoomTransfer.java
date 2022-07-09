package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/RoomTransfer.class */
public class RoomTransfer implements PacketExtension {
    public static final String ELEMENT_NAME = "transfer";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private String invitee;
    private String inviter;
    private String reason;
    private String room;
    private String sessionID;
    private Type type;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/RoomTransfer$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            RoomTransfer roomTransfer = new RoomTransfer();
            roomTransfer.type = Type.valueOf(xmlPullParser.getAttributeValue("", "type"));
            boolean z = false;
            while (!z) {
                xmlPullParser.next();
                String name = xmlPullParser.getName();
                if (xmlPullParser.getEventType() == 2) {
                    if (SessionID.ELEMENT_NAME.equals(name)) {
                        roomTransfer.sessionID = xmlPullParser.getAttributeValue("", "id");
                    } else if ("invitee".equals(name)) {
                        roomTransfer.invitee = xmlPullParser.nextText();
                    } else if ("inviter".equals(name)) {
                        roomTransfer.inviter = xmlPullParser.nextText();
                    } else if ("reason".equals(name)) {
                        roomTransfer.reason = xmlPullParser.nextText();
                    } else if ("room".equals(name)) {
                        roomTransfer.room = xmlPullParser.nextText();
                    }
                } else if (xmlPullParser.getEventType() == 3 && RoomTransfer.ELEMENT_NAME.equals(name)) {
                    z = true;
                }
            }
            return roomTransfer;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type.class */
    public enum Type {
        user,
        queue,
        workgroup
    }

    private RoomTransfer() {
    }

    public RoomTransfer(Type type, String str, String str2, String str3) {
        this.type = type;
        this.invitee = str;
        this.sessionID = str2;
        this.reason = str3;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    public String getInviter() {
        return this.inviter;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/workgroup";
    }

    public String getReason() {
        return this.reason;
    }

    public String getRoom() {
        return this.room;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jabber.org/protocol/workgroup");
        sb.append("\" type=\"").append(this.type).append("\">");
        sb.append("<session xmlns=\"http://jivesoftware.com/protocol/workgroup\" id=\"").append(this.sessionID).append("\"></session>");
        if (this.invitee != null) {
            sb.append("<invitee>").append(this.invitee).append("</invitee>");
        }
        if (this.inviter != null) {
            sb.append("<inviter>").append(this.inviter).append("</inviter>");
        }
        if (this.reason != null) {
            sb.append("<reason>").append(this.reason).append("</reason>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }
}
