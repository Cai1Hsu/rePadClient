package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/PayloadItem.class */
public class PayloadItem<E extends PacketExtension> extends Item {
    private E payload;

    public PayloadItem(String str, String str2, E e) {
        super(str, str2);
        if (e == null) {
            throw new IllegalArgumentException("payload cannot be 'null'");
        }
        this.payload = e;
    }

    public PayloadItem(String str, E e) {
        super(str);
        if (e == null) {
            throw new IllegalArgumentException("payload cannot be 'null'");
        }
        this.payload = e;
    }

    public PayloadItem(E e) {
        if (e == null) {
            throw new IllegalArgumentException("payload cannot be 'null'");
        }
        this.payload = e;
    }

    public E getPayload() {
        return this.payload;
    }

    @Override // org.jivesoftware.smackx.pubsub.Item, org.jivesoftware.smackx.pubsub.NodeExtension
    public String toString() {
        return getClass().getName() + " | Content [" + toXML() + "]";
    }

    @Override // org.jivesoftware.smackx.pubsub.Item, org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<item");
        if (getId() != null) {
            sb.append(" id='");
            sb.append(getId());
            sb.append("'");
        }
        if (getNode() != null) {
            sb.append(" node='");
            sb.append(getNode());
            sb.append("'");
        }
        sb.append(">");
        sb.append(this.payload.toXML());
        sb.append("</item>");
        return sb.toString();
    }
}
