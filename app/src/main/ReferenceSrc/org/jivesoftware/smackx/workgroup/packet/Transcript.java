package org.jivesoftware.smackx.workgroup.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/Transcript.class */
public class Transcript extends IQ {
    private List<Packet> packets;
    private String sessionID;

    public Transcript(String str) {
        this.sessionID = str;
        this.packets = new ArrayList();
    }

    public Transcript(String str, List<Packet> list) {
        this.sessionID = str;
        this.packets = list;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<transcript xmlns=\"http://jivesoftware.com/protocol/workgroup\" sessionID=\"").append(this.sessionID).append("\">");
        for (Packet packet : this.packets) {
            sb.append(packet.toXML());
        }
        sb.append("</transcript>");
        return sb.toString();
    }

    public List<Packet> getPackets() {
        return Collections.unmodifiableList(this.packets);
    }

    public String getSessionID() {
        return this.sessionID;
    }
}
