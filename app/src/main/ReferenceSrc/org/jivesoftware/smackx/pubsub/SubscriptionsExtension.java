package org.jivesoftware.smackx.pubsub;

import java.util.Collections;
import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/SubscriptionsExtension.class */
public class SubscriptionsExtension extends NodeExtension {
    protected List<Subscription> items;

    public SubscriptionsExtension(String str, List<Subscription> list) {
        super(PubSubElementType.SUBSCRIPTIONS, str);
        this.items = Collections.EMPTY_LIST;
        if (list != null) {
            this.items = list;
        }
    }

    public SubscriptionsExtension(List<Subscription> list) {
        super(PubSubElementType.SUBSCRIPTIONS);
        this.items = Collections.EMPTY_LIST;
        if (list != null) {
            this.items = list;
        }
    }

    public List<Subscription> getSubscriptions() {
        return this.items;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        String str;
        if (this.items == null || this.items.size() == 0) {
            str = super.toXML();
        } else {
            StringBuilder sb = new StringBuilder("<");
            sb.append(getElementName());
            if (getNode() != null) {
                sb.append(" node='");
                sb.append(getNode());
                sb.append("'");
            }
            sb.append(">");
            for (Subscription subscription : this.items) {
                sb.append(subscription.toXML());
            }
            sb.append("</");
            sb.append(getElementName());
            sb.append(">");
            str = sb.toString();
        }
        return str;
    }
}
