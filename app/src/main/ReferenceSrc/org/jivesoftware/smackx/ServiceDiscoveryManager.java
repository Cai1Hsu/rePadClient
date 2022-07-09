package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smackx.entitycaps.EntityCapsManager;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/ServiceDiscoveryManager.class */
public class ServiceDiscoveryManager {
    private static final String DEFAULT_IDENTITY_CATEGORY = "client";
    private static final String DEFAULT_IDENTITY_NAME = "Smack";
    private static final String DEFAULT_IDENTITY_TYPE = "pc";
    private static List<DiscoverInfo.Identity> identities = new LinkedList();
    private static Map<Connection, ServiceDiscoveryManager> instances = new ConcurrentHashMap();
    private EntityCapsManager capsManager;
    private Connection connection;
    private final Set<String> features = new HashSet();
    private DataForm extendedInfo = null;
    private Map<String, NodeInformationProvider> nodeInformationProviders = new ConcurrentHashMap();

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.ServiceDiscoveryManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new ServiceDiscoveryManager(connection);
            }
        });
        identities.add(new DiscoverInfo.Identity(DEFAULT_IDENTITY_CATEGORY, DEFAULT_IDENTITY_NAME, DEFAULT_IDENTITY_TYPE));
    }

    public ServiceDiscoveryManager(Connection connection) {
        this.connection = connection;
        init();
    }

    public static boolean canPublishItems(DiscoverInfo discoverInfo) {
        return discoverInfo.containsFeature("http://jabber.org/protocol/disco#publish");
    }

    public static List<DiscoverInfo.Identity> getIdentities() {
        return Collections.unmodifiableList(identities);
    }

    public static String getIdentityName() {
        DiscoverInfo.Identity identity = identities.get(0);
        return identity != null ? identity.getName() : null;
    }

    public static String getIdentityType() {
        DiscoverInfo.Identity identity = identities.get(0);
        return identity != null ? identity.getType() : null;
    }

    public static ServiceDiscoveryManager getInstanceFor(Connection connection) {
        return instances.get(connection);
    }

    public NodeInformationProvider getNodeInformationProvider(String str) {
        return str == null ? null : this.nodeInformationProviders.get(str);
    }

    private void init() {
        instances.put(this.connection, this);
        addFeature(DiscoverInfo.NAMESPACE);
        addFeature(DiscoverItems.NAMESPACE);
        this.connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smackx.ServiceDiscoveryManager.2
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                ServiceDiscoveryManager.instances.remove(ServiceDiscoveryManager.this.connection);
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
        PacketTypeFilter packetTypeFilter = new PacketTypeFilter(DiscoverItems.class);
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.ServiceDiscoveryManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                DiscoverItems discoverItems = (DiscoverItems) packet;
                if (discoverItems == null || discoverItems.getType() != IQ.Type.GET) {
                    return;
                }
                DiscoverItems discoverItems2 = new DiscoverItems();
                discoverItems2.setType(IQ.Type.RESULT);
                discoverItems2.setTo(discoverItems.getFrom());
                discoverItems2.setPacketID(discoverItems.getPacketID());
                discoverItems2.setNode(discoverItems.getNode());
                NodeInformationProvider nodeInformationProvider = ServiceDiscoveryManager.this.getNodeInformationProvider(discoverItems.getNode());
                if (nodeInformationProvider != null) {
                    discoverItems2.addItems(nodeInformationProvider.getNodeItems());
                    discoverItems2.addExtensions(nodeInformationProvider.getNodePacketExtensions());
                } else if (discoverItems.getNode() != null) {
                    discoverItems2.setType(IQ.Type.ERROR);
                    discoverItems2.setError(new XMPPError(XMPPError.Condition.item_not_found));
                }
                ServiceDiscoveryManager.this.connection.sendPacket(discoverItems2);
            }
        }, packetTypeFilter);
        PacketTypeFilter packetTypeFilter2 = new PacketTypeFilter(DiscoverInfo.class);
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.ServiceDiscoveryManager.4
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                DiscoverInfo discoverInfo = (DiscoverInfo) packet;
                if (discoverInfo == null || discoverInfo.getType() != IQ.Type.GET) {
                    return;
                }
                DiscoverInfo discoverInfo2 = new DiscoverInfo();
                discoverInfo2.setType(IQ.Type.RESULT);
                discoverInfo2.setTo(discoverInfo.getFrom());
                discoverInfo2.setPacketID(discoverInfo.getPacketID());
                discoverInfo2.setNode(discoverInfo.getNode());
                if (discoverInfo.getNode() == null) {
                    ServiceDiscoveryManager.this.addDiscoverInfoTo(discoverInfo2);
                } else {
                    NodeInformationProvider nodeInformationProvider = ServiceDiscoveryManager.this.getNodeInformationProvider(discoverInfo.getNode());
                    if (nodeInformationProvider != null) {
                        discoverInfo2.addFeatures(nodeInformationProvider.getNodeFeatures());
                        discoverInfo2.addIdentities(nodeInformationProvider.getNodeIdentities());
                        discoverInfo2.addExtensions(nodeInformationProvider.getNodePacketExtensions());
                    } else {
                        discoverInfo2.setType(IQ.Type.ERROR);
                        discoverInfo2.setError(new XMPPError(XMPPError.Condition.item_not_found));
                    }
                }
                ServiceDiscoveryManager.this.connection.sendPacket(discoverInfo2);
            }
        }, packetTypeFilter2);
    }

    private void renewEntityCapsVersion() {
        if (this.capsManager == null || !this.capsManager.entityCapsEnabled()) {
            return;
        }
        this.capsManager.updateLocalEntityCaps();
    }

    public static void setIdentityName(String str) {
        identities.remove(0);
        identities.add(new DiscoverInfo.Identity(DEFAULT_IDENTITY_CATEGORY, str, DEFAULT_IDENTITY_TYPE));
    }

    public static void setIdentityType(String str) {
        DiscoverInfo.Identity identity = identities.get(0);
        if (identity != null) {
            identity.setType(str);
            return;
        }
        identities.add(new DiscoverInfo.Identity(DEFAULT_IDENTITY_CATEGORY, DEFAULT_IDENTITY_NAME, str));
    }

    public void addDiscoverInfoTo(DiscoverInfo discoverInfo) {
        discoverInfo.addIdentities(identities);
        synchronized (this.features) {
            Iterator<String> features = getFeatures();
            while (features.hasNext()) {
                discoverInfo.addFeature(features.next());
            }
            discoverInfo.addExtension(this.extendedInfo);
        }
    }

    public void addFeature(String str) {
        synchronized (this.features) {
            this.features.add(str);
            renewEntityCapsVersion();
        }
    }

    public boolean canPublishItems(String str) throws XMPPException {
        return canPublishItems(discoverInfo(str));
    }

    public DiscoverInfo discoverInfo(String str) throws XMPPException {
        DiscoverInfo discoverInfo;
        if (str == null) {
            discoverInfo = discoverInfo(null, null);
        } else {
            DiscoverInfo discoverInfoByUser = EntityCapsManager.getDiscoverInfoByUser(str);
            discoverInfo = discoverInfoByUser;
            if (discoverInfoByUser == null) {
                EntityCapsManager.NodeVerHash nodeVerHashByJid = EntityCapsManager.getNodeVerHashByJid(str);
                String str2 = null;
                if (nodeVerHashByJid != null) {
                    str2 = nodeVerHashByJid.getNodeVer();
                }
                DiscoverInfo discoverInfo2 = discoverInfo(str, str2);
                discoverInfo = discoverInfo2;
                if (nodeVerHashByJid != null) {
                    discoverInfo = discoverInfo2;
                    if (EntityCapsManager.verifyDiscoverInfoVersion(nodeVerHashByJid.getVer(), nodeVerHashByJid.getHash(), discoverInfo2)) {
                        EntityCapsManager.addDiscoverInfoByNode(nodeVerHashByJid.getNodeVer(), discoverInfo2);
                        discoverInfo = discoverInfo2;
                    }
                }
            }
        }
        return discoverInfo;
    }

    public DiscoverInfo discoverInfo(String str, String str2) throws XMPPException {
        DiscoverInfo discoverInfo = new DiscoverInfo();
        discoverInfo.setType(IQ.Type.GET);
        discoverInfo.setTo(str);
        discoverInfo.setNode(str2);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(discoverInfo.getPacketID()));
        this.connection.sendPacket(discoverInfo);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return (DiscoverInfo) iq;
        }
        throw new XMPPException(iq.getError());
    }

    public DiscoverItems discoverItems(String str) throws XMPPException {
        return discoverItems(str, null);
    }

    public DiscoverItems discoverItems(String str, String str2) throws XMPPException {
        DiscoverItems discoverItems = new DiscoverItems();
        discoverItems.setType(IQ.Type.GET);
        discoverItems.setTo(str);
        discoverItems.setNode(str2);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(discoverItems.getPacketID()));
        this.connection.sendPacket(discoverItems);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return (DiscoverItems) iq;
        }
        throw new XMPPException(iq.getError());
    }

    public DataForm getExtendedInfo() {
        return this.extendedInfo;
    }

    public List<PacketExtension> getExtendedInfoAsList() {
        ArrayList arrayList = null;
        if (this.extendedInfo != null) {
            arrayList = new ArrayList(1);
            arrayList.add(this.extendedInfo);
        }
        return arrayList;
    }

    public Iterator<String> getFeatures() {
        Iterator<String> it;
        synchronized (this.features) {
            it = Collections.unmodifiableList(new ArrayList(this.features)).iterator();
        }
        return it;
    }

    public List<String> getFeaturesList() {
        LinkedList linkedList;
        synchronized (this.features) {
            linkedList = new LinkedList(this.features);
        }
        return linkedList;
    }

    public boolean includesFeature(String str) {
        boolean contains;
        synchronized (this.features) {
            contains = this.features.contains(str);
        }
        return contains;
    }

    public void publishItems(String str, String str2, DiscoverItems discoverItems) throws XMPPException {
        discoverItems.setType(IQ.Type.SET);
        discoverItems.setTo(str);
        discoverItems.setNode(str2);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(discoverItems.getPacketID()));
        this.connection.sendPacket(discoverItems);
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

    public void publishItems(String str, DiscoverItems discoverItems) throws XMPPException {
        publishItems(str, null, discoverItems);
    }

    public void removeExtendedInfo() {
        this.extendedInfo = null;
        renewEntityCapsVersion();
    }

    public void removeFeature(String str) {
        synchronized (this.features) {
            this.features.remove(str);
            renewEntityCapsVersion();
        }
    }

    public void removeNodeInformationProvider(String str) {
        this.nodeInformationProviders.remove(str);
    }

    public void setEntityCapsManager(EntityCapsManager entityCapsManager) {
        this.capsManager = entityCapsManager;
    }

    public void setExtendedInfo(DataForm dataForm) {
        this.extendedInfo = dataForm;
        renewEntityCapsVersion();
    }

    public void setNodeInformationProvider(String str, NodeInformationProvider nodeInformationProvider) {
        this.nodeInformationProviders.put(str, nodeInformationProvider);
    }
}
