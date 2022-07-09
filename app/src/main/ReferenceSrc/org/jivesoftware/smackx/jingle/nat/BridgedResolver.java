package org.jivesoftware.smackx.jingle.nat;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.Random;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/BridgedResolver.class */
public class BridgedResolver extends TransportResolver {
    Connection connection;
    Random random = new Random();
    long sid;

    public BridgedResolver(Connection connection) {
        this.connection = connection;
    }

    public static String getLocalHost() {
        String str;
        Enumeration<NetworkInterface> enumeration = null;
        try {
            enumeration = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException e) {
            e.printStackTrace();
        }
        loop0: while (true) {
            if (enumeration.hasMoreElements()) {
                Enumeration<InetAddress> inetAddresses = enumeration.nextElement().getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    InetAddress nextElement = inetAddresses.nextElement();
                    if (!nextElement.isLoopbackAddress() && !nextElement.isLinkLocalAddress() && !nextElement.isSiteLocalAddress() && !(nextElement instanceof Inet6Address)) {
                        str = nextElement.getHostAddress();
                        break loop0;
                    }
                }
            } else {
                try {
                    str = InetAddress.getLocalHost().getHostAddress();
                    break;
                } catch (Exception e2) {
                    e2.printStackTrace();
                    str = "127.0.0.1";
                }
            }
        }
        return str;
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void cancel() throws XMPPException {
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void initialize() throws XMPPException {
        clearCandidates();
        if (!RTPBridge.serviceAvailable(this.connection)) {
            setInitialized();
            throw new XMPPException("No RTP Bridge service available");
        } else {
            setInitialized();
        }
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void resolve(JingleSession jingleSession) throws XMPPException {
        synchronized (this) {
            setResolveInit();
            clearCandidates();
            this.sid = Math.abs(this.random.nextLong());
            RTPBridge rTPBridge = RTPBridge.getRTPBridge(this.connection, String.valueOf(this.sid));
            String localHost = getLocalHost();
            TransportCandidate.Fixed fixed = new TransportCandidate.Fixed(rTPBridge.getIp(), rTPBridge.getPortA());
            fixed.setLocalIp(localHost);
            TransportCandidate.Fixed fixed2 = new TransportCandidate.Fixed(rTPBridge.getIp(), rTPBridge.getPortB());
            fixed2.setLocalIp(localHost);
            fixed.setSymmetric(fixed2);
            fixed2.setSymmetric(fixed);
            fixed.setPassword(rTPBridge.getPass());
            fixed2.setPassword(rTPBridge.getPass());
            fixed.setSessionId(rTPBridge.getSid());
            fixed2.setSessionId(rTPBridge.getSid());
            fixed.setConnection(this.connection);
            fixed2.setConnection(this.connection);
            addCandidate(fixed);
            setResolveEnd();
        }
    }
}
