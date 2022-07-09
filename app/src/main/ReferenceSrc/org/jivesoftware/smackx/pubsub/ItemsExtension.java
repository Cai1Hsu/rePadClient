package org.jivesoftware.smackx.pubsub;

import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/ItemsExtension.class */
public class ItemsExtension extends NodeExtension implements EmbeddedPacketExtension {
    protected List<? extends PacketExtension> items;
    protected Boolean notify;
    protected ItemsElementType type;

    /* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/ItemsExtension$ItemsElementType.class */
    public enum ItemsElementType {
        items(PubSubElementType.ITEMS, "max_items"),
        retract(PubSubElementType.RETRACT, "notify");
        
        private String att;
        private PubSubElementType elem;

        ItemsElementType(PubSubElementType pubSubElementType, String str) {
            this.elem = pubSubElementType;
            this.att = str;
        }

        public String getElementAttribute() {
            return this.att;
        }

        public PubSubElementType getNodeElement() {
            return this.elem;
        }
    }

    public ItemsExtension(String str, List<? extends PacketExtension> list, boolean z) {
        super(ItemsElementType.retract.getNodeElement(), str);
        this.type = ItemsElementType.retract;
        this.items = list;
        this.notify = Boolean.valueOf(z);
    }

    public ItemsExtension(ItemsElementType itemsElementType, String str, List<? extends PacketExtension> list) {
        super(itemsElementType.getNodeElement(), str);
        this.type = itemsElementType;
        this.items = list;
    }

    /* JADX DEBUG: Type inference failed for r0v1. Raw type applied. Possible types: java.util.List<? extends org.jivesoftware.smack.packet.PacketExtension>, java.util.List<org.jivesoftware.smack.packet.PacketExtension> */
    @Override // org.jivesoftware.smackx.pubsub.EmbeddedPacketExtension
    public List<PacketExtension> getExtensions() {
        return getItems();
    }

    public List<? extends PacketExtension> getItems() {
        return this.items;
    }

    public ItemsElementType getItemsElementType() {
        return this.type;
    }

    public boolean getNotify() {
        return this.notify.booleanValue();
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension
    public String toString() {
        return getClass().getName() + "Content [" + toXML() + "]";
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        String str;
        if (this.items == null || this.items.size() == 0) {
            str = super.toXML();
        } else {
            StringBuilder sb = new StringBuilder("<");
            sb.append(getElementName());
            sb.append(" node='");
            sb.append(getNode());
            if (this.notify != null) {
                sb.append("' ");
                sb.append(this.type.getElementAttribute());
                sb.append("='");
                sb.append(this.notify.equals(Boolean.TRUE) ? 1 : 0);
                sb.append("'>");
            } else {
                sb.append("'>");
                for (PacketExtension packetExtension : this.items) {
                    sb.append(packetExtension.toXML());
                }
            }
            sb.append("</");
            sb.append(getElementName());
            sb.append(">");
            str = sb.toString();
        }
        return str;
    }
}
