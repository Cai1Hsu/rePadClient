package org.jivesoftware.smackx.jingle.nat;

import de.javawi.jstun.test.BindingLifetimeTest;
import de.javawi.jstun.test.DiscoveryInfo;
import de.javawi.jstun.test.DiscoveryTest;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.xmlpull.mxp1.MXParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUNResolver.class */
public class STUNResolver extends TransportResolver {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(STUNResolver.class);
    public static final String STUNSERVERS_FILENAME = "META-INF/stun-config.xml";
    protected STUNService currentServer;
    protected int defaultPort;
    protected String resolvedLocalIP;
    protected String resolvedPublicIP;
    protected Thread resolverThread;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService.class */
    protected class STUNService {
        private String hostname;
        private int port;

        public STUNService(STUNResolver sTUNResolver) {
            this(null, -1);
        }

        public STUNService(String str, int i) {
            STUNResolver.this = r4;
            this.hostname = str;
            this.port = i;
        }

        public boolean checkBinding() {
            boolean z;
            try {
                BindingLifetimeTest bindingLifetimeTest = new BindingLifetimeTest(this.hostname, this.port);
                bindingLifetimeTest.test();
                while (true) {
                    Thread.sleep(5000L);
                    z = false;
                    if (bindingLifetimeTest.getLifetime() != -1) {
                        if (bindingLifetimeTest.isCompleted()) {
                            z = true;
                            break;
                        }
                    } else {
                        break;
                    }
                }
            } catch (Exception e) {
                STUNResolver.LOGGER.error(e.getMessage(), e);
                z = false;
            }
            return z;
        }

        public String getHostname() {
            return this.hostname;
        }

        public int getPort() {
            return this.port;
        }

