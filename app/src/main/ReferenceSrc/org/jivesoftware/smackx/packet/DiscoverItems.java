package org.jivesoftware.smackx.packet;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DiscoverItems.class */
public class DiscoverItems extends IQ {
    public static final String NAMESPACE = "http://jabber.org/protocol/disco#items";
    private final List<Item> items = new CopyOnWriteArrayList();
    private String node;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/DiscoverItems$Item.class */
    public static class Item {
        public static final String REMOVE_ACTION = "remove";
        public static final String UPDATE_ACTION = "update";
        private String action;
        private String entityID;
        private String name;
        private String node;

        public Item(String str) {
            this.entityID = str;
        }

        public String getAction() {
            return this.action;
        }

        public String getEntityID() {
            return this.entityID;
        }

        public String getName() {
            return this.name;
        }

        public String getNode() {
            return this.node;
        }

        public void setAction(String str) {
            this.action = str;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setNode(String str) {
            this.node = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<item jid=\"").append(this.entityID).append("\"");
            if (this.name != null) {
                sb.append(" name=\"").append(StringUtils.escapeForXML(this.name)).append("\"");
            }
            if (this.node != null) {
                sb.append(" node=\"").append(StringUtils.escapeForXML(this.node)).append("\"");
            }
            if (this.action != null) {
                sb.append(" action=\"").append(StringUtils.escapeForXML(this.action)).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    public void addItem(Item item) {
        synchronized (this.items) {
            this.items.add(item);
        }
    }

    public void addItems(Collection<Item> collection) {
        if (collection == null) {
            return;
        }
        for (Item item : collection) {
            addItem(item);
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"http://jabber.org/protocol/disco#items\"");
        if (getNode() != null) {
            sb.append(" node=\"");
            sb.append(StringUtils.escapeForXML(getNode()));
            sb.append("\"");
        }
        sb.append(">");
        synchronized (this.items) {
            for (Item item : this.items) {
                sb.append(item.toXML());
            }
        }
        sb.append("</query>");
        return sb.toString();
    }

    public Iterator<Item> getItems() {
        Iterator<Item> it;
        synchronized (this.items) {
            it = Collections.unmodifiableList(this.items).iterator();
        }
        return it;
    }

    public String getNode() {
        return this.node;
    }

    public void setNode(String str) {
        this.node = str;
    }
}
