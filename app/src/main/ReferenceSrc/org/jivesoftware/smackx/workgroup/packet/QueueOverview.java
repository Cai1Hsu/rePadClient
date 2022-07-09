package org.jivesoftware.smackx.workgroup.packet;

import com.edutech.json.KeyEnvironment;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.workgroup.agent.WorkgroupQueue;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueOverview.class */
public class QueueOverview implements PacketExtension {
    private static final String DATE_FORMAT = "yyyyMMdd'T'HH:mm:ss";
    public static String ELEMENT_NAME = "notify-queue";
    public static String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private SimpleDateFormat dateFormat = new SimpleDateFormat(DATE_FORMAT);
    private int averageWaitTime = -1;
    private Date oldestEntry = null;
    private int userCount = -1;
    private WorkgroupQueue.Status status = null;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueOverview$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            int eventType = xmlPullParser.getEventType();
            QueueOverview queueOverview = new QueueOverview();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(QueueOverview.DATE_FORMAT);
            if (eventType != 2) {
            }
            int next = xmlPullParser.next();
            while (true) {
                if (next == 3 && QueueOverview.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    if (next != 3) {
                    }
                    return queueOverview;
                }
                if (KeyEnvironment.COUNT.equals(xmlPullParser.getName())) {
                    queueOverview.setUserCount(Integer.parseInt(xmlPullParser.nextText()));
                } else if ("time".equals(xmlPullParser.getName())) {
                    queueOverview.setAverageWaitTime(Integer.parseInt(xmlPullParser.nextText()));
                } else if ("oldest".equals(xmlPullParser.getName())) {
                    queueOverview.setOldestEntry(simpleDateFormat.parse(xmlPullParser.nextText()));
                } else if ("status".equals(xmlPullParser.getName())) {
                    queueOverview.setStatus(WorkgroupQueue.Status.fromString(xmlPullParser.nextText()));
                }
                int next2 = xmlPullParser.next();
                next = next2;
                if (next2 != 3) {
                    next = next2;
                }
            }
        }
    }

    QueueOverview() {
    }

    public int getAverageWaitTime() {
        return this.averageWaitTime;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    public Date getOldestEntry() {
        return this.oldestEntry;
    }

    public WorkgroupQueue.Status getStatus() {
        return this.status;
    }

    public int getUserCount() {
        return this.userCount;
    }

    void setAverageWaitTime(int i) {
        this.averageWaitTime = i;
    }

    void setOldestEntry(Date date) {
        this.oldestEntry = date;
    }

    void setStatus(WorkgroupQueue.Status status) {
        this.status = status;
    }

    void setUserCount(int i) {
        this.userCount = i;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append(NAMESPACE).append("\">");
        if (this.userCount != -1) {
            sb.append("<count>").append(this.userCount).append("</count>");
        }
        if (this.oldestEntry != null) {
            sb.append("<oldest>").append(this.dateFormat.format(this.oldestEntry)).append("</oldest>");
        }
        if (this.averageWaitTime != -1) {
            sb.append("<time>").append(this.averageWaitTime).append("</time>");
        }
        if (this.status != null) {
            sb.append("<status>").append(this.status).append("</status>");
        }
        sb.append("</").append(ELEMENT_NAME).append(">");
        return sb.toString();
    }
}
