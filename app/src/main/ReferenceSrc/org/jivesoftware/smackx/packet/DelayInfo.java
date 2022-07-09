package org.jivesoftware.smackx.packet;

import java.util.Date;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DelayInfo.class */
public class DelayInfo extends DelayInformation {
    DelayInformation wrappedInfo;

    public DelayInfo(DelayInformation delayInformation) {
        super(delayInformation.getStamp());
        this.wrappedInfo = delayInformation;
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation, org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "delay";
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation
    public String getFrom() {
        return this.wrappedInfo.getFrom();
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation, org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "urn:xmpp:delay";
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation
    public String getReason() {
        return this.wrappedInfo.getReason();
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation
    public Date getStamp() {
        return this.wrappedInfo.getStamp();
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation
    public void setFrom(String str) {
        this.wrappedInfo.setFrom(str);
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation
    public void setReason(String str) {
        this.wrappedInfo.setReason(str);
    }

    @Override // org.jivesoftware.smackx.packet.DelayInformation, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\"");
        sb.append(" stamp=\"");
        sb.append(StringUtils.formatXEP0082Date(getStamp()));
        sb.append("\"");
        if (getFrom() != null && getFrom().length() > 0) {
            sb.append(" from=\"").append(getFrom()).append("\"");
        }
        sb.append(">");
        if (getReason() != null && getReason().length() > 0) {
            sb.append(getReason());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
