package org.jivesoftware.smackx.muc;

import org.jivesoftware.smack.PacketInterceptor;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/DeafOccupantInterceptor.class */
public class DeafOccupantInterceptor implements PacketInterceptor {

    /* loaded from: classes.jar:org/jivesoftware/smackx/muc/DeafOccupantInterceptor$DeafExtension.class */
    private static class DeafExtension implements PacketExtension {
        private DeafExtension() {
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getElementName() {
            return "x";
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String getNamespace() {
            return "http://jivesoftware.org/protocol/muc";
        }

        @Override // org.jivesoftware.smack.packet.PacketExtension
        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
            sb.append("<deaf-occupant/>");
            sb.append("</").append(getElementName()).append(">");
            return sb.toString();
        }
    }

    @Override // org.jivesoftware.smack.PacketInterceptor
    public void interceptPacket(Packet packet) {
        Presence presence = (Presence) packet;
        if (Presence.Type.available != presence.getType() || presence.getExtension("x", "http://jabber.org/protocol/muc") == null) {
            return;
        }
        packet.addExtension(new DeafExtension());
    }
}
