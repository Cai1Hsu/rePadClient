package org.apache.commons.net.ftp.parser;

import java.util.Calendar;
import org.apache.commons.net.ftp.FTPFile;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/EnterpriseUnixFTPEntryParser.class */
public class EnterpriseUnixFTPEntryParser extends RegexFTPFileEntryParserImpl {
    private static final String MONTHS = "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)";
    private static final String REGEX = "(([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z])([\\-]|[A-Z]))(\\S*)\\s*(\\S+)\\s*(\\S*)\\s*(\\d*)\\s*(\\d*)\\s*(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\\s*((?:[012]\\d*)|(?:3[01]))\\s*((\\d\\d\\d\\d)|((?:[01]\\d)|(?:2[0123])):([012345]\\d))\\s(\\S*)(\\s*.*)";

    public EnterpriseUnixFTPEntryParser() {
        super(REGEX);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0112 -> B:6:0x0074). Please submit an issue!!! */
    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        FTPFile fTPFile2 = new FTPFile();
        fTPFile2.setRawListing(str);
        if (matches(str)) {
            String group = group(14);
            String group2 = group(15);
            String group3 = group(16);
            String group4 = group(17);
            String group5 = group(18);
            String group6 = group(20);
            String group7 = group(21);
            String group8 = group(22);
            String group9 = group(23);
            fTPFile2.setType(0);
            fTPFile2.setUser(group);
            fTPFile2.setGroup(group2);
            try {
                fTPFile2.setSize(Long.parseLong(group3));
            } catch (NumberFormatException e) {
            }
            Calendar calendar = Calendar.getInstance();
            calendar.set(14, 0);
            calendar.set(13, 0);
            calendar.set(12, 0);
            calendar.set(11, 0);
            try {
                int indexOf = MONTHS.indexOf(group4) / 4;
                if (group6 != null) {
                    calendar.set(1, Integer.parseInt(group6));
                } else {
                    int i = calendar.get(1);
                    int i2 = i;
                    if (calendar.get(2) < indexOf) {
                        i2 = i - 1;
                    }
                    calendar.set(1, i2);
                    calendar.set(11, Integer.parseInt(group7));
                    calendar.set(12, Integer.parseInt(group8));
                }
                calendar.set(2, indexOf);
                calendar.set(5, Integer.parseInt(group5));
                fTPFile2.setTimestamp(calendar);
            } catch (NumberFormatException e2) {
            }
            fTPFile2.setName(group9);
            fTPFile = fTPFile2;
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }
}
