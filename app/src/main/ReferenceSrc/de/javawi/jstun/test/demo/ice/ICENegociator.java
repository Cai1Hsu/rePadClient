package de.javawi.jstun.test.demo.ice;

import de.javawi.jstun.attribute.MessageAttributeException;
import de.javawi.jstun.header.MessageHeaderParsingException;
import de.javawi.jstun.test.DiscoveryTest;
import de.javawi.jstun.test.demo.ice.Candidate;
import de.javawi.jstun.util.Address;
import de.javawi.jstun.util.UtilityException;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/test/demo/ice/ICENegociator.class */
public class ICENegociator {
    private static final int LOCAL_PREFERENCE = 0;
    private static final int PEER_REFLEXIVE_PREFERENCE = 84;
    private static final int RELAYED_PREFERENCE = 126;
    private static final int SERVER_REFLEXIVE_PREFERENCE = 42;
    private static Log logger = LogFactory.getLog(ICENegociator.class);
    HashSet<Candidate> candidates;
    private short componentId;
    private int stunPort;
    private String stunServer;

    public ICENegociator(String str, int i, short s) {
        this.stunServer = "iphone-stun.freenet.de";
        this.stunPort = 3478;
        this.stunServer = str;
        this.stunPort = i;
        this.componentId = s;
        this.candidates = new HashSet<>();
    }

    public ICENegociator(short s) {
        this.stunServer = "iphone-stun.freenet.de";
        this.stunPort = 3478;
        this.componentId = s;
        this.candidates = new HashSet<>();
    }

    public static void main(String[] strArr) {
        ICENegociator iCENegociator = new ICENegociator("iphone-stun.freenet.de", 3478, (short) 1);
        iCENegociator.gatherCandidateAddresses();
        iCENegociator.prioritizeCandidates();
        iCENegociator.getSortedCandidates();
    }

    public void testInterface(NetworkInterface networkInterface) {
        Enumeration<InetAddress> inetAddresses = networkInterface.getInetAddresses();
        while (inetAddresses.hasMoreElements()) {
            InetAddress nextElement = inetAddresses.nextElement();
            if (!nextElement.isLoopbackAddress() && !nextElement.isLinkLocalAddress()) {
                try {
                    Candidate candidate = new Candidate(new Address(nextElement.getAddress()), this.componentId);
                    this.candidates.add(candidate);
                    if (new DiscoveryTest(nextElement, this.stunServer, this.stunPort).test().getPublicIP() != null) {
                        Candidate candidate2 = new Candidate(new Address(nextElement.getAddress()), Candidate.CandidateType.ServerReflexive, this.componentId, candidate);
                        candidate2.setComponentId(this.componentId);
                        this.candidates.add(candidate2);
                    }
                } catch (MessageAttributeException e) {
                    logger.debug("MessageAttributeException while gathering candidate addresses.");
                    e.printStackTrace();
                } catch (MessageHeaderParsingException e2) {
                    logger.debug("MessageHeaderParsingException while gathering candidate addresses.");
                    e2.printStackTrace();
                } catch (UtilityException e3) {
                    logger.debug("UtilityException while gathering candidate addresses.");
                    e3.printStackTrace();
                } catch (SocketException e4) {
                    logger.debug("SocketException while gathering candidate addresses.");
                    e4.printStackTrace();
                } catch (UnknownHostException e5) {
                    logger.debug("MessageHeaderParsingException while gathering candidate addresses.");
                    e5.printStackTrace();
                } catch (IOException e6) {
                    logger.debug("IOException while gathering candidate addresses.");
                    e6.printStackTrace();
                }
            }
        }
    }

    public void gatherCandidateAddresses() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(10, 10, 50000L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        logger.debug("\nStart gathering interfaces\n");
        try {
            this.candidates = new HashSet<>();
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            while (networkInterfaces.hasMoreElements()) {
                final NetworkInterface nextElement = networkInterfaces.nextElement();
                threadPoolExecutor.execute(new Runnable() { // from class: de.javawi.jstun.test.demo.ice.ICENegociator.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ICENegociator.this.testInterface(nextElement);
                    }
                });
            }
        } catch (SocketException e) {
            logger.debug("SocketException while enumatering over the network cards.");
            e.printStackTrace();
        }
        while (threadPoolExecutor.getActiveCount() > 0) {
            try {
                Thread.sleep(50L);
            } catch (InterruptedException e2) {
                logger.error("", e2);
            }
        }
        threadPoolExecutor.shutdown();
        logger.debug("\nDone gathering interfaces\n");
    }

    public List<Candidate> getSortedCandidates() {
        Vector vector = new Vector(this.candidates);
        Collections.sort(vector);
        return vector;
    }

    public void prioritizeCandidates() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        Iterator<Candidate> it = this.candidates.iterator();
        while (it.hasNext()) {
            Candidate.CandidateType candidateType = it.next().getCandidateType();
            if (candidateType == Candidate.CandidateType.Local) {
                i5++;
            } else if (candidateType == Candidate.CandidateType.ServerReflexive) {
                i6++;
            } else if (candidateType == Candidate.CandidateType.PeerReflexive) {
                i7++;
            } else if (candidateType == Candidate.CandidateType.Relayed) {
                i8++;
            }
        }
        Iterator<Candidate> it2 = this.candidates.iterator();
        while (it2.hasNext()) {
            int i9 = 0;
            int i10 = 0;
            Candidate next = it2.next();
            Candidate.CandidateType candidateType2 = next.getCandidateType();
            if (candidateType2 == Candidate.CandidateType.Local) {
                i9 = 0;
                i10 = i5;
                i = i5 - 1;
                i4 = i6;
                i3 = i8;
                i2 = i7;
            } else if (candidateType2 == Candidate.CandidateType.ServerReflexive) {
                i9 = 42;
                i10 = i6;
                i4 = i6 - 1;
                i = i5;
                i2 = i7;
                i3 = i8;
            } else if (candidateType2 == Candidate.CandidateType.PeerReflexive) {
                i9 = PEER_REFLEXIVE_PREFERENCE;
                i10 = i7;
                i2 = i7 - 1;
                i = i5;
                i3 = i8;
                i4 = i6;
            } else {
                i = i5;
                i2 = i7;
                i3 = i8;
                i4 = i6;
                if (candidateType2 == Candidate.CandidateType.Relayed) {
                    i9 = 126;
                    i10 = i8;
                    i3 = i8 - 1;
                    i = i5;
                    i2 = i7;
                    i4 = i6;
                }
            }
            next.setPriority((i9 * 26) + (i10 * 10) + next.getComponentId());
            i5 = i;
            i7 = i2;
            i8 = i3;
            i6 = i4;
        }
    }
}
