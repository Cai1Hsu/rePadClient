package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/PacketExtensionFilter.class */
public class PacketExtensionFilter implements PacketFilter {
    private String elementName;
    private String namespace;

    public PacketExtensionFilter(String str) {
        this(null, str);
    }

    public PacketExtensionFilter(String str, String str2) {
        this.elementName = str;
        this.namespace = str2;
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return packet.getExtension(this.elementName, this.namespace) != null;
    }
}
