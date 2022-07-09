package org.jivesoftware.smackx.workgroup.agent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.jivesoftware.smackx.workgroup.packet.AgentStatus;
import org.jivesoftware.smackx.workgroup.packet.AgentStatusRequest;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/AgentRoster.class */
public class AgentRoster {
    private static final int EVENT_AGENT_ADDED = 0;
    private static final int EVENT_AGENT_REMOVED = 1;
    private static final int EVENT_PRESENCE_CHANGED = 2;
    private Connection connection;
    private String workgroupJID;
    boolean rosterInitialized = false;
    private List<String> entries = new ArrayList();
    private List<AgentRosterListener> listeners = new ArrayList();
    private Map<String, Map<String, Presence>> presenceMap = new HashMap();

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/AgentRoster$AgentStatusListener.class */
    private class AgentStatusListener implements PacketListener {
        private AgentStatusListener() {
            AgentRoster.this = r4;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            if (packet instanceof AgentStatusRequest) {
                for (AgentStatusRequest.Item item : ((AgentStatusRequest) packet).getAgents()) {
                    String jid = item.getJID();
                    if (DiscoverItems.Item.REMOVE_ACTION.equals(item.getType())) {
                        AgentRoster.this.presenceMap.remove(StringUtils.parseName(StringUtils.parseName(jid) + "@" + StringUtils.parseServer(jid)));
                        AgentRoster.this.fireEvent(1, jid);
                    } else {
                        AgentRoster.this.entries.add(jid);
                        AgentRoster.this.fireEvent(0, jid);
                    }
                }
                AgentRoster.this.rosterInitialized = true;
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener.class */
    private class PresencePacketListener implements PacketListener {
        private PresencePacketListener() {
            AgentRoster.this = r4;
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            HashMap hashMap;
            Presence presence = (Presence) packet;
            String from = presence.getFrom();
            if (from == null) {
                System.out.println("Presence with no FROM: " + presence.toXML());
                return;
            }
            String presenceMapKey = AgentRoster.this.getPresenceMapKey(from);
            if (presence.getType() != Presence.Type.available) {
                if (presence.getType() != Presence.Type.unavailable) {
                    return;
                }
                if (AgentRoster.this.presenceMap.get(presenceMapKey) != null) {
                    Map map = (Map) AgentRoster.this.presenceMap.get(presenceMapKey);
                    synchronized (map) {
                        map.remove(StringUtils.parseResource(from));
                    }
                    if (map.isEmpty()) {
                        AgentRoster.this.presenceMap.remove(presenceMapKey);
                    }
                }
                synchronized (AgentRoster.this.entries) {
                    for (String str : AgentRoster.this.entries) {
                        if (str.toLowerCase().equals(StringUtils.parseBareAddress(presenceMapKey).toLowerCase())) {
                            AgentRoster.this.fireEvent(2, packet);
                        }
                    }
                }
                return;
            }
            AgentStatus agentStatus = (AgentStatus) presence.getExtension(AgentStatus.ELEMENT_NAME, "http://jabber.org/protocol/workgroup");
            if (agentStatus == null || !AgentRoster.this.workgroupJID.equals(agentStatus.getWorkgroupJID())) {
                return;
            }
            if (AgentRoster.this.presenceMap.get(presenceMapKey) == null) {
                hashMap = new HashMap();
                AgentRoster.this.presenceMap.put(presenceMapKey, hashMap);
            } else {
                hashMap = (Map) AgentRoster.this.presenceMap.get(presenceMapKey);
            }
            synchronized (hashMap) {
                try {
                    hashMap.put(StringUtils.parseResource(from), presence);
                } catch (Throwable th) {
                    Map map2 = hashMap;
                    throw th;
                }
            }
            synchronized (AgentRoster.this.entries) {
                for (String str2 : AgentRoster.this.entries) {
                    if (str2.toLowerCase().equals(StringUtils.parseBareAddress(presenceMapKey).toLowerCase())) {
                        AgentRoster.this.fireEvent(2, packet);
                    }
                }
            }
        }
    }

    AgentRoster(Connection connection, String str) {
        this.connection = connection;
        this.workgroupJID = str;
        connection.addPacketListener(new AgentStatusListener(), new PacketTypeFilter(AgentStatusRequest.class));
        connection.addPacketListener(new PresencePacketListener(), new PacketTypeFilter(Presence.class));
        AgentStatusRequest agentStatusRequest = new AgentStatusRequest();
        agentStatusRequest.setTo(str);
        connection.sendPacket(agentStatusRequest);
    }

    public void fireEvent(int i, Object obj) {
        AgentRosterListener[] agentRosterListenerArr;
        synchronized (this.listeners) {
            agentRosterListenerArr = new AgentRosterListener[this.listeners.size()];
            this.listeners.toArray(agentRosterListenerArr);
        }
        for (int i2 = 0; i2 < agentRosterListenerArr.length; i2++) {
            switch (i) {
                case 0:
                    agentRosterListenerArr[i2].agentAdded((String) obj);
                    break;
                case 1:
                    agentRosterListenerArr[i2].agentRemoved((String) obj);
                    break;
                case 2:
                    agentRosterListenerArr[i2].presenceChanged((Presence) obj);
                    break;
            }
        }
    }

    public String getPresenceMapKey(String str) {
        String str2 = str;
        if (!contains(str)) {
            str2 = StringUtils.parseBareAddress(str).toLowerCase();
        }
        return str2;
    }

    public void addListener(AgentRosterListener agentRosterListener) {
        synchronized (this.listeners) {
            if (!this.listeners.contains(agentRosterListener)) {
                this.listeners.add(agentRosterListener);
                for (String str : getAgents()) {
                    if (this.entries.contains(str)) {
                        agentRosterListener.agentAdded(str);
                        Map<String, Presence> map = this.presenceMap.get(str);
                        if (map != null) {
                            for (Presence presence : map.values()) {
                                agentRosterListener.presenceChanged(presence);
                            }
                        }
                    }
                }
            }
        }
    }

    public boolean contains(String str) {
        boolean z = false;
        if (str != null) {
            synchronized (this.entries) {
                Iterator<String> it = this.entries.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    } else if (it.next().toLowerCase().equals(str.toLowerCase())) {
                        z = true;
                        break;
                    }
                }
            }
        }
        return z;
    }

