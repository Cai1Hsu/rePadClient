package org.apache.commons.net.ftp.parser;

import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import org.apache.commons.net.ftp.Configurable;
import org.apache.commons.net.ftp.FTPClientConfig;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/FTPTimestampParserImpl.class */
public class FTPTimestampParserImpl implements FTPTimestampParser, Configurable {
    private SimpleDateFormat defaultDateFormat;
    private boolean lenientFutureDates = false;
    private SimpleDateFormat recentDateFormat;

    public FTPTimestampParserImpl() {
        setDefaultDateFormat(FTPTimestampParser.DEFAULT_SDF);
        setRecentDateFormat(FTPTimestampParser.DEFAULT_RECENT_SDF);
    }

    private void setDefaultDateFormat(String str) {
        if (str != null) {
            this.defaultDateFormat = new SimpleDateFormat(str);
            this.defaultDateFormat.setLenient(false);
        }
    }

    private void setRecentDateFormat(String str) {
        if (str != null) {
            this.recentDateFormat = new SimpleDateFormat(str);
            this.recentDateFormat.setLenient(false);
        }
    }

    private void setServerTimeZone(String str) {
        TimeZone timeZone = TimeZone.getDefault();
        if (str != null) {
            timeZone = TimeZone.getTimeZone(str);
        }
        this.defaultDateFormat.setTimeZone(timeZone);
        if (this.recentDateFormat != null) {
            this.recentDateFormat.setTimeZone(timeZone);
        }
    }

    @Override // org.apache.commons.net.ftp.Configurable
    public void configure(FTPClientConfig fTPClientConfig) {
        String serverLanguageCode = fTPClientConfig.getServerLanguageCode();
        String shortMonthNames = fTPClientConfig.getShortMonthNames();
        DateFormatSymbols dateFormatSymbols = shortMonthNames != null ? FTPClientConfig.getDateFormatSymbols(shortMonthNames) : serverLanguageCode != null ? FTPClientConfig.lookupDateFormatSymbols(serverLanguageCode) : FTPClientConfig.lookupDateFormatSymbols("en");
        String recentDateFormatStr = fTPClientConfig.getRecentDateFormatStr();
        if (recentDateFormatStr == null) {
            this.recentDateFormat = null;
        } else {
            this.recentDateFormat = new SimpleDateFormat(recentDateFormatStr, dateFormatSymbols);
            this.recentDateFormat.setLenient(false);
        }
        String defaultDateFormatStr = fTPClientConfig.getDefaultDateFormatStr();
        if (defaultDateFormatStr == null) {
            throw new IllegalArgumentException("defaultFormatString cannot be null");
        }
        this.defaultDateFormat = new SimpleDateFormat(defaultDateFormatStr, dateFormatSymbols);
        this.defaultDateFormat.setLenient(false);
        setServerTimeZone(fTPClientConfig.getServerTimeZoneId());
        this.lenientFutureDates = fTPClientConfig.isLenientFutureDates();
    }

    public SimpleDateFormat getDefaultDateFormat() {
        return this.defaultDateFormat;
    }

    public String getDefaultDateFormatString() {
        return this.defaultDateFormat.toPattern();
    }

    public SimpleDateFormat getRecentDateFormat() {
        return this.recentDateFormat;
    }

    public String getRecentDateFormatString() {
        return this.recentDateFormat.toPattern();
    }

    public TimeZone getServerTimeZone() {
        return this.defaultDateFormat.getTimeZone();
    }

    public String[] getShortMonths() {
        return this.defaultDateFormat.getDateFormatSymbols().getShortMonths();
    }

    boolean isLenientFutureDates() {
        return this.lenientFutureDates;
    }

    @Override // org.apache.commons.net.ftp.parser.FTPTimestampParser
    public Calendar parseTimestamp(String str) throws ParseException {
        return parseTimestamp(str, Calendar.getInstance());
    }

    public Calendar parseTimestamp(String str, Calendar calendar) throws ParseException {
        Calendar calendar2 = (Calendar) calendar.clone();
        calendar2.setTimeZone(getServerTimeZone());
        Calendar calendar3 = (Calendar) calendar2.clone();
        calendar3.setTimeZone(getServerTimeZone());
        ParsePosition parsePosition = new ParsePosition(0);
        Date date = null;
        if (this.recentDateFormat != null) {
            if (this.lenientFutureDates) {
                calendar2.add(5, 1);
            }
            date = this.recentDateFormat.parse(str, parsePosition);
        }
        if (date == null || parsePosition.getIndex() != str.length()) {
            Date date2 = date;
            ParsePosition parsePosition2 = parsePosition;
            if (this.recentDateFormat != null) {
                parsePosition2 = new ParsePosition(0);
                String str2 = str + " " + calendar2.get(1);
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(this.recentDateFormat.toPattern() + " yyyy", this.recentDateFormat.getDateFormatSymbols());
                simpleDateFormat.setLenient(false);
                simpleDateFormat.setTimeZone(this.recentDateFormat.getTimeZone());
                date2 = simpleDateFormat.parse(str2, parsePosition2);
            }
            if (date2 == null || parsePosition2.getIndex() != str.length() + 5) {
                ParsePosition parsePosition3 = new ParsePosition(0);
                Date parse = this.defaultDateFormat.parse(str, parsePosition3);
                if (parse == null || parsePosition3.getIndex() != str.length()) {
                    throw new ParseException("Timestamp could not be parsed with older or recent DateFormat", parsePosition3.getErrorIndex());
                }
                calendar3.setTime(parse);
            } else {
                calendar3.setTime(date2);
            }
        } else {
            calendar3.setTime(date);
            calendar3.set(1, calendar2.get(1));
            if (calendar3.after(calendar2)) {
                calendar3.add(1, -1);
            }
        }
        return calendar3;
    }

    void setLenientFutureDates(boolean z) {
        this.lenientFutureDates = z;
    }
}