        public boolean isNull() {
            boolean z;
            if (this.hostname == null) {
                z = true;
            } else {
                z = true;
                if (this.hostname.length() != 0) {
                    z = true;
                    if (this.port >= 0) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public void setHostname(String str) {
            this.hostname = str;
        }

        public void setPort(int i) {
            this.port = i;
        }
    }

    public STUNResolver() {
        this.defaultPort = 0;
        this.currentServer = new STUNService(this);
    }

    public STUNResolver(int i) {
        this();
        this.defaultPort = i;
    }

    private STUNService bestSTUNServer(ArrayList<STUNService> arrayList) {
        return arrayList.isEmpty() ? null : arrayList.get(0);
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void cancel() throws XMPPException {
        synchronized (this) {
            if (isResolving()) {
                this.resolverThread.interrupt();
                setResolveEnd();
            }
        }
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void clear() throws XMPPException {
        synchronized (this) {
            this.defaultPort = 0;
            super.clear();
        }
    }

    public String getCurrentServerName() {
        return !this.currentServer.isNull() ? this.currentServer.getHostname() : null;
    }

    public int getCurrentServerPort() {
        return !this.currentServer.isNull() ? this.currentServer.getPort() : 0;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void initialize() throws XMPPException {
        LOGGER.debug("Initialized");
        if (isResolving() || isResolved()) {
            return;
        }
        if (this.currentServer.isNull()) {
            loadSTUNServers();
        }
        if (this.currentServer.isNull()) {
            throw new IllegalStateException("No valid STUN server found.");
        }
        clearCandidates();
        this.resolverThread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.STUNResolver.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
                    while (networkInterfaces.hasMoreElements()) {
                        Enumeration<InetAddress> inetAddresses = networkInterfaces.nextElement().getInetAddresses();
                        while (inetAddresses.hasMoreElements()) {
                            InetAddress nextElement = inetAddresses.nextElement();
                            if (!nextElement.isLoopbackAddress() && !nextElement.isLinkLocalAddress()) {
                                try {
                                    DiscoveryInfo test = new DiscoveryTest(nextElement, STUNResolver.this.currentServer.getHostname(), STUNResolver.this.currentServer.getPort()).test();
                                    String hostAddress = test.getPublicIP() != null ? test.getPublicIP().getHostAddress() : null;
                                    int freePort = STUNResolver.this.defaultPort == 0 ? STUNResolver.this.getFreePort() : STUNResolver.this.defaultPort;
                                    if (hostAddress != null && freePort >= 0) {
                                        TransportCandidate.Fixed fixed = new TransportCandidate.Fixed(hostAddress, freePort);
                                        fixed.setLocalIp(nextElement.getHostAddress() != null ? nextElement.getHostAddress() : nextElement.getHostName());
                                        STUNResolver.this.addCandidate(fixed);
                                        STUNResolver.this.resolvedPublicIP = fixed.getIp();
                                        STUNResolver.this.resolvedLocalIP = fixed.getLocalIp();
                                        return;
                                    }
                                } catch (Exception e) {
                                    STUNResolver.LOGGER.error(e.getMessage(), e);
                                }
                            }
                        }
                    }
                } catch (SocketException e2) {
                    STUNResolver.LOGGER.error(e2.getMessage(), e2);
                } finally {
                    STUNResolver.this.setInitialized();
                }
            }
        }, "Waiting for all the transport candidates checks...");
        this.resolverThread.setName("STUN resolver");
        this.resolverThread.start();
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public boolean isResolving() {
        return super.isResolving() && this.resolverThread != null;
    }

    public ArrayList<STUNService> loadSTUNServers() {
        ArrayList<STUNService> arrayList = new ArrayList<>();
        try {
            for (ClassLoader classLoader : new ClassLoader[]{new STUNResolver() { // from class: org.jivesoftware.smackx.jingle.nat.STUNResolver.1
            }.getClass().getClassLoader(), Thread.currentThread().getContextClassLoader()}) {
                Enumeration<URL> resources = classLoader.getResources(STUNSERVERS_FILENAME);
                while (resources.hasMoreElements() && arrayList.isEmpty()) {
                    InputStream openStream = resources.nextElement().openStream();
                    arrayList.addAll(loadSTUNServers(openStream));
                    openStream.close();
                }
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
        return arrayList;
    }

    public ArrayList<STUNService> loadSTUNServers(InputStream inputStream) {
        int next;
        int i;
        ArrayList<STUNService> arrayList = new ArrayList<>();
        try {
            MXParser mXParser = new MXParser();
            mXParser.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, true);
            mXParser.setInput(inputStream, "UTF-8");
            int eventType = mXParser.getEventType();
            do {
                if (eventType == 2) {
                    if (mXParser.getName().equals("stunServer")) {
                        mXParser.next();
                        mXParser.next();
                        String nextText = mXParser.nextText();
                        mXParser.next();
                        mXParser.next();
                        try {
                            i = Integer.parseInt(mXParser.nextText());
                        } catch (Exception e) {
                            i = -1;
                        }
                        if (nextText != null && i != -1) {
                            arrayList.add(new STUNService(nextText, i));
                        }
                    }
                }
                next = mXParser.next();
                eventType = next;
            } while (next != 1);
        } catch (IOException e2) {
            LOGGER.error(e2.getMessage(), e2);
        } catch (XmlPullParserException e3) {
            LOGGER.error(e3.getMessage(), e3);
        }
        this.currentServer = bestSTUNServer(arrayList);
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void resolve(JingleSession jingleSession) throws XMPPException {
        synchronized (this) {
            setResolveInit();
            clearCandidates();
            TransportCandidate.Fixed fixed = new TransportCandidate.Fixed(this.resolvedPublicIP, getFreePort());
            fixed.setLocalIp(this.resolvedLocalIP);
            LOGGER.debug("RESOLVING : " + this.resolvedPublicIP + ":" + fixed.getPort());
            addCandidate(fixed);
            setResolveEnd();
        }
    }

    public void setSTUNService(String str, int i) {
        this.currentServer = new STUNService(str, i);
    }
}
