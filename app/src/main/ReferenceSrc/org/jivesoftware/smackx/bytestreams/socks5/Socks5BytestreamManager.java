package org.jivesoftware.smackx.bytestreams.socks5;

import java.io.IOException;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeoutException;
import org.jivesoftware.smack.AbstractConnectionListener;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.SyncPacketSend;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.bytestreams.BytestreamListener;
import org.jivesoftware.smackx.bytestreams.BytestreamManager;
import org.jivesoftware.smackx.bytestreams.socks5.packet.Bytestream;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager.class */
public final class Socks5BytestreamManager implements BytestreamManager {
    public static final String NAMESPACE = "http://jabber.org/protocol/bytestreams";
    private static final String SESSION_ID_PREFIX = "js5_";
    private final Connection connection;
    private static final Random randomGenerator = new Random();
    private static final Map<Connection, Socks5BytestreamManager> managers = new HashMap();
    private final Map<String, BytestreamListener> userListeners = new ConcurrentHashMap();
    private final List<BytestreamListener> allRequestListeners = Collections.synchronizedList(new LinkedList());
    private int targetResponseTimeout = 10000;
    private int proxyConnectionTimeout = 10000;
    private final List<String> proxyBlacklist = Collections.synchronizedList(new LinkedList());
    private String lastWorkingProxy = null;
    private boolean proxyPrioritizationEnabled = true;
    private List<String> ignoredBytestreamRequests = Collections.synchronizedList(new LinkedList());
    private final InitiationListener initiationListener = new InitiationListener(this);

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.bytestreams.socks5.Socks5BytestreamManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                final Socks5BytestreamManager bytestreamManager = Socks5BytestreamManager.getBytestreamManager(connection);
                connection.addConnectionListener(new AbstractConnectionListener() { // from class: org.jivesoftware.smackx.bytestreams.socks5.Socks5BytestreamManager.1.1
                    @Override // org.jivesoftware.smack.AbstractConnectionListener, org.jivesoftware.smack.ConnectionListener
                    public void connectionClosed() {
                        bytestreamManager.disableService();
                    }
                });
            }
        });
    }

    private Socks5BytestreamManager(Connection connection) {
        this.connection = connection;
    }

    private void activate() {
        this.connection.addPacketListener(this.initiationListener, this.initiationListener.getFilter());
        enableService();
    }

    private Bytestream createBytestreamInitiation(String str, String str2, List<Bytestream.StreamHost> list) {
        Bytestream bytestream = new Bytestream(str);
        for (Bytestream.StreamHost streamHost : list) {
            bytestream.addStreamHost(streamHost);
        }
        bytestream.setType(IQ.Type.SET);
        bytestream.setTo(str2);
        return bytestream;
    }

    private Bytestream createStreamHostRequest(String str) {
        Bytestream bytestream = new Bytestream();
        bytestream.setType(IQ.Type.GET);
        bytestream.setTo(str);
        return bytestream;
    }

    private List<String> determineProxies() throws XMPPException {
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.connection);
        ArrayList arrayList = new ArrayList();
        Iterator<DiscoverItems.Item> items = instanceFor.discoverItems(this.connection.getServiceName()).getItems();
        while (items.hasNext()) {
            DiscoverItems.Item next = items.next();
            if (!this.proxyBlacklist.contains(next.getEntityID())) {
                try {
                    Iterator<DiscoverInfo.Identity> identities = instanceFor.discoverInfo(next.getEntityID()).getIdentities();
                    while (true) {
                        if (identities.hasNext()) {
                            DiscoverInfo.Identity next2 = identities.next();
                            if ("proxy".equalsIgnoreCase(next2.getCategory()) && "bytestreams".equalsIgnoreCase(next2.getType())) {
                                arrayList.add(next.getEntityID());
                                break;
                            }
                            this.proxyBlacklist.add(next.getEntityID());
                        }
                    }
                } catch (XMPPException e) {
                    this.proxyBlacklist.add(next.getEntityID());
                }
            }
        }
        return arrayList;
    }

    private List<Bytestream.StreamHost> determineStreamHostInfos(List<String> list) {
        ArrayList arrayList = new ArrayList();
        List<Bytestream.StreamHost> localStreamHost = getLocalStreamHost();
        if (localStreamHost != null) {
            arrayList.addAll(localStreamHost);
        }
        for (String str : list) {
            try {
                arrayList.addAll(((Bytestream) SyncPacketSend.getReply(this.connection, createStreamHostRequest(str))).getStreamHosts());
            } catch (XMPPException e) {
                this.proxyBlacklist.add(str);
            }
        }
        return arrayList;
    }

    private void enableService() {
        ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.connection);
        if (!instanceFor.includesFeature(NAMESPACE)) {
            instanceFor.addFeature(NAMESPACE);
        }
    }

    public static Socks5BytestreamManager getBytestreamManager(Connection connection) {
        Socks5BytestreamManager socks5BytestreamManager;
        synchronized (Socks5BytestreamManager.class) {
            if (connection == null) {
                socks5BytestreamManager = null;
            } else {
                try {
                    Socks5BytestreamManager socks5BytestreamManager2 = managers.get(connection);
                    socks5BytestreamManager = socks5BytestreamManager2;
                    if (socks5BytestreamManager2 == null) {
                        socks5BytestreamManager = new Socks5BytestreamManager(connection);
                        managers.put(connection, socks5BytestreamManager);
                        socks5BytestreamManager.activate();
                    }
                } finally {
                }
            }
        }
        return socks5BytestreamManager;
    }

    private List<Bytestream.StreamHost> getLocalStreamHost() {
        ArrayList arrayList;
        Socks5Proxy socks5Proxy = Socks5Proxy.getSocks5Proxy();
        if (socks5Proxy.isRunning()) {
            List<String> localAddresses = socks5Proxy.getLocalAddresses();
            int port = socks5Proxy.getPort();
            if (localAddresses.size() >= 1) {
                ArrayList arrayList2 = new ArrayList();
                Iterator<String> it = localAddresses.iterator();
                while (true) {
                    arrayList = arrayList2;
                    if (!it.hasNext()) {
                        break;
                    }
                    Bytestream.StreamHost streamHost = new Bytestream.StreamHost(this.connection.getUser(), it.next());
                    streamHost.setPort(port);
                    arrayList2.add(streamHost);
                }
                return arrayList;
            }
        }
        arrayList = null;
        return arrayList;
    }

    private String getNextSessionID() {
        return SESSION_ID_PREFIX + Math.abs(randomGenerator.nextLong());
    }

    private boolean supportsSocks5(String str) throws XMPPException {
        return ServiceDiscoveryManager.getInstanceFor(this.connection).discoverInfo(str).containsFeature(NAMESPACE);
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public void addIncomingBytestreamListener(BytestreamListener bytestreamListener) {
        this.allRequestListeners.add(bytestreamListener);
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public void addIncomingBytestreamListener(BytestreamListener bytestreamListener, String str) {
        this.userListeners.put(str, bytestreamListener);
    }

    public void disableService() {
        synchronized (this) {
            this.connection.removePacketListener(this.initiationListener);
            this.initiationListener.shutdown();
            this.allRequestListeners.clear();
            this.userListeners.clear();
            this.lastWorkingProxy = null;
            this.proxyBlacklist.clear();
            this.ignoredBytestreamRequests.clear();
            managers.remove(this.connection);
            if (managers.size() == 0) {
                Socks5Proxy.getSocks5Proxy().stop();
            }
            ServiceDiscoveryManager instanceFor = ServiceDiscoveryManager.getInstanceFor(this.connection);
            if (instanceFor != null) {
                instanceFor.removeFeature(NAMESPACE);
            }
        }
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public Socks5BytestreamSession establishSession(String str) throws XMPPException, IOException, InterruptedException {
        return establishSession(str, getNextSessionID());
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public Socks5BytestreamSession establishSession(String str, String str2) throws XMPPException, IOException, InterruptedException {
        Bytestream.StreamHost streamHost;
        XMPPException e = null;
        if (!supportsSocks5(str)) {
            throw new XMPPException(str + " doesn't support SOCKS5 Bytestream");
        }
        ArrayList arrayList = new ArrayList();
        try {
            arrayList.addAll(determineProxies());
        } catch (XMPPException e2) {
            e = e2;
        }
        List<Bytestream.StreamHost> determineStreamHostInfos = determineStreamHostInfos(arrayList);
        if (determineStreamHostInfos.isEmpty()) {
            if (e == null) {
                e = new XMPPException("no SOCKS5 proxies available");
            }
            throw e;
        }
        String createDigest = Socks5Utils.createDigest(str2, this.connection.getUser(), str);
        if (this.proxyPrioritizationEnabled && this.lastWorkingProxy != null) {
            Iterator<Bytestream.StreamHost> it = determineStreamHostInfos.iterator();
            do {
                streamHost = null;
                if (!it.hasNext()) {
                    break;
                }
                streamHost = it.next();
            } while (!streamHost.getJID().equals(this.lastWorkingProxy));
            if (streamHost != null) {
                determineStreamHostInfos.remove(streamHost);
                determineStreamHostInfos.add(0, streamHost);
            }
        }
        Socks5Proxy socks5Proxy = Socks5Proxy.getSocks5Proxy();
        try {
            try {
                socks5Proxy.addTransfer(createDigest);
                Bytestream createBytestreamInitiation = createBytestreamInitiation(str2, str, determineStreamHostInfos);
                Bytestream.StreamHost streamHost2 = createBytestreamInitiation.getStreamHost(((Bytestream) SyncPacketSend.getReply(this.connection, createBytestreamInitiation, getTargetResponseTimeout())).getUsedHost().getJID());
                if (streamHost2 == null) {
                    throw new XMPPException("Remote user responded with unknown host");
                }
                Socket socket = new Socks5ClientForInitiator(streamHost2, createDigest, this.connection, str2, str).getSocket(getProxyConnectionTimeout());
                this.lastWorkingProxy = streamHost2.getJID();
                return new Socks5BytestreamSession(socket, streamHost2.getJID().equals(this.connection.getUser()));
            } finally {
                socks5Proxy.removeTransfer(createDigest);
            }
        } catch (TimeoutException e3) {
            throw new IOException("Timeout while connecting to SOCKS5 proxy");
        }
    }

    protected List<BytestreamListener> getAllRequestListeners() {
        return this.allRequestListeners;
    }

    protected Connection getConnection() {
        return this.connection;
    }

    protected List<String> getIgnoredBytestreamRequests() {
        return this.ignoredBytestreamRequests;
    }

    public int getProxyConnectionTimeout() {
        if (this.proxyConnectionTimeout <= 0) {
            this.proxyConnectionTimeout = 10000;
        }
        return this.proxyConnectionTimeout;
    }

    public int getTargetResponseTimeout() {
        if (this.targetResponseTimeout <= 0) {
            this.targetResponseTimeout = 10000;
        }
        return this.targetResponseTimeout;
    }

    protected BytestreamListener getUserListener(String str) {
        return this.userListeners.get(str);
    }

    public void ignoreBytestreamRequestOnce(String str) {
        this.ignoredBytestreamRequests.add(str);
    }

    public boolean isProxyPrioritizationEnabled() {
        return this.proxyPrioritizationEnabled;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public void removeIncomingBytestreamListener(String str) {
        this.userListeners.remove(str);
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamManager
    public void removeIncomingBytestreamListener(BytestreamListener bytestreamListener) {
        this.allRequestListeners.remove(bytestreamListener);
    }

    protected void replyRejectPacket(IQ iq) {
        this.connection.sendPacket(IQ.createErrorResponse(iq, new XMPPError(XMPPError.Condition.no_acceptable)));
    }

    public void setProxyConnectionTimeout(int i) {
        this.proxyConnectionTimeout = i;
    }

    public void setProxyPrioritizationEnabled(boolean z) {
        this.proxyPrioritizationEnabled = z;
    }

    public void setTargetResponseTimeout(int i) {
        this.targetResponseTimeout = i;
    }
}
