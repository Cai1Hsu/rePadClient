package org.apache.commons.net.ntp;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes.jar:org/apache/commons/net/ntp/TimeStamp.class */
public class TimeStamp implements Serializable, Comparable<TimeStamp> {
    public static final String NTP_DATE_FORMAT = "EEE, MMM dd yyyy HH:mm:ss.SSS";
    protected static final long msb0baseTime = 2085978496000L;
    protected static final long msb1baseTime = -2208988800000L;
    private static final long serialVersionUID = 8139806907588338737L;
    private final long ntpTime;
    private DateFormat simpleFormatter;
    private DateFormat utcFormatter;

    public TimeStamp(long j) {
        this.ntpTime = j;
    }

    public TimeStamp(String str) throws NumberFormatException {
        this.ntpTime = decodeNtpHexString(str);
    }

    public TimeStamp(Date date) {
        this.ntpTime = date == null ? 0L : toNtpTime(date.getTime());
    }

    private static void appendHexString(StringBuilder sb, long j) {
        String hexString = Long.toHexString(j);
        for (int length = hexString.length(); length < 8; length++) {
            sb.append('0');
        }
        sb.append(hexString);
    }

    protected static long decodeNtpHexString(String str) throws NumberFormatException {
        if (str == null) {
            throw new NumberFormatException("null");
        }
        int indexOf = str.indexOf(46);
        return indexOf == -1 ? str.length() == 0 ? 0L : Long.parseLong(str, 16) << 32 : (Long.parseLong(str.substring(0, indexOf), 16) << 32) | Long.parseLong(str.substring(indexOf + 1), 16);
    }

    public static TimeStamp getCurrentTime() {
        return getNtpTime(System.currentTimeMillis());
    }

    public static TimeStamp getNtpTime(long j) {
        return new TimeStamp(toNtpTime(j));
    }

    public static long getTime(long j) {
        long j2 = (j >>> 32) & 4294967295L;
        long round = Math.round((1000.0d * (j & 4294967295L)) / 4.294967296E9d);
        return (j2 & 2147483648L) == 0 ? msb0baseTime + (j2 * 1000) + round : msb1baseTime + (j2 * 1000) + round;
    }

    public static TimeStamp parseNtpString(String str) throws NumberFormatException {
        return new TimeStamp(decodeNtpHexString(str));
    }

    protected static long toNtpTime(long j) {
        boolean z = j < msb0baseTime;
        long j2 = z ? j + 2208988800000L : j - msb0baseTime;
        long j3 = j2 / 1000;
        long j4 = ((j2 % 1000) * 4294967296L) / 1000;
        long j5 = j3;
        if (z) {
            j5 = j3 | 2147483648L;
        }
        return (j5 << 32) | j4;
    }

    public static String toString(long j) {
        StringBuilder sb = new StringBuilder();
        appendHexString(sb, (j >>> 32) & 4294967295L);
        sb.append('.');
        appendHexString(sb, j & 4294967295L);
        return sb.toString();
    }

    public int compareTo(TimeStamp timeStamp) {
        long j = this.ntpTime;
        long j2 = timeStamp.ntpTime;
        return j < j2 ? -1 : j == j2 ? 0 : 1;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj instanceof TimeStamp) {
            z = false;
            if (this.ntpTime == ((TimeStamp) obj).ntpValue()) {
                z = true;
            }
        }
        return z;
    }

    public Date getDate() {
        return new Date(getTime(this.ntpTime));
    }

    public long getFraction() {
        return this.ntpTime & 4294967295L;
    }

    public long getSeconds() {
        return (this.ntpTime >>> 32) & 4294967295L;
    }

    public long getTime() {
        return getTime(this.ntpTime);
    }

    public int hashCode() {
        return (int) (this.ntpTime ^ (this.ntpTime >>> 32));
    }

    public long ntpValue() {
        return this.ntpTime;
    }

    public String toDateString() {
        if (this.simpleFormatter == null) {
            this.simpleFormatter = new SimpleDateFormat(NTP_DATE_FORMAT, Locale.US);
            this.simpleFormatter.setTimeZone(TimeZone.getDefault());
        }
        return this.simpleFormatter.format(getDate());
    }

    public String toString() {
        return toString(this.ntpTime);
    }

    public String toUTCString() {
        if (this.utcFormatter == null) {
            this.utcFormatter = new SimpleDateFormat("EEE, MMM dd yyyy HH:mm:ss.SSS 'UTC'", Locale.US);
            this.utcFormatter.setTimeZone(TimeZone.getTimeZone("UTC"));
        }
        return this.utcFormatter.format(getDate());
    }
}
