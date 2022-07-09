package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/MonitorPacket.class */
public class MonitorPacket extends IQ {
    public static final String ELEMENT_NAME = "monitor";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private boolean isMonitor;
    private String sessionID;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/MonitorPacket$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            MonitorPacket monitorPacket = new MonitorPacket();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next != 2 || !"isMonitor".equals(xmlPullParser.getName())) {
                    if (next == 3 && MonitorPacket.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                        z = true;
                    }
                } else if ("false".equalsIgnoreCase(xmlPullParser.nextText())) {
                    monitorPacket.setMonitor(false);
                } else {
                    monitorPacket.setMonitor(true);
                }
            }
            return monitorPacket;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=");
        sb.append('\"');
        sb.append("http://jivesoftware.com/protocol/workgroup");
        sb.append('\"');
        sb.append(">");
        if (this.sessionID != null) {
            sb.append("<makeOwner sessionID=\"" + this.sessionID + "\"></makeOwner>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public String getElementName() {
        return ELEMENT_NAME;
    }

    public String getNamespace() {
        return "http://jivesoftware.com/protocol/workgroup";
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public boolean isMonitor() {
        return this.isMonitor;
    }

    public void setMonitor(boolean z) {
        this.isMonitor = z;
    }

    public void setSessionID(String str) {
        this.sessionID = str;
    }
}
