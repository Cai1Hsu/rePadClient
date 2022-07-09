package org.jivesoftware.smack.util;

import com.mongodb.util.JSONCallback;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.TimeZone;
import java.util.regex.Pattern;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/jivesoftware/smack/util/StringUtils.class */
public class StringUtils {
    public static final DateFormat XEP_0082_UTC_FORMAT = new SimpleDateFormat(JSONCallback._msDateFormat);
    private static final DateFormat dateFormatter = DateFormatType.XEP_0082_DATE_PROFILE.createFormatter();
    private static final Pattern datePattern = Pattern.compile("^\\d+-\\d+-\\d+$");
    private static final DateFormat timeFormatter = DateFormatType.XEP_0082_TIME_MILLIS_ZONE_PROFILE.createFormatter();
    private static final Pattern timePattern = Pattern.compile("^(\\d+:){2}\\d+.\\d+(Z|([+-](\\d+:\\d+)))$");
    private static final DateFormat timeNoZoneFormatter = DateFormatType.XEP_0082_TIME_MILLIS_PROFILE.createFormatter();
    private static final Pattern timeNoZonePattern = Pattern.compile("^(\\d+:){2}\\d+.\\d+$");
    private static final DateFormat timeNoMillisFormatter = DateFormatType.XEP_0082_TIME_ZONE_PROFILE.createFormatter();
    private static final Pattern timeNoMillisPattern = Pattern.compile("^(\\d+:){2}\\d+(Z|([+-](\\d+:\\d+)))$");
    private static final DateFormat timeNoMillisNoZoneFormatter = DateFormatType.XEP_0082_TIME_PROFILE.createFormatter();
    private static final Pattern timeNoMillisNoZonePattern = Pattern.compile("^(\\d+:){2}\\d+$");
    private static final DateFormat dateTimeFormatter = DateFormatType.XEP_0082_DATETIME_MILLIS_PROFILE.createFormatter();
    private static final Pattern dateTimePattern = Pattern.compile("^\\d+(-\\d+){2}+T(\\d+:){2}\\d+.\\d+(Z|([+-](\\d+:\\d+)))?$");
    private static final DateFormat dateTimeNoMillisFormatter = DateFormatType.XEP_0082_DATETIME_PROFILE.createFormatter();
    private static final Pattern dateTimeNoMillisPattern = Pattern.compile("^\\d+(-\\d+){2}+T(\\d+:){2}\\d+(Z|([+-](\\d+:\\d+)))?$");
    private static final DateFormat xep0091Formatter = new SimpleDateFormat("yyyyMMdd'T'HH:mm:ss");
    private static final DateFormat xep0091Date6DigitFormatter = new SimpleDateFormat("yyyyMd'T'HH:mm:ss");
    private static final DateFormat xep0091Date7Digit1MonthFormatter = new SimpleDateFormat("yyyyMdd'T'HH:mm:ss");
    private static final DateFormat xep0091Date7Digit2MonthFormatter = new SimpleDateFormat("yyyyMMd'T'HH:mm:ss");
    private static final Pattern xep0091Pattern = Pattern.compile("^\\d+T\\d+:\\d+:\\d+$");
    private static final List<PatternCouplings> couplings = new ArrayList();
    private static final char[] QUOTE_ENCODE = "&quot;".toCharArray();
    private static final char[] APOS_ENCODE = "&apos;".toCharArray();
    private static final char[] AMP_ENCODE = "&amp;".toCharArray();
    private static final char[] LT_ENCODE = "&lt;".toCharArray();
    private static final char[] GT_ENCODE = "&gt;".toCharArray();
    private static MessageDigest digest = null;
    private static Random randGen = new Random();
    private static char[] numbersAndLetters = "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();

    /* loaded from: classes.jar:org/jivesoftware/smack/util/StringUtils$PatternCouplings.class */
    private static class PatternCouplings {
        DateFormat formatter;
        boolean needToConvertTimeZone;
        Pattern pattern;

        public PatternCouplings(Pattern pattern, DateFormat dateFormat) {
            this.needToConvertTimeZone = false;
            this.pattern = pattern;
            this.formatter = dateFormat;
        }

        public PatternCouplings(Pattern pattern, DateFormat dateFormat, boolean z) {
            this.needToConvertTimeZone = false;
            this.pattern = pattern;
            this.formatter = dateFormat;
            this.needToConvertTimeZone = z;
        }

        public String convertTime(String str) {
            return str.charAt(str.length() - 1) == 'Z' ? str.replace("Z", "+0000") : str.replaceAll("([\\+\\-]\\d\\d):(\\d\\d)", "$1$2");
        }
    }

