package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/RosterGroup.class */
public class RosterGroup {
    private Connection connection;
    private final List<RosterEntry> entries = new ArrayList();
    private String name;

    RosterGroup(String str, Connection connection) {
        this.name = str;
        this.connection = connection;
    }

    public void addEntry(RosterEntry rosterEntry) throws XMPPException {
        PacketCollector packetCollector = null;
        synchronized (this.entries) {
            if (!this.entries.contains(rosterEntry)) {
                RosterPacket rosterPacket = new RosterPacket();
                rosterPacket.setType(IQ.Type.SET);
                RosterPacket.Item rosterItem = RosterEntry.toRosterItem(rosterEntry);
                rosterItem.addGroupName(getName());
                rosterPacket.addRosterItem(rosterItem);
                packetCollector = this.connection.createPacketCollector(new PacketIDFilter(rosterPacket.getPacketID()));
                this.connection.sendPacket(rosterPacket);
            }
        }
        if (packetCollector != null) {
            IQ iq = (IQ) packetCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            packetCollector.cancel();
            if (iq == null) {
                throw new XMPPException("No response from the server.");
            }
            if (iq.getType() != IQ.Type.ERROR) {
                return;
            }
            throw new XMPPException(iq.getError());
        }
    }

    void addEntryLocal(RosterEntry rosterEntry) {
        synchronized (this.entries) {
            this.entries.remove(rosterEntry);
            this.entries.add(rosterEntry);
        }
    }

    public boolean contains(String str) {
        return getEntry(str) != null;
    }

    public boolean contains(RosterEntry rosterEntry) {
        boolean contains;
        synchronized (this.entries) {
            contains = this.entries.contains(rosterEntry);
        }
        return contains;
    }

    public Collection<RosterEntry> getEntries() {
        List unmodifiableList;
        synchronized (this.entries) {
            unmodifiableList = Collections.unmodifiableList(new ArrayList(this.entries));
        }
        return unmodifiableList;
    }

    public RosterEntry getEntry(String str) {
        RosterEntry rosterEntry;
        if (str != null) {
            String lowerCase = StringUtils.parseBareAddress(str).toLowerCase();
            synchronized (this.entries) {
                Iterator<RosterEntry> it = this.entries.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        rosterEntry = null;
                        break;
                    }
                    rosterEntry = it.next();
                    if (rosterEntry.getUser().equals(lowerCase)) {
                        break;
                    }
                }
            }
        } else {
            rosterEntry = null;
        }
        return rosterEntry;
    }

    public int getEntryCount() {
        int size;
        synchronized (this.entries) {
            size = this.entries.size();
        }
        return size;
    }

    public String getName() {
        return this.name;
    }

    public void removeEntry(RosterEntry rosterEntry) throws XMPPException {
        PacketCollector packetCollector = null;
        synchronized (this.entries) {
            if (this.entries.contains(rosterEntry)) {
                RosterPacket rosterPacket = new RosterPacket();
                rosterPacket.setType(IQ.Type.SET);
                RosterPacket.Item rosterItem = RosterEntry.toRosterItem(rosterEntry);
                rosterItem.removeGroupName(getName());
                rosterPacket.addRosterItem(rosterItem);
                packetCollector = this.connection.createPacketCollector(new PacketIDFilter(rosterPacket.getPacketID()));
                this.connection.sendPacket(rosterPacket);
            }
        }
        if (packetCollector != null) {
            IQ iq = (IQ) packetCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
            packetCollector.cancel();
            if (iq == null) {
                throw new XMPPException("No response from the server.");
            }
            if (iq.getType() != IQ.Type.ERROR) {
                return;
            }
            throw new XMPPException(iq.getError());
        }
    }

    void removeEntryLocal(RosterEntry rosterEntry) {
        synchronized (this.entries) {
            if (this.entries.contains(rosterEntry)) {
                this.entries.remove(rosterEntry);
            }
        }
    }

    public void setName(String str) {
        synchronized (this.entries) {
            for (RosterEntry rosterEntry : this.entries) {
                RosterPacket rosterPacket = new RosterPacket();
                rosterPacket.setType(IQ.Type.SET);
                RosterPacket.Item rosterItem = RosterEntry.toRosterItem(rosterEntry);
                rosterItem.removeGroupName(this.name);
                rosterItem.addGroupName(str);
                rosterPacket.addRosterItem(rosterItem);
                this.connection.sendPacket(rosterPacket);
            }
        }
    }
}
