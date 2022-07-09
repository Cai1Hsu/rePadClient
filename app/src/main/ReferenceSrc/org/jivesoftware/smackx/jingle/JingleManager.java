package org.jivesoftware.smackx.jingle;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionCreationListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.RosterListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.ServiceDiscoveryManager;
import org.jivesoftware.smackx.jingle.listeners.CreatedJingleSessionListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionRequestListener;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.provider.JingleProvider;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleManager.class */
public class JingleManager implements JingleSessionListener {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleManager.class);
    private Connection connection;
    private List<JingleMediaManager> jingleMediaManagers;
    private List<JingleSessionRequestListener> jingleSessionRequestListeners;
    final List<JingleSession> jingleSessions = new ArrayList();
    private List<CreatedJingleSessionListener> creationListeners = new ArrayList();

    public JingleManager(Connection connection, List<JingleMediaManager> list) {
        this.connection = connection;
        this.jingleMediaManagers = list;
        connection.getRoster().addRosterListener(new RosterListener() { // from class: org.jivesoftware.smackx.jingle.JingleManager.1
            @Override // org.jivesoftware.smack.RosterListener
            public void entriesAdded(Collection<String> collection) {
            }

            @Override // org.jivesoftware.smack.RosterListener
            public void entriesDeleted(Collection<String> collection) {
            }

            @Override // org.jivesoftware.smack.RosterListener
            public void entriesUpdated(Collection<String> collection) {
            }

            @Override // org.jivesoftware.smack.RosterListener
            public void presenceChanged(Presence presence) {
                if (!presence.isAvailable()) {
                    String from = presence.getFrom();
                    JingleSession jingleSession = null;
                    for (JingleSession jingleSession2 : JingleManager.this.jingleSessions) {
                        if (jingleSession2.getInitiator().equals(from) || jingleSession2.getResponder().equals(from)) {
                            jingleSession = jingleSession2;
                        }
                    }
                    if (jingleSession == null) {
                        return;
                    }
                    try {
                        jingleSession.terminate();
                    } catch (XMPPException e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    private void initJingleSessionRequestListeners() {
        PacketFilter packetFilter = new PacketFilter() { // from class: org.jivesoftware.smackx.jingle.JingleManager.3
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                boolean z;
                if (packet instanceof IQ) {
                    IQ iq = (IQ) packet;
                    if (iq.getType().equals(IQ.Type.SET) && (iq instanceof Jingle) && ((Jingle) packet).getAction().equals(JingleActionEnum.SESSION_INITIATE)) {
                        z = true;
                        return z;
                    }
                }
                z = false;
                return z;
            }
        };
        this.jingleSessionRequestListeners = new ArrayList();
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.jingle.JingleManager.4
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                JingleManager.this.triggerSessionRequested((Jingle) packet);
            }
        }, packetFilter);
    }

    public static boolean isServiceEnabled(Connection connection) {
        return ServiceDiscoveryManager.getInstanceFor(connection).includesFeature(Jingle.NAMESPACE);
    }

    public static boolean isServiceEnabled(Connection connection, String str) {
        boolean z;
        try {
            z = ServiceDiscoveryManager.getInstanceFor(connection).discoverInfo(str).containsFeature(Jingle.NAMESPACE);
        } catch (XMPPException e) {
            e.printStackTrace();
            z = false;
        }
        return z;
    }

    public static void setJingleServiceEnabled() {
        ProviderManager.getInstance().addIQProvider(Jingle.NODENAME, Jingle.NAMESPACE, new JingleProvider());
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smackx.jingle.JingleManager.2
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                JingleManager.setServiceEnabled(connection, true);
            }
        });
    }

    public static void setServiceEnabled(Connection connection, boolean z) {
        synchronized (JingleManager.class) {
            try {
                if (isServiceEnabled(connection) != z) {
                    if (z) {
                        ServiceDiscoveryManager.getInstanceFor(connection).addFeature(Jingle.NAMESPACE);
                    } else {
                        ServiceDiscoveryManager.getInstanceFor(connection).removeFeature(Jingle.NAMESPACE);
                    }
                }
            } finally {
            }
        }
    }

    public void addCreationListener(CreatedJingleSessionListener createdJingleSessionListener) {
        this.creationListeners.add(createdJingleSessionListener);
    }

    public void addJingleSessionRequestListener(JingleSessionRequestListener jingleSessionRequestListener) {
        synchronized (this) {
            if (jingleSessionRequestListener != null) {
                if (this.jingleSessionRequestListeners == null) {
                    initJingleSessionRequestListeners();
                }
                synchronized (this.jingleSessionRequestListeners) {
                    this.jingleSessionRequestListeners.add(jingleSessionRequestListener);
                }
            }
        }
    }

    public JingleSession createIncomingJingleSession(JingleSessionRequest jingleSessionRequest) throws XMPPException {
        if (jingleSessionRequest == null) {
            throw new NullPointerException("Received request cannot be null");
        }
        JingleSession jingleSession = new JingleSession(this.connection, jingleSessionRequest, jingleSessionRequest.getFrom(), this.connection.getUser(), this.jingleMediaManagers);
        triggerSessionCreated(jingleSession);
        return jingleSession;
    }

    public JingleSession createOutgoingJingleSession(String str) throws XMPPException {
        if (str == null || StringUtils.parseName(str).length() <= 0 || StringUtils.parseServer(str).length() <= 0 || StringUtils.parseResource(str).length() <= 0) {
            throw new IllegalArgumentException("The provided user id was not fully qualified");
        }
        JingleSession jingleSession = new JingleSession(this.connection, (JingleSessionRequest) null, this.connection.getUser(), str, this.jingleMediaManagers);
        triggerSessionCreated(jingleSession);
        return jingleSession;
    }

    public void disconnectAllSessions() {
        List<JingleSession> subList = this.jingleSessions.subList(0, this.jingleSessions.size());
        for (JingleSession jingleSession : subList) {
            try {
                jingleSession.terminate();
            } catch (XMPPException e) {
                e.printStackTrace();
            }
        }
        subList.clear();
    }

    public List<JingleMediaManager> getMediaManagers() {
        return this.jingleMediaManagers;
    }

    public JingleSession getSession(String str) {
        JingleSession jingleSession;
        Iterator<JingleSession> it = this.jingleSessions.iterator();
        while (true) {
            if (!it.hasNext()) {
                jingleSession = null;
                break;
            }
            JingleSession next = it.next();
            if (next.getResponder().equals(str)) {
                jingleSession = next;
                break;
            }
        }
        return jingleSession;
    }

    public void removeCreationListener(CreatedJingleSessionListener createdJingleSessionListener) {
        this.creationListeners.remove(createdJingleSessionListener);
    }

    public void removeJingleSessionRequestListener(JingleSessionRequestListener jingleSessionRequestListener) {
        if (this.jingleSessionRequestListeners == null) {
            return;
        }
        synchronized (this.jingleSessionRequestListeners) {
            this.jingleSessionRequestListeners.remove(jingleSessionRequestListener);
        }
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosed(String str, JingleSession jingleSession) {
        jingleSession.removeListener(this);
        this.jingleSessions.remove(jingleSession);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionClosedOnError(XMPPException xMPPException, JingleSession jingleSession) {
        jingleSession.removeListener(this);
        this.jingleSessions.remove(jingleSession);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionDeclined(String str, JingleSession jingleSession) {
        jingleSession.removeListener(this);
        this.jingleSessions.remove(jingleSession);
        jingleSession.close();
        LOGGER.error("Declined:" + str);
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionEstablished(PayloadType payloadType, TransportCandidate transportCandidate, TransportCandidate transportCandidate2, JingleSession jingleSession) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionMediaReceived(JingleSession jingleSession, String str) {
    }

    @Override // org.jivesoftware.smackx.jingle.listeners.JingleSessionListener
    public void sessionRedirected(String str, JingleSession jingleSession) {
        jingleSession.removeListener(this);
        this.jingleSessions.remove(jingleSession);
    }

    public void setMediaManagers(List<JingleMediaManager> list) {
        this.jingleMediaManagers = list;
    }

    public void triggerSessionCreated(JingleSession jingleSession) {
        this.jingleSessions.add(jingleSession);
        jingleSession.addListener(this);
        for (CreatedJingleSessionListener createdJingleSessionListener : this.creationListeners) {
            try {
                createdJingleSessionListener.sessionCreated(jingleSession);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    void triggerSessionRequested(Jingle jingle) {
        JingleSessionRequestListener[] jingleSessionRequestListenerArr;
        synchronized (this.jingleSessionRequestListeners) {
            jingleSessionRequestListenerArr = new JingleSessionRequestListener[this.jingleSessionRequestListeners.size()];
            this.jingleSessionRequestListeners.toArray(jingleSessionRequestListenerArr);
        }
        JingleSessionRequest jingleSessionRequest = new JingleSessionRequest(this, jingle);
        for (JingleSessionRequestListener jingleSessionRequestListener : jingleSessionRequestListenerArr) {
            jingleSessionRequestListener.sessionRequested(jingleSessionRequest);
        }
    }
}
