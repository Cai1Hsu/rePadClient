package org.jivesoftware.smackx.packet;

import java.io.IOException;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/LastActivity.class */
public class LastActivity extends IQ {
    public static final String NAMESPACE = "jabber:iq:last";
    public long lastActivity = -1;
    public String message;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/LastActivity$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws XMPPException, XmlPullParserException {
            String str;
            if (xmlPullParser.getEventType() != 2) {
                throw new XMPPException("Parser not in proper position, or bad XML.");
            }
            LastActivity lastActivity = new LastActivity();
            String attributeValue = xmlPullParser.getAttributeValue("", "seconds");
            try {
                str = xmlPullParser.nextText();
            } catch (IOException e) {
                str = null;
            }
            if (attributeValue != null) {
                try {
                    lastActivity.setLastActivity(Long.parseLong(attributeValue));
                } catch (NumberFormatException e2) {
                }
            }
            if (str != null) {
                lastActivity.setMessage(str);
            }
            return lastActivity;
        }
    }

    public LastActivity() {
        setType(IQ.Type.GET);
    }

    public static LastActivity getLastActivity(Connection connection, String str) throws XMPPException {
        LastActivity lastActivity = new LastActivity();
        lastActivity.setTo(StringUtils.parseBareAddress(str));
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(lastActivity.getPacketID()));
        connection.sendPacket(lastActivity);
        LastActivity lastActivity2 = (LastActivity) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (lastActivity2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (lastActivity2.getError() == null) {
            return lastActivity2;
        }
        throw new XMPPException(lastActivity2.getError());
    }

    public void setMessage(String str) {
        this.message = str;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:last\"");
        if (this.lastActivity != -1) {
            sb.append(" seconds=\"").append(this.lastActivity).append("\"");
        }
        sb.append("></query>");
        return sb.toString();
    }

    public long getIdleTime() {
        return this.lastActivity;
    }

    public String getStatusMessage() {
        return this.message;
    }

    public void setLastActivity(long j) {
        this.lastActivity = j;
    }
}
