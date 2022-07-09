package org.jivesoftware.smack.ping.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smack/ping/packet/Ping.class */
public class Ping extends IQ {
    public static final String ELEMENT = "ping";
    public static final String NAMESPACE = "urn:xmpp:ping";

    public Ping() {
    }

    public Ping(String str) {
        setTo(str);
        setType(IQ.Type.GET);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<ping xmlns='urn:xmpp:ping' />";
    }
}
