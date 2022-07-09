package org.apache.commons.net.ftp.parser;

import android.support.v4.view.MotionEventCompat;
import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/MacOsPeterFTPEntryParser.class */
public class MacOsPeterFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    static final String DEFAULT_DATE_FORMAT = "MMM d yyyy";
    static final String DEFAULT_RECENT_DATE_FORMAT = "MMM d HH:mm";
    private static final String REGEX = "([bcdelfmpSs-])(((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-]))((r|-)(w|-)([xsStTL-])))\\+?\\s+((folder\\s+)|((\\d+)\\s+(\\d+)\\s+))(\\d+)\\s+((?:\\d+[-/]\\d+[-/]\\d+)|(?:\\S{3}\\s+\\d{1,2})|(?:\\d{1,2}\\s+\\S{3}))\\s+(\\d+(?::\\d+)?)\\s+(\\S*)(\\s*.*)";

    public MacOsPeterFTPEntryParser() {
        this(null);
    }

    public MacOsPeterFTPEntryParser(FTPClientConfig fTPClientConfig) {
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
            String group2 = group(20);
            String str2 = group(21) + " " + group(22);
            String group3 = group(23);
            String group4 = group(24);
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
                String group5 = group(i2 + 2);
                if (group5.equals("-") || Character.isUpperCase(group5.charAt(0))) {
                    fTPFile2.setPermission(i3, 2, false);
                } else {
                    fTPFile2.setPermission(i3, 2, true);
                }
                i3++;
                i2 += 4;
            }
            if (!z) {
                try {
                    fTPFile2.setHardLinkCount(Integer.parseInt("0"));
                } catch (NumberFormatException e2) {
                }
            }
            fTPFile2.setUser(null);
            fTPFile2.setGroup(null);
            try {
                fTPFile2.setSize(Long.parseLong(group2));
            } catch (NumberFormatException e3) {
            }
            if (group4 == null) {
                fTPFile2.setName(group3);
                fTPFile = fTPFile2;
            } else {
                String str3 = group3 + group4;
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
}
