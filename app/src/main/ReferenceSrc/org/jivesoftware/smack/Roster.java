package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/Roster.class */
public class Roster {
    private static SubscriptionMode defaultSubscriptionMode = SubscriptionMode.accept_all;
    private Connection connection;
    boolean rosterInitialized = false;
    private SubscriptionMode subscriptionMode = getDefaultSubscriptionMode();
    private final Map<String, RosterGroup> groups = new ConcurrentHashMap();
    private final List<RosterEntry> unfiledEntries = new CopyOnWriteArrayList();
    private final Map<String, RosterEntry> entries = new ConcurrentHashMap();
    private final List<RosterListener> rosterListeners = new CopyOnWriteArrayList();
    private Map<String, Map<String, Presence>> presenceMap = new ConcurrentHashMap();
    private PresencePacketListener presencePacketListener = new PresencePacketListener();

    /* loaded from: classes.jar:org/jivesoftware/smack/Roster$PresencePacketListener.class */
    private class PresencePacketListener implements PacketListener {
        private PresencePacketListener() {
            Roster.this = r4;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            ConcurrentHashMap concurrentHashMap;
            ConcurrentHashMap concurrentHashMap2;
            ConcurrentHashMap concurrentHashMap3;
            Presence presence = (Presence) packet;
            String from = presence.getFrom();
            String presenceMapKey = Roster.this.getPresenceMapKey(from);
            if (presence.getType() == Presence.Type.available) {
                if (Roster.this.presenceMap.get(presenceMapKey) == null) {
                    concurrentHashMap3 = new ConcurrentHashMap();
                    Roster.this.presenceMap.put(presenceMapKey, concurrentHashMap3);
                } else {
                    concurrentHashMap3 = (Map) Roster.this.presenceMap.get(presenceMapKey);
                }
                concurrentHashMap3.remove("");
                concurrentHashMap3.put(StringUtils.parseResource(from), presence);
                if (((RosterEntry) Roster.this.entries.get(presenceMapKey)) == null) {
                    return;
                }
                Roster.this.fireRosterPresenceEvent(presence);
            } else if (presence.getType() == Presence.Type.unavailable) {
                if ("".equals(StringUtils.parseResource(from))) {
                    if (Roster.this.presenceMap.get(presenceMapKey) == null) {
                        concurrentHashMap2 = new ConcurrentHashMap();
                        Roster.this.presenceMap.put(presenceMapKey, concurrentHashMap2);
                    } else {
                        concurrentHashMap2 = (Map) Roster.this.presenceMap.get(presenceMapKey);
                    }
                    concurrentHashMap2.put("", presence);
                } else if (Roster.this.presenceMap.get(presenceMapKey) != null) {
                    ((Map) Roster.this.presenceMap.get(presenceMapKey)).put(StringUtils.parseResource(from), presence);
                }
                if (((RosterEntry) Roster.this.entries.get(presenceMapKey)) == null) {
                    return;
                }
                Roster.this.fireRosterPresenceEvent(presence);
            } else if (presence.getType() == Presence.Type.subscribe) {
                if (Roster.this.subscriptionMode == SubscriptionMode.accept_all) {
                    Presence presence2 = new Presence(Presence.Type.subscribed);
                    presence2.setTo(presence.getFrom());
                    Roster.this.connection.sendPacket(presence2);
                } else if (Roster.this.subscriptionMode != SubscriptionMode.reject_all) {
                } else {
                    Presence presence3 = new Presence(Presence.Type.unsubscribed);
                    presence3.setTo(presence.getFrom());
                    Roster.this.connection.sendPacket(presence3);
                }
            } else if (presence.getType() == Presence.Type.unsubscribe) {
                if (Roster.this.subscriptionMode == SubscriptionMode.manual) {
                    return;
                }
                Presence presence4 = new Presence(Presence.Type.unsubscribed);
                presence4.setTo(presence.getFrom());
                Roster.this.connection.sendPacket(presence4);
            } else if (presence.getType() != Presence.Type.error || !"".equals(StringUtils.parseResource(from))) {
            } else {
                if (!Roster.this.presenceMap.containsKey(presenceMapKey)) {
                    concurrentHashMap = new ConcurrentHashMap();
                    Roster.this.presenceMap.put(presenceMapKey, concurrentHashMap);
                } else {
                    concurrentHashMap = (Map) Roster.this.presenceMap.get(presenceMapKey);
                    concurrentHashMap.clear();
                }
                concurrentHashMap.put("", presence);
                if (((RosterEntry) Roster.this.entries.get(presenceMapKey)) == null) {
                    return;
                }
                Roster.this.fireRosterPresenceEvent(presence);
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/Roster$RosterPacketListener.class */
    private class RosterPacketListener implements PacketListener {
        private RosterPacketListener() {
            Roster.this = r4;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            ArrayList arrayList3 = new ArrayList();
            for (RosterPacket.Item item : ((RosterPacket) packet).getRosterItems()) {
                RosterEntry rosterEntry = new RosterEntry(item.getUser(), item.getName(), item.getItemType(), item.getItemStatus(), Roster.this, Roster.this.connection);
                if (RosterPacket.ItemType.remove.equals(item.getItemType())) {
                    if (Roster.this.entries.containsKey(item.getUser())) {
                        Roster.this.entries.remove(item.getUser());
                    }
                    if (Roster.this.unfiledEntries.contains(rosterEntry)) {
                        Roster.this.unfiledEntries.remove(rosterEntry);
                    }
                    Roster.this.presenceMap.remove(StringUtils.parseName(item.getUser()) + "@" + StringUtils.parseServer(item.getUser()));
                    arrayList3.add(item.getUser());
                } else {
                    if (!Roster.this.entries.containsKey(item.getUser())) {
                        Roster.this.entries.put(item.getUser(), rosterEntry);
                        arrayList.add(item.getUser());
                    } else {
                        RosterEntry rosterEntry2 = (RosterEntry) Roster.this.entries.put(item.getUser(), rosterEntry);
                        RosterPacket.Item rosterItem = RosterEntry.toRosterItem(rosterEntry2);
                        if (rosterEntry2 == null || !rosterEntry2.equalsDeep(rosterEntry) || !item.getGroupNames().equals(rosterItem.getGroupNames())) {
                            arrayList2.add(item.getUser());
                        }
                    }
                    if (!item.getGroupNames().isEmpty()) {
                        Roster.this.unfiledEntries.remove(rosterEntry);
                    } else if (!Roster.this.unfiledEntries.contains(rosterEntry)) {
                        Roster.this.unfiledEntries.add(rosterEntry);
                    }
                }
                ArrayList<String> arrayList4 = new ArrayList();
                for (RosterGroup rosterGroup : Roster.this.getGroups()) {
                    if (rosterGroup.contains(rosterEntry)) {
                        arrayList4.add(rosterGroup.getName());
                    }
                }
                if (!RosterPacket.ItemType.remove.equals(item.getItemType())) {
                    ArrayList<String> arrayList5 = new ArrayList();
                    for (String str : item.getGroupNames()) {
                        arrayList5.add(str);
                        RosterGroup group = Roster.this.getGroup(str);
                        RosterGroup rosterGroup2 = group;
                        if (group == null) {
                            rosterGroup2 = Roster.this.createGroup(str);
                            Roster.this.groups.put(str, rosterGroup2);
                        }
                        rosterGroup2.addEntryLocal(rosterEntry);
                    }
                    for (String str2 : arrayList5) {
                        arrayList4.remove(str2);
                    }
                }
                for (String str3 : arrayList4) {
                    RosterGroup group2 = Roster.this.getGroup(str3);
                    group2.removeEntryLocal(rosterEntry);
                    if (group2.getEntryCount() == 0) {
                        Roster.this.groups.remove(str3);
                    }
                }
                for (RosterGroup rosterGroup3 : Roster.this.getGroups()) {
                    if (rosterGroup3.getEntryCount() == 0) {
                        Roster.this.groups.remove(rosterGroup3.getName());
                    }
                }
            }
            synchronized (Roster.this) {
                Roster.this.rosterInitialized = true;
                Roster.this.notifyAll();
            }
            Roster.this.fireRosterChangedEvent(arrayList, arrayList2, arrayList3);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/Roster$SubscriptionMode.class */
    public enum SubscriptionMode {
        accept_all,
        reject_all,
        manual
    }

    Roster(Connection connection) {
        this.connection = connection;
        connection.addPacketListener(new RosterPacketListener(), new PacketTypeFilter(RosterPacket.class));
        PacketTypeFilter packetTypeFilter = new PacketTypeFilter(Presence.class);
        connection.addPacketListener(this.presencePacketListener, packetTypeFilter);
        final AbstractConnectionListener abstractConnectionListener = new AbstractConnectionListener() { // from class: org.jivesoftware.smack.Roster.1
            @Override // org.jivesoftware.smack.AbstractConnectionListener, org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                Roster.this.setOfflinePresences();
            }

            @Override // org.jivesoftware.smack.AbstractConnectionListener, org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                Roster.this.setOfflinePresences();
            }
        };
        if (!this.connection.isConnected()) {
            Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.Roster.2
                @Override // org.jivesoftware.smack.ConnectionCreationListener
                public void connectionCreated(Connection connection2) {
                    if (connection2.equals(Roster.this.connection)) {
                        Roster.this.connection.addConnectionListener(abstractConnectionListener);
                    }
                }
            });
        } else {
            connection.addConnectionListener(abstractConnectionListener);
        }
    }

