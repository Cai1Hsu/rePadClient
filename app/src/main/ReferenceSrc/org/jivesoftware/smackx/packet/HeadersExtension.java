package org.jivesoftware.smackx.packet;

import java.util.Collection;
import java.util.Collections;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/HeadersExtension.class */
public class HeadersExtension implements PacketExtension {
    public static final String NAMESPACE = "http://jabber.org/protocol/shim";
    private Collection<Header> headers;

    public HeadersExtension(Collection<Header> collection) {
        this.headers = Collections.EMPTY_LIST;
        if (collection != null) {
            this.headers = collection;
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "headers";
    }

    public Collection<Header> getHeaders() {
        return this.headers;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return NAMESPACE;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<" + getElementName() + " xmlns='" + getNamespace() + "'>");
        for (Header header : this.headers) {
            sb.append(header.toXML());
        }
        sb.append("</" + getElementName() + '>');
        return sb.toString();
    }
}
