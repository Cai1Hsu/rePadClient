package org.jivesoftware.smackx.muc;

import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketInterceptor;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromMatchesFilter;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.NodeInformationProvider;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.jivesoftware.smackx.packet.MUCAdmin;
import org.jivesoftware.smackx.packet.MUCInitialPresence;
import org.jivesoftware.smackx.packet.MUCOwner;
import org.jivesoftware.smackx.packet.MUCUser;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/MultiUserChat.class */
public class MultiUserChat {
    private static final String discoNamespace = "http://jabber.org/protocol/muc";
    private static final String discoNode = "http://jabber.org/protocol/muc#rooms";
    private static Map<Connection, List<String>> joinedRooms = new WeakHashMap();
    private Connection connection;
    private ConnectionDetachedPacketCollector messageCollector;
    private PacketFilter messageFilter;
    private PacketFilter presenceFilter;
    private String room;
    private RoomListenerMultiplexor roomListenerMultiplexor;
    private String subject;
    private String nickname = null;
    private boolean joined = false;
    private Map<String, Presence> occupantsMap = new ConcurrentHashMap();
    private final List<InvitationRejectionListener> invitationRejectionListeners = new ArrayList();
    private final List<SubjectUpdatedListener> subjectUpdatedListeners = new ArrayList();
    private final List<UserStatusListener> userStatusListeners = new ArrayList();
    private final List<ParticipantStatusListener> participantStatusListeners = new ArrayList();
    private List<PacketInterceptor> presenceInterceptors = new ArrayList();
    private List<PacketListener> connectionListeners = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/muc/MultiUserChat$InvitationsMonitor.class */
    private static class InvitationsMonitor implements ConnectionListener {
        private static final Map<Connection, WeakReference<InvitationsMonitor>> monitors = new WeakHashMap();
        private Connection connection;
        private PacketFilter invitationFilter;
        private PacketListener invitationPacketListener;
        private final List<InvitationListener> invitationsListeners = new ArrayList();

        private InvitationsMonitor(Connection connection) {
            this.connection = connection;
        }

        private void cancel() {
            this.connection.removePacketListener(this.invitationPacketListener);
            this.connection.removeConnectionListener(this);
        }

        public void fireInvitationListeners(String str, String str2, String str3, String str4, Message message) {
            InvitationListener[] invitationListenerArr;
            synchronized (this.invitationsListeners) {
                invitationListenerArr = new InvitationListener[this.invitationsListeners.size()];
                this.invitationsListeners.toArray(invitationListenerArr);
            }
            for (InvitationListener invitationListener : invitationListenerArr) {
                invitationListener.invitationReceived(this.connection, str, str2, str3, str4, message);
            }
        }

        public static InvitationsMonitor getInvitationsMonitor(Connection connection) {
            InvitationsMonitor invitationsMonitor;
            synchronized (monitors) {
                if (!monitors.containsKey(connection)) {
                    monitors.put(connection, new WeakReference<>(new InvitationsMonitor(connection)));
                }
                invitationsMonitor = monitors.get(connection).get();
            }
            return invitationsMonitor;
        }

        private void init() {
            this.invitationFilter = new PacketExtensionFilter("x", "http://jabber.org/protocol/muc#user");
            this.invitationPacketListener = new PacketListener() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.InvitationsMonitor.1
                @Override // org.jivesoftware.smack.PacketListener
                public void processPacket(Packet packet) {
                    MUCUser mUCUser = (MUCUser) packet.getExtension("x", "http://jabber.org/protocol/muc#user");
                    if (mUCUser.getInvite() == null || ((Message) packet).getType() == Message.Type.error) {
                        return;
                    }
                    InvitationsMonitor.this.fireInvitationListeners(packet.getFrom(), mUCUser.getInvite().getFrom(), mUCUser.getInvite().getReason(), mUCUser.getPassword(), (Message) packet);
                }
            };
            this.connection.addPacketListener(this.invitationPacketListener, this.invitationFilter);
            this.connection.addConnectionListener(this);
        }

        public void addInvitationListener(InvitationListener invitationListener) {
            synchronized (this.invitationsListeners) {
                if (this.invitationsListeners.size() == 0) {
                    init();
                }
                if (!this.invitationsListeners.contains(invitationListener)) {
                    this.invitationsListeners.add(invitationListener);
                }
            }
        }

        @Override // org.jivesoftware.smack.ConnectionListener
        public void connectionClosed() {
            cancel();
        }

        @Override // org.jivesoftware.smack.ConnectionListener
        public void connectionClosedOnError(Exception exc) {
        }

        @Override // org.jivesoftware.smack.ConnectionListener
        public void reconnectingIn(int i) {
        }

        @Override // org.jivesoftware.smack.ConnectionListener
        public void reconnectionFailed(Exception exc) {
        }

        @Override // org.jivesoftware.smack.ConnectionListener
        public void reconnectionSuccessful() {
        }

