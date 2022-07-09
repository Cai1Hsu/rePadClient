package org.jivesoftware.smackx.workgroup.packet;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.workgroup.QueueUser;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueDetails.class */
public class QueueDetails implements PacketExtension {
    private static final String DATE_FORMAT = "yyyyMMdd'T'HH:mm:ss";
    public static final String ELEMENT_NAME = "notify-queue-details";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private SimpleDateFormat dateFormat;
    private Set<QueueUser> users;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/QueueDetails$Provider.class */
    public static class Provider implements PacketExtensionProvider {
        @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
        public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
            Date date;
            int i;
            int i2;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(QueueDetails.DATE_FORMAT);
            QueueDetails queueDetails = new QueueDetails();
            int eventType = xmlPullParser.getEventType();
            while (eventType != 3 && QueueDetails.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                int next = xmlPullParser.next();
                while (true) {
                    int i3 = next;
                    eventType = i3;
                    if (i3 == 2) {
                        eventType = i3;
                        if (UserID.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                            int i4 = -1;
                            int i5 = -1;
                            Date date2 = null;
                            String attributeValue = xmlPullParser.getAttributeValue("", "jid");
                            if (attributeValue == null) {
                            }
                            int next2 = xmlPullParser.next();
                            while (true) {
                                if (next2 != 3 || !UserID.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                                    if ("position".equals(xmlPullParser.getName())) {
                                        i = Integer.parseInt(xmlPullParser.nextText());
                                        i2 = i5;
                                        date = date2;
                                    } else if ("time".equals(xmlPullParser.getName())) {
                                        i2 = Integer.parseInt(xmlPullParser.nextText());
                                        date = date2;
                                        i = i4;
                                    } else if ("join-time".equals(xmlPullParser.getName())) {
                                        date = simpleDateFormat.parse(xmlPullParser.nextText());
                                        i = i4;
                                        i2 = i5;
                                    } else {
                                        date = date2;
                                        i = i4;
                                        i2 = i5;
                                        if (xmlPullParser.getName().equals("waitTime")) {
                                            System.out.println(simpleDateFormat.parse(xmlPullParser.nextText()));
                                            date = date2;
                                            i = i4;
                                            i2 = i5;
                                        }
                                    }
                                    int next3 = xmlPullParser.next();
                                    next2 = next3;
                                    date2 = date;
                                    i4 = i;
                                    i5 = i2;
                                    if (next3 != 3) {
                                        next2 = next3;
                                        date2 = date;
                                        i4 = i;
                                        i5 = i2;
                                    }
                                }
                            }
                            queueDetails.addUser(new QueueUser(attributeValue, i4, i5, date2));
                            next = xmlPullParser.next();
                        }
                    }
                }
            }
            return queueDetails;
        }
    }

    private QueueDetails() {
        this.dateFormat = new SimpleDateFormat(DATE_FORMAT);
        this.users = new HashSet();
    }

    public void addUser(QueueUser queueUser) {
        synchronized (this.users) {
            this.users.add(queueUser);
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/workgroup";
    }

    public int getUserCount() {
        return this.users.size();
    }

    public Set<QueueUser> getUsers() {
        Set<QueueUser> set;
        synchronized (this.users) {
            set = this.users;
        }
        return set;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jabber.org/protocol/workgroup").append("\">");
        synchronized (this.users) {
            for (QueueUser queueUser : this.users) {
                int queuePosition = queueUser.getQueuePosition();
                int estimatedRemainingTime = queueUser.getEstimatedRemainingTime();
                Date queueJoinTimestamp = queueUser.getQueueJoinTimestamp();
                sb.append("<user jid=\"").append(queueUser.getUserID()).append("\">");
                if (queuePosition != -1) {
                    sb.append("<position>").append(queuePosition).append("</position>");
                }
                if (estimatedRemainingTime != -1) {
                    sb.append("<time>").append(estimatedRemainingTime).append("</time>");
                }
                if (queueJoinTimestamp != null) {
                    sb.append("<join-time>");
                    sb.append(this.dateFormat.format(queueJoinTimestamp));
                    sb.append("</join-time>");
                }
                sb.append("</user>");
            }
        }
        sb.append("</").append(ELEMENT_NAME).append(">");
        return sb.toString();
    }
}