    public void fireRosterChangedEvent(Collection<String> collection, Collection<String> collection2, Collection<String> collection3) {
        for (RosterListener rosterListener : this.rosterListeners) {
            if (!collection.isEmpty()) {
                rosterListener.entriesAdded(collection);
            }
            if (!collection2.isEmpty()) {
                rosterListener.entriesUpdated(collection2);
            }
            if (!collection3.isEmpty()) {
                rosterListener.entriesDeleted(collection3);
            }
        }
    }

    public void fireRosterPresenceEvent(Presence presence) {
        for (RosterListener rosterListener : this.rosterListeners) {
            rosterListener.presenceChanged(presence);
        }
    }

    public static SubscriptionMode getDefaultSubscriptionMode() {
        return defaultSubscriptionMode;
    }

    public String getPresenceMapKey(String str) {
        String lowerCase;
        if (str == null) {
            lowerCase = null;
        } else {
            String str2 = str;
            if (!contains(str)) {
                str2 = StringUtils.parseBareAddress(str);
            }
            lowerCase = str2.toLowerCase();
        }
        return lowerCase;
    }

    public static void setDefaultSubscriptionMode(SubscriptionMode subscriptionMode) {
        defaultSubscriptionMode = subscriptionMode;
    }

    public void setOfflinePresences() {
        for (String str : this.presenceMap.keySet()) {
            Map<String, Presence> map = this.presenceMap.get(str);
            if (map != null) {
                for (String str2 : map.keySet()) {
                    Presence presence = new Presence(Presence.Type.unavailable);
                    presence.setFrom(str + "/" + str2);
                    this.presencePacketListener.processPacket(presence);
                }
            }
        }
    }

