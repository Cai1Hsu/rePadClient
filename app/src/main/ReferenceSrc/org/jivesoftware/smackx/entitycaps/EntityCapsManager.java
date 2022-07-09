package org.jivesoftware.smackx.entitycaps;

import java.io.IOException;
import java.lang.ref.WeakReference;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.TreeSet;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketInterceptor;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.NotFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.Base64;
import org.jivesoftware.smack.util.Cache;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.NodeInformationProvider;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.entitycaps.cache.EntityCapsPersistentCache;
import org.jivesoftware.smackx.entitycaps.packet.CapsExtension;
import org.jivesoftware.smackx.packet.DataForm;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/entitycaps/EntityCapsManager.class */
public class EntityCapsManager {
    public static final String ELEMENT = "c";
    private static final String ENTITY_NODE = "http://www.igniterealtime.org/projects/smack";
    public static final String NAMESPACE = "http://jabber.org/protocol/caps";
    protected static EntityCapsPersistentCache persistentCache;
    private String currentCapsVersion;
    private boolean entityCapsEnabled;
    private Queue<String> lastLocalCapsVersions;
    private boolean presenceSend;
    private ServiceDiscoveryManager sdm;
    private WeakReference<Connection> weakRefConnection;
    private static final Map<String, MessageDigest> SUPPORTED_HASHES = new HashMap();
    private static Map<Connection, EntityCapsManager> instances = Collections.synchronizedMap(new WeakHashMap());
    protected static Map<String, DiscoverInfo> caps = new Cache(1000, -1);
    protected static Map<String, NodeVerHash> jidCaps = new Cache(10000, -1);

    /* loaded from: classes.jar:org/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash.class */
    public static class NodeVerHash {
        private String hash;
        private String node;
        private String nodeVer;
        private String ver;

        NodeVerHash(String str, String str2, String str3) {
            this.node = str;
            this.ver = str2;
            this.hash = str3;
            this.nodeVer = str + "#" + str2;
        }

        public String getHash() {
            return this.hash;
        }

        public String getNode() {
            return this.node;
        }

        public String getNodeVer() {
            return this.nodeVer;
        }

