package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/XHTMLExtension.class */
public class XHTMLExtension implements PacketExtension {
    private List<String> bodies = new ArrayList();

    public void addBody(String str) {
        synchronized (this.bodies) {
            this.bodies.add(str);
        }
    }

    public Iterator<String> getBodies() {
        Iterator<String> it;
        synchronized (this.bodies) {
            it = Collections.unmodifiableList(new ArrayList(this.bodies)).iterator();
        }
        return it;
    }

    public int getBodiesCount() {
        return this.bodies.size();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "html";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/xhtml-im";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        Iterator<String> bodies = getBodies();
        while (bodies.hasNext()) {
            sb.append(bodies.next());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
