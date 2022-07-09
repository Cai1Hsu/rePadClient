package org.apache.tools.ant.util;

import java.text.ChoiceFormat;
import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes.jar:org/apache/tools/ant/util/DateUtils.class */
public final class DateUtils {
    public static final String ISO8601_DATETIME_PATTERN = "yyyy-MM-dd'T'HH:mm:ss";
    public static final String ISO8601_DATE_PATTERN = "yyyy-MM-dd";
    public static final String ISO8601_TIME_PATTERN = "HH:mm:ss";
    private static final int ONE_HOUR = 60;
    private static final int ONE_MINUTE = 60;
    private static final int ONE_SECOND = 1000;
    private static final int TEN = 10;
    public static final DateFormat DATE_HEADER_FORMAT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss ", Locale.US);
    private static final DateFormat DATE_HEADER_FORMAT_INT = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss ", Locale.US);
    private static final MessageFormat MINUTE_SECONDS = new MessageFormat("{0}{1}");
    private static final double[] LIMITS = {0.0d, 1.0d, 2.0d};
    private static final String[] MINUTES_PART = {"", "1 minute ", "{0,number,###############} minutes "};
    private static final String[] SECONDS_PART = {"0 seconds", "1 second", "{1,number} seconds"};
    private static final ChoiceFormat MINUTES_FORMAT = new ChoiceFormat(LIMITS, MINUTES_PART);
    private static final ChoiceFormat SECONDS_FORMAT = new ChoiceFormat(LIMITS, SECONDS_PART);

    static {
        MINUTE_SECONDS.setFormat(0, MINUTES_FORMAT);
        MINUTE_SECONDS.setFormat(1, SECONDS_FORMAT);
    }

    private DateUtils() {
    }

    private static DateFormat createDateFormat(String str) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        simpleDateFormat.setLenient(true);
        return simpleDateFormat;
    }

    public static String format(long j, String str) {
        return format(new Date(j), str);
    }

    public static String format(Date date, String str) {
        return createDateFormat(str).format(date);
    }

    public static String formatElapsedTime(long j) {
        long j2 = j / 1000;
        return MINUTE_SECONDS.format(new Object[]{new Long(j2 / 60), new Long(j2 % 60)});
    }

    public static String getDateForHeader() {
        String stringBuffer;
        Calendar calendar = Calendar.getInstance();
        int offset = calendar.getTimeZone().getOffset(calendar.get(0), calendar.get(1), calendar.get(2), calendar.get(5), calendar.get(7), calendar.get(14));
        StringBuffer stringBuffer2 = new StringBuffer(offset < 0 ? "-" : "+");
        int abs = Math.abs(offset);
        int i = abs / 3600000;
        int i2 = (abs / 60000) - (i * 60);
        if (i < 10) {
            stringBuffer2.append("0");
        }
        stringBuffer2.append(i);
        if (i2 < 10) {
            stringBuffer2.append("0");
        }
        stringBuffer2.append(i2);
        synchronized (DATE_HEADER_FORMAT_INT) {
            stringBuffer = new StringBuffer().append(DATE_HEADER_FORMAT_INT.format(calendar.getTime())).append(stringBuffer2.toString()).toString();
        }
        return stringBuffer;
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0032, code lost:
        if (r0 == 24) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int getPhaseOfMoon(Calendar calendar) {
        int i;
        int i2 = calendar.get(6);
        int i3 = ((calendar.get(1) - 1900) % 19) + 1;
        int i4 = ((i3 * 11) + 18) % 30;
        if (i4 != 25 || i3 <= 11) {
            i = i4;
        }
        i = i4 + 1;
        return (((((i2 + i) * 6) + 11) % 177) / 22) & 7;
    }

    public static Date parseDateFromHeader(String str) throws ParseException {
        Date parse;
        synchronized (DATE_HEADER_FORMAT_INT) {
            parse = DATE_HEADER_FORMAT_INT.parse(str);
        }
        return parse;
    }

    public static Date parseIso8601Date(String str) throws ParseException {
        return new SimpleDateFormat(ISO8601_DATE_PATTERN).parse(str);
    }

    public static Date parseIso8601DateTime(String str) throws ParseException {
        return new SimpleDateFormat(ISO8601_DATETIME_PATTERN).parse(str);
    }

    public static Date parseIso8601DateTimeOrDate(String str) throws ParseException {
        Date parseIso8601Date;
        try {
            parseIso8601Date = parseIso8601DateTime(str);
        } catch (ParseException e) {
            parseIso8601Date = parseIso8601Date(str);
        }
        return parseIso8601Date;
    }
}
