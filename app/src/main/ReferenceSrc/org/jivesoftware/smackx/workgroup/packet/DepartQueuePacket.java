package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/DepartQueuePacket.class */
public class DepartQueuePacket extends IQ {
    private String user;

    public DepartQueuePacket(String str) {
        this(str, null);
    }

    public DepartQueuePacket(String str, String str2) {
        this.user = str2;
        setTo(str);
        setType(IQ.Type.SET);
        setFrom(str2);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder("<depart-queue xmlns=\"http://jabber.org/protocol/workgroup\"");
        if (this.user != null) {
            sb.append("><jid>").append(this.user).append("</jid></depart-queue>");
        } else {
            sb.append("/>");
        }
        return sb.toString();
    }
}
