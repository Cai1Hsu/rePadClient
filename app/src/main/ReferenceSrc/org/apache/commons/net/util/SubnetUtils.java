package org.apache.commons.net.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.jar:org/apache/commons/net/util/SubnetUtils.class */
public class SubnetUtils {
    private static final int NBITS = 32;
    private static final String IP_ADDRESS = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})";
    private static final Pattern addressPattern = Pattern.compile(IP_ADDRESS);
    private static final String SLASH_FORMAT = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,3})";
    private static final Pattern cidrPattern = Pattern.compile(SLASH_FORMAT);
    private int netmask = 0;
    private int address = 0;
    private int network = 0;
    private int broadcast = 0;
    private boolean inclusiveHostCount = false;

    /* loaded from: classes.jar:org/apache/commons/net/util/SubnetUtils$SubnetInfo.class */
    public final class SubnetInfo {
        private SubnetInfo() {
            SubnetUtils.this = r4;
        }

        private int address() {
            return SubnetUtils.this.address;
        }

        private int broadcast() {
            return SubnetUtils.this.broadcast;
        }

        private int high() {
            return SubnetUtils.this.isInclusiveHostCount() ? broadcast() : broadcast() - network() > 1 ? broadcast() - 1 : 0;
        }

        private boolean isInRange(int i) {
            int low = i - low();
            return low >= 0 && low <= high() - low();
        }

        private int low() {
            return SubnetUtils.this.isInclusiveHostCount() ? network() : broadcast() - network() > 1 ? network() + 1 : 0;
        }

        private int netmask() {
            return SubnetUtils.this.netmask;
        }

        private int network() {
            return SubnetUtils.this.network;
        }

        public int asInteger(String str) {
            return SubnetUtils.this.toInteger(str);
        }

        public String getAddress() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(address()));
        }

        public int getAddressCount() {
            int broadcast = (broadcast() - network()) + (SubnetUtils.this.isInclusiveHostCount() ? 1 : -1);
            int i = broadcast;
            if (broadcast < 0) {
                i = 0;
            }
            return i;
        }

        public String[] getAllAddresses() {
            int addressCount = getAddressCount();
            String[] strArr = new String[addressCount];
            if (addressCount != 0) {
                int low = low();
                int i = 0;
                while (low <= high()) {
                    strArr[i] = SubnetUtils.this.format(SubnetUtils.this.toArray(low));
                    low++;
                    i++;
                }
            }
            return strArr;
        }

        public String getBroadcastAddress() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(broadcast()));
        }

        public String getCidrSignature() {
            return SubnetUtils.this.toCidrNotation(SubnetUtils.this.format(SubnetUtils.this.toArray(address())), SubnetUtils.this.format(SubnetUtils.this.toArray(netmask())));
        }

        public String getHighAddress() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(high()));
        }

        public String getLowAddress() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(low()));
        }

        public String getNetmask() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(netmask()));
        }

        public String getNetworkAddress() {
            return SubnetUtils.this.format(SubnetUtils.this.toArray(network()));
        }

        public boolean isInRange(String str) {
            return isInRange(SubnetUtils.this.toInteger(str));
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("CIDR Signature:\t[").append(getCidrSignature()).append("]").append(" Netmask: [").append(getNetmask()).append("]\n").append("Network:\t[").append(getNetworkAddress()).append("]\n").append("Broadcast:\t[").append(getBroadcastAddress()).append("]\n").append("First Address:\t[").append(getLowAddress()).append("]\n").append("Last Address:\t[").append(getHighAddress()).append("]\n").append("# Addresses:\t[").append(getAddressCount()).append("]\n");
            return sb.toString();
        }
    }

    public SubnetUtils(String str) {
        calculate(str);
    }

    public SubnetUtils(String str, String str2) {
        calculate(toCidrNotation(str, str2));
    }

    private void calculate(String str) {
        Matcher matcher = cidrPattern.matcher(str);
        if (matcher.matches()) {
            this.address = matchAddress(matcher);
            int rangeCheck = rangeCheck(Integer.parseInt(matcher.group(5)), 0, 32);
            for (int i = 0; i < rangeCheck; i++) {
                this.netmask |= 1 << (31 - i);
            }
            this.network = this.address & this.netmask;
            this.broadcast = this.network | (this.netmask ^ (-1));
            return;
        }
        throw new IllegalArgumentException("Could not parse [" + str + "]");
    }

    public String format(int[] iArr) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < iArr.length; i++) {
            sb.append(iArr[i]);
            if (i != iArr.length - 1) {
                sb.append(".");
            }
        }
        return sb.toString();
    }

    private int matchAddress(Matcher matcher) {
        int i = 0;
        for (int i2 = 1; i2 <= 4; i2++) {
            i |= (rangeCheck(Integer.parseInt(matcher.group(i2)), -1, 255) & 255) << ((4 - i2) * 8);
        }
        return i;
    }

    private int rangeCheck(int i, int i2, int i3) {
        if (i <= i2 || i > i3) {
            throw new IllegalArgumentException("Value [" + i + "] not in range (" + i2 + "," + i3 + "]");
        }
        return i;
    }

    public int[] toArray(int i) {
        int[] iArr = new int[4];
        for (int i2 = 3; i2 >= 0; i2--) {
            iArr[i2] = iArr[i2] | ((i >>> ((3 - i2) * 8)) & 255);
        }
        return iArr;
    }

    public String toCidrNotation(String str, String str2) {
        return str + "/" + pop(toInteger(str2));
    }

    public int toInteger(String str) {
        Matcher matcher = addressPattern.matcher(str);
        if (matcher.matches()) {
            return matchAddress(matcher);
        }
        throw new IllegalArgumentException("Could not parse [" + str + "]");
    }

    public final SubnetInfo getInfo() {
        return new SubnetInfo();
    }

    public boolean isInclusiveHostCount() {
        return this.inclusiveHostCount;
    }

    int pop(int i) {
        int i2 = i - ((i >>> 1) & 1431655765);
        int i3 = (i2 & 858993459) + ((i2 >>> 2) & 858993459);
        int i4 = ((i3 >>> 4) + i3) & 252645135;
        int i5 = i4 + (i4 >>> 8);
        return (i5 + (i5 >>> 16)) & 63;
    }

    public void setInclusiveHostCount(boolean z) {
        this.inclusiveHostCount = z;
    }
}
