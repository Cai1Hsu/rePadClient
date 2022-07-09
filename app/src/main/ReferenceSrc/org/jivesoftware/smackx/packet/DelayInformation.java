package org.jivesoftware.smackx.packet;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DelayInformation.class */
public class DelayInformation implements PacketExtension {
    public static final DateFormat XEP_0091_UTC_FORMAT = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private String from;
    private String reason;
    private Date stamp;

    static {
        XEP_0091_UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public DelayInformation(Date date) {
        this.stamp = date;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    public String getFrom() {
        return this.from;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "jabber:x:delay";
    }

    public String getReason() {
        return this.reason;
    }

    public Date getStamp() {
        return this.stamp;
    }

    public void setFrom(String str) {
        this.from = str;
    }

    public void setReason(String str) {
        this.reason = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\"");
        sb.append(" stamp=\"");
        synchronized (XEP_0091_UTC_FORMAT) {
            sb.append(XEP_0091_UTC_FORMAT.format(this.stamp));
        }
        sb.append("\"");
        if (this.from != null && this.from.length() > 0) {
            sb.append(" from=\"").append(this.from).append("\"");
        }
        sb.append(">");
        if (this.reason != null && this.reason.length() > 0) {
            sb.append(this.reason);
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
