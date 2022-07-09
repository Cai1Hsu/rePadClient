package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Privacy;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smackx.jingle.nat.STUN;

/* loaded from: classes.jar:org/jivesoftware/smack/PrivacyListManager.class */
public class PrivacyListManager {
    private static Map<Connection, PrivacyListManager> instances = new Hashtable();
    private Connection connection;
    private final List<PrivacyListListener> listeners;
    PacketFilter packetFilter;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.PrivacyListManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new PrivacyListManager(connection);
            }
        });
    }

    private PrivacyListManager(Connection connection) {
        this.listeners = new ArrayList();
        this.packetFilter = new AndFilter(new IQTypeFilter(IQ.Type.SET), new PacketExtensionFilter(STUN.ELEMENT_NAME, "jabber:iq:privacy"));
        this.connection = connection;
        init();
    }

    public static PrivacyListManager getInstanceFor(Connection connection) {
        return instances.get(connection);
    }

    private List<PrivacyItem> getPrivacyListItems(String str) throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setPrivacyList(str, new ArrayList());
        return getRequest(privacy).getPrivacyList(str);
    }

    private Privacy getPrivacyWithListNames() throws XMPPException {
        return getRequest(new Privacy());
    }

    private Privacy getRequest(Privacy privacy) throws XMPPException {
        privacy.setType(IQ.Type.GET);
        privacy.setFrom(getUser());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(privacy.getPacketID()));
        this.connection.sendPacket(privacy);
        Privacy privacy2 = (Privacy) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (privacy2 == null) {
            throw new XMPPException("No response from server.");
        }
        if (privacy2.getError() == null) {
            return privacy2;
        }
        throw new XMPPException(privacy2.getError());
    }

    private String getUser() {
        return this.connection.getUser();
    }

    private void init() {
        instances.put(this.connection, this);
        this.connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smack.PrivacyListManager.2
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                PrivacyListManager.instances.remove(PrivacyListManager.this.connection);
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
        });
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smack.PrivacyListManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (packet == null || packet.getError() != null) {
                    return;
                }
                Privacy privacy = (Privacy) packet;
                synchronized (PrivacyListManager.this.listeners) {
                    for (PrivacyListListener privacyListListener : PrivacyListManager.this.listeners) {
                        for (Map.Entry<String, List<PrivacyItem>> entry : privacy.getItemLists().entrySet()) {
                            String key = entry.getKey();
                            List<PrivacyItem> value = entry.getValue();
                            if (value.isEmpty()) {
                                privacyListListener.updatedPrivacyList(key);
                            } else {
                                privacyListListener.setPrivacyList(key, value);
                            }
                        }
                    }
                }
                IQ iq = new IQ() { // from class: org.jivesoftware.smack.PrivacyListManager.3.1
                    @Override // org.jivesoftware.smack.packet.IQ
                    public String getChildElementXML() {
                        return "";
                    }
                };
                iq.setType(IQ.Type.RESULT);
                iq.setFrom(packet.getFrom());
                iq.setPacketID(packet.getPacketID());
                PrivacyListManager.this.connection.sendPacket(iq);
            }
        }, this.packetFilter);
    }

    private Packet setRequest(Privacy privacy) throws XMPPException {
        privacy.setType(IQ.Type.SET);
        privacy.setFrom(getUser());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(privacy.getPacketID()));
        this.connection.sendPacket(privacy);
        Packet nextResult = createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (nextResult == null) {
            throw new XMPPException("No response from server.");
        }
        if (nextResult.getError() == null) {
            return nextResult;
        }
        throw new XMPPException(nextResult.getError());
    }

    public void addListener(PrivacyListListener privacyListListener) {
        synchronized (this.listeners) {
            this.listeners.add(privacyListListener);
        }
    }

    public void createPrivacyList(String str, List<PrivacyItem> list) throws XMPPException {
        updatePrivacyList(str, list);
    }

    public void declineActiveList() throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setDeclineActiveList(true);
        setRequest(privacy);
    }

    public void declineDefaultList() throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setDeclineDefaultList(true);
        setRequest(privacy);
    }

    public void deletePrivacyList(String str) throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setPrivacyList(str, new ArrayList());
        setRequest(privacy);
    }

    public PrivacyList getActiveList() throws XMPPException {
        Privacy privacyWithListNames = getPrivacyWithListNames();
        String activeName = privacyWithListNames.getActiveName();
        return new PrivacyList(true, (privacyWithListNames.getActiveName() == null || privacyWithListNames.getDefaultName() == null || !privacyWithListNames.getActiveName().equals(privacyWithListNames.getDefaultName())) ? false : true, activeName, getPrivacyListItems(activeName));
    }

    public PrivacyList getDefaultList() throws XMPPException {
        Privacy privacyWithListNames = getPrivacyWithListNames();
        String defaultName = privacyWithListNames.getDefaultName();
        return new PrivacyList((privacyWithListNames.getActiveName() == null || privacyWithListNames.getDefaultName() == null || !privacyWithListNames.getActiveName().equals(privacyWithListNames.getDefaultName())) ? false : true, true, defaultName, getPrivacyListItems(defaultName));
    }

    public PrivacyList getPrivacyList(String str) throws XMPPException {
        return new PrivacyList(false, false, str, getPrivacyListItems(str));
    }

    public PrivacyList[] getPrivacyLists() throws XMPPException {
        Privacy privacyWithListNames = getPrivacyWithListNames();
        Set<String> privacyListNames = privacyWithListNames.getPrivacyListNames();
        PrivacyList[] privacyListArr = new PrivacyList[privacyListNames.size()];
        int i = 0;
        for (String str : privacyListNames) {
            privacyListArr[i] = new PrivacyList(str.equals(privacyWithListNames.getActiveName()), str.equals(privacyWithListNames.getDefaultName()), str, getPrivacyListItems(str));
            i++;
        }
        return privacyListArr;
    }

    public void setActiveListName(String str) throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setActiveName(str);
        setRequest(privacy);
    }

    public void setDefaultListName(String str) throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setDefaultName(str);
        setRequest(privacy);
    }

    public void updatePrivacyList(String str, List<PrivacyItem> list) throws XMPPException {
        Privacy privacy = new Privacy();
        privacy.setPrivacyList(str, list);
        setRequest(privacy);
    }
}
