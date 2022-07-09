package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.RosterGroup;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.RemoteRosterEntry;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/RosterExchange.class */
public class RosterExchange implements PacketExtension {
    private List<RemoteRosterEntry> remoteRosterEntries = new ArrayList();

    public RosterExchange() {
    }

    public RosterExchange(Roster roster) {
        for (RosterEntry rosterEntry : roster.getEntries()) {
            addRosterEntry(rosterEntry);
        }
    }

    public void addRosterEntry(RosterEntry rosterEntry) {
        ArrayList arrayList = new ArrayList();
        for (RosterGroup rosterGroup : rosterEntry.getGroups()) {
            arrayList.add(rosterGroup.getName());
        }
        addRosterEntry(new RemoteRosterEntry(rosterEntry.getUser(), rosterEntry.getName(), (String[]) arrayList.toArray(new String[arrayList.size()])));
    }

    public void addRosterEntry(RemoteRosterEntry remoteRosterEntry) {
        synchronized (this.remoteRosterEntries) {
            this.remoteRosterEntries.add(remoteRosterEntry);
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    public int getEntryCount() {
        return this.remoteRosterEntries.size();
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "jabber:x:roster";
    }

    public Iterator<RemoteRosterEntry> getRosterEntries() {
        Iterator<RemoteRosterEntry> it;
        synchronized (this.remoteRosterEntries) {
            it = Collections.unmodifiableList(new ArrayList(this.remoteRosterEntries)).iterator();
        }
        return it;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        Iterator<RemoteRosterEntry> rosterEntries = getRosterEntries();
        while (rosterEntries.hasNext()) {
            sb.append(rosterEntries.next().toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
