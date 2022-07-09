package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/filter/FromMatchesFilter.class */
public class FromMatchesFilter implements PacketFilter {
    private String address;
    private boolean matchBareJID;

    public FromMatchesFilter(String str) {
        this.matchBareJID = false;
        if (str == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.address = str.toLowerCase();
        this.matchBareJID = "".equals(StringUtils.parseResource(str));
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        return packet.getFrom() == null ? false : this.matchBareJID ? packet.getFrom().toLowerCase().startsWith(this.address) : this.address.equals(packet.getFrom().toLowerCase());
    }

    public String toString() {
        return "FromMatchesFilter: " + this.address;
    }
}
