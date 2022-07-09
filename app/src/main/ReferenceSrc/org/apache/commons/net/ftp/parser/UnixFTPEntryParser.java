package org.apache.commons.net.ftp.parser;

import android.support.v4.view.MotionEventCompat;
import java.text.ParseException;
import java.util.List;
import java.util.ListIterator;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/UnixFTPEntryParser.class */
public class UnixFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    static final String DEFAULT_DATE_FORMAT = "MMM d yyyy";
    static final String DEFAULT_RECENT_DATE_FORMAT = "MMM d HH:mm";
    private static final String REGEX = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s*(\\d+)\\s+(?:(\\S+(?:\\s\\S+)*?)\\s+)?(?:(\\S+(?:\\s\\S+)*)\\s+)?(\\d+(?:,\\s*\\d+)?)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)";
    static final String NUMERIC_DATE_FORMAT = "yyyy-MM-dd HH:mm";
    public static final FTPClientConfig NUMERIC_DATE_CONFIG = new FTPClientConfig(FTPClientConfig.SYST_UNIX, NUMERIC_DATE_FORMAT, null, null, null, null);

    public UnixFTPEntryParser() {
        this(null);
    }

    public UnixFTPEntryParser(FTPClientConfig fTPClientConfig) {
        super(REGEX);
        configure(fTPClientConfig);
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_UNIX, "MMM d yyyy", "MMM d HH:mm", null, null, null);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        int i;
        FTPFile fTPFile2 = new FTPFile();
        fTPFile2.setRawListing(str);
        boolean z = false;
        if (matches(str)) {
            String group = group(1);
            String group2 = group(15);
            String group3 = group(16);
            String group4 = group(17);
            String group5 = group(18);
            String str2 = group(19) + " " + group(20);
            String group6 = group(21);
            String group7 = group(22);
            try {
                fTPFile2.setTimestamp(super.parseTimestamp(str2));
            } catch (ParseException e) {
            }
            switch (group.charAt(0)) {
                case MotionEventCompat.AXIS_GENERIC_14 /* 45 */:
                case HttpStatus.SC_PROCESSING /* 102 */:
                    i = 0;
                    break;
                case 'b':
                case 'c':
                    z = true;
                    i = 0;
                    break;
                case 'd':
                    i = 1;
                    break;
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    i = 2;
                    break;
                case 'l':
                    i = 2;
                    break;
                default:
                    i = 3;
                    break;
            }
            fTPFile2.setType(i);
            int i2 = 4;
            int i3 = 0;
            while (i3 < 3) {
                fTPFile2.setPermission(i3, 0, !group(i2).equals("-"));
                fTPFile2.setPermission(i3, 1, !group(i2 + 1).equals("-"));
                String group8 = group(i2 + 2);
                if (group8.equals("-") || Character.isUpperCase(group8.charAt(0))) {
                    fTPFile2.setPermission(i3, 2, false);
                } else {
                    fTPFile2.setPermission(i3, 2, true);
                }
                i3++;
                i2 += 4;
            }
            if (!z) {
                try {
                    fTPFile2.setHardLinkCount(Integer.parseInt(group2));
                } catch (NumberFormatException e2) {
                }
            }
            fTPFile2.setUser(group3);
            fTPFile2.setGroup(group4);
            try {
                fTPFile2.setSize(Long.parseLong(group5));
            } catch (NumberFormatException e3) {
            }
            if (group7 == null) {
                fTPFile2.setName(group6);
                fTPFile = fTPFile2;
            } else {
                String str3 = group6 + group7;
                if (i == 2) {
                    int indexOf = str3.indexOf(" -> ");
                    if (indexOf == -1) {
                        fTPFile2.setName(str3);
                        fTPFile = fTPFile2;
                    } else {
                        fTPFile2.setName(str3.substring(0, indexOf));
                        fTPFile2.setLink(str3.substring(indexOf + 4));
                        fTPFile = fTPFile2;
                    }
                } else {
                    fTPFile2.setName(str3);
                    fTPFile = fTPFile2;
                }
            }
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParserImpl, org.apache.commons.net.ftp.FTPFileEntryParser
    public List<String> preParse(List<String> list) {
        ListIterator<String> listIterator = list.listIterator();
        while (listIterator.hasNext()) {
            if (listIterator.next().matches("^total \\d+$")) {
                listIterator.remove();
            }
        }
        return list;
    }
}
