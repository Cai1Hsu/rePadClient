package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Affiliation.class */
public class Affiliation implements PacketExtension {
    protected String node;
    protected Type type;

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/Affiliation$Type.class */
    public enum Type {
        member,
        none,
        outcast,
        owner,
        publisher
    }

    public Affiliation(String str, Type type) {
        this.node = str;
        this.type = type;
    }

    private void appendAttribute(StringBuilder sb, String str, String str2) {
        sb.append(" ");
        sb.append(str);
        sb.append("='");
        sb.append(str2);
        sb.append("'");
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "subscription";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return null;
    }

    public String getNodeId() {
        return this.node;
    }

    public Type getType() {
        return this.type;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(getElementName());
        appendAttribute(sb, "node", this.node);
        appendAttribute(sb, "affiliation", this.type.toString());
        sb.append("/>");
        return sb.toString();
    }
}
