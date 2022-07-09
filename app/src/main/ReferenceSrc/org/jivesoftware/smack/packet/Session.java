package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Session.class */
public class Session extends IQ {
    public Session() {
        setType(IQ.Type.SET);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<session xmlns=\"urn:ietf:params:xml:ns:xmpp-session\"/>";
    }
}