        public void removeInvitationListener(InvitationListener invitationListener) {
            synchronized (this.invitationsListeners) {
                if (this.invitationsListeners.contains(invitationListener)) {
                    this.invitationsListeners.remove(invitationListener);
                }
                if (this.invitationsListeners.size() == 0) {
                    cancel();
                }
            }
        }
    }

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(final Connection connection) {
                ServiceDiscoveryManager.getInstanceFor(connection).addFeature(MultiUserChat.discoNamespace);
                ServiceDiscoveryManager.getInstanceFor(connection).setNodeInformationProvider(MultiUserChat.discoNode, new NodeInformationProvider() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.1.1
                    @Override // org.jivesoftware.smackx.NodeInformationProvider
                    public List<String> getNodeFeatures() {
                        return null;
                    }

                    @Override // org.jivesoftware.smackx.NodeInformationProvider
                    public List<DiscoverInfo.Identity> getNodeIdentities() {
                        return null;
                    }

                    @Override // org.jivesoftware.smackx.NodeInformationProvider
                    public List<DiscoverItems.Item> getNodeItems() {
                        ArrayList arrayList = new ArrayList();
                        Iterator joinedRooms2 = MultiUserChat.getJoinedRooms(connection);
                        while (joinedRooms2.hasNext()) {
                            arrayList.add(new DiscoverItems.Item((String) joinedRooms2.next()));
                        }
                        return arrayList;
                    }

                    @Override // org.jivesoftware.smackx.NodeInformationProvider
                    public List<PacketExtension> getNodePacketExtensions() {
                        return null;
                    }
                });
            }
        });
    }

    public MultiUserChat(Connection connection, String str) {
        this.connection = connection;
        this.room = str.toLowerCase();
        init();
    }

    public static void addInvitationListener(Connection connection, InvitationListener invitationListener) {
        InvitationsMonitor.getInvitationsMonitor(connection).addInvitationListener(invitationListener);
    }

    private void changeAffiliationByAdmin(String str, String str2, String str3) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.SET);
        MUCAdmin.Item item = new MUCAdmin.Item(str2, null);
        item.setJid(str);
        item.setReason(str3);
        mUCAdmin.addItem(item);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    private void changeAffiliationByAdmin(Collection<String> collection, String str) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.SET);
        for (String str2 : collection) {
            MUCAdmin.Item item = new MUCAdmin.Item(str, null);
            item.setJid(str2);
            mUCAdmin.addItem(item);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    private void changeAffiliationByOwner(String str, String str2) throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.SET);
        MUCOwner.Item item = new MUCOwner.Item(str2);
        item.setJid(str);
        mUCOwner.addItem(item);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    private void changeAffiliationByOwner(Collection<String> collection, String str) throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.SET);
        for (String str2 : collection) {
            MUCOwner.Item item = new MUCOwner.Item(str);
            item.setJid(str2);
            mUCOwner.addItem(item);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    private void changeRole(String str, String str2, String str3) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.SET);
        MUCAdmin.Item item = new MUCAdmin.Item(null, str2);
        item.setNick(str);
        item.setReason(str3);
        mUCAdmin.addItem(item);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    private void changeRole(Collection<String> collection, String str) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.SET);
        for (String str2 : collection) {
            MUCAdmin.Item item = new MUCAdmin.Item(null, str);
            item.setNick(str2);
            mUCAdmin.addItem(item);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void checkAffiliationModifications(String str, String str2, boolean z, String str3) {
        if (!"owner".equals(str) || "owner".equals(str2)) {
            if (!"admin".equals(str) || "admin".equals(str2)) {
                if ("member".equals(str) && !"member".equals(str2)) {
                    if (z) {
                        fireUserStatusListeners("membershipRevoked", new Object[0]);
                    } else {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(str3);
                        fireParticipantStatusListeners("membershipRevoked", arrayList);
                    }
                }
            } else if (z) {
                fireUserStatusListeners("adminRevoked", new Object[0]);
            } else {
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(str3);
                fireParticipantStatusListeners("adminRevoked", arrayList2);
            }
        } else if (z) {
            fireUserStatusListeners("ownershipRevoked", new Object[0]);
        } else {
            ArrayList arrayList3 = new ArrayList();
            arrayList3.add(str3);
            fireParticipantStatusListeners("ownershipRevoked", arrayList3);
        }
        if (!"owner".equals(str) && "owner".equals(str2)) {
            if (z) {
                fireUserStatusListeners("ownershipGranted", new Object[0]);
                return;
            }
            ArrayList arrayList4 = new ArrayList();
            arrayList4.add(str3);
            fireParticipantStatusListeners("ownershipGranted", arrayList4);
        } else if (!"admin".equals(str) && "admin".equals(str2)) {
            if (z) {
                fireUserStatusListeners("adminGranted", new Object[0]);
                return;
            }
            ArrayList arrayList5 = new ArrayList();
            arrayList5.add(str3);
            fireParticipantStatusListeners("adminGranted", arrayList5);
        } else if ("member".equals(str) || !"member".equals(str2)) {
        } else {
            if (z) {
                fireUserStatusListeners("membershipGranted", new Object[0]);
                return;
            }
            ArrayList arrayList6 = new ArrayList();
            arrayList6.add(str3);
            fireParticipantStatusListeners("membershipGranted", arrayList6);
        }
    }

    public void checkPresenceCode(String str, boolean z, MUCUser mUCUser, String str2) {
        if ("307".equals(str)) {
            if (z) {
                this.joined = false;
                fireUserStatusListeners("kicked", new Object[]{mUCUser.getItem().getActor(), mUCUser.getItem().getReason()});
                this.occupantsMap.clear();
                this.nickname = null;
                userHasLeft();
                return;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.add(str2);
            arrayList.add(mUCUser.getItem().getActor());
            arrayList.add(mUCUser.getItem().getReason());
            fireParticipantStatusListeners("kicked", arrayList);
        } else if ("301".equals(str)) {
            if (z) {
                this.joined = false;
                fireUserStatusListeners("banned", new Object[]{mUCUser.getItem().getActor(), mUCUser.getItem().getReason()});
                this.occupantsMap.clear();
                this.nickname = null;
                userHasLeft();
                return;
            }
            ArrayList arrayList2 = new ArrayList();
            arrayList2.add(str2);
            arrayList2.add(mUCUser.getItem().getActor());
            arrayList2.add(mUCUser.getItem().getReason());
            fireParticipantStatusListeners("banned", arrayList2);
        } else if (!"321".equals(str)) {
            if (!"303".equals(str)) {
                return;
            }
            ArrayList arrayList3 = new ArrayList();
            arrayList3.add(str2);
            arrayList3.add(mUCUser.getItem().getNick());
            fireParticipantStatusListeners("nicknameChanged", arrayList3);
        } else if (!z) {
        } else {
            this.joined = false;
            fireUserStatusListeners("membershipRevoked", new Object[0]);
            this.occupantsMap.clear();
            this.nickname = null;
            userHasLeft();
        }
    }

    public void checkRoleModifications(String str, String str2, boolean z, String str3) {
        if (("visitor".equals(str) || "none".equals(str)) && "participant".equals(str2)) {
            if (z) {
                fireUserStatusListeners("voiceGranted", new Object[0]);
            } else {
                ArrayList arrayList = new ArrayList();
                arrayList.add(str3);
                fireParticipantStatusListeners("voiceGranted", arrayList);
            }
        } else if ("participant".equals(str) && ("visitor".equals(str2) || "none".equals(str2))) {
            if (z) {
                fireUserStatusListeners("voiceRevoked", new Object[0]);
            } else {
                ArrayList arrayList2 = new ArrayList();
                arrayList2.add(str3);
                fireParticipantStatusListeners("voiceRevoked", arrayList2);
            }
        }
        if (!"moderator".equals(str) && "moderator".equals(str2)) {
            if ("visitor".equals(str) || "none".equals(str)) {
                if (z) {
                    fireUserStatusListeners("voiceGranted", new Object[0]);
                } else {
                    ArrayList arrayList3 = new ArrayList();
                    arrayList3.add(str3);
                    fireParticipantStatusListeners("voiceGranted", arrayList3);
                }
            }
            if (z) {
                fireUserStatusListeners("moderatorGranted", new Object[0]);
                return;
            }
            ArrayList arrayList4 = new ArrayList();
            arrayList4.add(str3);
            fireParticipantStatusListeners("moderatorGranted", arrayList4);
        } else if (!"moderator".equals(str) || "moderator".equals(str2)) {
        } else {
            if ("visitor".equals(str2) || "none".equals(str2)) {
                if (z) {
                    fireUserStatusListeners("voiceRevoked", new Object[0]);
                } else {
                    ArrayList arrayList5 = new ArrayList();
                    arrayList5.add(str3);
                    fireParticipantStatusListeners("voiceRevoked", arrayList5);
                }
            }
            if (z) {
                fireUserStatusListeners("moderatorRevoked", new Object[0]);
                return;
            }
            ArrayList arrayList6 = new ArrayList();
            arrayList6.add(str3);
            fireParticipantStatusListeners("moderatorRevoked", arrayList6);
        }
    }

    private void cleanup() {
        try {
            if (this.connection == null) {
                return;
            }
            this.roomListenerMultiplexor.removeRoom(this.room);
            for (PacketListener packetListener : this.connectionListeners) {
                this.connection.removePacketListener(packetListener);
            }
        } catch (Exception e) {
        }
    }

    public static void decline(Connection connection, String str, String str2, String str3) {
        Packet message = new Message(str);
        MUCUser mUCUser = new MUCUser();
        MUCUser.Decline decline = new MUCUser.Decline();
        decline.setTo(str2);
        decline.setReason(str3);
        mUCUser.setDecline(decline);
        message.addExtension(mUCUser);
        connection.sendPacket(message);
    }

    public void fireInvitationRejectionListeners(String str, String str2) {
        InvitationRejectionListener[] invitationRejectionListenerArr;
        synchronized (this.invitationRejectionListeners) {
            invitationRejectionListenerArr = new InvitationRejectionListener[this.invitationRejectionListeners.size()];
            this.invitationRejectionListeners.toArray(invitationRejectionListenerArr);
        }
        for (InvitationRejectionListener invitationRejectionListener : invitationRejectionListenerArr) {
            invitationRejectionListener.invitationDeclined(str, str2);
        }
    }

    public void fireParticipantStatusListeners(String str, List<String> list) {
        ParticipantStatusListener[] participantStatusListenerArr;
        synchronized (this.participantStatusListeners) {
            participantStatusListenerArr = new ParticipantStatusListener[this.participantStatusListeners.size()];
            this.participantStatusListeners.toArray(participantStatusListenerArr);
        }
        try {
            Class[] clsArr = new Class[list.size()];
            for (int i = 0; i < list.size(); i++) {
                clsArr[i] = String.class;
            }
            Method declaredMethod = ParticipantStatusListener.class.getDeclaredMethod(str, clsArr);
            for (ParticipantStatusListener participantStatusListener : participantStatusListenerArr) {
                declaredMethod.invoke(participantStatusListener, list.toArray());
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e2) {
            e2.printStackTrace();
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
        }
    }

    public void fireSubjectUpdatedListeners(String str, String str2) {
        SubjectUpdatedListener[] subjectUpdatedListenerArr;
        synchronized (this.subjectUpdatedListeners) {
            subjectUpdatedListenerArr = new SubjectUpdatedListener[this.subjectUpdatedListeners.size()];
            this.subjectUpdatedListeners.toArray(subjectUpdatedListenerArr);
        }
        for (SubjectUpdatedListener subjectUpdatedListener : subjectUpdatedListenerArr) {
            subjectUpdatedListener.subjectUpdated(str, str2);
        }
    }

    private void fireUserStatusListeners(String str, Object[] objArr) {
        UserStatusListener[] userStatusListenerArr;
        synchronized (this.userStatusListeners) {
            userStatusListenerArr = new UserStatusListener[this.userStatusListeners.size()];
            this.userStatusListeners.toArray(userStatusListenerArr);
        }
        Class[] clsArr = new Class[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            clsArr[i] = objArr[i].getClass();
        }
        try {
            Method declaredMethod = UserStatusListener.class.getDeclaredMethod(str, clsArr);
            for (UserStatusListener userStatusListener : userStatusListenerArr) {
                declaredMethod.invoke(userStatusListener, objArr);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e2) {
            e2.printStackTrace();
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
        }
    }

    private Collection<Affiliate> getAffiliatesByAdmin(String str) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.GET);
        mUCAdmin.addItem(new MUCAdmin.Item(str, null));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        MUCAdmin mUCAdmin2 = (MUCAdmin) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (mUCAdmin2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (mUCAdmin2.getError() != null) {
            throw new XMPPException(mUCAdmin2.getError());
        }
        ArrayList arrayList = new ArrayList();
        Iterator<MUCAdmin.Item> items = mUCAdmin2.getItems();
        while (items.hasNext()) {
            arrayList.add(new Affiliate(items.next()));
        }
        return arrayList;
    }

    private Collection<Affiliate> getAffiliatesByOwner(String str) throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.GET);
        mUCOwner.addItem(new MUCOwner.Item(str));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        MUCOwner mUCOwner2 = (MUCOwner) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (mUCOwner2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (mUCOwner2.getError() != null) {
            throw new XMPPException(mUCOwner2.getError());
        }
        ArrayList arrayList = new ArrayList();
        Iterator<MUCOwner.Item> items = mUCOwner2.getItems();
        while (items.hasNext()) {
            arrayList.add(new Affiliate(items.next()));
        }
        return arrayList;
    }

    public static Collection<HostedRoom> getHostedRooms(Connection connection, String str) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        Iterator<DiscoverItems.Item> items = ServiceDiscoveryManager.getInstanceFor(connection).discoverItems(str).getItems();
        while (items.hasNext()) {
            arrayList.add(new HostedRoom(items.next()));
        }
        return arrayList;
    }

    public static Iterator<String> getJoinedRooms(Connection connection) {
        List<String> list = joinedRooms.get(connection);
        return list != null ? list.iterator() : new ArrayList().iterator();
    }

    public static Iterator<String> getJoinedRooms(Connection connection, String str) {
        Iterator<String> it;
        try {
            ArrayList arrayList = new ArrayList();
            Iterator<DiscoverItems.Item> items = ServiceDiscoveryManager.getInstanceFor(connection).discoverItems(str, discoNode).getItems();
            while (items.hasNext()) {
                arrayList.add(items.next().getEntityID());
            }
            it = arrayList.iterator();
        } catch (XMPPException e) {
            e.printStackTrace();
            it = new ArrayList().iterator();
        }
        return it;
    }

    public MUCUser getMUCUserExtension(Packet packet) {
        return packet != null ? (MUCUser) packet.getExtension("x", "http://jabber.org/protocol/muc#user") : null;
    }

    private Collection<Occupant> getOccupants(String str) throws XMPPException {
        MUCAdmin mUCAdmin = new MUCAdmin();
        mUCAdmin.setTo(this.room);
        mUCAdmin.setType(IQ.Type.GET);
        mUCAdmin.addItem(new MUCAdmin.Item(null, str));
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCAdmin.getPacketID()));
        this.connection.sendPacket(mUCAdmin);
        MUCAdmin mUCAdmin2 = (MUCAdmin) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (mUCAdmin2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (mUCAdmin2.getError() != null) {
            throw new XMPPException(mUCAdmin2.getError());
        }
        ArrayList arrayList = new ArrayList();
        Iterator<MUCAdmin.Item> items = mUCAdmin2.getItems();
        while (items.hasNext()) {
            arrayList.add(new Occupant(items.next()));
        }
        return arrayList;
    }

    public static RoomInfo getRoomInfo(Connection connection, String str) throws XMPPException {
        return new RoomInfo(ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(str));
    }

    public static Collection<String> getServiceNames(Connection connection) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(connection);
        Iterator<DiscoverItems.Item> items = instanceFor.discoverItems(connection.getServiceName()).getItems();
        while (items.hasNext()) {
            DiscoverItems.Item next = items.next();
            try {
                if (instanceFor.discoverInfo(next.getEntityID()).containsFeature(discoNamespace)) {
                    arrayList.add(next.getEntityID());
                }
            } catch (XMPPException e) {
            }
        }
        return arrayList;
    }

    private void init() {
        this.messageFilter = new AndFilter(new FromMatchesFilter(this.room), new MessageTypeFilter(Message.Type.groupchat));
        this.messageFilter = new AndFilter(this.messageFilter, new PacketFilter() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.3
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                return ((Message) packet).getBody() != null;
            }
        });
        this.presenceFilter = new AndFilter(new FromMatchesFilter(this.room), new PacketTypeFilter(Presence.class));
        this.messageCollector = new ConnectionDetachedPacketCollector();
        PacketMultiplexListener packetMultiplexListener = new PacketMultiplexListener(this.messageCollector, new PacketListener() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.5
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Presence presence = (Presence) packet;
                String from = presence.getFrom();
                String str = MultiUserChat.this.room + "/" + MultiUserChat.this.nickname;
                boolean equals = presence.getFrom().equals(str);
                if (presence.getType() != Presence.Type.available) {
                    if (presence.getType() != Presence.Type.unavailable) {
                        return;
                    }
                    MultiUserChat.this.occupantsMap.remove(from);
                    MUCUser mUCUserExtension = MultiUserChat.this.getMUCUserExtension(presence);
                    if (mUCUserExtension != null && mUCUserExtension.getStatus() != null) {
                        MultiUserChat.this.checkPresenceCode(mUCUserExtension.getStatus().getCode(), presence.getFrom().equals(str), mUCUserExtension, from);
                        return;
                    } else if (equals) {
                        return;
                    } else {
                        ArrayList arrayList = new ArrayList();
                        arrayList.add(from);
                        MultiUserChat.this.fireParticipantStatusListeners("left", arrayList);
                        return;
                    }
                }
                Presence presence2 = (Presence) MultiUserChat.this.occupantsMap.put(from, presence);
                if (presence2 == null) {
                    if (equals) {
                        return;
                    }
                    ArrayList arrayList2 = new ArrayList();
                    arrayList2.add(from);
                    MultiUserChat.this.fireParticipantStatusListeners("joined", arrayList2);
                    return;
                }
                MUCUser mUCUserExtension2 = MultiUserChat.this.getMUCUserExtension(presence2);
                String affiliation = mUCUserExtension2.getItem().getAffiliation();
                String role = mUCUserExtension2.getItem().getRole();
                MUCUser mUCUserExtension3 = MultiUserChat.this.getMUCUserExtension(presence);
                String affiliation2 = mUCUserExtension3.getItem().getAffiliation();
                MultiUserChat.this.checkRoleModifications(role, mUCUserExtension3.getItem().getRole(), equals, from);
                MultiUserChat.this.checkAffiliationModifications(affiliation, affiliation2, equals, from);
            }
        }, new PacketListener() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.4
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                Message message = (Message) packet;
                MultiUserChat.this.subject = message.getSubject();
                MultiUserChat.this.fireSubjectUpdatedListeners(message.getSubject(), message.getFrom());
            }
        }, new PacketListener() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.6
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                MUCUser mUCUserExtension = MultiUserChat.this.getMUCUserExtension(packet);
                if (mUCUserExtension.getDecline() == null || ((Message) packet).getType() == Message.Type.error) {
                    return;
                }
                MultiUserChat.this.fireInvitationRejectionListeners(mUCUserExtension.getDecline().getFrom(), mUCUserExtension.getDecline().getReason());
            }
        });
        this.roomListenerMultiplexor = RoomListenerMultiplexor.getRoomMultiplexor(this.connection);
        this.roomListenerMultiplexor.addRoom(this.room, packetMultiplexListener);
    }

    public static boolean isServiceEnabled(Connection connection, String str) {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(str).containsFeature(discoNamespace);
        } catch (XMPPException e) {
            e.printStackTrace();
            z = false;
        }
        return z;
    }

    public static void removeInvitationListener(Connection connection, InvitationListener invitationListener) {
        InvitationsMonitor.getInvitationsMonitor(connection).removeInvitationListener(invitationListener);
    }

    private void userHasJoined() {
        synchronized (this) {
            List<String> list = joinedRooms.get(this.connection);
            List<String> list2 = list;
            if (list == null) {
                list2 = new ArrayList<>();
                joinedRooms.put(this.connection, list2);
            }
            list2.add(this.room);
        }
    }

    private void userHasLeft() {
        synchronized (this) {
            List<String> list = joinedRooms.get(this.connection);
            if (list != null) {
                list.remove(this.room);
                cleanup();
            }
        }
    }

    public void addInvitationRejectionListener(InvitationRejectionListener invitationRejectionListener) {
        synchronized (this.invitationRejectionListeners) {
            if (!this.invitationRejectionListeners.contains(invitationRejectionListener)) {
                this.invitationRejectionListeners.add(invitationRejectionListener);
            }
        }
    }

    public void addMessageListener(PacketListener packetListener) {
        this.connection.addPacketListener(packetListener, this.messageFilter);
        this.connectionListeners.add(packetListener);
    }

    public void addParticipantListener(PacketListener packetListener) {
        this.connection.addPacketListener(packetListener, this.presenceFilter);
        this.connectionListeners.add(packetListener);
    }

    public void addParticipantStatusListener(ParticipantStatusListener participantStatusListener) {
        synchronized (this.participantStatusListeners) {
            if (!this.participantStatusListeners.contains(participantStatusListener)) {
                this.participantStatusListeners.add(participantStatusListener);
            }
        }
    }

    public void addPresenceInterceptor(PacketInterceptor packetInterceptor) {
        this.presenceInterceptors.add(packetInterceptor);
    }

    public void addSubjectUpdatedListener(SubjectUpdatedListener subjectUpdatedListener) {
        synchronized (this.subjectUpdatedListeners) {
            if (!this.subjectUpdatedListeners.contains(subjectUpdatedListener)) {
                this.subjectUpdatedListeners.add(subjectUpdatedListener);
            }
        }
    }

    public void addUserStatusListener(UserStatusListener userStatusListener) {
        synchronized (this.userStatusListeners) {
            if (!this.userStatusListeners.contains(userStatusListener)) {
                this.userStatusListeners.add(userStatusListener);
            }
        }
    }

    public void banUser(String str, String str2) throws XMPPException {
        changeAffiliationByAdmin(str, "outcast", str2);
    }

    public void banUsers(Collection<String> collection) throws XMPPException {
        changeAffiliationByAdmin(collection, "outcast");
    }

    public void changeAvailabilityStatus(String str, Presence.Mode mode) {
        if (this.nickname == null || this.nickname.equals("")) {
            throw new IllegalArgumentException("Nickname must not be null or blank.");
        }
        if (!this.joined) {
            throw new IllegalStateException("Must be logged into the room to change the availability status.");
        }
        Presence presence = new Presence(Presence.Type.available);
        presence.setStatus(str);
        presence.setMode(mode);
        presence.setTo(this.room + "/" + this.nickname);
        for (PacketInterceptor packetInterceptor : this.presenceInterceptors) {
            packetInterceptor.interceptPacket(presence);
        }
        this.connection.sendPacket(presence);
    }

    public void changeNickname(String str) throws XMPPException {
        if (str == null || str.equals("")) {
            throw new IllegalArgumentException("Nickname must not be null or blank.");
        }
        if (!this.joined) {
            throw new IllegalStateException("Must be logged into the room to change nickname.");
        }
        Presence presence = new Presence(Presence.Type.available);
        presence.setTo(this.room + "/" + str);
        for (PacketInterceptor packetInterceptor : this.presenceInterceptors) {
            packetInterceptor.interceptPacket(presence);
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new FromMatchesFilter(this.room + "/" + str), new PacketTypeFilter(Presence.class)));
        this.connection.sendPacket(presence);
        Presence presence2 = (Presence) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (presence2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (presence2.getError() != null) {
            throw new XMPPException(presence2.getError());
        }
        this.nickname = str;
    }

    public void changeSubject(final String str) throws XMPPException {
        Message message = new Message(this.room, Message.Type.groupchat);
        message.setSubject(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new AndFilter(new FromMatchesFilter(this.room), new PacketTypeFilter(Message.class)), new PacketFilter() { // from class: org.jivesoftware.smackx.muc.MultiUserChat.2
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                return str.equals(((Message) packet).getSubject());
            }
        }));
        this.connection.sendPacket(message);
        Message message2 = (Message) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (message2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (message2.getError() == null) {
            return;
        }
        throw new XMPPException(message2.getError());
    }

    public void create(String str) throws XMPPException {
        synchronized (this) {
            if (str != null) {
                if (!str.equals("")) {
                    if (this.joined) {
                        throw new IllegalStateException("Creation failed - User already joined the room.");
                    }
                    Presence presence = new Presence(Presence.Type.available);
                    presence.setTo(this.room + "/" + str);
                    presence.addExtension(new MUCInitialPresence());
                    for (PacketInterceptor packetInterceptor : this.presenceInterceptors) {
                        packetInterceptor.interceptPacket(presence);
                    }
                    PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new FromMatchesFilter(this.room + "/" + str), new PacketTypeFilter(Presence.class)));
                    this.connection.sendPacket(presence);
                    Presence presence2 = (Presence) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
                    createPacketCollector.cancel();
                    if (presence2 == null) {
                        throw new XMPPException("No response from server.");
                    }
                    if (presence2.getError() != null) {
                        throw new XMPPException(presence2.getError());
                    }
                    this.nickname = str;
                    this.joined = true;
                    userHasJoined();
                    MUCUser mUCUserExtension = getMUCUserExtension(presence2);
                    if (mUCUserExtension == null || mUCUserExtension.getStatus() == null || !"201".equals(mUCUserExtension.getStatus().getCode())) {
                        leave();
                        throw new XMPPException("Creation failed - Missing acknowledge of room creation.");
                    }
                }
            }
            throw new IllegalArgumentException("Nickname must not be null or blank.");
        }
    }

    public Message createMessage() {
        return new Message(this.room, Message.Type.groupchat);
    }

    public Chat createPrivateChat(String str, MessageListener messageListener) {
        return this.connection.getChatManager().createChat(str, messageListener);
    }

    public void destroy(String str, String str2) throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.SET);
        MUCOwner.Destroy destroy = new MUCOwner.Destroy();
        destroy.setReason(str);
        destroy.setJid(str2);
        mUCOwner.setDestroy(destroy);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() != null) {
            throw new XMPPException(iq.getError());
        }
        this.occupantsMap.clear();
        this.nickname = null;
        this.joined = false;
        userHasLeft();
    }

    protected void finalize() throws Throwable {
        cleanup();
        super.finalize();
    }

    public Collection<Affiliate> getAdmins() throws XMPPException {
        return getAffiliatesByOwner("admin");
    }

    public Form getConfigurationForm() throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.GET);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return Form.getFormFrom(iq);
        }
        throw new XMPPException(iq.getError());
    }

    public Collection<Affiliate> getMembers() throws XMPPException {
        return getAffiliatesByAdmin("member");
    }

    public Collection<Occupant> getModerators() throws XMPPException {
        return getOccupants("moderator");
    }

    public String getNickname() {
        return this.nickname;
    }

    public Occupant getOccupant(String str) {
        Presence presence = this.occupantsMap.get(str);
        return presence != null ? new Occupant(presence) : null;
    }

    public Presence getOccupantPresence(String str) {
        return this.occupantsMap.get(str);
    }

    public Iterator<String> getOccupants() {
        return Collections.unmodifiableList(new ArrayList(this.occupantsMap.keySet())).iterator();
    }

    public int getOccupantsCount() {
        return this.occupantsMap.size();
    }

    public Collection<Affiliate> getOutcasts() throws XMPPException {
        return getAffiliatesByAdmin("outcast");
    }

    public Collection<Affiliate> getOwners() throws XMPPException {
        return getAffiliatesByAdmin("owner");
    }

    public Collection<Occupant> getParticipants() throws XMPPException {
        return getOccupants("participant");
    }

    public Form getRegistrationForm() throws XMPPException {
        Registration registration = new Registration();
        registration.setType(IQ.Type.GET);
        registration.setTo(this.room);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
        this.connection.sendPacket(registration);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return Form.getFormFrom(iq);
        }
        throw new XMPPException(iq.getError());
    }

    public String getReservedNickname() {
        String str;
        try {
            Iterator<DiscoverInfo.Identity> identities = ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(this.room, "x-roomuser-item").getIdentities();
            str = null;
            if (identities.hasNext()) {
                str = identities.next().getName();
            }
        } catch (XMPPException e) {
            e.printStackTrace();
            str = null;
        }
        return str;
    }

    public String getRoom() {
        return this.room;
    }

    public String getSubject() {
        return this.subject;
    }

    public void grantAdmin(String str) throws XMPPException {
        changeAffiliationByOwner(str, "admin");
    }

    public void grantAdmin(Collection<String> collection) throws XMPPException {
        changeAffiliationByOwner(collection, "admin");
    }

    public void grantMembership(String str) throws XMPPException {
        changeAffiliationByAdmin(str, "member", null);
    }

    public void grantMembership(Collection<String> collection) throws XMPPException {
        changeAffiliationByAdmin(collection, "member");
    }

    public void grantModerator(String str) throws XMPPException {
        changeRole(str, "moderator", null);
    }

    public void grantModerator(Collection<String> collection) throws XMPPException {
        changeRole(collection, "moderator");
    }

    public void grantOwnership(String str) throws XMPPException {
        changeAffiliationByAdmin(str, "owner", null);
    }

    public void grantOwnership(Collection<String> collection) throws XMPPException {
        changeAffiliationByAdmin(collection, "owner");
    }

    public void grantVoice(String str) throws XMPPException {
        changeRole(str, "participant", null);
    }

    public void grantVoice(Collection<String> collection) throws XMPPException {
        changeRole(collection, "participant");
    }

    public void invite(String str, String str2) {
        invite(new Message(), str, str2);
    }

    public void invite(Message message, String str, String str2) {
        message.setTo(this.room);
        MUCUser mUCUser = new MUCUser();
        MUCUser.Invite invite = new MUCUser.Invite();
        invite.setTo(str);
        invite.setReason(str2);
        mUCUser.setInvite(invite);
        message.addExtension(mUCUser);
        this.connection.sendPacket(message);
    }

    public boolean isJoined() {
        return this.joined;
    }

    public void join(String str) throws XMPPException {
        join(str, null, null, SmackConfiguration.getPacketReplyTimeout());
    }

    public void join(String str, String str2) throws XMPPException {
        join(str, str2, null, SmackConfiguration.getPacketReplyTimeout());
    }

    public void join(String str, String str2, DiscussionHistory discussionHistory, long j) throws XMPPException {
        synchronized (this) {
            if (str != null) {
                if (!str.equals("")) {
                    if (this.joined) {
                        leave();
                    }
                    Packet presence = new Presence(Presence.Type.available);
                    presence.setTo(this.room + "/" + str);
                    MUCInitialPresence mUCInitialPresence = new MUCInitialPresence();
                    if (str2 != null) {
                        mUCInitialPresence.setPassword(str2);
                    }
                    if (discussionHistory != null) {
                        mUCInitialPresence.setHistory(discussionHistory.getMUCHistory());
                    }
                    presence.addExtension(mUCInitialPresence);
                    for (PacketInterceptor packetInterceptor : this.presenceInterceptors) {
                        packetInterceptor.interceptPacket(presence);
                    }
                    PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new FromMatchesFilter(this.room + "/" + str), new PacketTypeFilter(Presence.class)));
                    this.connection.sendPacket(presence);
                    Presence presence2 = (Presence) createPacketCollector.nextResult(j);
                    if (createPacketCollector != null) {
                        createPacketCollector.cancel();
                    }
                    if (presence2 == null) {
                        throw new XMPPException("No response from server.");
                    }
                    if (presence2.getError() != null) {
                        throw new XMPPException(presence2.getError());
                    }
                    this.nickname = str;
                    this.joined = true;
                    userHasJoined();
                }
            }
            throw new IllegalArgumentException("Nickname must not be null or blank.");
        }
    }

    public void kickParticipant(String str, String str2) throws XMPPException {
        changeRole(str, "none", str2);
    }

    public void leave() {
        synchronized (this) {
            if (this.joined) {
                Presence presence = new Presence(Presence.Type.unavailable);
                presence.setTo(this.room + "/" + this.nickname);
                for (PacketInterceptor packetInterceptor : this.presenceInterceptors) {
                    packetInterceptor.interceptPacket(presence);
                }
                this.connection.sendPacket(presence);
                this.occupantsMap.clear();
                this.nickname = null;
                this.joined = false;
                userHasLeft();
            }
        }
    }

    public Message nextMessage() {
        return (Message) this.messageCollector.nextResult();
    }

    public Message nextMessage(long j) {
        return (Message) this.messageCollector.nextResult(j);
    }

    public Message pollMessage() {
        return (Message) this.messageCollector.pollResult();
    }

    public void removeInvitationRejectionListener(InvitationRejectionListener invitationRejectionListener) {
        synchronized (this.invitationRejectionListeners) {
            this.invitationRejectionListeners.remove(invitationRejectionListener);
        }
    }

    public void removeMessageListener(PacketListener packetListener) {
        this.connection.removePacketListener(packetListener);
        this.connectionListeners.remove(packetListener);
    }

    public void removeParticipantListener(PacketListener packetListener) {
        this.connection.removePacketListener(packetListener);
        this.connectionListeners.remove(packetListener);
    }

    public void removeParticipantStatusListener(ParticipantStatusListener participantStatusListener) {
        synchronized (this.participantStatusListeners) {
            this.participantStatusListeners.remove(participantStatusListener);
        }
    }

    public void removePresenceInterceptor(PacketInterceptor packetInterceptor) {
        this.presenceInterceptors.remove(packetInterceptor);
    }

    public void removeSubjectUpdatedListener(SubjectUpdatedListener subjectUpdatedListener) {
        synchronized (this.subjectUpdatedListeners) {
            this.subjectUpdatedListeners.remove(subjectUpdatedListener);
        }
    }

    public void removeUserStatusListener(UserStatusListener userStatusListener) {
        synchronized (this.userStatusListeners) {
            this.userStatusListeners.remove(userStatusListener);
        }
    }

    public void revokeAdmin(String str) throws XMPPException {
        changeAffiliationByOwner(str, "member");
    }

    public void revokeAdmin(Collection<String> collection) throws XMPPException {
        changeAffiliationByOwner(collection, "member");
    }

    public void revokeMembership(String str) throws XMPPException {
        changeAffiliationByAdmin(str, "none", null);
    }

    public void revokeMembership(Collection<String> collection) throws XMPPException {
        changeAffiliationByAdmin(collection, "none");
    }

    public void revokeModerator(String str) throws XMPPException {
        changeRole(str, "participant", null);
    }

    public void revokeModerator(Collection<String> collection) throws XMPPException {
        changeRole(collection, "participant");
    }

    public void revokeOwnership(String str) throws XMPPException {
        changeAffiliationByAdmin(str, "admin", null);
    }

    public void revokeOwnership(Collection<String> collection) throws XMPPException {
        changeAffiliationByAdmin(collection, "admin");
    }

    public void revokeVoice(String str) throws XMPPException {
        changeRole(str, "visitor", null);
    }

    public void revokeVoice(Collection<String> collection) throws XMPPException {
        changeRole(collection, "visitor");
    }

    public void sendConfigurationForm(Form form) throws XMPPException {
        MUCOwner mUCOwner = new MUCOwner();
        mUCOwner.setTo(this.room);
        mUCOwner.setType(IQ.Type.SET);
        mUCOwner.addExtension(form.getDataFormToSend());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(mUCOwner.getPacketID()));
        this.connection.sendPacket(mUCOwner);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }

    public void sendMessage(String str) throws XMPPException {
        Message message = new Message(this.room, Message.Type.groupchat);
        message.setBody(str);
        this.connection.sendPacket(message);
    }

    public void sendMessage(Message message) throws XMPPException {
        this.connection.sendPacket(message);
    }

    public void sendRegistrationForm(Form form) throws XMPPException {
        Registration registration = new Registration();
        registration.setType(IQ.Type.SET);
        registration.setTo(this.room);
        registration.addExtension(form.getDataFormToSend());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new AndFilter(new PacketIDFilter(registration.getPacketID()), new PacketTypeFilter(IQ.class)));
        this.connection.sendPacket(registration);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return;
        }
        throw new XMPPException(iq.getError());
    }
}