    static {
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        XEP_0082_UTC_FORMAT.setTimeZone(timeZone);
        dateFormatter.setTimeZone(timeZone);
        timeFormatter.setTimeZone(timeZone);
        timeNoZoneFormatter.setTimeZone(timeZone);
        timeNoMillisFormatter.setTimeZone(timeZone);
        timeNoMillisNoZoneFormatter.setTimeZone(timeZone);
        dateTimeFormatter.setTimeZone(timeZone);
        dateTimeNoMillisFormatter.setTimeZone(timeZone);
        xep0091Formatter.setTimeZone(timeZone);
        xep0091Date6DigitFormatter.setTimeZone(timeZone);
        xep0091Date7Digit1MonthFormatter.setTimeZone(timeZone);
        xep0091Date7Digit1MonthFormatter.setLenient(false);
        xep0091Date7Digit2MonthFormatter.setTimeZone(timeZone);
        xep0091Date7Digit2MonthFormatter.setLenient(false);
        couplings.add(new PatternCouplings(datePattern, dateFormatter));
        couplings.add(new PatternCouplings(dateTimePattern, dateTimeFormatter, true));
        couplings.add(new PatternCouplings(dateTimeNoMillisPattern, dateTimeNoMillisFormatter, true));
        couplings.add(new PatternCouplings(timePattern, timeFormatter, true));
        couplings.add(new PatternCouplings(timeNoZonePattern, timeNoZoneFormatter));
        couplings.add(new PatternCouplings(timeNoMillisPattern, timeNoMillisFormatter, true));
        couplings.add(new PatternCouplings(timeNoMillisNoZonePattern, timeNoMillisNoZoneFormatter));
    }

    private StringUtils() {
    }

    public static byte[] decodeBase64(String str) {
        byte[] bytes;
        try {
            bytes = str.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            bytes = str.getBytes();
        }
        return Base64.decode(bytes, 0, bytes.length, 0);
    }

    private static Calendar determineNearestDate(final Calendar calendar, List<Calendar> list) {
        Collections.sort(list, new Comparator<Calendar>() { // from class: org.jivesoftware.smack.util.StringUtils.1
            public int compare(Calendar calendar2, Calendar calendar3) {
                return new Long(calendar.getTimeInMillis() - calendar2.getTimeInMillis()).compareTo(new Long(calendar.getTimeInMillis() - calendar3.getTimeInMillis()));
            }
        });
        return list.get(0);
    }

    public static String encodeBase64(String str) {
        byte[] bArr;
        try {
            bArr = str.getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            bArr = null;
        }
        return encodeBase64(bArr);
    }

    public static String encodeBase64(byte[] bArr) {
        return encodeBase64(bArr, false);
    }

    public static String encodeBase64(byte[] bArr, int i, int i2, boolean z) {
        return Base64.encodeBytes(bArr, i, i2, z ? 0 : 8);
    }

    public static String encodeBase64(byte[] bArr, boolean z) {
        return encodeBase64(bArr, 0, bArr.length, z);
    }

