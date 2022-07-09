package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smackx.pubsub.util.XmlUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/OptionsExtension.class */
public class OptionsExtension extends NodeExtension {
    protected String id;
    protected String jid;

    public OptionsExtension(String str) {
        this(str, null, null);
    }

    public OptionsExtension(String str, String str2) {
        this(str, str2, null);
    }

    public OptionsExtension(String str, String str2, String str3) {
        super(PubSubElementType.OPTIONS, str2);
        this.jid = str;
        this.id = str3;
    }

    public String getId() {
        return this.id;
    }

    public String getJid() {
        return this.jid;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(getElementName());
        XmlUtils.appendAttribute(sb, "jid", this.jid);
        if (getNode() != null) {
            XmlUtils.appendAttribute(sb, "node", getNode());
        }
        if (this.id != null) {
            XmlUtils.appendAttribute(sb, "subid", this.id);
        }
        sb.append("/>");
        return sb.toString();
    }
}
