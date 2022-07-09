package org.jivesoftware.smackx.pubsub;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/SubscribeExtension.class */
public class SubscribeExtension extends NodeExtension {
    protected String jid;

    public SubscribeExtension(String str) {
        super(PubSubElementType.SUBSCRIBE);
        this.jid = str;
    }

    public SubscribeExtension(String str, String str2) {
        super(PubSubElementType.SUBSCRIBE, str2);
        this.jid = str;
    }

    public String getJid() {
        return this.jid;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(getElementName());
        if (getNode() != null) {
            sb.append(" node='");
            sb.append(getNode());
            sb.append("'");
        }
        sb.append(" jid='");
        sb.append(getJid());
        sb.append("'/>");
        return sb.toString();
    }
}
