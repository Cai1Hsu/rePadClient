package org.jivesoftware.smackx.workgroup.agent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromContainsFilter;
import org.jivesoftware.smack.filter.OrFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.packet.MUCUser;
import org.jivesoftware.smackx.workgroup.MetaData;
import org.jivesoftware.smackx.workgroup.QueueUser;
import org.jivesoftware.smackx.workgroup.WorkgroupInvitation;
import org.jivesoftware.smackx.workgroup.WorkgroupInvitationListener;
import org.jivesoftware.smackx.workgroup.agent.WorkgroupQueue;
import org.jivesoftware.smackx.workgroup.ext.history.AgentChatHistory;
import org.jivesoftware.smackx.workgroup.ext.history.ChatMetadata;
import org.jivesoftware.smackx.workgroup.ext.macros.MacroGroup;
import org.jivesoftware.smackx.workgroup.ext.macros.Macros;
import org.jivesoftware.smackx.workgroup.ext.notes.ChatNotes;
import org.jivesoftware.smackx.workgroup.packet.AgentStatus;
import org.jivesoftware.smackx.workgroup.packet.DepartQueuePacket;
import org.jivesoftware.smackx.workgroup.packet.MonitorPacket;
import org.jivesoftware.smackx.workgroup.packet.OccupantsInfo;
import org.jivesoftware.smackx.workgroup.packet.OfferRequestProvider;
import org.jivesoftware.smackx.workgroup.packet.OfferRevokeProvider;
import org.jivesoftware.smackx.workgroup.packet.QueueDetails;
import org.jivesoftware.smackx.workgroup.packet.QueueOverview;
import org.jivesoftware.smackx.workgroup.packet.RoomInvitation;
import org.jivesoftware.smackx.workgroup.packet.RoomTransfer;
import org.jivesoftware.smackx.workgroup.packet.SessionID;
import org.jivesoftware.smackx.workgroup.packet.Transcript;
import org.jivesoftware.smackx.workgroup.packet.Transcripts;
import org.jivesoftware.smackx.workgroup.settings.GenericSettings;
import org.jivesoftware.smackx.workgroup.settings.SearchSettings;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/AgentSession.class */
public class AgentSession {
    private Agent agent;
    private Connection connection;
    private final List<WorkgroupInvitationListener> invitationListeners;
    private int maxChats;
    private final Map<String, List<String>> metaData;
    private final List<OfferListener> offerListeners;
    private PacketListener packetListener;
    private Presence.Mode presenceMode;
    private final List<QueueUsersListener> queueUsersListeners;
    private Map<String, WorkgroupQueue> queues;
    private TranscriptManager transcriptManager;
    private TranscriptSearchManager transcriptSearchManager;
    private String workgroupJID;
    private boolean online = false;
    private AgentRoster agentRoster = null;

