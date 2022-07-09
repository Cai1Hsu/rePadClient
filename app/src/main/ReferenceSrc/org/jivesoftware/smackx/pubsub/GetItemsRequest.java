package org.jivesoftware.smackx.pubsub;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/GetItemsRequest.class */
public class GetItemsRequest extends NodeExtension {
    protected int maxItems;
    protected String subId;

    public GetItemsRequest(String str) {
        super(PubSubElementType.ITEMS, str);
    }

    public GetItemsRequest(String str, int i) {
        super(PubSubElementType.ITEMS, str);
        this.maxItems = i;
    }

    public GetItemsRequest(String str, String str2) {
        super(PubSubElementType.ITEMS, str);
        this.subId = str2;
    }

    public GetItemsRequest(String str, String str2, int i) {
        this(str, i);
        this.subId = str2;
    }

    public int getMaxItems() {
        return this.maxItems;
    }

    public String getSubscriptionId() {
        return this.subId;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(getElementName());
        sb.append(" node='");
        sb.append(getNode());
        sb.append("'");
        if (getSubscriptionId() != null) {
            sb.append(" subid='");
            sb.append(getSubscriptionId());
            sb.append("'");
        }
        if (getMaxItems() > 0) {
            sb.append(" max_items='");
            sb.append(getMaxItems());
            sb.append("'");
        }
        sb.append("/>");
        return sb.toString();
    }
}
