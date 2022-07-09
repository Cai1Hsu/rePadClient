package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider.class */
public class OfferRevokeProvider implements IQProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OfferRevokeProvider$OfferRevokePacket.class */
    public class OfferRevokePacket extends IQ {
        private String reason;
        private String sessionID;
        private String userID;
        private String userJID;

        public OfferRevokePacket(String str, String str2, String str3, String str4) {
            OfferRevokeProvider.this = r4;
            this.userJID = str;
            this.userID = str2;
            this.reason = str3;
            this.sessionID = str4;
        }

        @Override // org.jivesoftware.smack.packet.IQ
        public String getChildElementXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<offer-revoke xmlns=\"http://jabber.org/protocol/workgroup\" jid=\"").append(this.userID).append("\">");
            if (this.reason != null) {
                sb.append("<reason>").append(this.reason).append("</reason>");
            }
            if (this.sessionID != null) {
                sb.append(new SessionID(this.sessionID).toXML());
            }
            if (this.userID != null) {
                sb.append(new UserID(this.userID).toXML());
            }
            sb.append("</offer-revoke>");
            return sb.toString();
        }

        public String getReason() {
            return this.reason;
        }

        public String getSessionID() {
            return this.sessionID;
        }

        public String getUserID() {
            return this.userID;
        }

        public String getUserJID() {
            return this.userJID;
        }
    }

    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        String attributeValue = xmlPullParser.getAttributeValue("", "jid");
        String str = attributeValue;
        String str2 = null;
        String str3 = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2 && xmlPullParser.getName().equals("reason")) {
                str2 = xmlPullParser.nextText();
            } else if (next == 2 && xmlPullParser.getName().equals(SessionID.ELEMENT_NAME)) {
                str3 = xmlPullParser.getAttributeValue("", "id");
            } else if (next == 2 && xmlPullParser.getName().equals(UserID.ELEMENT_NAME)) {
                str = xmlPullParser.getAttributeValue("", "id");
            } else if (next == 3 && xmlPullParser.getName().equals("offer-revoke")) {
                z = true;
            }
        }
        return new OfferRevokePacket(attributeValue, str, str2, str3);
    }
}
