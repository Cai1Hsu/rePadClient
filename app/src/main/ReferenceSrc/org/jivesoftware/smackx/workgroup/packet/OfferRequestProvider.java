package org.jivesoftware.smackx.workgroup.packet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.workgroup.MetaData;
import org.jivesoftware.smackx.workgroup.agent.InvitationRequest;
import org.jivesoftware.smackx.workgroup.agent.OfferContent;
import org.jivesoftware.smackx.workgroup.agent.TransferRequest;
import org.jivesoftware.smackx.workgroup.agent.UserRequest;
import org.jivesoftware.smackx.workgroup.util.MetaDataUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OfferRequestProvider.class */
public class OfferRequestProvider implements IQProvider {

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OfferRequestProvider$OfferRequestPacket.class */
    public static class OfferRequestPacket extends IQ {
        private OfferContent content;
        private Map<String, List<String>> metaData;
        private String sessionID;
        private int timeout;
        private String userID;
        private String userJID;

        public OfferRequestPacket(String str, String str2, int i, Map<String, List<String>> map, String str3, OfferContent offerContent) {
            this.userJID = str;
            this.userID = str2;
            this.timeout = i;
            this.metaData = map;
            this.sessionID = str3;
            this.content = offerContent;
        }

        @Override // org.jivesoftware.smack.packet.IQ
        public String getChildElementXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<offer xmlns=\"http://jabber.org/protocol/workgroup\" jid=\"").append(this.userJID).append("\">");
            sb.append("<timeout>").append(this.timeout).append("</timeout>");
            if (this.sessionID != null) {
                sb.append('<').append(SessionID.ELEMENT_NAME);
                sb.append(" session=\"");
                sb.append(getSessionID()).append("\" xmlns=\"");
                sb.append("http://jivesoftware.com/protocol/workgroup").append("\"/>");
            }
            if (this.metaData != null) {
                sb.append(MetaDataUtils.serializeMetaData(this.metaData));
            }
            if (this.userID != null) {
                sb.append('<').append(UserID.ELEMENT_NAME);
                sb.append(" id=\"");
                sb.append(this.userID).append("\" xmlns=\"");
                sb.append("http://jivesoftware.com/protocol/workgroup").append("\"/>");
            }
            sb.append("</offer>");
            return sb.toString();
        }

        public OfferContent getContent() {
            return this.content;
        }

        public Map<String, List<String>> getMetaData() {
            return this.metaData;
        }

        public String getSessionID() {
            return this.sessionID;
        }

        public int getTimeout() {
            return this.timeout;
        }

        public String getUserID() {
            return this.userID;
        }

        public String getUserJID() {
            return this.userJID;
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:55:0x0030 */
    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:56:0x0030 */
    /* JADX DEBUG: Type inference failed for r0v28. Raw type applied. Possible types: java.util.Map<java.lang.String, java.util.List<java.lang.String>> */
    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        int eventType = xmlPullParser.getEventType();
        String str = null;
        int i = -1;
        TransferRequest transferRequest = null;
        boolean z = false;
        Map hashMap = new HashMap();
        if (eventType != 2) {
        }
        String attributeValue = xmlPullParser.getAttributeValue("", "jid");
        String str2 = attributeValue;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                if ("timeout".equals(name)) {
                    i = Integer.parseInt(xmlPullParser.nextText());
                } else if (MetaData.ELEMENT_NAME.equals(name)) {
                    hashMap = MetaDataUtils.parseMetaData(xmlPullParser);
                } else if (SessionID.ELEMENT_NAME.equals(name)) {
                    str = xmlPullParser.getAttributeValue("", "id");
                } else if (UserID.ELEMENT_NAME.equals(name)) {
                    str2 = xmlPullParser.getAttributeValue("", "id");
                } else if ("user-request".equals(name)) {
                    transferRequest = UserRequest.getInstance();
                } else if (RoomInvitation.ELEMENT_NAME.equals(name)) {
                    RoomInvitation roomInvitation = (RoomInvitation) PacketParserUtils.parsePacketExtension(RoomInvitation.ELEMENT_NAME, "http://jabber.org/protocol/workgroup", xmlPullParser);
                    transferRequest = new InvitationRequest(roomInvitation.getInviter(), roomInvitation.getRoom(), roomInvitation.getReason());
                } else if (RoomTransfer.ELEMENT_NAME.equals(name)) {
                    RoomTransfer roomTransfer = (RoomTransfer) PacketParserUtils.parsePacketExtension(RoomTransfer.ELEMENT_NAME, "http://jabber.org/protocol/workgroup", xmlPullParser);
                    transferRequest = new TransferRequest(roomTransfer.getInviter(), roomTransfer.getRoom(), roomTransfer.getReason());
                }
            } else if (next == 3 && "offer".equals(xmlPullParser.getName())) {
                z = true;
            }
        }
        OfferRequestPacket offerRequestPacket = new OfferRequestPacket(attributeValue, str2, i, hashMap, str, transferRequest);
        offerRequestPacket.setType(IQ.Type.SET);
        return offerRequestPacket;
    }
}
