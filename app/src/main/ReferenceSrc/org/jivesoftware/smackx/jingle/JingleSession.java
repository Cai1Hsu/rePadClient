package org.jivesoftware.smackx.jingle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smackx.jingle.listeners.JingleListener;
import org.jivesoftware.smackx.jingle.listeners.JingleMediaListener;
import org.jivesoftware.smackx.jingle.listeners.JingleSessionListener;
import org.jivesoftware.smackx.jingle.listeners.JingleTransportListener;
import org.jivesoftware.smackx.jingle.media.JingleMediaManager;
import org.jivesoftware.smackx.jingle.media.JingleMediaSession;
import org.jivesoftware.smackx.jingle.media.MediaNegotiator;
import org.jivesoftware.smackx.jingle.media.MediaReceivedListener;
import org.jivesoftware.smackx.jingle.media.PayloadType;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.jivesoftware.smackx.jingle.nat.TransportNegotiator;
import org.jivesoftware.smackx.jingle.nat.TransportResolver;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleError;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/JingleSession.class */
public class JingleSession extends JingleNegotiator implements MediaReceivedListener {
    private Connection connection;
    ConnectionListener connectionListener;
    private List<ContentNegotiator> contentNegotiators;
    private String initiator;
    protected List<JingleMediaManager> jingleMediaManagers;
    private Map<String, JingleMediaSession> mediaSessionMap;
    PacketFilter packetFilter;
    PacketListener packetListener;
    private String responder;
    private String sessionInitPacketID;
    private JingleSessionState sessionState;
    private String sid;
    private static final SmackLogger LOGGER = SmackLogger.getLogger(JingleSession.class);
    private static final HashMap<Connection, JingleSession> sessions = new HashMap<>();
    private static final Random randomGenerator = new Random();

    public JingleSession(Connection connection, String str, String str2, String str3, List<JingleMediaManager> list) {
        this.jingleMediaManagers = null;
        this.initiator = str;
        this.responder = str2;
        this.sid = str3;
        this.jingleMediaManagers = list;
        setSession(this);
        this.connection = connection;
        setSessionState(JingleSessionStateUnknown.getInstance());
        this.contentNegotiators = new ArrayList();
        this.mediaSessionMap = new HashMap();
        registerInstance();
        installConnectionListeners(connection);
    }

    public JingleSession(Connection connection, JingleSessionRequest jingleSessionRequest, String str, String str2, List<JingleMediaManager> list) {
        this(connection, str, str2, generateSessionId(), list);
    }

    public static IQ createError(String str, String str2, String str3, int i, XMPPError xMPPError) {
        IQ createIQ = createIQ(str, str2, str3, IQ.Type.ERROR);
        createIQ.setError(xMPPError);
        LOGGER.debug("Created Error Packet:" + createIQ.toXML());
        return createIQ;
    }

