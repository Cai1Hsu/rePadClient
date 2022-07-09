package org.jivesoftware.smackx.pubsub;

import java.util.ArrayList;
import java.util.Collection;
import org.jivesoftware.smackx.pubsub.Item;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/PublishItem.class */
public class PublishItem<T extends Item> extends NodeExtension {
    protected Collection<T> items;

    public PublishItem(String str, Collection<T> collection) {
        super(PubSubElementType.PUBLISH, str);
        this.items = collection;
    }

    public PublishItem(String str, T t) {
        super(PubSubElementType.PUBLISH, str);
        this.items = new ArrayList(1);
        this.items.add(t);
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(getElementName());
        sb.append(" node='");
        sb.append(getNode());
        sb.append("'>");
        for (T t : this.items) {
            sb.append(t.toXML());
        }
        sb.append("</publish>");
        return sb.toString();
    }
}
