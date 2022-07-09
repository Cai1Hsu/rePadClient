package org.jivesoftware.smackx.workgroup.packet;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OccupantsInfo.class */
public class OccupantsInfo extends IQ {
    public static final String ELEMENT_NAME = "occupants-info";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private static final SimpleDateFormat UTC_FORMAT = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private final Set<OccupantInfo> occupants = new HashSet();
    private String roomID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OccupantsInfo$OccupantInfo.class */
    public static class OccupantInfo {
        private String jid;
        private Date joined;
        private String nickname;

        public OccupantInfo(String str, String str2, Date date) {
            this.jid = str;
            this.nickname = str2;
            this.joined = date;
        }

        public String getJID() {
            return this.jid;
        }

        public Date getJoined() {
            return this.joined;
        }

        public String getNickname() {
            return this.nickname;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/OccupantsInfo$Provider.class */
    public static class Provider implements IQProvider {
        private OccupantInfo parseOccupantInfo(XmlPullParser xmlPullParser) throws Exception {
            boolean z = false;
            String str = null;
            String str2 = null;
            Date date = null;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "jid".equals(xmlPullParser.getName())) {
                    str = xmlPullParser.nextText();
                } else if (next == 2 && "nickname".equals(xmlPullParser.getName())) {
                    str2 = xmlPullParser.nextText();
                } else if (next == 2 && "joined".equals(xmlPullParser.getName())) {
                    date = OccupantsInfo.UTC_FORMAT.parse(xmlPullParser.nextText());
                } else if (next == 3 && "occupant".equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return new OccupantInfo(str, str2, date);
        }

        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            OccupantsInfo occupantsInfo = new OccupantsInfo(xmlPullParser.getAttributeValue("", "roomID"));
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "occupant".equals(xmlPullParser.getName())) {
                    occupantsInfo.occupants.add(parseOccupantInfo(xmlPullParser));
                } else if (next == 3 && OccupantsInfo.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return occupantsInfo;
        }
    }

    static {
        UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT+0"));
    }

    public OccupantsInfo(String str) {
        this.roomID = str;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup");
        sb.append("\" roomID=\"").append(this.roomID).append("\">");
        synchronized (this.occupants) {
            for (OccupantInfo occupantInfo : this.occupants) {
                sb.append("<occupant>");
                sb.append("<jid>");
                sb.append(occupantInfo.getJID());
                sb.append("</jid>");
                sb.append("<name>");
                sb.append(occupantInfo.getNickname());
                sb.append("</name>");
                sb.append("<joined>");
                sb.append(UTC_FORMAT.format(occupantInfo.getJoined()));
                sb.append("</joined>");
                sb.append("</occupant>");
            }
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public Set<OccupantInfo> getOccupants() {
        return Collections.unmodifiableSet(this.occupants);
    }

    public int getOccupantsCount() {
        return this.occupants.size();
    }

    public String getRoomID() {
        return this.roomID;
    }
}
