package org.apache.commons.net.ntp;

import org.apache.http.protocol.HTTP;

/* loaded from: classes.jar:org/apache/commons/net/ntp/NtpUtils.class */
public final class NtpUtils {
    public static String getHostAddress(int i) {
        return ((i >>> 24) & 255) + "." + ((i >>> 16) & 255) + "." + ((i >>> 8) & 255) + "." + ((i >>> 0) & 255);
    }

    public static String getModeName(int i) {
        String str;
        switch (i) {
            case 0:
                str = "Reserved";
                break;
            case 1:
                str = "Symmetric Active";
                break;
            case 2:
                str = "Symmetric Passive";
                break;
            case 3:
                str = "Client";
                break;
            case 4:
                str = HTTP.SERVER_HEADER;
                break;
            case 5:
                str = "Broadcast";
                break;
            case 6:
                str = "Control";
                break;
            case 7:
                str = "Private";
                break;
            default:
                str = "Unknown";
                break;
        }
        return str;
    }

    public static String getRefAddress(NtpV3Packet ntpV3Packet) {
        return getHostAddress(ntpV3Packet == null ? 0 : ntpV3Packet.getReferenceId());
    }

    public static String getReferenceClock(NtpV3Packet ntpV3Packet) {
        String sb;
        char c;
        if (ntpV3Packet == null) {
            sb = "";
        } else {
            int referenceId = ntpV3Packet.getReferenceId();
            if (referenceId == 0) {
                sb = "";
            } else {
                StringBuilder sb2 = new StringBuilder(4);
                for (int i = 24; i >= 0 && (c = (char) ((referenceId >>> i) & 255)) != 0; i -= 8) {
                    if (!Character.isLetterOrDigit(c)) {
                        sb = "";
                        break;
                    }
                    sb2.append(c);
                }
                sb = sb2.toString();
            }
        }
        return sb;
    }
}
