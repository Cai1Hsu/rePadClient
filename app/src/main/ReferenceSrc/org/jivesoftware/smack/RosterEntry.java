package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.RosterPacket;

/* loaded from: classes.jar:org/jivesoftware/smack/RosterEntry.class */
public class RosterEntry {
    private final Connection connection;
    private String name;
    private final Roster roster;
    private RosterPacket.ItemStatus status;
    private RosterPacket.ItemType type;
    private String user;

    RosterEntry(String str, String str2, RosterPacket.ItemType itemType, RosterPacket.ItemStatus itemStatus, Roster roster, Connection connection) {
        this.user = str;
        this.name = str2;
        this.type = itemType;
        this.status = itemStatus;
        this.roster = roster;
        this.connection = connection;
    }

    static RosterPacket.Item toRosterItem(RosterEntry rosterEntry) {
        RosterPacket.Item item = new RosterPacket.Item(rosterEntry.getUser(), rosterEntry.getName());
        item.setItemType(rosterEntry.getType());
        item.setItemStatus(rosterEntry.getStatus());
        for (RosterGroup rosterGroup : rosterEntry.getGroups()) {
            item.addGroupName(rosterGroup.getName());
        }
        return item;
    }

    public boolean equals(Object obj) {
        return this == obj ? true : (obj == null || !(obj instanceof RosterEntry)) ? false : this.user.equals(((RosterEntry) obj).getUser());
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ac  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equalsDeep(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null) {
                z = false;
            } else if (getClass() != obj.getClass()) {
                z = false;
            } else {
                RosterEntry rosterEntry = (RosterEntry) obj;
                if (this.name == null) {
                    if (rosterEntry.name != null) {
                        z = false;
                    }
                    if (this.status != null) {
                        if (rosterEntry.status != null) {
                            z = false;
                        }
                        if (this.type != null) {
                            if (rosterEntry.type != null) {
                                z = false;
                            }
                            if (this.user != null) {
                                if (rosterEntry.user != null) {
                                    z = false;
                                }
                            } else if (!this.user.equals(rosterEntry.user)) {
                                z = false;
                            }
                        } else {
                            if (!this.type.equals(rosterEntry.type)) {
                                z = false;
                            }
                            if (this.user != null) {
                            }
                        }
                    } else {
                        if (!this.status.equals(rosterEntry.status)) {
                            z = false;
                        }
                        if (this.type != null) {
                        }
                    }
                } else {
                    if (!this.name.equals(rosterEntry.name)) {
                        z = false;
                    }
                    if (this.status != null) {
                    }
                }
            }
        }
        return z;
    }

    public Collection<RosterGroup> getGroups() {
        ArrayList arrayList = new ArrayList();
        for (RosterGroup rosterGroup : this.roster.getGroups()) {
            if (rosterGroup.contains(this)) {
                arrayList.add(rosterGroup);
            }
        }
        return Collections.unmodifiableCollection(arrayList);
    }

    public String getName() {
        return this.name;
    }

    public RosterPacket.ItemStatus getStatus() {
        return this.status;
    }

    public RosterPacket.ItemType getType() {
        return this.type;
    }

    public String getUser() {
        return this.user;
    }

    public void setName(String str) {
        if (str == null || !str.equals(this.name)) {
            this.name = str;
            RosterPacket rosterPacket = new RosterPacket();
            rosterPacket.setType(IQ.Type.SET);
            rosterPacket.addRosterItem(toRosterItem(this));
            this.connection.sendPacket(rosterPacket);
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.name != null) {
            sb.append(this.name).append(": ");
        }
        sb.append(this.user);
        Collection<RosterGroup> groups = getGroups();
        if (!groups.isEmpty()) {
            sb.append(" [");
            Iterator<RosterGroup> it = groups.iterator();
            sb.append(it.next().getName());
            while (it.hasNext()) {
                sb.append(", ");
                sb.append(it.next().getName());
            }
            sb.append("]");
        }
        return sb.toString();
    }

    void updateState(String str, RosterPacket.ItemType itemType, RosterPacket.ItemStatus itemStatus) {
        this.name = str;
        this.type = itemType;
        this.status = itemStatus;
    }
}
