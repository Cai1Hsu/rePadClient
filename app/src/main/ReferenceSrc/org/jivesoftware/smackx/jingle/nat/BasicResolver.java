package org.jivesoftware.smackx.jingle.nat;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.nat.TransportCandidate;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/BasicResolver.class */
public class BasicResolver extends TransportResolver {
    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void cancel() throws XMPPException {
    }

    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    public void initialize() throws XMPPException {
        setInitialized();
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00a8, code lost:
        r5 = java.net.NetworkInterface.getNetworkInterfaces();
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0138, code lost:
        if (java.net.InetAddress.getLocalHost().getHostAddress() == null) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x013b, code lost:
        r5 = java.net.InetAddress.getLocalHost().getHostAddress();
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0143, code lost:
        r0 = new org.jivesoftware.smackx.jingle.nat.TransportCandidate.Fixed(r5, getFreePort());
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0151, code lost:
        if (java.net.InetAddress.getLocalHost().getHostAddress() == null) goto L77;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0154, code lost:
        r5 = java.net.InetAddress.getLocalHost().getHostAddress();
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x015c, code lost:
        r0.setLocalIp(r5);
        addCandidate(r0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x016c, code lost:
        r5 = java.net.InetAddress.getLocalHost().getHostName();
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x0176, code lost:
        r5 = java.net.InetAddress.getLocalHost().getHostName();
     */
    @Override // org.jivesoftware.smackx.jingle.nat.TransportResolver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void resolve(JingleSession jingleSession) throws XMPPException {
        Enumeration<NetworkInterface> enumeration;
        synchronized (this) {
            setResolveInit();
            clearCandidates();
            enumeration = null;
            try {
                enumeration = NetworkInterface.getNetworkInterfaces();
            } catch (SocketException e) {
                e.printStackTrace();
            }
            while (true) {
                if (enumeration.hasMoreElements()) {
                    Enumeration<InetAddress> inetAddresses = enumeration.nextElement().getInetAddresses();
                    while (inetAddresses.hasMoreElements()) {
                        InetAddress nextElement = inetAddresses.nextElement();
                        if (!nextElement.isLoopbackAddress() && !nextElement.isLinkLocalAddress() && !nextElement.isSiteLocalAddress()) {
                            TransportCandidate.Fixed fixed = new TransportCandidate.Fixed(nextElement.getHostAddress() != null ? nextElement.getHostAddress() : nextElement.getHostName(), getFreePort());
                            fixed.setLocalIp(nextElement.getHostAddress() != null ? nextElement.getHostAddress() : nextElement.getHostName());
                            addCandidate(fixed);
                            setResolveEnd();
                        }
                    }
                } else {
                    try {
                        break;
                    } catch (SocketException e2) {
                        e2.printStackTrace();
                    }
                }
            }
        }
        setResolveEnd();
        while (true) {
            if (enumeration.hasMoreElements()) {
                Enumeration<InetAddress> inetAddresses2 = enumeration.nextElement().getInetAddresses();
                while (inetAddresses2.hasMoreElements()) {
                    InetAddress nextElement2 = inetAddresses2.nextElement();
                    if (!nextElement2.isLoopbackAddress() && !nextElement2.isLinkLocalAddress()) {
                        TransportCandidate.Fixed fixed2 = new TransportCandidate.Fixed(nextElement2.getHostAddress() != null ? nextElement2.getHostAddress() : nextElement2.getHostName(), getFreePort());
                        fixed2.setLocalIp(nextElement2.getHostAddress() != null ? nextElement2.getHostAddress() : nextElement2.getHostName());
                        addCandidate(fixed2);
                        setResolveEnd();
                    }
                }
            } else {
                try {
                    break;
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
            }
        }
    }
}