    public static String encodeHex(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b : bArr) {
            if ((b & 255) < 16) {
                sb.append("0");
            }
            sb.append(Integer.toString(b & 255, 16));
        }
        return sb.toString();
    }

    public static String escapeForXML(String str) {
        int i;
        if (str == null) {
            str = null;
        } else {
            int i2 = 0;
            int i3 = 0;
            char[] charArray = str.toCharArray();
            int length = charArray.length;
            StringBuilder sb = new StringBuilder((int) (length * 1.3d));
            while (i2 < length) {
                char c = charArray[i2];
                if (c > '>') {
                    i = i3;
                } else if (c == '<') {
                    if (i2 > i3) {
                        sb.append(charArray, i3, i2 - i3);
                    }
                    i = i2 + 1;
                    sb.append(LT_ENCODE);
                } else if (c == '>') {
                    if (i2 > i3) {
                        sb.append(charArray, i3, i2 - i3);
                    }
                    i = i2 + 1;
                    sb.append(GT_ENCODE);
                } else if (c == '&') {
                    if (i2 > i3) {
                        sb.append(charArray, i3, i2 - i3);
                    }
                    if (length > i2 + 5 && charArray[i2 + 1] == '#' && Character.isDigit(charArray[i2 + 2]) && Character.isDigit(charArray[i2 + 3]) && Character.isDigit(charArray[i2 + 4])) {
                        i = i3;
                        if (charArray[i2 + 5] == ';') {
                        }
                    }
                    i = i2 + 1;
                    sb.append(AMP_ENCODE);
                } else if (c == '\"') {
                    if (i2 > i3) {
                        sb.append(charArray, i3, i2 - i3);
                    }
                    i = i2 + 1;
                    sb.append(QUOTE_ENCODE);
                } else {
                    i = i3;
                    if (c == '\'') {
                        if (i2 > i3) {
                            sb.append(charArray, i3, i2 - i3);
                        }
                        i = i2 + 1;
                        sb.append(APOS_ENCODE);
                    }
                }
                i2++;
                i3 = i;
            }
            if (i3 != 0) {
                if (i2 > i3) {
                    sb.append(charArray, i3, i2 - i3);
                }
                str = sb.toString();
            }
        }
        return str;
    }

    public static String escapeNode(String str) {
        String sb;
        if (str == null) {
            sb = null;
        } else {
            StringBuilder sb2 = new StringBuilder(str.length() + 8);
            int length = str.length();
            for (int i = 0; i < length; i++) {
                char charAt = str.charAt(i);
                switch (charAt) {
                    case '\"':
                        sb2.append("\\22");
                        break;
                    case '&':
                        sb2.append("\\26");
                        break;
                    case '\'':
                        sb2.append("\\27");
                        break;
                    case '/':
                        sb2.append("\\2f");
                        break;
                    case ':':
                        sb2.append("\\3a");
                        break;
                    case '<':
                        sb2.append("\\3c");
                        break;
                    case '>':
                        sb2.append("\\3e");
                        break;
                    case '@':
                        sb2.append("\\40");
                        break;
                    case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                        sb2.append("\\5c");
                        break;
                    default:
                        if (Character.isWhitespace(charAt)) {
                            sb2.append("\\20");
                            break;
                        } else {
                            sb2.append(charAt);
                            break;
                        }
                }
            }
            sb = sb2.toString();
        }
        return sb;
    }

    private static List<Calendar> filterDatesBefore(Calendar calendar, Calendar... calendarArr) {
        ArrayList arrayList = new ArrayList();
        for (Calendar calendar2 : calendarArr) {
            if (calendar2 != null && calendar2.before(calendar)) {
                arrayList.add(calendar2);
            }
        }
        return arrayList;
    }

    public static String formatDate(Date date, DateFormatType dateFormatType) {
        return null;
    }

    public static String formatXEP0082Date(Date date) {
        String format;
        synchronized (dateTimeFormatter) {
            format = dateTimeFormatter.format(date);
        }
        return format;
    }

    private static Date handleDateWithMissingLeadingZeros(String str, int i) throws ParseException {
        Date time;
        if (i == 6) {
            synchronized (xep0091Date6DigitFormatter) {
                time = xep0091Date6DigitFormatter.parse(str);
            }
        } else {
            Calendar calendar = Calendar.getInstance();
            List<Calendar> filterDatesBefore = filterDatesBefore(calendar, parseXEP91Date(str, xep0091Date7Digit1MonthFormatter), parseXEP91Date(str, xep0091Date7Digit2MonthFormatter));
            time = !filterDatesBefore.isEmpty() ? determineNearestDate(calendar, filterDatesBefore).getTime() : null;
        }
        return time;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:15:0x0030 -> B:22:0x0014). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0043 -> B:9:0x0020). Please submit an issue!!! */
    public static String hash(String str) {
        String encodeHex;
        synchronized (StringUtils.class) {
            try {
                if (digest == null) {
                    try {
                        digest = MessageDigest.getInstance("SHA-1");
                    } catch (NoSuchAlgorithmException e) {
                        System.err.println("Failed to load the SHA-1 MessageDigest. Jive will be unable to function normally.");
                    }
                }
                try {
                    digest.update(str.getBytes("UTF-8"));
                } catch (UnsupportedEncodingException e2) {
                    System.err.println(e2);
                }
                encodeHex = encodeHex(digest.digest());
            } catch (Throwable th) {
                throw th;
            }
        }
        return encodeHex;
    }

    public static boolean isFullJID(String str) {
        return parseName(str).length() > 0 && parseServer(str).length() > 0 && parseResource(str).length() > 0;
    }

    public static String parseBareAddress(String str) {
        String str2;
        if (str == null) {
            str2 = null;
        } else {
            int indexOf = str.indexOf("/");
            str2 = str;
            if (indexOf >= 0) {
                str2 = indexOf == 0 ? "" : str.substring(0, indexOf);
            }
        }
        return str2;
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x00a3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Date parseDate(String str) throws ParseException {
        Date parse;
        if (xep0091Pattern.matcher(str).matches()) {
            int length = str.split("T")[0].length();
            if (length < 8) {
                Date handleDateWithMissingLeadingZeros = handleDateWithMissingLeadingZeros(str, length);
                if (handleDateWithMissingLeadingZeros != null) {
                    parse = handleDateWithMissingLeadingZeros;
                }
                synchronized (dateTimeNoMillisFormatter) {
                    parse = dateTimeNoMillisFormatter.parse(str);
                }
            } else {
                synchronized (xep0091Formatter) {
                    parse = xep0091Formatter.parse(str);
                }
            }
        } else {
            for (PatternCouplings patternCouplings : couplings) {
                if (patternCouplings.pattern.matcher(str).matches()) {
                    String str2 = str;
                    if (patternCouplings.needToConvertTimeZone) {
                        str2 = patternCouplings.convertTime(str);
                    }
                    synchronized (patternCouplings.formatter) {
                        parse = patternCouplings.formatter.parse(str2);
                    }
                }
            }
            synchronized (dateTimeNoMillisFormatter) {
            }
        }
        return parse;
    }

    public static String parseName(String str) {
        String substring;
        if (str == null) {
            substring = null;
        } else {
            int lastIndexOf = str.lastIndexOf("@");
            substring = lastIndexOf <= 0 ? "" : str.substring(0, lastIndexOf);
        }
        return substring;
    }

    public static String parseResource(String str) {
        String substring;
        if (str == null) {
            substring = null;
        } else {
            int indexOf = str.indexOf("/");
            substring = (indexOf + 1 > str.length() || indexOf < 0) ? "" : str.substring(indexOf + 1);
        }
        return substring;
    }

    public static String parseServer(String str) {
        String substring;
        if (str == null) {
            substring = null;
        } else {
            int lastIndexOf = str.lastIndexOf("@");
            if (lastIndexOf + 1 > str.length()) {
                substring = "";
            } else {
                int indexOf = str.indexOf("/");
                substring = (indexOf <= 0 || indexOf <= lastIndexOf) ? str.substring(lastIndexOf + 1) : str.substring(lastIndexOf + 1, indexOf);
            }
        }
        return substring;
    }

    public static Date parseXEP0082Date(String str) throws ParseException {
        return parseDate(str);
    }

    private static Calendar parseXEP91Date(String str, DateFormat dateFormat) {
        Calendar calendar;
        try {
            synchronized (dateFormat) {
                dateFormat.parse(str);
                calendar = dateFormat.getCalendar();
            }
        } catch (ParseException e) {
            calendar = null;
        }
        return calendar;
    }

    public static String randomString(int i) {
        String str;
        if (i < 1) {
            str = null;
        } else {
            char[] cArr = new char[i];
            for (int i2 = 0; i2 < cArr.length; i2++) {
                cArr[i2] = numbersAndLetters[randGen.nextInt(71)];
            }
            str = new String(cArr);
        }
        return str;
    }

    public static String unescapeNode(String str) {
        String sb;
        if (str == null) {
            sb = null;
        } else {
            char[] charArray = str.toCharArray();
            StringBuilder sb2 = new StringBuilder(charArray.length);
            int i = 0;
            int length = charArray.length;
            while (i < length) {
                char charAt = str.charAt(i);
                if (charAt == '\\' && i + 2 < length) {
                    char c = charArray[i + 1];
                    char c2 = charArray[i + 2];
                    if (c == '2') {
                        switch (c2) {
                            case '0':
                                sb2.append(' ');
                                i += 2;
                                break;
                            case '2':
                                sb2.append('\"');
                                i += 2;
                                break;
                            case '6':
                                sb2.append('&');
                                i += 2;
                                break;
                            case '7':
                                sb2.append('\'');
                                i += 2;
                                break;
                            case HttpStatus.SC_PROCESSING /* 102 */:
                                sb2.append('/');
                                i += 2;
                                break;
                        }
                        i++;
                    } else if (c == '3') {
                        switch (c2) {
                            case 'a':
                                sb2.append(':');
                                i += 2;
                                break;
                            case 'c':
                                sb2.append('<');
                                i += 2;
                                break;
                            case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                                sb2.append('>');
                                i += 2;
                                break;
                        }
                        i++;
                    } else if (c == '4') {
                        if (c2 == '0') {
                            sb2.append("@");
                            i += 2;
                            i++;
                        }
                    } else if (c == '5' && c2 == 'c') {
                        sb2.append("\\");
                        i += 2;
                        i++;
                    }
                }
                sb2.append(charAt);
                i++;
            }
            sb = sb2.toString();
        }
        return sb;
    }
}
