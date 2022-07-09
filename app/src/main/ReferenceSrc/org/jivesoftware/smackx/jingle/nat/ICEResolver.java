package org.jivesoftware.smackx.jingle.nat;

import com.edutech.publicedu.log.LogHelp;
import de.javawi.jstun.test.demo.ice.Candidate;
import de.javawi.jstun.test.demo.ice.ICENegociator;
import de.javawi.jstun.util.UtilityException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.nat.ICECandidate;
import org.jivesoftware.smackx.jingle.nat.TransportResolver;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/ICEResolver.class */
public class ICEResolver extends TransportResolver {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(ICEResolver.class);
    static Map<String, ICENegociator> negociatorsMap = new HashMap();
    Connection connection;
    int port;
    Random random = new Random();
    String server;
    long sid;

    public ICEResolver(Connection connection, String str, int i) {
        this.connection = connection;
        this.server = str;
        this.port = i;
        setType(TransportResolver.Type.ice);
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void cancel() throws XMPPException {
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void initialize() throws XMPPException {
        if (!isResolving() && !isResolved()) {
            LOGGER.debug("Initialized");
            if (negociatorsMap.get(this.server) == null) {
                ICENegociator iCENegociator = new ICENegociator(this.server, this.port, (short) 1);
                negociatorsMap.put(this.server, iCENegociator);
                iCENegociator.gatherCandidateAddresses();
                iCENegociator.prioritizeCandidates();
            }
        }
        setInitialized();
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void resolve(JingleSession jingleSession) throws XMPPException {
        short s;
        synchronized (this) {
            setResolveInit();
            for (TransportCandidate transportCandidate : getCandidatesList()) {
                if (transportCandidate instanceof ICECandidate) {
                    ((ICECandidate) transportCandidate).removeCandidateEcho();
                }
            }
            clear();
            for (Candidate candidate : negociatorsMap.get(this.server).getSortedCandidates()) {
                try {
                    try {
                        Candidate.CandidateType candidateType = candidate.getCandidateType();
                        ICECandidate.Type type = ICECandidate.Type.local;
                        ICECandidate.Type type2 = candidateType.equals(Candidate.CandidateType.ServerReflexive) ? ICECandidate.Type.srflx : candidateType.equals(Candidate.CandidateType.PeerReflexive) ? ICECandidate.Type.prflx : candidateType.equals(Candidate.CandidateType.Relayed) ? ICECandidate.Type.relay : ICECandidate.Type.host;
                        try {
                            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
                            short s2 = 0;
                            NetworkInterface byInetAddress = NetworkInterface.getByInetAddress(candidate.getAddress().getInetAddress());
                            while (true) {
                                s = 0;
                                if (!networkInterfaces.hasMoreElements()) {
                                    break;
                                } else if (networkInterfaces.nextElement().equals(byInetAddress)) {
                                    s = s2;
                                    break;
                                } else {
                                    s2 = (short) (s2 + 1);
                                }
                            }
                        } catch (SocketException e) {
                            e.printStackTrace();
                            s = 0;
                        }
                        ICECandidate iCECandidate = new ICECandidate(candidate.getAddress().getInetAddress().getHostAddress(), 1, s, String.valueOf(Math.abs(this.random.nextLong())), candidate.getPort(), LogHelp.TYPE_GUIDANCE, candidate.getPriority(), type2);
                        iCECandidate.setLocalIp(candidate.getBase().getAddress().getInetAddress().getHostAddress());
                        iCECandidate.setPort(getFreePort());
                        try {
                            iCECandidate.addCandidateEcho(jingleSession);
                        } catch (SocketException e2) {
                            e2.printStackTrace();
                        }
                        addCandidate(iCECandidate);
                        LOGGER.debug("Candidate addr: " + candidate.getAddress().getInetAddress() + "|" + candidate.getBase().getAddress().getInetAddress() + " Priority:" + candidate.getPriority());
                    } catch (UnknownHostException e3) {
                        e3.printStackTrace();
                    }
                } catch (UtilityException e4) {
                    e4.printStackTrace();
                }
            }
            if (RTPBridge.serviceAvailable(this.connection)) {
                String localHost = BridgedResolver.getLocalHost();
                this.sid = Math.abs(this.random.nextLong());
                RTPBridge rTPBridge = RTPBridge.getRTPBridge(this.connection, String.valueOf(this.sid));
                ICECandidate iCECandidate2 = new ICECandidate(rTPBridge.getIp(), 1, 0, String.valueOf(Math.abs(this.random.nextLong())), rTPBridge.getPortA(), LogHelp.TYPE_GUIDANCE, 0, ICECandidate.Type.relay);
                iCECandidate2.setLocalIp(localHost);
                ICECandidate iCECandidate3 = new ICECandidate(rTPBridge.getIp(), 1, 0, String.valueOf(Math.abs(this.random.nextLong())), rTPBridge.getPortB(), LogHelp.TYPE_GUIDANCE, 0, ICECandidate.Type.relay);
                iCECandidate3.setLocalIp(localHost);
                iCECandidate2.setSymmetric(iCECandidate3);
                iCECandidate3.setSymmetric(iCECandidate2);
                iCECandidate2.setPassword(rTPBridge.getPass());
                iCECandidate3.setPassword(rTPBridge.getPass());
                iCECandidate2.setSessionId(rTPBridge.getSid());
                iCECandidate3.setSessionId(rTPBridge.getSid());
                iCECandidate2.setConnection(this.connection);
                iCECandidate3.setConnection(this.connection);
                addCandidate(iCECandidate2);
                String publicIP = RTPBridge.getPublicIP(this.connection);
                if (publicIP != null && !publicIP.equals("")) {
                    Enumeration<NetworkInterface> enumeration = null;
                    try {
                        enumeration = NetworkInterface.getNetworkInterfaces();
                    } catch (SocketException e5) {
                        e5.printStackTrace();
                    }
                    boolean z = false;
                    while (enumeration.hasMoreElements()) {
                        Enumeration<InetAddress> inetAddresses = enumeration.nextElement().getInetAddresses();
                        while (true) {
                            if (!inetAddresses.hasMoreElements()) {
                                break;
                            } else if (inetAddresses.nextElement().getHostAddress().indexOf(publicIP) > -1) {
                                z = true;
                                break;
                            }
                        }
                    }
                    if (!z) {
                        try {
                            ICECandidate iCECandidate4 = new ICECandidate(publicIP, 1, 0, String.valueOf(Math.abs(this.random.nextLong())), getFreePort(), LogHelp.TYPE_GUIDANCE, 0, ICECandidate.Type.srflx);
                            iCECandidate4.setLocalIp(InetAddress.getLocalHost().getHostAddress());
                            try {
                                iCECandidate4.addCandidateEcho(jingleSession);
                            } catch (SocketException e6) {
                                e6.printStackTrace();
                            }
                            addCandidate(iCECandidate4);
                        } catch (UnknownHostException e7) {
                            e7.printStackTrace();
                        }
                    }
                }
            }
            setResolveEnd();
        }
    }
}
