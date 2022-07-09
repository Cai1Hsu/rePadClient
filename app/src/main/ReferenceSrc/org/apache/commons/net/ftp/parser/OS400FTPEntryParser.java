package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/OS400FTPEntryParser.class */
public class OS400FTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    private static final String DEFAULT_DATE_FORMAT = "yy/MM/dd HH:mm:ss";
    private static final String REGEX = "(\\S+)\\s+(\\d+)\\s+(\\S+)\\s+(\\S+)\\s+(\\*\\S+)\\s+(\\S+/?)\\s*";

    public OS400FTPEntryParser() {
        this(null);
    }

    public OS400FTPEntryParser(FTPClientConfig fTPClientConfig) {
        super(REGEX);
        configure(fTPClientConfig);
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_OS400, DEFAULT_DATE_FORMAT, null, null, null, null);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        FTPFile fTPFile2 = new FTPFile();
        fTPFile2.setRawListing(str);
        if (matches(str)) {
            String group = group(1);
            String group2 = group(2);
            String str2 = group(3) + " " + group(4);
            String group3 = group(5);
            String group4 = group(6);
            try {
                fTPFile2.setTimestamp(super.parseTimestamp(str2));
            } catch (ParseException e) {
            }
            fTPFile2.setType(group3.equalsIgnoreCase("*STMF") ? 0 : group3.equalsIgnoreCase("*DIR") ? 1 : 3);
            fTPFile2.setUser(group);
            try {
                fTPFile2.setSize(Long.parseLong(group2));
            } catch (NumberFormatException e2) {
            }
            String str3 = group4;
            if (group4.endsWith("/")) {
                str3 = group4.substring(0, group4.length() - 1);
            }
            int lastIndexOf = str3.lastIndexOf(47);
            String str4 = str3;
            if (lastIndexOf > -1) {
                str4 = str3.substring(lastIndexOf + 1);
            }
            fTPFile2.setName(str4);
            fTPFile = fTPFile2;
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }
}
