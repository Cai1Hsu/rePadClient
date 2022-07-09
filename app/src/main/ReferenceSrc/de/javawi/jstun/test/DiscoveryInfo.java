package de.javawi.jstun.test;

import android.support.v4.os.EnvironmentCompat;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;

/* loaded from: classes.jar:de/javawi/jstun/test/DiscoveryInfo.class */
public class DiscoveryInfo {
    private String errorReason;
    private InetAddress publicIP;
    private InetAddress testIP;
    private boolean error = false;
    private int errorResponseCode = 0;
    private boolean openAccess = false;
    private boolean blockedUDP = false;
    private boolean fullCone = false;
    private boolean restrictedCone = false;
    private boolean portRestrictedCone = false;
    private boolean symmetric = false;
    private boolean symmetricUDPFirewall = false;

    public DiscoveryInfo(InetAddress inetAddress) {
        this.testIP = inetAddress;
    }

    public InetAddress getLocalIP() {
        return this.testIP;
    }

    public InetAddress getPublicIP() {
        return this.publicIP;
    }

    public boolean isBlockedUDP() {
        return this.error ? false : this.blockedUDP;
    }

    public boolean isError() {
        return this.error;
    }

    public boolean isFullCone() {
        return this.error ? false : this.fullCone;
    }

    public boolean isOpenAccess() {
        return this.error ? false : this.openAccess;
    }

    public boolean isPortRestrictedCone() {
        return this.error ? false : this.portRestrictedCone;
    }

    public boolean isRestrictedCone() {
        return this.error ? false : this.restrictedCone;
    }

    public boolean isSymmetric() {
        return this.error ? false : this.symmetric;
    }

    public boolean isSymmetricUDPFirewall() {
        return this.error ? false : this.symmetricUDPFirewall;
    }

    public void setBlockedUDP() {
        this.blockedUDP = true;
    }

    public void setError(int i, String str) {
        this.error = true;
        this.errorResponseCode = i;
        this.errorReason = str;
    }

    public void setFullCone() {
        this.fullCone = true;
    }

    public void setOpenAccess() {
        this.openAccess = true;
    }

    public void setPortRestrictedCone() {
        this.portRestrictedCone = true;
    }

    public void setPublicIP(InetAddress inetAddress) {
        this.publicIP = inetAddress;
    }

    public void setRestrictedCone() {
        this.restrictedCone = true;
    }

    public void setSymmetric() {
        this.symmetric = true;
    }

    public void setSymmetricUDPFirewall() {
        this.symmetricUDPFirewall = true;
    }

    public String toString() {
        String stringBuffer;
        StringBuffer stringBuffer2 = new StringBuffer();
        stringBuffer2.append("Network interface: ");
        try {
            stringBuffer2.append(NetworkInterface.getByInetAddress(this.testIP).getName());
        } catch (SocketException e) {
            stringBuffer2.append(EnvironmentCompat.MEDIA_UNKNOWN);
        }
        stringBuffer2.append("\n");
        stringBuffer2.append("Local IP address: ");
        stringBuffer2.append(this.testIP.getHostAddress());
        stringBuffer2.append("\n");
        if (this.error) {
            stringBuffer2.append(this.errorReason + " - Responsecode: " + this.errorResponseCode);
            stringBuffer = stringBuffer2.toString();
        } else {
            stringBuffer2.append("Result: ");
            if (this.openAccess) {
                stringBuffer2.append("Open access to the Internet.\n");
            }
            if (this.blockedUDP) {
                stringBuffer2.append("Firewall blocks UDP.\n");
            }
            if (this.fullCone) {
                stringBuffer2.append("Full Cone NAT handles connections.\n");
            }
            if (this.restrictedCone) {
                stringBuffer2.append("Restricted Cone NAT handles connections.\n");
            }
            if (this.portRestrictedCone) {
                stringBuffer2.append("Port restricted Cone NAT handles connections.\n");
            }
            if (this.symmetric) {
                stringBuffer2.append("Symmetric Cone NAT handles connections.\n");
            }
            if (this.symmetricUDPFirewall) {
                stringBuffer2.append("Symmetric UDP Firewall handles connections.\n");
            }
            if (!this.openAccess && !this.blockedUDP && !this.fullCone && !this.restrictedCone && !this.portRestrictedCone && !this.symmetric && !this.symmetricUDPFirewall) {
                stringBuffer2.append("unkown\n");
            }
            stringBuffer2.append("Public IP address: ");
            if (this.publicIP != null) {
                stringBuffer2.append(this.publicIP.getHostAddress());
            } else {
                stringBuffer2.append(EnvironmentCompat.MEDIA_UNKNOWN);
            }
            stringBuffer2.append("\n");
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }
}