    public void addRosterListener(RosterListener rosterListener) {
        if (!this.rosterListeners.contains(rosterListener)) {
            this.rosterListeners.add(rosterListener);
        }
    }

    void cleanup() {
        this.rosterListeners.clear();
    }

    public boolean contains(String str) {
        return getEntry(str) != null;
    }

    public void createEntry(String str, String str2, String[] strArr) throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        RosterPacket rosterPacket = new RosterPacket();
        rosterPacket.setType(IQ.Type.SET);
        RosterPacket.Item item = new RosterPacket.Item(str, str2);
        if (strArr != null) {
            for (String str3 : strArr) {
                if (str3 != null && str3.trim().length() > 0) {
                    item.addGroupName(str3);
                }
            }
        }
        rosterPacket.addRosterItem(item);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(rosterPacket.getPacketID()));
        this.connection.sendPacket(rosterPacket);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() == IQ.Type.ERROR) {
            throw new XMPPException(iq.getError());
        }
        Presence presence = new Presence(Presence.Type.subscribe);
        presence.setTo(str);
        this.connection.sendPacket(presence);
    }

    public RosterGroup createGroup(String str) {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        if (this.groups.containsKey(str)) {
            throw new IllegalArgumentException("Group with name " + str + " alread exists.");
        }
        RosterGroup rosterGroup = new RosterGroup(str, this.connection);
        this.groups.put(str, rosterGroup);
        return rosterGroup;
    }

    public Collection<RosterEntry> getEntries() {
        HashSet hashSet = new HashSet();
        for (RosterGroup rosterGroup : getGroups()) {
            hashSet.addAll(rosterGroup.getEntries());
        }
        hashSet.addAll(this.unfiledEntries);
        return Collections.unmodifiableCollection(hashSet);
    }

    public RosterEntry getEntry(String str) {
        return str == null ? null : this.entries.get(str.toLowerCase());
    }

    public int getEntryCount() {
        return getEntries().size();
    }

    public RosterGroup getGroup(String str) {
        return this.groups.get(str);
    }

    public int getGroupCount() {
        return this.groups.size();
    }

    public Collection<RosterGroup> getGroups() {
        return Collections.unmodifiableCollection(this.groups.values());
    }

    public Presence getPresence(String str) {
        Presence presence;
        Map<String, Presence> map = this.presenceMap.get(getPresenceMapKey(StringUtils.parseBareAddress(str)));
        if (map == null) {
            Presence presence2 = new Presence(Presence.Type.unavailable);
            presence2.setFrom(str);
            presence = presence2;
        } else {
            Presence presence3 = null;
            for (String str2 : map.keySet()) {
                Presence presence4 = map.get(str2);
                if (presence4.isAvailable()) {
                    if (presence3 == null || presence4.getPriority() > presence3.getPriority()) {
                        presence3 = presence4;
                    } else if (presence4.getPriority() == presence3.getPriority()) {
                        Presence.Mode mode = presence4.getMode();
                        Presence.Mode mode2 = mode;
                        if (mode == null) {
                            mode2 = Presence.Mode.available;
                        }
                        Presence.Mode mode3 = presence3.getMode();
                        Presence.Mode mode4 = mode3;
                        if (mode3 == null) {
                            mode4 = Presence.Mode.available;
                        }
                        if (mode2.compareTo(mode4) < 0) {
                            presence3 = presence4;
                        }
                    }
                }
            }
            if (presence3 == null) {
                Presence presence5 = new Presence(Presence.Type.unavailable);
                presence5.setFrom(str);
                presence = presence5;
            } else {
                presence = presence3;
            }
        }
        return presence;
    }

    public Presence getPresenceResource(String str) {
        Presence presence;
        String presenceMapKey = getPresenceMapKey(str);
        String parseResource = StringUtils.parseResource(str);
        Map<String, Presence> map = this.presenceMap.get(presenceMapKey);
        if (map == null) {
            Presence presence2 = new Presence(Presence.Type.unavailable);
            presence2.setFrom(str);
            presence = presence2;
        } else {
            Presence presence3 = map.get(parseResource);
            if (presence3 == null) {
                Presence presence4 = new Presence(Presence.Type.unavailable);
                presence4.setFrom(str);
                presence = presence4;
            } else {
                presence = presence3;
            }
        }
        return presence;
    }

    public Iterator<Presence> getPresences(String str) {
        Iterator<Presence> it;
        Map<String, Presence> map = this.presenceMap.get(getPresenceMapKey(str));
        if (map == null) {
            Presence presence = new Presence(Presence.Type.unavailable);
            presence.setFrom(str);
            it = Arrays.asList(presence).iterator();
        } else {
            ArrayList arrayList = new ArrayList();
            for (Presence presence2 : map.values()) {
                if (presence2.isAvailable()) {
                    arrayList.add(presence2);
                }
            }
            if (!arrayList.isEmpty()) {
                it = arrayList.iterator();
            } else {
                Presence presence3 = new Presence(Presence.Type.unavailable);
                presence3.setFrom(str);
                it = Arrays.asList(presence3).iterator();
            }
        }
        return it;
    }

    public SubscriptionMode getSubscriptionMode() {
        return this.subscriptionMode;
    }

    public Collection<RosterEntry> getUnfiledEntries() {
        return Collections.unmodifiableList(this.unfiledEntries);
    }

    public int getUnfiledEntryCount() {
        return this.unfiledEntries.size();
    }

    public void reload() {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        this.connection.sendPacket(new RosterPacket());
    }

    public void removeEntry(RosterEntry rosterEntry) throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        if (!this.entries.containsKey(rosterEntry.getUser())) {
            return;
        }
        RosterPacket rosterPacket = new RosterPacket();
        rosterPacket.setType(IQ.Type.SET);
        RosterPacket.Item rosterItem = RosterEntry.toRosterItem(rosterEntry);
        rosterItem.setItemType(RosterPacket.ItemType.remove);
        rosterPacket.addRosterItem(rosterItem);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(rosterPacket.getPacketID()));
        this.connection.sendPacket(rosterPacket);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void removeRosterListener(RosterListener rosterListener) {
        this.rosterListeners.remove(rosterListener);
    }

    public void setSubscriptionMode(SubscriptionMode subscriptionMode) {
        this.subscriptionMode = subscriptionMode;
    }
}