    public AgentSession(String str, Connection connection) {
        if (!connection.isAuthenticated()) {
            throw new IllegalStateException("Must login to server before creating workgroup.");
        }
        this.workgroupJID = str;
        this.connection = connection;
        this.transcriptManager = new TranscriptManager(connection);
        this.transcriptSearchManager = new TranscriptSearchManager(connection);
        this.maxChats = -1;
        this.metaData = new HashMap();
        this.queues = new HashMap();
        this.offerListeners = new ArrayList();
        this.invitationListeners = new ArrayList();
        this.queueUsersListeners = new ArrayList();
        OrFilter orFilter = new OrFilter();
        orFilter.addFilter(new PacketTypeFilter(OfferRequestProvider.OfferRequestPacket.class));
        orFilter.addFilter(new PacketTypeFilter(OfferRevokeProvider.OfferRevokePacket.class));
        orFilter.addFilter(new PacketTypeFilter(Presence.class));
        orFilter.addFilter(new PacketTypeFilter(Message.class));
        this.packetListener = new PacketListener() { // from class: org.jivesoftware.smackx.workgroup.agent.AgentSession.1
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                try {
                    AgentSession.this.handlePacket(packet);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };
        connection.addPacketListener(this.packetListener, orFilter);
        this.agent = new Agent(connection, str);
    }

    private void fireInvitationEvent(String str, String str2, String str3, String str4, Map<String, List<String>> map) {
        WorkgroupInvitation workgroupInvitation = new WorkgroupInvitation(this.connection.getUser(), str, this.workgroupJID, str2, str3, str4, map);
        synchronized (this.invitationListeners) {
            for (WorkgroupInvitationListener workgroupInvitationListener : this.invitationListeners) {
                workgroupInvitationListener.invitationReceived(workgroupInvitation);
            }
        }
    }

    private void fireOfferRequestEvent(OfferRequestProvider.OfferRequestPacket offerRequestPacket) {
        Offer offer = new Offer(this.connection, this, offerRequestPacket.getUserID(), offerRequestPacket.getUserJID(), getWorkgroupJID(), new Date(new Date().getTime() + (offerRequestPacket.getTimeout() * 1000)), offerRequestPacket.getSessionID(), offerRequestPacket.getMetaData(), offerRequestPacket.getContent());
        synchronized (this.offerListeners) {
            for (OfferListener offerListener : this.offerListeners) {
                offerListener.offerReceived(offer);
            }
        }
    }

    private void fireOfferRevokeEvent(OfferRevokeProvider.OfferRevokePacket offerRevokePacket) {
        RevokedOffer revokedOffer = new RevokedOffer(offerRevokePacket.getUserJID(), offerRevokePacket.getUserID(), getWorkgroupJID(), offerRevokePacket.getSessionID(), offerRevokePacket.getReason(), new Date());
        synchronized (this.offerListeners) {
            for (OfferListener offerListener : this.offerListeners) {
                offerListener.offerRevoked(revokedOffer);
            }
        }
    }

    private void fireQueueUsersEvent(WorkgroupQueue workgroupQueue, WorkgroupQueue.Status status, int i, Date date, Set<QueueUser> set) {
        synchronized (this.queueUsersListeners) {
            for (QueueUsersListener queueUsersListener : this.queueUsersListeners) {
                if (status != null) {
                    queueUsersListener.statusUpdated(workgroupQueue, status);
                }
                if (i != -1) {
                    queueUsersListener.averageWaitTimeUpdated(workgroupQueue, i);
                }
                if (date != null) {
                    queueUsersListener.oldestEntryUpdated(workgroupQueue, date);
                }
                if (set != null) {
                    queueUsersListener.usersUpdated(workgroupQueue, set);
                }
            }
        }
    }

    public void handlePacket(Packet packet) {
        if (packet instanceof OfferRequestProvider.OfferRequestPacket) {
            IQ iq = new IQ() { // from class: org.jivesoftware.smackx.workgroup.agent.AgentSession.2
                @Override // org.jivesoftware.smack.packet.IQ
                public String getChildElementXML() {
                    return null;
                }
            };
            iq.setPacketID(packet.getPacketID());
            iq.setTo(packet.getFrom());
            iq.setType(IQ.Type.RESULT);
            this.connection.sendPacket(iq);
            fireOfferRequestEvent((OfferRequestProvider.OfferRequestPacket) packet);
        } else if (!(packet instanceof Presence)) {
            if (!(packet instanceof Message)) {
                if (!(packet instanceof OfferRevokeProvider.OfferRevokePacket)) {
                    return;
                }
                IQ iq2 = new IQ() { // from class: org.jivesoftware.smackx.workgroup.agent.AgentSession.3
                    @Override // org.jivesoftware.smack.packet.IQ
                    public String getChildElementXML() {
                        return null;
                    }
                };
                iq2.setPacketID(packet.getPacketID());
                iq2.setType(IQ.Type.RESULT);
                this.connection.sendPacket(iq2);
                fireOfferRevokeEvent((OfferRevokeProvider.OfferRevokePacket) packet);
                return;
            }
            Message message = (Message) packet;
            MUCUser mUCUser = (MUCUser) message.getExtension("x", "http://jabber.org/protocol/muc#user");
            MUCUser.Invite invite = mUCUser != null ? mUCUser.getInvite() : null;
            if (invite == null || !this.workgroupJID.equals(invite.getFrom())) {
                return;
            }
            String str = null;
            Map<String, List<String>> map = null;
            SessionID sessionID = (SessionID) message.getExtension(SessionID.ELEMENT_NAME, "http://jivesoftware.com/protocol/workgroup");
            if (sessionID != null) {
                str = sessionID.getSessionID();
            }
            MetaData metaData = (MetaData) message.getExtension(MetaData.ELEMENT_NAME, "http://jivesoftware.com/protocol/workgroup");
            if (metaData != null) {
                map = metaData.getMetaData();
            }
            fireInvitationEvent(message.getFrom(), str, message.getBody(), message.getFrom(), map);
        } else {
            Presence presence = (Presence) packet;
            String parseResource = StringUtils.parseResource(presence.getFrom());
            WorkgroupQueue workgroupQueue = this.queues.get(parseResource);
            WorkgroupQueue workgroupQueue2 = workgroupQueue;
            if (workgroupQueue == null) {
                workgroupQueue2 = new WorkgroupQueue(parseResource);
                this.queues.put(parseResource, workgroupQueue2);
            }
            QueueOverview queueOverview = (QueueOverview) presence.getExtension(QueueOverview.ELEMENT_NAME, QueueOverview.NAMESPACE);
            if (queueOverview != null) {
                if (queueOverview.getStatus() == null) {
                    workgroupQueue2.setStatus(WorkgroupQueue.Status.CLOSED);
                } else {
                    workgroupQueue2.setStatus(queueOverview.getStatus());
                }
                workgroupQueue2.setAverageWaitTime(queueOverview.getAverageWaitTime());
                workgroupQueue2.setOldestEntry(queueOverview.getOldestEntry());
                fireQueueUsersEvent(workgroupQueue2, queueOverview.getStatus(), queueOverview.getAverageWaitTime(), queueOverview.getOldestEntry(), null);
                return;
            }
            QueueDetails queueDetails = (QueueDetails) packet.getExtension(QueueDetails.ELEMENT_NAME, "http://jabber.org/protocol/workgroup");
            if (queueDetails != null) {
                workgroupQueue2.setUsers(queueDetails.getUsers());
                fireQueueUsersEvent(workgroupQueue2, null, -1, null, queueDetails.getUsers());
                return;
            }
            DefaultPacketExtension defaultPacketExtension = (DefaultPacketExtension) presence.getExtension("notify-agents", "http://jabber.org/protocol/workgroup");
            if (defaultPacketExtension == null) {
                return;
            }
            int parseInt = Integer.parseInt(defaultPacketExtension.getValue("current-chats"));
            int parseInt2 = Integer.parseInt(defaultPacketExtension.getValue("max-chats"));
            workgroupQueue2.setCurrentChats(parseInt);
            workgroupQueue2.setMaxChats(parseInt2);
        }
    }

    public void addInvitationListener(WorkgroupInvitationListener workgroupInvitationListener) {
        synchronized (this.invitationListeners) {
            if (!this.invitationListeners.contains(workgroupInvitationListener)) {
                this.invitationListeners.add(workgroupInvitationListener);
            }
        }
    }

    public void addOfferListener(OfferListener offerListener) {
        synchronized (this.offerListeners) {
            if (!this.offerListeners.contains(offerListener)) {
                this.offerListeners.add(offerListener);
            }
        }
    }

    public void addQueueUsersListener(QueueUsersListener queueUsersListener) {
        synchronized (this.queueUsersListeners) {
            if (!this.queueUsersListeners.contains(queueUsersListener)) {
                this.queueUsersListeners.add(queueUsersListener);
            }
        }
    }

    public void close() {
        this.connection.removePacketListener(this.packetListener);
    }

    public void dequeueUser(String str) throws XMPPException {
        this.connection.sendPacket(new DepartQueuePacket(this.workgroupJID));
    }

    public Agent getAgent() {
        return this.agent;
    }

    public AgentChatHistory getAgentHistory(String str, int i, Date date) throws XMPPException {
        AgentChatHistory agentChatHistory = date != null ? new AgentChatHistory(str, i, date) : new AgentChatHistory(str, i);
        agentChatHistory.setType(IQ.Type.GET);
        agentChatHistory.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(agentChatHistory.getPacketID()));
        this.connection.sendPacket(agentChatHistory);
        AgentChatHistory agentChatHistory2 = (AgentChatHistory) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (agentChatHistory2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (agentChatHistory2.getError() == null) {
            return agentChatHistory2;
        }
        throw new XMPPException(agentChatHistory2.getError());
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x0041 -> B:11:0x0033). Please submit an issue!!! */
    public AgentRoster getAgentRoster() {
        if (this.agentRoster == null) {
            this.agentRoster = new AgentRoster(this.connection, this.workgroupJID);
        }
        for (int i = 0; !this.agentRoster.rosterInitialized && i <= 2000; i += 500) {
            try {
                Thread.sleep(500L);
            } catch (Exception e) {
            }
        }
        return this.agentRoster;
    }

    public Map<String, List<String>> getChatMetadata(String str) throws XMPPException {
        ChatMetadata chatMetadata = new ChatMetadata();
        chatMetadata.setType(IQ.Type.GET);
        chatMetadata.setTo(this.workgroupJID);
        chatMetadata.setSessionID(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(chatMetadata.getPacketID()));
        this.connection.sendPacket(chatMetadata);
        ChatMetadata chatMetadata2 = (ChatMetadata) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (chatMetadata2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (chatMetadata2.getError() == null) {
            return chatMetadata2.getMetadata();
        }
        throw new XMPPException(chatMetadata2.getError());
    }

    public GenericSettings getGenericSettings(Connection connection, String str) throws XMPPException {
        GenericSettings genericSettings = new GenericSettings();
        genericSettings.setType(IQ.Type.GET);
        genericSettings.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(genericSettings.getPacketID()));
        this.connection.sendPacket(genericSettings);
        GenericSettings genericSettings2 = (GenericSettings) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (genericSettings2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (genericSettings2.getError() == null) {
            return genericSettings2;
        }
        throw new XMPPException(genericSettings2.getError());
    }

    public MacroGroup getMacros(boolean z) throws XMPPException {
        Macros macros = new Macros();
        macros.setType(IQ.Type.GET);
        macros.setTo(this.workgroupJID);
        macros.setPersonal(!z);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(macros.getPacketID()));
        this.connection.sendPacket(macros);
        Macros macros2 = (Macros) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (macros2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (macros2.getError() == null) {
            return macros2.getRootGroup();
        }
        throw new XMPPException(macros2.getError());
    }

    public int getMaxChats() {
        return this.maxChats;
    }

    public List<String> getMetaData(String str) {
        return this.metaData.get(str);
    }

    public ChatNotes getNote(String str) throws XMPPException {
        ChatNotes chatNotes = new ChatNotes();
        chatNotes.setType(IQ.Type.GET);
        chatNotes.setTo(this.workgroupJID);
        chatNotes.setSessionID(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(chatNotes.getPacketID()));
        this.connection.sendPacket(chatNotes);
        ChatNotes chatNotes2 = (ChatNotes) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (chatNotes2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (chatNotes2.getError() == null) {
            return chatNotes2;
        }
        throw new XMPPException(chatNotes2.getError());
    }

    public OccupantsInfo getOccupantsInfo(String str) throws XMPPException {
        OccupantsInfo occupantsInfo = new OccupantsInfo(str);
        occupantsInfo.setType(IQ.Type.GET);
        occupantsInfo.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(occupantsInfo.getPacketID()));
        this.connection.sendPacket(occupantsInfo);
        OccupantsInfo occupantsInfo2 = (OccupantsInfo) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (occupantsInfo2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (occupantsInfo2.getError() == null) {
            return occupantsInfo2;
        }
        throw new XMPPException(occupantsInfo2.getError());
    }

    public Presence.Mode getPresenceMode() {
        return this.presenceMode;
    }

    public WorkgroupQueue getQueue(String str) {
        return this.queues.get(str);
    }

    public Iterator<WorkgroupQueue> getQueues() {
        return Collections.unmodifiableMap(new HashMap(this.queues)).values().iterator();
    }

    public SearchSettings getSearchSettings() throws XMPPException {
        SearchSettings searchSettings = new SearchSettings();
        searchSettings.setType(IQ.Type.GET);
        searchSettings.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(searchSettings.getPacketID()));
        this.connection.sendPacket(searchSettings);
        SearchSettings searchSettings2 = (SearchSettings) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (searchSettings2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (searchSettings2.getError() == null) {
            return searchSettings2;
        }
        throw new XMPPException(searchSettings2.getError());
    }

    public Transcript getTranscript(String str) throws XMPPException {
        return this.transcriptManager.getTranscript(this.workgroupJID, str);
    }

    public Form getTranscriptSearchForm() throws XMPPException {
        return this.transcriptSearchManager.getSearchForm(StringUtils.parseServer(this.workgroupJID));
    }

    public Transcripts getTranscripts(String str) throws XMPPException {
        return this.transcriptManager.getTranscripts(this.workgroupJID, str);
    }

    public String getWorkgroupJID() {
        return this.workgroupJID;
    }

    public boolean hasMonitorPrivileges(Connection connection) throws XMPPException {
        MonitorPacket monitorPacket = new MonitorPacket();
        monitorPacket.setType(IQ.Type.GET);
        monitorPacket.setTo(this.workgroupJID);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(monitorPacket.getPacketID()));
        this.connection.sendPacket(monitorPacket);
        MonitorPacket monitorPacket2 = (MonitorPacket) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (monitorPacket2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (monitorPacket2.getError() == null) {
            return monitorPacket2.isMonitor();
        }
        throw new XMPPException(monitorPacket2.getError());
    }

    public boolean isOnline() {
        return this.online;
    }

    public void makeRoomOwner(Connection connection, String str) throws XMPPException {
        MonitorPacket monitorPacket = new MonitorPacket();
        monitorPacket.setType(IQ.Type.SET);
        monitorPacket.setTo(this.workgroupJID);
        monitorPacket.setSessionID(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(monitorPacket.getPacketID()));
        this.connection.sendPacket(monitorPacket);
        Packet nextResult = createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (nextResult == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (nextResult.getError() == null) {
            return;
        }
        throw new XMPPException(nextResult.getError());
    }

    public void removeInvitationListener(WorkgroupInvitationListener workgroupInvitationListener) {
        synchronized (this.invitationListeners) {
            this.invitationListeners.remove(workgroupInvitationListener);
        }
    }

    public void removeMetaData(String str) throws XMPPException {
        synchronized (this.metaData) {
            if (this.metaData.remove(str) != null) {
                setStatus(this.presenceMode, this.maxChats);
            }
        }
    }

    public void removeOfferListener(OfferListener offerListener) {
        synchronized (this.offerListeners) {
            this.offerListeners.remove(offerListener);
        }
    }

    public void removeQueueUsersListener(QueueUsersListener queueUsersListener) {
        synchronized (this.queueUsersListeners) {
            this.queueUsersListeners.remove(queueUsersListener);
        }
    }

    public void saveMacros(MacroGroup macroGroup) throws XMPPException {
        Macros macros = new Macros();
        macros.setType(IQ.Type.SET);
        macros.setTo(this.workgroupJID);
        macros.setPersonal(true);
        macros.setPersonalMacroGroup(macroGroup);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(macros.getPacketID()));
        this.connection.sendPacket(macros);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public ReportedData searchTranscripts(Form form) throws XMPPException {
        return this.transcriptSearchManager.submitSearch(StringUtils.parseServer(this.workgroupJID), form);
    }

    public void sendRoomInvitation(RoomInvitation.Type type, String str, String str2, String str3) throws XMPPException {
        final RoomInvitation roomInvitation = new RoomInvitation(type, str, str2, str3);
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.workgroup.agent.AgentSession.4
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return roomInvitation.toXML();
            }
        };
        iq.setType(IQ.Type.SET);
        iq.setTo(this.workgroupJID);
        iq.setFrom(this.connection.getUser());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(iq.getPacketID()));
        this.connection.sendPacket(iq);
        IQ iq2 = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq2.getError() == null) {
            return;
        }
        throw new XMPPException(iq2.getError());
    }

