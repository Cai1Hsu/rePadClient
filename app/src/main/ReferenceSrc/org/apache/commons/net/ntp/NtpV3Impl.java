package org.apache.commons.net.ntp;

import android.support.v4.media.session.PlaybackStateCompat;
import java.net.DatagramPacket;

/* loaded from: classes.jar:org/apache/commons/net/ntp/NtpV3Impl.class */
public class NtpV3Impl implements NtpV3Packet {
    private static final int LI_INDEX = 0;
    private static final int LI_SHIFT = 6;
    private static final int MODE_INDEX = 0;
    private static final int MODE_SHIFT = 0;
    private static final int ORIGINATE_TIMESTAMP_INDEX = 24;
    private static final int POLL_INDEX = 2;
    private static final int PRECISION_INDEX = 3;
    private static final int RECEIVE_TIMESTAMP_INDEX = 32;
    private static final int REFERENCE_ID_INDEX = 12;
    private static final int REFERENCE_TIMESTAMP_INDEX = 16;
    private static final int ROOT_DELAY_INDEX = 4;
    private static final int ROOT_DISPERSION_INDEX = 8;
    private static final int STRATUM_INDEX = 1;
    private static final int TRANSMIT_TIMESTAMP_INDEX = 40;
    private static final int VERSION_INDEX = 0;
    private static final int VERSION_SHIFT = 3;
    private final byte[] buf = new byte[48];
    private volatile DatagramPacket dp;

    private int getInt(int i) {
        return (ui(this.buf[i]) << 24) | (ui(this.buf[i + 1]) << 16) | (ui(this.buf[i + 2]) << 8) | ui(this.buf[i + 3]);
    }

    private long getLong(int i) {
        return (ul(this.buf[i]) << 56) | (ul(this.buf[i + 1]) << 48) | (ul(this.buf[i + 2]) << 40) | (ul(this.buf[i + 3]) << 32) | (ul(this.buf[i + 4]) << 24) | (ul(this.buf[i + 5]) << 16) | (ul(this.buf[i + 6]) << 8) | ul(this.buf[i + 7]);
    }

    private TimeStamp getTimestamp(int i) {
        return new TimeStamp(getLong(i));
    }

    private String idAsHex() {
        return Integer.toHexString(getReferenceId());
    }

    private String idAsIPAddress() {
        return ui(this.buf[12]) + "." + ui(this.buf[13]) + "." + ui(this.buf[14]) + "." + ui(this.buf[15]);
    }

    private String idAsString() {
        char c;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i <= 3 && (c = (char) this.buf[i + 12]) != 0; i++) {
            sb.append(c);
        }
        return sb.toString();
    }

    private void setTimestamp(int i, TimeStamp timeStamp) {
        long ntpValue = timeStamp == null ? 0L : timeStamp.ntpValue();
        for (int i2 = 7; i2 >= 0; i2--) {
            this.buf[i + i2] = (byte) (255 & ntpValue);
            ntpValue >>>= 8;
        }
    }

    protected static final int ui(byte b) {
        return b & 255;
    }

    protected static final long ul(byte b) {
        return b & 255;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public DatagramPacket getDatagramPacket() {
        DatagramPacket datagramPacket;
        synchronized (this) {
            if (this.dp == null) {
                this.dp = new DatagramPacket(this.buf, this.buf.length);
                this.dp.setPort(123);
            }
            datagramPacket = this.dp;
        }
        return datagramPacket;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getLeapIndicator() {
        return (ui(this.buf[0]) >> 6) & 3;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getMode() {
        return (ui(this.buf[0]) >> 0) & 7;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getModeName() {
        return NtpUtils.getModeName(getMode());
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getOriginateTimeStamp() {
        return getTimestamp(24);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getPoll() {
        return this.buf[2];
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getPrecision() {
        return this.buf[3];
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getReceiveTimeStamp() {
        return getTimestamp(32);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getReferenceId() {
        return getInt(12);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getReferenceIdString() {
        String idAsIPAddress;
        int version = getVersion();
        int stratum = getStratum();
        if (version == 3 || version == 4) {
            if (stratum == 0 || stratum == 1) {
                idAsIPAddress = idAsString();
            } else if (version == 4) {
                idAsIPAddress = idAsHex();
            }
            return idAsIPAddress;
        }
        idAsIPAddress = stratum >= 2 ? idAsIPAddress() : idAsHex();
        return idAsIPAddress;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getReferenceTimeStamp() {
        return getTimestamp(16);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getRootDelay() {
        return getInt(4);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public double getRootDelayInMillisDouble() {
        return getRootDelay() / 65.536d;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getRootDispersion() {
        return getInt(8);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public long getRootDispersionInMillis() {
        return (1000 * getRootDispersion()) / PlaybackStateCompat.ACTION_PREPARE_FROM_SEARCH;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public double getRootDispersionInMillisDouble() {
        return getRootDispersion() / 65.536d;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getStratum() {
        return ui(this.buf[1]);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public TimeStamp getTransmitTimeStamp() {
        return getTimestamp(40);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public String getType() {
        return NtpV3Packet.TYPE_NTP;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public int getVersion() {
        return (ui(this.buf[0]) >> 3) & 7;
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setDatagramPacket(DatagramPacket datagramPacket) {
        byte[] data = datagramPacket.getData();
        int length = datagramPacket.getLength();
        int i = length;
        if (length > this.buf.length) {
            i = this.buf.length;
        }
        System.arraycopy(data, 0, this.buf, 0, i);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setLeapIndicator(int i) {
        this.buf[0] = (byte) ((this.buf[0] & 63) | ((i & 3) << 6));
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setMode(int i) {
        this.buf[0] = (byte) ((this.buf[0] & 248) | (i & 7));
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setOriginateTimeStamp(TimeStamp timeStamp) {
        setTimestamp(24, timeStamp);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setPoll(int i) {
        this.buf[2] = (byte) (i & 255);
    }

    public void setPrecision(int i) {
        this.buf[3] = (byte) (i & 255);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReceiveTimeStamp(TimeStamp timeStamp) {
        setTimestamp(32, timeStamp);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReferenceId(int i) {
        int i2 = i;
        for (int i3 = 3; i3 >= 0; i3--) {
            this.buf[i3 + 12] = (byte) (i2 & 255);
            i2 >>>= 8;
        }
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setReferenceTime(TimeStamp timeStamp) {
        setTimestamp(16, timeStamp);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setStratum(int i) {
        this.buf[1] = (byte) (i & 255);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setTransmitTime(TimeStamp timeStamp) {
        setTimestamp(40, timeStamp);
    }

    @Override // org.apache.commons.net.ntp.NtpV3Packet
    public void setVersion(int i) {
        this.buf[0] = (byte) ((this.buf[0] & 199) | ((i & 7) << 3));
    }

    public String toString() {
        return "[version:" + getVersion() + ", mode:" + getMode() + ", poll:" + getPoll() + ", precision:" + getPrecision() + ", delay:" + getRootDelay() + ", dispersion(ms):" + getRootDispersionInMillisDouble() + ", id:" + getReferenceIdString() + ", xmitTime:" + getTransmitTimeStamp().toDateString() + " ]";
    }
}