        public String getVer() {
            return this.ver;
        }
    }

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                if (connection instanceof XMPPConnection) {
                    new EntityCapsManager(connection);
                }
            }
        });
        try {
            SUPPORTED_HASHES.put("sha-1", MessageDigest.getInstance("SHA-1"));
        } catch (NoSuchAlgorithmException e) {
        }
    }

    private EntityCapsManager(Connection connection) {
        this.presenceSend = false;
        this.lastLocalCapsVersions = new ConcurrentLinkedQueue();
        this.weakRefConnection = new WeakReference<>(connection);
        this.sdm = ServiceDiscoveryManager.getInstanceFor(connection);
        init();
    }

    public static void addDiscoverInfoByNode(String str, DiscoverInfo discoverInfo) {
        caps.put(str, discoverInfo);
        if (persistentCache != null) {
            persistentCache.addDiscoverInfoByNodePersistent(str, discoverInfo);
        }
    }

    private static void formFieldValuesToCaps(Iterator<String> it, StringBuilder sb) {
        TreeSet<String> treeSet = new TreeSet();
        while (it.hasNext()) {
            treeSet.add(it.next());
        }
        for (String str : treeSet) {
            sb.append(str);
            sb.append("<");
        }
    }

    protected static String generateVerificationString(DiscoverInfo discoverInfo, String str) {
        String encodeBytes;
        MessageDigest messageDigest = SUPPORTED_HASHES.get(str.toLowerCase());
        if (messageDigest == null) {
            encodeBytes = null;
        } else {
            DataForm dataForm = (DataForm) discoverInfo.getExtension("x", Form.NAMESPACE);
            StringBuilder sb = new StringBuilder();
            TreeSet<DiscoverInfo.Identity> treeSet = new TreeSet();
            Iterator<DiscoverInfo.Identity> identities = discoverInfo.getIdentities();
            while (identities.hasNext()) {
                treeSet.add(identities.next());
            }
            for (DiscoverInfo.Identity identity : treeSet) {
                sb.append(identity.getCategory());
                sb.append("/");
                sb.append(identity.getType());
                sb.append("/");
                sb.append(identity.getLanguage() == null ? "" : identity.getLanguage());
                sb.append("/");
                sb.append(identity.getName() == null ? "" : identity.getName());
                sb.append("<");
            }
            TreeSet<String> treeSet2 = new TreeSet();
            Iterator<DiscoverInfo.Feature> features = discoverInfo.getFeatures();
            while (features.hasNext()) {
                treeSet2.add(features.next().getVar());
            }
            for (String str2 : treeSet2) {
                sb.append(str2);
                sb.append("<");
            }
            if (dataForm != null && dataForm.hasHiddenFormTypeField()) {
                synchronized (dataForm) {
                    TreeSet<FormField> treeSet3 = new TreeSet(new Comparator<FormField>() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.8
                        public int compare(FormField formField, FormField formField2) {
                            return formField.getVariable().compareTo(formField2.getVariable());
                        }
                    });
                    FormField formField = null;
                    Iterator<FormField> fields = dataForm.getFields();
                    while (fields.hasNext()) {
                        FormField next = fields.next();
                        if (!next.getVariable().equals("FORM_TYPE")) {
                            treeSet3.add(next);
                        } else {
                            formField = next;
                        }
                    }
                    if (formField != null) {
                        formFieldValuesToCaps(formField.getValues(), sb);
                    }
                    for (FormField formField2 : treeSet3) {
                        sb.append(formField2.getVariable());
                        sb.append("<");
                        formFieldValuesToCaps(formField2.getValues(), sb);
                    }
                }
            }
            encodeBytes = Base64.encodeBytes(messageDigest.digest(sb.toString().getBytes()));
        }
        return encodeBytes;
    }

    public static DiscoverInfo getDiscoverInfoByUser(String str) {
        NodeVerHash nodeVerHash = jidCaps.get(str);
        return nodeVerHash == null ? null : getDiscoveryInfoByNodeVer(nodeVerHash.nodeVer);
    }

    public static DiscoverInfo getDiscoveryInfoByNodeVer(String str) {
        DiscoverInfo discoverInfo = caps.get(str);
        DiscoverInfo discoverInfo2 = discoverInfo;
        if (discoverInfo != null) {
            discoverInfo2 = new DiscoverInfo(discoverInfo);
        }
        return discoverInfo2;
    }

    public static EntityCapsManager getInstanceFor(Connection connection) {
        EntityCapsManager entityCapsManager = null;
        synchronized (EntityCapsManager.class) {
            try {
                if ((connection instanceof XMPPConnection) && SUPPORTED_HASHES.size() > 0) {
                    EntityCapsManager entityCapsManager2 = instances.get(connection);
                    entityCapsManager = entityCapsManager2;
                    if (entityCapsManager2 == null) {
                        entityCapsManager = new EntityCapsManager(connection);
                    }
                }
            } finally {
            }
        }
        return entityCapsManager;
    }

    public static NodeVerHash getNodeVerHashByJid(String str) {
        return jidCaps.get(str);
    }

    public static String getNodeVersionByJid(String str) {
        NodeVerHash nodeVerHash = jidCaps.get(str);
        return nodeVerHash != null ? nodeVerHash.nodeVer : null;
    }

    private void init() {
        Connection connection = this.weakRefConnection.get();
        instances.put(connection, this);
        connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.2
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                EntityCapsManager.this.presenceSend = false;
                EntityCapsManager.instances.remove(EntityCapsManager.this.weakRefConnection.get());
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception exc) {
                EntityCapsManager.this.presenceSend = false;
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
        updateLocalEntityCaps();
        if (SmackConfiguration.autoEnableEntityCaps()) {
            enableEntityCaps();
        }
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (!EntityCapsManager.this.entityCapsEnabled()) {
                    return;
                }
                CapsExtension capsExtension = (CapsExtension) packet.getExtension(EntityCapsManager.ELEMENT, EntityCapsManager.NAMESPACE);
                String lowerCase = capsExtension.getHash().toLowerCase();
                if (!EntityCapsManager.SUPPORTED_HASHES.containsKey(lowerCase)) {
                    return;
                }
                EntityCapsManager.jidCaps.put(packet.getFrom(), new NodeVerHash(capsExtension.getNode(), capsExtension.getVer(), lowerCase));
            }
        }, new AndFilter(new PacketTypeFilter(Presence.class), new PacketExtensionFilter(ELEMENT, NAMESPACE)));
        connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.4
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                EntityCapsManager.jidCaps.remove(packet.getFrom());
            }
        }, new AndFilter(new PacketTypeFilter(Presence.class), new NotFilter(new PacketExtensionFilter(ELEMENT, NAMESPACE))));
        connection.addPacketSendingListener(new PacketListener() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.5
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                EntityCapsManager.this.presenceSend = true;
            }
        }, new PacketTypeFilter(Presence.class));
        connection.addPacketInterceptor(new PacketInterceptor() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.6
            @Override // org.jivesoftware.smack.PacketInterceptor
            public void interceptPacket(Packet packet) {
                if (!EntityCapsManager.this.entityCapsEnabled) {
                    return;
                }
                packet.addExtension(new CapsExtension(EntityCapsManager.ENTITY_NODE, EntityCapsManager.this.getCapsVersion(), "sha-1"));
            }
        }, new PacketTypeFilter(Presence.class));
        this.sdm.setEntityCapsManager(this);
    }

    public static void setCapsMaxCacheSize(int i) {
        ((Cache) caps).setMaxCacheSize(i);
    }

    public static void setJidCapsMaxCacheSize(int i) {
        ((Cache) jidCaps).setMaxCacheSize(i);
    }

    public static void setPersistentCache(EntityCapsPersistentCache entityCapsPersistentCache) throws IOException {
        if (persistentCache != null) {
            throw new IllegalStateException("Entity Caps Persistent Cache was already set");
        }
        persistentCache = entityCapsPersistentCache;
        persistentCache.replay();
    }

    public static boolean verifyDiscoverInfoVersion(String str, String str2, DiscoverInfo discoverInfo) {
        boolean z;
        if (discoverInfo.containsDuplicateIdentities()) {
            z = false;
        } else {
            z = false;
            if (!discoverInfo.containsDuplicateFeatures()) {
                z = false;
                if (!verifyPacketExtensions(discoverInfo)) {
                    z = false;
                    if (str.equals(generateVerificationString(discoverInfo, str2))) {
                        z = true;
                    }
                }
            }
        }
        return z;
    }

    protected static boolean verifyPacketExtensions(DiscoverInfo discoverInfo) {
        boolean z;
        LinkedList<FormField> linkedList = new LinkedList();
        Iterator<PacketExtension> it = discoverInfo.getExtensions().iterator();
        loop0: while (true) {
            if (!it.hasNext()) {
                z = false;
                break;
            }
            PacketExtension next = it.next();
            if (next.getNamespace().equals(Form.NAMESPACE)) {
                Iterator<FormField> fields = ((DataForm) next).getFields();
                while (fields.hasNext()) {
                    FormField next2 = fields.next();
                    if (next2.getVariable().equals("FORM_TYPE")) {
                        for (FormField formField : linkedList) {
                            if (next2.equals(formField)) {
                                z = true;
                                break loop0;
                            }
                        }
                        linkedList.add(next2);
                    }
                }
                continue;
            }
        }
        return z;
    }

    public boolean areEntityCapsSupported(String str) {
        boolean z;
        if (str == null) {
            z = false;
        } else {
            try {
                z = this.sdm.discoverInfo(str).containsFeature(NAMESPACE);
            } catch (XMPPException e) {
                z = false;
            }
        }
        return z;
    }

    public boolean areEntityCapsSupportedByServer() {
        return areEntityCapsSupported(this.weakRefConnection.get().getServiceName());
    }

    public void disableEntityCaps() {
        this.entityCapsEnabled = false;
        this.sdm.removeFeature(NAMESPACE);
    }

    public void enableEntityCaps() {
        this.sdm.addFeature(NAMESPACE);
        updateLocalEntityCaps();
        this.entityCapsEnabled = true;
    }

    public boolean entityCapsEnabled() {
        return this.entityCapsEnabled;
    }

    public String getCapsVersion() {
        return this.currentCapsVersion;
    }

    public String getLocalNodeVer() {
        return "http://www.igniterealtime.org/projects/smack#" + getCapsVersion();
    }

    public void removeUserCapsNode(String str) {
        jidCaps.remove(str);
    }

    public void updateLocalEntityCaps() {
        Connection connection = this.weakRefConnection.get();
        DiscoverInfo discoverInfo = new DiscoverInfo();
        discoverInfo.setType(IQ.Type.RESULT);
        discoverInfo.setNode(getLocalNodeVer());
        if (connection != null) {
            discoverInfo.setFrom(connection.getUser());
        }
        this.sdm.addDiscoverInfoTo(discoverInfo);
        this.currentCapsVersion = generateVerificationString(discoverInfo, "sha-1");
        addDiscoverInfoByNode("http://www.igniterealtime.org/projects/smack#" + this.currentCapsVersion, discoverInfo);
        if (this.lastLocalCapsVersions.size() > 10) {
            this.sdm.removeNodeInformationProvider("http://www.igniterealtime.org/projects/smack#" + this.lastLocalCapsVersions.poll());
        }
        this.lastLocalCapsVersions.add(this.currentCapsVersion);
        caps.put(this.currentCapsVersion, discoverInfo);
        if (connection != null) {
            jidCaps.put(connection.getUser(), new NodeVerHash(ENTITY_NODE, this.currentCapsVersion, "sha-1"));
        }
        this.sdm.setNodeInformationProvider("http://www.igniterealtime.org/projects/smack#" + this.currentCapsVersion, new NodeInformationProvider() { // from class: org.jivesoftware.smackx.entitycaps.EntityCapsManager.7
            List<String> features;
            List<DiscoverInfo.Identity> identities = new LinkedList(ServiceDiscoveryManager.getIdentities());
            List<PacketExtension> packetExtensions;

            {
                EntityCapsManager.this = this;
                this.features = EntityCapsManager.this.sdm.getFeaturesList();
                this.packetExtensions = EntityCapsManager.this.sdm.getExtendedInfoAsList();
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<String> getNodeFeatures() {
                return this.features;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverInfo.Identity> getNodeIdentities() {
                return this.identities;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<DiscoverItems.Item> getNodeItems() {
                return null;
            }

            @Override // org.jivesoftware.smackx.NodeInformationProvider
            public List<PacketExtension> getNodePacketExtensions() {
                return this.packetExtensions;
            }
        });
        if (connection == null || !connection.isAuthenticated() || !this.presenceSend) {
            return;
        }
        connection.sendPacket(new Presence(Presence.Type.available));
    }
}
