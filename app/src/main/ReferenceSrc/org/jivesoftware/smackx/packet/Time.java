package org.jivesoftware.smackx.packet;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/Time.class */
public class Time extends IQ {
    private String display;
    private String tz;
    private String utc;
    private static SimpleDateFormat utcFormat = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private static DateFormat displayFormat = DateFormat.getDateTimeInstance();

    public Time() {
        this.utc = null;
        this.tz = null;
        this.display = null;
    }

    public Time(Calendar calendar) {
        this.utc = null;
        this.tz = null;
        this.display = null;
        TimeZone timeZone = calendar.getTimeZone();
        this.tz = calendar.getTimeZone().getID();
        this.display = displayFormat.format(calendar.getTime());
        this.utc = utcFormat.format(new Date(calendar.getTimeInMillis() - timeZone.getOffset(calendar.getTimeInMillis())));
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<query xmlns=\"jabber:iq:time\">");
        if (this.utc != null) {
            sb.append("<utc>").append(this.utc).append("</utc>");
        }
        if (this.tz != null) {
            sb.append("<tz>").append(this.tz).append("</tz>");
        }
        if (this.display != null) {
            sb.append("<display>").append(this.display).append("</display>");
        }
        sb.append("</query>");
        return sb.toString();
    }

    public String getDisplay() {
        return this.display;
    }

    public Date getTime() {
        Date date;
        if (this.utc == null) {
            date = null;
        } else {
            date = null;
            try {
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date(utcFormat.parse(this.utc).getTime() + calendar.getTimeZone().getOffset(calendar.getTimeInMillis())));
                date = calendar.getTime();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return date;
    }

    public String getTz() {
        return this.tz;
    }

    public String getUtc() {
        return this.utc;
    }

    public void setDisplay(String str) {
        this.display = str;
    }

    public void setTime(Date date) {
        this.utc = utcFormat.format(new Date(date.getTime() - TimeZone.getDefault().getOffset(date.getTime())));
    }

    public void setTz(String str) {
        this.tz = str;
    }

    public void setUtc(String str) {
        this.utc = str;
    }
}