    public void sendRoomTransfer(RoomTransfer.Type type, String str, String str2, String str3) throws XMPPException {
        final RoomTransfer roomTransfer = new RoomTransfer(type, str, str2, str3);
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.workgroup.agent.AgentSession.5
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return roomTransfer.toXML();
            }
        };
        iq.setType(IQ.Type.SET);
        iq.setTo(this.workgroupJID);
        iq.setFrom(this.connection.getUser());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(iq.getPacketID()));
        this.connection.sendPacket(iq);
        IQ iq2 = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq2.getError() == null) {
            return;
        }
        throw new XMPPException(iq2.getError());
    }

    public void setMetaData(String str, String str2) throws XMPPException {
        synchronized (this.metaData) {
            List<String> list = this.metaData.get(str);
            if (list == null || !list.get(0).equals(str2)) {
                list.set(0, str2);
                setStatus(this.presenceMode, this.maxChats);
            }
        }
    }

    public void setNote(String str, String str2) throws XMPPException {
        String escapeForXML = StringUtils.escapeForXML(ChatNotes.replace(str2, "\n", "\\n"));
        ChatNotes chatNotes = new ChatNotes();
        chatNotes.setType(IQ.Type.SET);
        chatNotes.setTo(this.workgroupJID);
        chatNotes.setSessionID(str);
        chatNotes.setNotes(escapeForXML);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(chatNotes.getPacketID()));
        this.connection.sendPacket(chatNotes);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void setOnline(boolean z) throws XMPPException {
        if (this.online == z) {
            return;
        }
        if (!z) {
            this.online = z;
            Presence presence = new Presence(Presence.Type.unavailable);
            presence.setTo(this.workgroupJID);
            presence.addExtension(new DefaultPacketExtension(AgentStatus.ELEMENT_NAME, "http://jabber.org/protocol/workgroup"));
            this.connection.sendPacket(presence);
            return;
        }
        Presence presence2 = new Presence(Presence.Type.available);
        presence2.setTo(this.workgroupJID);
        presence2.addExtension(new DefaultPacketExtension(AgentStatus.ELEMENT_NAME, "http://jabber.org/protocol/workgroup"));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketTypeFilter(Presence.class), new FromContainsFilter(this.workgroupJID)));
        this.connection.sendPacket(presence2);
        Presence presence3 = (Presence) createPacketCollector.nextResult(5000L);
        createPacketCollector.cancel();
        if (!presence3.isAvailable()) {
            throw new XMPPException("No response from server on status set.");
        }
        if (presence3.getError() != null) {
            throw new XMPPException(presence3.getError());
        }
        this.online = z;
    }

    public void setStatus(Presence.Mode mode, int i) throws XMPPException {
        setStatus(mode, i, null);
    }

    public void setStatus(Presence.Mode mode, int i, String str) throws XMPPException {
        if (!this.online) {
            throw new IllegalStateException("Cannot set status when the agent is not online.");
        }
        Presence.Mode mode2 = mode;
        if (mode == null) {
            mode2 = Presence.Mode.available;
        }
        this.presenceMode = mode2;
        this.maxChats = i;
        Presence presence = new Presence(Presence.Type.available);
        presence.setMode(mode2);
        presence.setTo(getWorkgroupJID());
        if (str != null) {
            presence.setStatus(str);
        }
        DefaultPacketExtension defaultPacketExtension = new DefaultPacketExtension(AgentStatus.ELEMENT_NAME, "http://jabber.org/protocol/workgroup");
        defaultPacketExtension.setValue("max-chats", "" + i);
        presence.addExtension(defaultPacketExtension);
        presence.addExtension(new MetaData(this.metaData));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketTypeFilter(Presence.class), new FromContainsFilter(this.workgroupJID)));
        this.connection.sendPacket(presence);
        Presence presence2 = (Presence) createPacketCollector.nextResult(5000L);
        createPacketCollector.cancel();
        if (!presence2.isAvailable()) {
            throw new XMPPException("No response from server on status set.");
        }
        if (presence2.getError() == null) {
            return;
        }
        throw new XMPPException(presence2.getError());
    }

    public void setStatus(Presence.Mode mode, String str) throws XMPPException {
        if (!this.online) {
            throw new IllegalStateException("Cannot set status when the agent is not online.");
        }
        Presence.Mode mode2 = mode;
        if (mode == null) {
            mode2 = Presence.Mode.available;
        }
        this.presenceMode = mode2;
        Presence presence = new Presence(Presence.Type.available);
        presence.setMode(mode2);
        presence.setTo(getWorkgroupJID());
        if (str != null) {
            presence.setStatus(str);
        }
        presence.addExtension(new MetaData(this.metaData));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketTypeFilter(Presence.class), new FromContainsFilter(this.workgroupJID)));
        this.connection.sendPacket(presence);
        Presence presence2 = (Presence) createPacketCollector.nextResult(5000L);
        createPacketCollector.cancel();
        if (!presence2.isAvailable()) {
            throw new XMPPException("No response from server on status set.");
        }
        if (presence2.getError() == null) {
            return;
        }
        throw new XMPPException(presence2.getError());
    }
}
