package org.jivesoftware.smackx.jingle.nat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.jingle.ContentNegotiator;
import org.jivesoftware.smackx.jingle.JingleActionEnum;
import org.jivesoftware.smackx.jingle.JingleException;
import org.jivesoftware.smackx.jingle.JingleNegotiator;
import org.jivesoftware.smackx.jingle.JingleNegotiatorState;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.listeners.JingleListener;
import org.jivesoftware.smackx.jingle.listeners.JingleTransportListener;
import org.jivesoftware.smackx.jingle.nat.ICECandidate;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;
import org.jivesoftware.smackx.jingle.nat.TransportResolverListener;
import org.jivesoftware.smackx.packet.Jingle;
import org.jivesoftware.smackx.packet.JingleContent;
import org.jivesoftware.smackx.packet.JingleTransport;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportNegotiator.class */
public abstract class TransportNegotiator extends JingleNegotiator {
    public static final int CANDIDATES_ACCEPT_PERIOD = 4000;
    private static final SmackLogger LOGGER = SmackLogger.getLogger(TransportNegotiator.class);
    private TransportCandidate acceptedLocalCandidate;
    private ContentNegotiator parentNegotiator;
    private final TransportResolver resolver;
    private TransportResolverListener.Resolver resolverListener;
    private final List<TransportCandidate> offeredCandidates = new ArrayList();
    private final List<TransportCandidate> remoteCandidates = new ArrayList();
    private final List<TransportCandidate> validRemoteCandidates = new ArrayList();
    private final List<TransportCandidate> acceptedRemoteCandidates = new ArrayList();
    private Thread resultThread = null;

