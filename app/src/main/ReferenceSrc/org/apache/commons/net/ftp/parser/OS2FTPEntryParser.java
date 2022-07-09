package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/OS2FTPEntryParser.class */
public class OS2FTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    private static final String DEFAULT_DATE_FORMAT = "MM-dd-yy HH:mm";
    private static final String REGEX = "\\s*([0-9]+)\\s*(\\s+|[A-Z]+)\\s*(DIR|\\s+)\\s*(\\S+)\\s+(\\S+)\\s+(\\S.*)";

    public OS2FTPEntryParser() {
        this(null);
    }

    public OS2FTPEntryParser(FTPClientConfig fTPClientConfig) {
        super(REGEX);
        configure(fTPClientConfig);
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_OS2, DEFAULT_DATE_FORMAT, null, null, null, null);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        FTPFile fTPFile2 = new FTPFile();
        if (matches(str)) {
            String group = group(1);
            String group2 = group(2);
            String group3 = group(3);
            String str2 = group(4) + " " + group(5);
            String group4 = group(6);
            try {
                fTPFile2.setTimestamp(super.parseTimestamp(str2));
            } catch (ParseException e) {
            }
            if (group3.trim().equals("DIR") || group2.trim().equals("DIR")) {
                fTPFile2.setType(1);
            } else {
                fTPFile2.setType(0);
            }
            fTPFile2.setName(group4.trim());
            fTPFile2.setSize(Long.parseLong(group.trim()));
            fTPFile = fTPFile2;
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }
}
