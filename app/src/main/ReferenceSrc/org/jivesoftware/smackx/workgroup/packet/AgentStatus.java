package org.jivesoftware.smackx.workgroup.packet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatus.class */
public class AgentStatus implements PacketExtension {
    public static final String ELEMENT_NAME = "agent-status";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private static final SimpleDateFormat UTC_FORMAT = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private List<ChatInfo> currentChats = new ArrayList();
    private int maxChats = -1;
    private String workgroupJID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo.class */
    public static class ChatInfo {
        private Date date;
        private String email;
        private String question;
        private String sessionID;
        private String userID;
        private String username;

        public ChatInfo(String str, String str2, Date date, String str3, String str4, String str5) {
            this.sessionID = str;
            this.userID = str2;
            this.date = date;
            this.email = str3;
            this.username = str4;
            this.question = str5;
        }

        public Date getDate() {
            return this.date;
        }

        public String getEmail() {
            return this.email;
        }

        public String getQuestion() {
            return this.question;
        }

        public String getSessionID() {
            return this.sessionID;
        }

        public String getUserID() {
            return this.userID;
        }

        public String getUsername() {
            return this.username;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<chat ");
            if (this.sessionID != null) {
                sb.append(" sessionID=\"").append(this.sessionID).append("\"");
            }
            if (this.userID != null) {
                sb.append(" userID=\"").append(this.userID).append("\"");
            }
            if (this.date != null) {
                sb.append(" startTime=\"").append(AgentStatus.UTC_FORMAT.format(this.date)).append("\"");
            }
            if (this.email != null) {
                sb.append(" email=\"").append(this.email).append("\"");
            }
            if (this.username != null) {
                sb.append(" username=\"").append(this.username).append("\"");
            }
            if (this.question != null) {
                sb.append(" question=\"").append(this.question).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatus$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        private ChatInfo parseChatInfo(XmlPullParser xmlPullParser) {
            String attributeValue = xmlPullParser.getAttributeValue("", "sessionID");
            String attributeValue2 = xmlPullParser.getAttributeValue("", "userID");
            Date date = null;
            try {
                date = AgentStatus.UTC_FORMAT.parse(xmlPullParser.getAttributeValue("", "startTime"));
            } catch (ParseException e) {
            }
            return new ChatInfo(attributeValue, attributeValue2, date, xmlPullParser.getAttributeValue("", "email"), xmlPullParser.getAttributeValue("", "username"), xmlPullParser.getAttributeValue("", "question"));
        }

        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            AgentStatus agentStatus = new AgentStatus();
            agentStatus.workgroupJID = xmlPullParser.getAttributeValue("", "jid");
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if ("chat".equals(xmlPullParser.getName())) {
                        agentStatus.currentChats.add(parseChatInfo(xmlPullParser));
                    } else if ("max-chats".equals(xmlPullParser.getName())) {
                        agentStatus.maxChats = Integer.parseInt(xmlPullParser.nextText());
                    }
                } else if (next == 3 && AgentStatus.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return agentStatus;
        }
    }

    static {
        UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT+0"));
    }

    AgentStatus() {
    }

    public List<ChatInfo> getCurrentChats() {
        return Collections.unmodifiableList(this.currentChats);
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    public int getMaxChats() {
        return this.maxChats;
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
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jabber.org/protocol/workgroup").append("\"");
        if (this.workgroupJID != null) {
            sb.append(" jid=\"").append(this.workgroupJID).append("\"");
        }
        sb.append(">");
        if (this.maxChats != -1) {
            sb.append("<max-chats>").append(this.maxChats).append("</max-chats>");
        }
        if (!this.currentChats.isEmpty()) {
            sb.append("<current-chats xmlns= \"http://jivesoftware.com/protocol/workgroup\">");
            for (ChatInfo chatInfo : this.currentChats) {
                sb.append(chatInfo.toXML());
            }
            sb.append("</current-chats>");
        }
        sb.append("</").append(getElementName()).append("> ");
        return sb.toString();
    }
}