    /* renamed from: org.jivesoftware.smackx.jingle.nat.TransportNegotiator$4 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportNegotiator$4.class */
    static /* synthetic */ class AnonymousClass4 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum = new int[JingleActionEnum.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x005d -> B:28:0x004c). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0061 -> B:24:0x0040). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0065 -> B:34:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0069 -> B:32:0x002a). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x006d -> B:30:0x001f). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0071 -> B:26:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_ACCEPT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_MODIFY.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.CONTENT_REMOVE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INFO.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_INITIATE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.SESSION_ACCEPT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[JingleActionEnum.TRANSPORT_INFO.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice.class */
    public static final class Ice extends TransportNegotiator {
        public Ice(JingleSession jingleSession, TransportResolver transportResolver, ContentNegotiator contentNegotiator) {
            super(jingleSession, transportResolver, contentNegotiator);
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public boolean acceptableTransportCandidate(TransportCandidate transportCandidate, List<TransportCandidate> list) {
            return transportCandidate instanceof ICECandidate;
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public TransportCandidate getBestRemoteCandidate() {
            ICECandidate iCECandidate = null;
            ArrayList<TransportCandidate> validRemoteCandidatesList = getValidRemoteCandidatesList();
            if (!validRemoteCandidatesList.isEmpty()) {
                int i = -1;
                iCECandidate = null;
                Iterator<TransportCandidate> it = validRemoteCandidatesList.iterator();
                while (it.hasNext()) {
                    TransportCandidate next = it.next();
                    if (next instanceof ICECandidate) {
                        ICECandidate iCECandidate2 = (ICECandidate) next;
                        if (iCECandidate2.getPreference() > i) {
                            iCECandidate = iCECandidate2;
                            i = iCECandidate2.getPreference();
                        }
                    }
                }
            }
            if (iCECandidate != null && iCECandidate.getType().equals("relay")) {
                TransportNegotiator.LOGGER.debug("Relay Type");
            }
            return iCECandidate;
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public JingleTransport getJingleTransport(TransportCandidate transportCandidate) {
            JingleTransport.Ice ice = new JingleTransport.Ice();
            ice.addCandidate(new JingleTransport.Ice.Candidate(transportCandidate));
            return ice;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp.class */
    public static final class RawUdp extends TransportNegotiator {
        public RawUdp(JingleSession jingleSession, TransportResolver transportResolver, ContentNegotiator contentNegotiator) {
            super(jingleSession, transportResolver, contentNegotiator);
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public boolean acceptableTransportCandidate(TransportCandidate transportCandidate, List<TransportCandidate> list) {
            return transportCandidate instanceof TransportCandidate.Fixed;
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public TransportCandidate getBestRemoteCandidate() {
            TransportCandidate transportCandidate;
            ArrayList<TransportCandidate> validRemoteCandidatesList = getValidRemoteCandidatesList();
            if (!validRemoteCandidatesList.isEmpty()) {
                TransportNegotiator.LOGGER.debug("RAW CAND");
                transportCandidate = validRemoteCandidatesList.get(0);
            } else {
                TransportNegotiator.LOGGER.debug("No Remote Candidate");
                transportCandidate = null;
            }
            return transportCandidate;
        }

        @Override // org.jivesoftware.smackx.jingle.nat.TransportNegotiator
        public JingleTransport getJingleTransport(TransportCandidate transportCandidate) {
            JingleTransport.RawUdp rawUdp = new JingleTransport.RawUdp();
            rawUdp.addCandidate(new JingleTransport.RawUdp.Candidate(transportCandidate));
            return rawUdp;
        }
    }

    public TransportNegotiator(JingleSession jingleSession, TransportResolver transportResolver, ContentNegotiator contentNegotiator) {
        super(jingleSession);
        this.resolver = transportResolver;
        this.parentNegotiator = contentNegotiator;
    }

    private void addOfferedCandidate(TransportCandidate transportCandidate) {
        if (transportCandidate != null) {
            synchronized (this.offeredCandidates) {
                this.offeredCandidates.add(transportCandidate);
            }
        }
    }

    private void addRemoteCandidate(TransportCandidate transportCandidate) {
        if (transportCandidate == null || !acceptableTransportCandidate(transportCandidate, this.offeredCandidates)) {
            return;
        }
        synchronized (this.remoteCandidates) {
            this.remoteCandidates.add(transportCandidate);
        }
        checkRemoteCandidate(transportCandidate);
    }

    private void addRemoteCandidates(List<TransportCandidate> list) {
        if (list == null || list.size() <= 0) {
            return;
        }
        for (TransportCandidate transportCandidate : list) {
            addRemoteCandidate(transportCandidate);
        }
    }

    public void addValidRemoteCandidate(TransportCandidate transportCandidate) {
        if (transportCandidate != null) {
            synchronized (this.validRemoteCandidates) {
                LOGGER.debug("Added valid candidate: " + transportCandidate.getIp() + ":" + transportCandidate.getPort());
                this.validRemoteCandidates.add(transportCandidate);
            }
        }
    }

    private void checkRemoteCandidate(final TransportCandidate transportCandidate) {
        transportCandidate.addListener(new TransportResolverListener.Checker() { // from class: org.jivesoftware.smackx.jingle.nat.TransportNegotiator.1
            @Override // org.jivesoftware.smackx.jingle.nat.TransportResolverListener.Checker
            public void candidateChecked(TransportCandidate transportCandidate2, boolean z) {
                if (!z || TransportNegotiator.this.getNegotiatorState() != JingleNegotiatorState.PENDING) {
                    return;
                }
                TransportNegotiator.this.addValidRemoteCandidate(transportCandidate);
            }

            @Override // org.jivesoftware.smackx.jingle.nat.TransportResolverListener.Checker
            public void candidateChecking(TransportCandidate transportCandidate2) {
            }
        });
        transportCandidate.check(this.resolver.getCandidatesList());
    }

    private void delayedCheckBestCandidate(final JingleSession jingleSession, final Jingle jingle) {
        if (this.resultThread != null || getRemoteCandidates().isEmpty()) {
            return;
        }
        this.resultThread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TransportNegotiator.2
            @Override // java.lang.Runnable
            public void run() {
                int ceil = (int) Math.ceil(7);
                int i = 0;
                while (true) {
                    if (i >= ceil - 1) {
                        break;
                    }
                    try {
                        Thread.sleep(1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    TransportCandidate bestRemoteCandidate = TransportNegotiator.this.getBestRemoteCandidate();
                    if (bestRemoteCandidate != null && TransportNegotiator.this.getNegotiatorState() == JingleNegotiatorState.PENDING) {
                        if (!TransportNegotiator.this.acceptedRemoteCandidates.contains(bestRemoteCandidate)) {
                            Jingle jingle2 = new Jingle(JingleActionEnum.CONTENT_ACCEPT);
                            JingleContent jingleContent = TransportNegotiator.this.parentNegotiator.getJingleContent();
                            jingleContent.addJingleTransport(TransportNegotiator.this.getJingleTransport(bestRemoteCandidate));
                            jingle2.addContent(jingleContent);
                            jingleSession.sendFormattedJingle(jingle, jingle2);
                            TransportNegotiator.this.acceptedRemoteCandidates.add(bestRemoteCandidate);
                        }
                        if (TransportNegotiator.this.isEstablished() && TransportNegotiator.this.getNegotiatorState() == JingleNegotiatorState.PENDING) {
                            TransportNegotiator.this.setNegotiatorState(JingleNegotiatorState.SUCCEEDED);
                            TransportNegotiator.this.triggerTransportEstablished(TransportNegotiator.this.getAcceptedLocalCandidate(), bestRemoteCandidate);
                            break;
                        }
                    }
                    i++;
                }
                if (TransportNegotiator.this.getBestRemoteCandidate() == null) {
                    boolean z = false;
                    for (TransportCandidate transportCandidate : TransportNegotiator.this.remoteCandidates) {
                        if (transportCandidate instanceof ICECandidate) {
                            ICECandidate iCECandidate = (ICECandidate) transportCandidate;
                            if (iCECandidate.getType().equals("relay")) {
                                TransportNegotiator.this.addValidRemoteCandidate(iCECandidate);
                                z = true;
                            }
                        }
                    }
                    if (!z) {
                        boolean z2 = false;
                        for (TransportCandidate transportCandidate2 : TransportNegotiator.this.offeredCandidates) {
                            if ((transportCandidate2 instanceof ICECandidate) && ((ICECandidate) transportCandidate2).getType().equals("relay")) {
                                z2 = true;
                            }
                        }
                        if (z2) {
                            boolean z3 = false;
                            for (TransportCandidate transportCandidate3 : TransportNegotiator.this.remoteCandidates) {
                                if (transportCandidate3 instanceof ICECandidate) {
                                    ICECandidate iCECandidate2 = (ICECandidate) transportCandidate3;
                                    if (iCECandidate2.getType().equals(ICECandidate.Type.srflx)) {
                                        TransportNegotiator.this.addValidRemoteCandidate(iCECandidate2);
                                        z3 = true;
                                    }
                                }
                            }
                            if (!z3) {
                                for (TransportCandidate transportCandidate4 : TransportNegotiator.this.remoteCandidates) {
                                    if (transportCandidate4 instanceof ICECandidate) {
                                        TransportNegotiator.this.addValidRemoteCandidate((ICECandidate) transportCandidate4);
                                    }
                                }
                            }
                        }
                    }
                }
                int i2 = 0;
                while (true) {
                    if (i2 >= 6) {
                        break;
                    }
                    try {
                        Thread.sleep(500L);
                    } catch (InterruptedException e2) {
                        e2.printStackTrace();
                    }
                    TransportCandidate bestRemoteCandidate2 = TransportNegotiator.this.getBestRemoteCandidate();
                    if (bestRemoteCandidate2 != null && TransportNegotiator.this.getNegotiatorState() == JingleNegotiatorState.PENDING) {
                        if (!TransportNegotiator.this.acceptedRemoteCandidates.contains(bestRemoteCandidate2)) {
                            Jingle jingle3 = new Jingle(JingleActionEnum.CONTENT_ACCEPT);
                            JingleContent jingleContent2 = TransportNegotiator.this.parentNegotiator.getJingleContent();
                            jingleContent2.addJingleTransport(TransportNegotiator.this.getJingleTransport(bestRemoteCandidate2));
                            jingle3.addContent(jingleContent2);
                            jingleSession.sendFormattedJingle(jingle, jingle3);
                            TransportNegotiator.this.acceptedRemoteCandidates.add(bestRemoteCandidate2);
                        }
                        if (TransportNegotiator.this.isEstablished()) {
                            TransportNegotiator.this.setNegotiatorState(JingleNegotiatorState.SUCCEEDED);
                            break;
                        }
                    }
                    i2++;
                }
                if (TransportNegotiator.this.getNegotiatorState() != JingleNegotiatorState.SUCCEEDED) {
                    try {
                        TransportNegotiator.this.session.terminate("Unable to negotiate session. This may be caused by firewall configuration problems.");
                    } catch (XMPPException e3) {
                        e3.printStackTrace();
                    }
                }
            }
        }, "Waiting for all the transport candidates checks...");
        this.resultThread.setName("Transport Resolver Result");
        this.resultThread.start();
    }

    private List<TransportCandidate> getRemoteCandidates() {
        return this.remoteCandidates;
    }

    public boolean isEstablished() {
        return (getBestRemoteCandidate() == null || getAcceptedLocalCandidate() == null) ? false : true;
    }

    private boolean isOfferStarted() {
        return this.resolver.isResolving() || this.resolver.isResolved();
    }

    private List<TransportCandidate> obtainCandidatesList(Jingle jingle) {
        ArrayList arrayList = new ArrayList();
        if (jingle != null) {
            for (JingleContent jingleContent : jingle.getContentsList()) {
                if (jingleContent.getName().equals(this.parentNegotiator.getName())) {
                    for (JingleTransport jingleTransport : jingleContent.getJingleTransportsList()) {
                        for (JingleTransport.JingleTransportCandidate jingleTransportCandidate : jingleTransport.getCandidatesList()) {
                            arrayList.add(jingleTransportCandidate.getMediaTransport());
                        }
                    }
                }
            }
        }
        return arrayList;
    }

    private IQ receiveContentAcceptAction(Jingle jingle) throws XMPPException {
        List<TransportCandidate> obtainCandidatesList = obtainCandidatesList(jingle);
        if (!obtainCandidatesList.isEmpty()) {
            Iterator<TransportCandidate> it = obtainCandidatesList.iterator();
            while (it.hasNext()) {
                LOGGER.debug("Remote acccepted candidate addr: " + it.next().getIp());
            }
            TransportCandidate transportCandidate = obtainCandidatesList.get(0);
            setAcceptedLocalCandidate(transportCandidate);
            if (!isEstablished()) {
                return null;
            }
            LOGGER.debug(transportCandidate.getIp() + " is set active");
            return null;
        }
        return null;
    }

    private Jingle receiveResult(IQ iq) throws XMPPException {
        sendTransportCandidatesOffer();
        setNegotiatorState(JingleNegotiatorState.PENDING);
        return null;
    }

    private IQ receiveSessionAcceptAction(Jingle jingle) {
        LOGGER.debug("Transport stabilished");
        return null;
    }

    private IQ receiveSessionInitiateAction(Jingle jingle) throws XMPPException {
        sendTransportCandidatesOffer();
        delayedCheckBestCandidate(this.session, jingle);
        setNegotiatorState(JingleNegotiatorState.PENDING);
        return null;
    }

    private IQ receiveTransportInfoAction(Jingle jingle) throws XMPPException {
        addRemoteCandidates(obtainCandidatesList(jingle));
        delayedCheckBestCandidate(this.session, jingle);
        return this.session.createAck(jingle);
    }

    public void sendTransportCandidateOffer(TransportCandidate transportCandidate) {
        synchronized (this) {
            if (!transportCandidate.isNull()) {
                addOfferedCandidate(transportCandidate);
                JingleContent jingleContent = this.parentNegotiator.getJingleContent();
                jingleContent.addJingleTransport(getJingleTransport(transportCandidate));
                Jingle jingle = new Jingle(JingleActionEnum.TRANSPORT_INFO);
                jingle.addContent(jingleContent);
                this.session.sendFormattedJingle(jingle);
            }
        }
    }

    private void sendTransportCandidatesOffer() throws XMPPException {
        List<TransportCandidate> candidatesList = this.resolver.getCandidatesList();
        candidatesList.removeAll(this.offeredCandidates);
        for (TransportCandidate transportCandidate : candidatesList) {
            sendTransportCandidateOffer(transportCandidate);
        }
        if (this.resolverListener == null) {
            this.resolverListener = new TransportResolverListener.Resolver() { // from class: org.jivesoftware.smackx.jingle.nat.TransportNegotiator.3
                @Override // org.jivesoftware.smackx.jingle.nat.TransportResolverListener.Resolver
                public void candidateAdded(TransportCandidate transportCandidate2) {
                    TransportNegotiator.this.sendTransportCandidateOffer(transportCandidate2);
                }

                @Override // org.jivesoftware.smackx.jingle.nat.TransportResolverListener.Resolver
                public void end() {
                }

                @Override // org.jivesoftware.smackx.jingle.nat.TransportResolverListener.Resolver
                public void init() {
                }
            };
            this.resolver.addListener(this.resolverListener);
        }
        if (this.resolver.isResolving() || this.resolver.isResolved()) {
            return;
        }
        LOGGER.debug("RESOLVER CALLED");
        this.resolver.resolve(this.session);
    }

    private void setAcceptedLocalCandidate(TransportCandidate transportCandidate) throws XMPPException {
        for (int i = 0; i < this.resolver.getCandidateCount(); i++) {
            if (this.resolver.getCandidate(i).getIp().equals(transportCandidate.getIp()) && this.resolver.getCandidate(i).getPort() == transportCandidate.getPort()) {
                this.acceptedLocalCandidate = this.resolver.getCandidate(i);
                return;
            }
        }
        LOGGER.debug("BEST: ip=" + transportCandidate.getIp() + " port=" + transportCandidate.getPort() + " has not been offered.");
    }

    private void triggerTransportClosed(TransportCandidate transportCandidate) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleTransportListener) {
                ((JingleTransportListener) jingleListener).transportClosed(transportCandidate);
            }
        }
    }

    public void triggerTransportEstablished(TransportCandidate transportCandidate, TransportCandidate transportCandidate2) {
        for (JingleListener jingleListener : getListenersList()) {
            if (jingleListener instanceof JingleTransportListener) {
                LOGGER.debug("triggerTransportEstablished " + transportCandidate.getLocalIp() + ":" + transportCandidate.getPort() + " <-> " + transportCandidate2.getIp() + ":" + transportCandidate2.getPort());
                ((JingleTransportListener) jingleListener).transportEstablished(transportCandidate, transportCandidate2);
            }
        }
    }

    public abstract boolean acceptableTransportCandidate(TransportCandidate transportCandidate, List<TransportCandidate> list);

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public void close() {
        super.close();
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    public final List<IQ> dispatchIncomingPacket(IQ iq, String str) throws XMPPException {
        ArrayList arrayList = new ArrayList();
        Jingle jingle = null;
        if (iq != null) {
            if (!iq.getType().equals(IQ.Type.ERROR)) {
                if (!iq.getType().equals(IQ.Type.RESULT)) {
                    jingle = null;
                    if (iq instanceof Jingle) {
                        Jingle jingle2 = (Jingle) iq;
                        jingle = null;
                        switch (AnonymousClass4.$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum[jingle2.getAction().ordinal()]) {
                            case 1:
                                jingle = receiveContentAcceptAction(jingle2);
                                break;
                            case 2:
                            case 3:
                            case 4:
                                break;
                            case 5:
                                jingle = receiveSessionInitiateAction(jingle2);
                                break;
                            case 6:
                                jingle = receiveSessionAcceptAction(jingle2);
                                break;
                            case 7:
                                jingle = receiveTransportInfoAction(jingle2);
                                break;
                            default:
                                jingle = null;
                                break;
                        }
                    }
                } else {
                    jingle = null;
                    if (isExpectedId(iq.getPacketID())) {
                        jingle = receiveResult(iq);
                        removeExpectedId(iq.getPacketID());
                    }
                }
            } else {
                setNegotiatorState(JingleNegotiatorState.FAILED);
                triggerTransportClosed(null);
                throw new JingleException(iq.getError().getMessage());
            }
        }
        if (jingle != null) {
            addExpectedId(jingle.getPacketID());
            arrayList.add(jingle);
        }
        return arrayList;
    }

    @Override // org.jivesoftware.smackx.jingle.JingleNegotiator
    protected void doStart() {
        try {
            sendTransportCandidatesOffer();
            setNegotiatorState(JingleNegotiatorState.PENDING);
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }

    public TransportCandidate getAcceptedLocalCandidate() {
        return this.acceptedLocalCandidate;
    }

    public final TransportCandidate getBestLocalCandidate() {
        return this.resolver.getPreferredCandidate();
    }

    public abstract TransportCandidate getBestRemoteCandidate();

    public JingleTransport getJingleTransport() {
        return getJingleTransport(getBestRemoteCandidate());
    }

    public abstract JingleTransport getJingleTransport(TransportCandidate transportCandidate);

    public List<TransportCandidate> getOfferedCandidates() {
        return this.offeredCandidates;
    }

    public final Iterator<TransportCandidate> getValidRemoteCandidates() {
        return Collections.unmodifiableList(getRemoteCandidates()).iterator();
    }

    final ArrayList<TransportCandidate> getValidRemoteCandidatesList() {
        ArrayList<TransportCandidate> arrayList;
        synchronized (this.validRemoteCandidates) {
            arrayList = new ArrayList<>(this.validRemoteCandidates);
        }
        return arrayList;
    }

    public final boolean isFullyEstablished() {
        return isEstablished() && (getNegotiatorState() == JingleNegotiatorState.SUCCEEDED || getNegotiatorState() == JingleNegotiatorState.FAILED);
    }
}
