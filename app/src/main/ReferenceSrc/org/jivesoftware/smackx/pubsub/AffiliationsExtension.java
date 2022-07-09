package org.jivesoftware.smackx.pubsub;

import java.util.Collections;
import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/AffiliationsExtension.class */
public class AffiliationsExtension extends NodeExtension {
    protected List<Affiliation> items;

    public AffiliationsExtension() {
        super(PubSubElementType.AFFILIATIONS);
        this.items = Collections.EMPTY_LIST;
    }

    public AffiliationsExtension(List<Affiliation> list) {
        super(PubSubElementType.AFFILIATIONS);
        this.items = Collections.EMPTY_LIST;
        this.items = list;
    }

    public List<Affiliation> getAffiliations() {
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
            sb.append(">");
            for (Affiliation affiliation : this.items) {
                sb.append(affiliation.toXML());
            }
            sb.append("</");
            sb.append(getElementName());
            sb.append(">");
            str = sb.toString();
        }
        return str;
    }
}
