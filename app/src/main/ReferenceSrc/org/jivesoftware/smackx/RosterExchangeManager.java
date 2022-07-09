package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.RosterGroup;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.packet.RosterExchange;

/* loaded from: classes.jar:org/jivesoftware/smackx/RosterExchangeManager.class */
public class RosterExchangeManager {
    private Connection con;
    private PacketListener packetListener;
    private List<RosterExchangeListener> rosterExchangeListeners = new ArrayList();
    private PacketFilter packetFilter = new PacketExtensionFilter("x", "jabber:x:roster");

    public RosterExchangeManager(Connection connection) {
        this.con = connection;
        init();
    }

    public void fireRosterExchangeListeners(String str, Iterator<RemoteRosterEntry> it) {
        RosterExchangeListener[] rosterExchangeListenerArr;
        synchronized (this.rosterExchangeListeners) {
            rosterExchangeListenerArr = new RosterExchangeListener[this.rosterExchangeListeners.size()];
            this.rosterExchangeListeners.toArray(rosterExchangeListenerArr);
        }
        for (RosterExchangeListener rosterExchangeListener : rosterExchangeListenerArr) {
            rosterExchangeListener.entriesReceived(str, it);
        }
    }

    private void init() {
        this.packetListener = new PacketListener() { // from class: org.jivesoftware.smackx.RosterExchangeManager.1
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Message message = (Message) packet;
                RosterExchangeManager.this.fireRosterExchangeListeners(message.getFrom(), ((RosterExchange) message.getExtension("x", "jabber:x:roster")).getRosterEntries());
            }
        };
        this.con.addPacketListener(this.packetListener, this.packetFilter);
    }

    public void addRosterListener(RosterExchangeListener rosterExchangeListener) {
        synchronized (this.rosterExchangeListeners) {
            if (!this.rosterExchangeListeners.contains(rosterExchangeListener)) {
                this.rosterExchangeListeners.add(rosterExchangeListener);
            }
        }
    }

    public void destroy() {
        if (this.con != null) {
            this.con.removePacketListener(this.packetListener);
        }
    }

    protected void finalize() throws Throwable {
        destroy();
        super.finalize();
    }

    public void removeRosterListener(RosterExchangeListener rosterExchangeListener) {
        synchronized (this.rosterExchangeListeners) {
            this.rosterExchangeListeners.remove(rosterExchangeListener);
        }
    }

    public void send(Roster roster, String str) {
        Message message = new Message(str);
        message.addExtension(new RosterExchange(roster));
        this.con.sendPacket(message);
    }

    public void send(RosterEntry rosterEntry, String str) {
        Packet message = new Message(str);
        RosterExchange rosterExchange = new RosterExchange();
        rosterExchange.addRosterEntry(rosterEntry);
        message.addExtension(rosterExchange);
        this.con.sendPacket(message);
    }

    public void send(RosterGroup rosterGroup, String str) {
        Packet message = new Message(str);
        RosterExchange rosterExchange = new RosterExchange();
        for (RosterEntry rosterEntry : rosterGroup.getEntries()) {
            rosterExchange.addRosterEntry(rosterEntry);
        }
        message.addExtension(rosterExchange);
        this.con.sendPacket(message);
    }
}
