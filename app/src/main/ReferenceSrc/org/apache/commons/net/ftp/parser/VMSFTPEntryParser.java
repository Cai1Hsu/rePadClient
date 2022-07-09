package org.apache.commons.net.ftp.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.StringTokenizer;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPListParseEngine;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/VMSFTPEntryParser.class */
public class VMSFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    private static final String DEFAULT_DATE_FORMAT = "d-MMM-yyyy HH:mm:ss";
    private static final String REGEX = "(.*;[0-9]+)\\s*(\\d+)/\\d+\\s*(\\S+)\\s+(\\S+)\\s+\\[(([0-9$A-Za-z_]+)|([0-9$A-Za-z_]+),([0-9$a-zA-Z_]+))\\]?\\s*\\([a-zA-Z]*,([a-zA-Z]*),([a-zA-Z]*),([a-zA-Z]*)\\)";

    public VMSFTPEntryParser() {
        this(null);
    }

    public VMSFTPEntryParser(FTPClientConfig fTPClientConfig) {
        super(REGEX);
        configure(fTPClientConfig);
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_VMS, DEFAULT_DATE_FORMAT, null, null, null, null);
    }

    protected boolean isVersioning() {
        return false;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:39:0x017f -> B:6:0x006b). Please submit an issue!!! */
    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        String nextToken;
        String nextToken2;
        if (matches(str)) {
            FTPFile fTPFile2 = new FTPFile();
            fTPFile2.setRawListing(str);
            String group = group(1);
            String group2 = group(2);
            String str2 = group(3) + " " + group(4);
            String group3 = group(5);
            String group4 = group(9);
            String group5 = group(10);
            String group6 = group(11);
            try {
                fTPFile2.setTimestamp(super.parseTimestamp(str2));
            } catch (ParseException e) {
            }
            StringTokenizer stringTokenizer = new StringTokenizer(group3, ",");
            switch (stringTokenizer.countTokens()) {
                case 1:
                    nextToken = null;
                    nextToken2 = stringTokenizer.nextToken();
                    break;
                case 2:
                    nextToken = stringTokenizer.nextToken();
                    nextToken2 = stringTokenizer.nextToken();
                    break;
                default:
                    nextToken = null;
                    nextToken2 = null;
                    break;
            }
            if (group.lastIndexOf(".DIR") != -1) {
                fTPFile2.setType(1);
            } else {
                fTPFile2.setType(0);
            }
            if (isVersioning()) {
                fTPFile2.setName(group);
            } else {
                fTPFile2.setName(group.substring(0, group.lastIndexOf(";")));
            }
            fTPFile2.setSize(Long.parseLong(group2) * 512);
            fTPFile2.setGroup(nextToken);
            fTPFile2.setUser(nextToken2);
            int i = 0;
            while (true) {
                fTPFile = fTPFile2;
                if (i < 3) {
                    String str3 = new String[]{group4, group5, group6}[i];
                    fTPFile2.setPermission(i, 0, str3.indexOf(82) >= 0);
                    fTPFile2.setPermission(i, 1, str3.indexOf(87) >= 0);
                    fTPFile2.setPermission(i, 2, str3.indexOf(69) >= 0);
                    i++;
                }
            }
        } else {
            fTPFile = null;
        }
        return fTPFile;
    }

    @Deprecated
    public FTPFile[] parseFileList(InputStream inputStream) throws IOException {
        FTPListParseEngine fTPListParseEngine = new FTPListParseEngine(this);
        fTPListParseEngine.readServerList(inputStream, null);
        return fTPListParseEngine.getFiles();
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParserImpl, org.apache.commons.net.ftp.FTPFileEntryParser
    public String readNextEntry(BufferedReader bufferedReader) throws IOException {
        String readLine = bufferedReader.readLine();
        StringBuilder sb = new StringBuilder();
        while (readLine != null) {
            if (readLine.startsWith("Directory") || readLine.startsWith("Total")) {
                readLine = bufferedReader.readLine();
            } else {
                sb.append(readLine);
                if (readLine.trim().endsWith(")")) {
                    break;
                }
                readLine = bufferedReader.readLine();
            }
        }
        return sb.length() == 0 ? null : sb.toString();
    }
}
