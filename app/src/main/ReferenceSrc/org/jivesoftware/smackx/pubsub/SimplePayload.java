package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/SimplePayload.class */
public class SimplePayload implements PacketExtension {
    private String elemName;
    private String ns;
    private String payload;

    public SimplePayload(String str, String str2, String str3) {
        this.elemName = str;
        this.payload = str3;
        this.ns = str2;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return this.elemName;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return this.ns;
    }

    public String toString() {
        return getClass().getName() + "payload [" + toXML() + "]";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return this.payload;
    }
}