    public static IQ createIQ(String str, String str2, String str3, IQ.Type type) {
        IQ iq = new IQ() { // from class: org.jivesoftware.smackx.jingle.JingleSession.6
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return null;
            }
        };
        iq.setPacketID(str);
        iq.setTo(str2);
        iq.setFrom(str3);
        iq.setType(type);
        return iq;
    }

    protected static String generateSessionId() {
        return String.valueOf(Math.abs(randomGenerator.nextLong()));
    }

    public static JingleSession getInstanceFor(Connection connection) {
        if (connection == null) {
            throw new IllegalArgumentException("Connection cannot be null");
        }
        JingleSession jingleSession = null;
        synchronized (sessions) {
            if (sessions.containsKey(connection)) {
                jingleSession = sessions.get(connection);
            }
        }
        return jingleSession;
    }

    private void installConnectionListeners(final Connection connection) {
        if (connection != null) {
            this.connectionListener = new ConnectionListener() { // from class: org.jivesoftware.smackx.jingle.JingleSession.1
                @Override // org.jivesoftware.smack.ConnectionListener
                public void connectionClosed() {
                    JingleSession.this.unregisterInstanceFor(connection);
                }

                @Override // org.jivesoftware.smack.ConnectionListener
                public void connectionClosedOnError(Exception exc) {
                    JingleSession.this.unregisterInstanceFor(connection);
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
            };
            connection.addConnectionListener(this.connectionListener);
        }
    }

    private void registerInstance() {
        synchronized (sessions) {
            sessions.put(getConnection(), this);
        }
    }

    private void removeConnectionListener() {
        if (this.connectionListener != null) {
            getConnection().removeConnectionListener(this.connectionListener);
            LOGGER.debug("JINGLE SESSION: REMOVE CONNECTION LISTENER");
        }
    }

    private void startNegotiators() {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            contentNegotiator.getTransportNegotiator().start();
        }
    }

    public void unregisterInstanceFor(Connection connection) {
        synchronized (sessions) {
            sessions.remove(connection);
        }
    }

    public void addContentNegotiator(ContentNegotiator contentNegotiator) {
        this.contentNegotiators.add(contentNegotiator);
    }

    public void addJingleMediaSession(String str, JingleMediaSession jingleMediaSession) {
        this.mediaSessionMap.put(str, jingleMediaSession);
    }

    public void addMediaListener(JingleMediaListener jingleMediaListener) {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            if (contentNegotiator.getMediaNegotiator() != null) {
                contentNegotiator.getMediaNegotiator().addListener(jingleMediaListener);
            }
        }
    }

    public void addTransportListener(JingleTransportListener jingleTransportListener) {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            if (contentNegotiator.getTransportNegotiator() != null) {
                contentNegotiator.getTransportNegotiator().addListener(jingleTransportListener);
            }
        }
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public void close() {
        if (isClosed()) {
            return;
        }
        setSessionState(JingleSessionStateEnded.getInstance());
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            contentNegotiator.stopJingleMediaSession();
            for (TransportCandidate transportCandidate : contentNegotiator.getTransportNegotiator().getOfferedCandidates()) {
                transportCandidate.removeCandidateEcho();
            }
            contentNegotiator.close();
        }
        removePacketListener();
        removeConnectionListener();
        getConnection().removeConnectionListener(this.connectionListener);
        LOGGER.debug("Negotiation Closed: " + getConnection().getUser() + " " + this.sid);
        super.close();
    }

    public IQ createAck(IQ iq) {
        IQ iq2 = null;
        if (iq != null) {
            iq2 = null;
            if (iq.getType().equals(IQ.Type.SET)) {
                iq2 = createIQ(iq.getPacketID(), iq.getFrom(), iq.getTo(), IQ.Type.RESULT);
            }
        }
        return iq2;
    }

    public IQ createJingleError(IQ iq, JingleError jingleError) {
        IQ iq2 = null;
        if (jingleError != null) {
            iq2 = createIQ(getSid(), iq.getFrom(), iq.getTo(), IQ.Type.ERROR);
            ArrayList arrayList = new ArrayList();
            arrayList.add(jingleError);
            XMPPError xMPPError = new XMPPError(0, XMPPError.Type.CANCEL, jingleError.toString(), "", arrayList);
            iq2.setPacketID(iq.getPacketID());
            iq2.setError(xMPPError);
            LOGGER.error("Error sent: " + iq2.toXML());
        }
        return iq2;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public List<IQ> dispatchIncomingPacket(IQ iq, String str) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        IQ iq2 = null;
        if (iq != null) {
            if (iq.getType().equals(IQ.Type.ERROR)) {
                iq2 = null;
            } else if (iq.getType().equals(IQ.Type.RESULT)) {
                iq2 = null;
                if (isExpectedId(iq.getPacketID())) {
                    if (iq.getPacketID().equals(this.sessionInitPacketID)) {
                        startNegotiators();
                    }
                    removeExpectedId(iq.getPacketID());
                    iq2 = null;
                }
            } else {
                iq2 = null;
                if (iq instanceof Jingle) {
                    Jingle jingle = (Jingle) iq;
                    iq2 = getSessionState().processJingle(this, jingle, jingle.getAction());
                }
            }
        }
        if (iq2 != null) {
            addExpectedId(iq2.getPacketID());
            arrayList.add(iq2);
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    protected void doStart() {
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null) {
                z = false;
            } else if (getClass() != obj.getClass()) {
                z = false;
            } else {
                JingleSession jingleSession = (JingleSession) obj;
                if (this.initiator == null) {
                    if (jingleSession.initiator != null) {
                        z = false;
                    }
                } else if (!this.initiator.equals(jingleSession.initiator)) {
                }
                if (this.responder == null) {
                    if (jingleSession.responder != null) {
                        z = false;
                    }
                    if (this.sid != null) {
                        if (jingleSession.sid != null) {
                            z = false;
                        }
                    } else if (!this.sid.equals(jingleSession.sid)) {
                        z = false;
                    }
                } else {
                    if (!this.responder.equals(jingleSession.responder)) {
                        z = false;
                    }
                    if (this.sid != null) {
                    }
                }
            }
        }
        return z;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public Connection getConnection() {
        return this.connection;
    }

    public String getInitiator() {
        return this.initiator;
    }

    public List<JingleMediaManager> getMediaManagers() {
        return this.jingleMediaManagers;
    }

    public JingleMediaSession getMediaSession(String str) {
        return this.mediaSessionMap.get(str);
    }

    public String getResponder() {
        return this.responder;
    }

    public JingleSessionState getSessionState() {
        return this.sessionState;
    }

    public String getSid() {
        return this.sid;
    }

    public int hashCode() {
        return Jingle.getSessionHash(getSid(), getInitiator());
    }

    public boolean isClosed() {
        return getSessionState().equals(JingleSessionStateEnded.getInstance());
    }

    public boolean isFullyEstablished() {
        boolean z = true;
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            if (!contentNegotiator.isFullyEstablished()) {
                z = false;
            }
        }
        return z;
    }

    @Override // org.jivesoftware.smackx.jingle.media.MediaReceivedListener
    public void mediaReceived(String str) {
        triggerMediaReceived(str);
    }

    public void receivePacketAndRespond(IQ iq) throws XMPPException {
        synchronized (this) {
            ArrayList<IQ> arrayList = new ArrayList();
            LOGGER.debug("Packet: " + iq.toXML());
            try {
                arrayList.addAll(dispatchIncomingPacket(iq, null));
                if (iq != null) {
                    String packetID = iq.getPacketID();
                    for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
                        if (!contentNegotiator.isStarted()) {
                            contentNegotiator.start();
                        }
                        arrayList.addAll(contentNegotiator.dispatchIncomingPacket(iq, packetID));
                    }
                }
            } catch (JingleException e) {
                JingleError error = e.getError();
                if (error != null) {
                    arrayList.add(createJingleError(iq, error));
                }
                triggerSessionClosedOnError(e);
            }
            for (IQ iq2 : arrayList) {
                sendPacket(iq2);
            }
        }
    }

    public void removeMediaListener(JingleMediaListener jingleMediaListener) {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            if (contentNegotiator.getMediaNegotiator() != null) {
                contentNegotiator.getMediaNegotiator().removeListener(jingleMediaListener);
            }
        }
    }

    protected void removePacketListener() {
        if (this.packetListener != null) {
            getConnection().removePacketListener(this.packetListener);
            LOGGER.debug("JINGLE SESSION: REMOVE PACKET LISTENER");
        }
    }

    public void removeTransportListener(JingleTransportListener jingleTransportListener) {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            if (contentNegotiator.getTransportNegotiator() != null) {
                contentNegotiator.getTransportNegotiator().removeListener(jingleTransportListener);
            }
        }
    }

    public Jingle sendFormattedJingle(IQ iq, Jingle jingle) {
        if (jingle != null) {
            if (jingle.getInitiator() == null) {
                jingle.setInitiator(getInitiator());
            }
            if (jingle.getResponder() == null) {
                jingle.setResponder(getResponder());
            }
            if (jingle.getSid() == null) {
                jingle.setSid(getSid());
            }
            String user = getConnection().getUser();
            String initiator = getResponder().equals(user) ? getInitiator() : getResponder();
            if (jingle.getTo() == null) {
                if (iq != null) {
                    jingle.setTo(iq.getFrom());
                } else {
                    jingle.setTo(initiator);
                }
            }
            if (jingle.getFrom() == null) {
                if (iq != null) {
                    jingle.setFrom(iq.getTo());
                } else {
                    jingle.setFrom(user);
                }
            }
            if (getConnection() != null && getConnection().isConnected()) {
                getConnection().sendPacket(jingle);
            }
        }
        return jingle;
    }

    public Jingle sendFormattedJingle(Jingle jingle) {
        return sendFormattedJingle(null, jingle);
    }

    public void sendPacket(IQ iq) {
        if (iq instanceof Jingle) {
            sendFormattedJingle((Jingle) iq);
        } else {
            getConnection().sendPacket(iq);
        }
    }

    public void setInitiator(String str) {
        this.initiator = str;
    }

    public void setMediaManagers(List<JingleMediaManager> list) {
        this.jingleMediaManagers = list;
    }

    public void setResponder(String str) {
        this.responder = str;
    }

    public void setSessionState(JingleSessionState jingleSessionState) {
        LOGGER.debug("Session state change: " + this.sessionState + "->" + jingleSessionState);
        jingleSessionState.enter();
        this.sessionState = jingleSessionState;
    }

    protected void setSid(String str) {
        this.sid = str;
    }

    public void setupListeners() {
        JingleMediaListener jingleMediaListener = new JingleMediaListener() { // from class: org.jivesoftware.smackx.jingle.JingleSession.4
            @Override // org.jivesoftware.smackx.jingle.listeners.JingleMediaListener
            public void mediaClosed(PayloadType payloadType) {
            }

            @Override // org.jivesoftware.smackx.jingle.listeners.JingleMediaListener
            public void mediaEstablished(PayloadType payloadType) {
                if (JingleSession.this.isFullyEstablished()) {
                    Jingle jingle = new Jingle(JingleActionEnum.SESSION_ACCEPT);
                    for (ContentNegotiator contentNegotiator : JingleSession.this.contentNegotiators) {
                        if (contentNegotiator.getNegotiatorState() == JingleNegotiatorState.SUCCEEDED) {
                            jingle.addContent(contentNegotiator.getJingleContent());
                        }
                    }
                    JingleSession.this.addExpectedId(jingle.getPacketID());
                    JingleSession.this.sendPacket(jingle);
                }
            }
        };
        JingleTransportListener jingleTransportListener = new JingleTransportListener() { // from class: org.jivesoftware.smackx.jingle.JingleSession.5
            @Override // org.jivesoftware.smackx.jingle.listeners.JingleTransportListener
            public void transportClosed(TransportCandidate transportCandidate) {
            }

            @Override // org.jivesoftware.smackx.jingle.listeners.JingleTransportListener
            public void transportClosedOnError(XMPPException xMPPException) {
            }

            @Override // org.jivesoftware.smackx.jingle.listeners.JingleTransportListener
            public void transportEstablished(TransportCandidate transportCandidate, TransportCandidate transportCandidate2) {
                if (JingleSession.this.isFullyEstablished()) {
                    JingleSession.this.setSessionState(JingleSessionStateActive.getInstance());
                    for (ContentNegotiator contentNegotiator : JingleSession.this.contentNegotiators) {
                        if (contentNegotiator.getNegotiatorState() == JingleNegotiatorState.SUCCEEDED) {
                            contentNegotiator.triggerContentEstablished();
                        }
                    }
                    if (!JingleSession.this.getSessionState().equals(JingleSessionStatePending.getInstance())) {
                        return;
                    }
                    Jingle jingle = new Jingle(JingleActionEnum.SESSION_ACCEPT);
                    for (ContentNegotiator contentNegotiator2 : JingleSession.this.contentNegotiators) {
                        if (contentNegotiator2.getNegotiatorState() == JingleNegotiatorState.SUCCEEDED) {
                            jingle.addContent(contentNegotiator2.getJingleContent());
                        }
                    }
                    JingleSession.this.addExpectedId(jingle.getPacketID());
                    JingleSession.this.sendPacket(jingle);
                }
            }
        };
        addMediaListener(jingleMediaListener);
        addTransportListener(jingleTransportListener);
    }

    public void startIncoming() {
    }

    public void startOutgoing() throws IllegalStateException {
        updatePacketListener();
        setSessionState(JingleSessionStatePending.getInstance());
        Jingle jingle = new Jingle(JingleActionEnum.SESSION_INITIATE);
        for (JingleMediaManager jingleMediaManager : getMediaManagers()) {
            ContentNegotiator contentNegotiator = new ContentNegotiator(this, ContentNegotiator.INITIATOR, jingleMediaManager.getName());
            contentNegotiator.setMediaNegotiator(new MediaNegotiator(this, jingleMediaManager, jingleMediaManager.getPayloads(), contentNegotiator));
            TransportResolver transportResolver = null;
            try {
                transportResolver = jingleMediaManager.getTransportManager().getResolver(this);
            } catch (XMPPException e) {
                e.printStackTrace();
            }
            if (transportResolver.getType().equals(TransportResolver.Type.rawupd)) {
                contentNegotiator.setTransportNegotiator(new TransportNegotiator.RawUdp(this, transportResolver, contentNegotiator));
            }
            if (transportResolver.getType().equals(TransportResolver.Type.ice)) {
                contentNegotiator.setTransportNegotiator(new TransportNegotiator.Ice(this, transportResolver, contentNegotiator));
            }
            addContentNegotiator(contentNegotiator);
        }
        for (ContentNegotiator contentNegotiator2 : this.contentNegotiators) {
            jingle.addContent(contentNegotiator2.getJingleContent());
        }
        this.sessionInitPacketID = jingle.getPacketID();
        sendPacket(jingle);
        setupListeners();
    }

    public void terminate() throws XMPPException {
        terminate("Closed Locally");
    }

    public void terminate(String str) throws XMPPException {
        if (isClosed()) {
            return;
        }
        LOGGER.debug("Terminate " + str);
        Jingle jingle = new Jingle(JingleActionEnum.SESSION_TERMINATE);
        jingle.setType(IQ.Type.SET);
        sendPacket(jingle);
        triggerSessionClosed(str);
    }

    protected void triggerMediaReceived(String str) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleSessionListener) {
                ((JingleSessionListener) jingleListener).sessionMediaReceived(this, str);
            }
        }
    }

    protected void triggerSessionClosed(String str) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleSessionListener) {
                ((JingleSessionListener) jingleListener).sessionClosed(str, this);
            }
        }
        close();
    }

    protected void triggerSessionClosedOnError(XMPPException xMPPException) {
        for (ContentNegotiator contentNegotiator : this.contentNegotiators) {
            contentNegotiator.stopJingleMediaSession();
            for (TransportCandidate transportCandidate : contentNegotiator.getTransportNegotiator().getOfferedCandidates()) {
                transportCandidate.removeCandidateEcho();
            }
        }
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleSessionListener) {
                ((JingleSessionListener) jingleListener).sessionClosedOnError(xMPPException, this);
            }
        }
        close();
    }

    protected void updatePacketListener() {
        removePacketListener();
        LOGGER.debug("UpdatePacketListener");
        this.packetListener = new PacketListener() { // from class: org.jivesoftware.smackx.jingle.JingleSession.2
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                try {
                    JingleSession.this.receivePacketAndRespond((IQ) packet);
                } catch (XMPPException e) {
                    e.printStackTrace();
                }
            }
        };
        this.packetFilter = new PacketFilter() { // from class: org.jivesoftware.smackx.jingle.JingleSession.3
            @Override // org.jivesoftware.smack.filter.PacketFilter
            public boolean accept(Packet packet) {
                boolean z = false;
                if (packet instanceof IQ) {
                    IQ iq = (IQ) packet;
                    String user = JingleSession.this.getConnection().getUser();
                    if (!iq.getTo().equals(user)) {
                        z = false;
                    } else {
                        String initiator = JingleSession.this.getResponder().equals(user) ? JingleSession.this.getInitiator() : JingleSession.this.getResponder();
                        z = false;
                        if (iq.getFrom() != null) {
                            String from = iq.getFrom();
                            String str = initiator;
                            if (initiator == null) {
                                str = "";
                            }
                            z = false;
                            if (from.equals(str)) {
                                if (iq instanceof Jingle) {
                                    Jingle jingle = (Jingle) iq;
                                    String sid = jingle.getSid();
                                    if (sid == null || !sid.equals(JingleSession.this.getSid())) {
                                        JingleSession.LOGGER.debug("Ignored Jingle(SID) " + sid + "|" + JingleSession.this.getSid() + " :" + iq.toXML());
                                        z = false;
                                    } else {
                                        if (!jingle.getInitiator().equals(JingleSession.this.getInitiator())) {
                                            JingleSession.LOGGER.debug("Ignored Jingle(INI): " + iq.toXML());
                                            z = false;
                                        }
                                        z = true;
                                    }
                                } else if (iq.getType().equals(IQ.Type.SET)) {
                                    JingleSession.LOGGER.debug("Ignored Jingle(TYPE): " + iq.toXML());
                                    z = false;
                                } else {
                                    if (iq.getType().equals(IQ.Type.GET)) {
                                        JingleSession.LOGGER.debug("Ignored Jingle(TYPE): " + iq.toXML());
                                        z = false;
                                    }
                                    z = true;
                                }
                            }
                        }
                    }
                }
                return z;
            }
        };
        getConnection().addPacketListener(this.packetListener, this.packetFilter);
    }
}
