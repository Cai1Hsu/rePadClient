package org.jivesoftware.smack.packet;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/RosterPacket.class */
public class RosterPacket extends IQ {
    private final List<Item> rosterItems = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/RosterPacket$Item.class */
    public static class Item {
        private String name;
        private String user;
        private ItemType itemType = null;
        private ItemStatus itemStatus = null;
        private final Set<String> groupNames = new CopyOnWriteArraySet();

        public Item(String str, String str2) {
            this.user = str.toLowerCase();
            this.name = str2;
        }

        public void addGroupName(String str) {
            this.groupNames.add(str);
        }

        public Set<String> getGroupNames() {
            return Collections.unmodifiableSet(this.groupNames);
        }

        public ItemStatus getItemStatus() {
            return this.itemStatus;
        }

        public ItemType getItemType() {
            return this.itemType;
        }

        public String getName() {
            return this.name;
        }

        public String getUser() {
            return this.user;
        }

        public void removeGroupName(String str) {
            this.groupNames.remove(str);
        }

        public void setItemStatus(ItemStatus itemStatus) {
            this.itemStatus = itemStatus;
        }

        public void setItemType(ItemType itemType) {
            this.itemType = itemType;
        }

        public void setName(String str) {
            this.name = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<item jid=\"").append(this.user).append("\"");
            if (this.name != null) {
                sb.append(" name=\"").append(StringUtils.escapeForXML(this.name)).append("\"");
            }
            if (this.itemType != null) {
                sb.append(" subscription=\"").append(this.itemType).append("\"");
            }
            if (this.itemStatus != null) {
                sb.append(" ask=\"").append(this.itemStatus).append("\"");
            }
            sb.append(">");
            for (String str : this.groupNames) {
                sb.append("<group>").append(StringUtils.escapeForXML(str)).append("</group>");
            }
            sb.append("</item>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/RosterPacket$ItemStatus.class */
    public static class ItemStatus {
        public static final ItemStatus SUBSCRIPTION_PENDING = new ItemStatus("subscribe");
        public static final ItemStatus UNSUBSCRIPTION_PENDING = new ItemStatus("unsubscribe");
        private String value;

        private ItemStatus(String str) {
            this.value = str;
        }

        public static ItemStatus fromString(String str) {
            ItemStatus itemStatus;
            if (str == null) {
                itemStatus = null;
            } else {
                String lowerCase = str.toLowerCase();
                if ("unsubscribe".equals(lowerCase)) {
                    itemStatus = UNSUBSCRIPTION_PENDING;
                } else {
                    itemStatus = null;
                    if ("subscribe".equals(lowerCase)) {
                        itemStatus = SUBSCRIPTION_PENDING;
                    }
                }
            }
            return itemStatus;
        }

        public String toString() {
            return this.value;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/RosterPacket$ItemType.class */
    public enum ItemType {
        none,
        to,
        from,
        both,
        remove
    }

    public void addRosterItem(Item item) {
        synchronized (this.rosterItems) {
            this.rosterItems.add(item);
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:roster\">");
        synchronized (this.rosterItems) {
            for (Item item : this.rosterItems) {
                sb.append(item.toXML());
            }
        }
        sb.append("</query>");
        return sb.toString();
    }

    public int getRosterItemCount() {
        int size;
        synchronized (this.rosterItems) {
            size = this.rosterItems.size();
        }
        return size;
    }

    public Collection<Item> getRosterItems() {
        List unmodifiableList;
        synchronized (this.rosterItems) {
            unmodifiableList = Collections.unmodifiableList(new ArrayList(this.rosterItems));
        }
        return unmodifiableList;
    }
}