    public int getAgentCount() {
        return this.entries.size();
    }

    public Set<String> getAgents() {
        HashSet hashSet = new HashSet();
        synchronized (this.entries) {
            for (String str : this.entries) {
                hashSet.add(str);
            }
        }
        return Collections.unmodifiableSet(hashSet);
    }

    public Presence getPresence(String str) {
        Presence presence;
        Map<String, Presence> map = this.presenceMap.get(getPresenceMapKey(str));
        if (map == null) {
            presence = new Presence(Presence.Type.unavailable);
            presence.setFrom(str);
        } else {
            Presence presence2 = null;
            for (String str2 : map.keySet()) {
                Presence presence3 = map.get(str2);
                if (presence2 == null) {
                    presence2 = presence3;
                } else if (presence3.getPriority() > presence2.getPriority()) {
                    presence2 = presence3;
                }
            }
            presence = presence2;
            if (presence2 == null) {
                presence = new Presence(Presence.Type.unavailable);
                presence.setFrom(str);
            }
        }
        return presence;
    }

    public void reload() {
        AgentStatusRequest agentStatusRequest = new AgentStatusRequest();
        agentStatusRequest.setTo(this.workgroupJID);
        this.connection.sendPacket(agentStatusRequest);
    }

    public void removeListener(AgentRosterListener agentRosterListener) {
        synchronized (this.listeners) {
            this.listeners.remove(agentRosterListener);
        }
    }
}
