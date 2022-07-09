package org.apache.commons.net.ftp.parser;

import java.text.ParseException;
import java.util.List;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.tools.ant.taskdefs.Manifest;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/MVSFTPEntryParser.class */
public class MVSFTPEntryParser extends ConfigurableFTPFileEntryParserImpl {
    static final String DEFAULT_DATE_FORMAT = "yyyy/MM/dd HH:mm";
    static final String FILE_LIST_REGEX = "\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s+[FV]\\S*\\s+\\S+\\s+\\S+\\s+(PS|PO|PO-E)\\s+(\\S+)\\s*";
    static final int FILE_LIST_TYPE = 0;
    static final String JES_LEVEL_1_LIST_REGEX = "(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s*";
    static final int JES_LEVEL_1_LIST_TYPE = 3;
    static final String JES_LEVEL_2_LIST_REGEX = "(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+).*";
    static final int JES_LEVEL_2_LIST_TYPE = 4;
    static final String MEMBER_LIST_REGEX = "(\\S+)\\s+\\S+\\s+\\S+\\s+(\\S+)\\s+(\\S+)\\s+\\S+\\s+\\S+\\s+\\S+\\s+\\S+\\s*";
    static final int MEMBER_LIST_TYPE = 1;
    static final int UNIX_LIST_TYPE = 2;
    static final int UNKNOWN_LIST_TYPE = -1;
    private int isType = -1;
    private UnixFTPEntryParser unixFTPEntryParser;

    public MVSFTPEntryParser() {
        super("");
        super.configure(null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x004d, code lost:
        if ("PO-E".equals(r0) != false) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean parseFileList(FTPFile fTPFile, String str) {
        boolean z = false;
        if (matches(str)) {
            fTPFile.setRawListing(str);
            String group = group(2);
            String group2 = group(1);
            fTPFile.setName(group);
            if ("PS".equals(group2)) {
                fTPFile.setType(0);
            } else {
                if (!"PO".equals(group2)) {
                    z = false;
                }
                fTPFile.setType(1);
            }
            z = true;
        }
        return z;
    }

    private boolean parseJeslevel1List(FTPFile fTPFile, String str) {
        boolean z = false;
        if (matches(str)) {
            z = false;
            if (group(3).equalsIgnoreCase("OUTPUT")) {
                fTPFile.setRawListing(str);
                fTPFile.setName(group(2));
                fTPFile.setType(0);
                z = true;
            }
        }
        return z;
    }

    private boolean parseJeslevel2List(FTPFile fTPFile, String str) {
        boolean z = false;
        if (matches(str)) {
            z = false;
            if (group(4).equalsIgnoreCase("OUTPUT")) {
                fTPFile.setRawListing(str);
                fTPFile.setName(group(2));
                fTPFile.setType(0);
                z = true;
            }
        }
        return z;
    }

    private boolean parseMemberList(FTPFile fTPFile, String str) {
        boolean z = true;
        if (matches(str)) {
            fTPFile.setRawListing(str);
            String str2 = group(2) + " " + group(3);
            fTPFile.setName(group(1));
            fTPFile.setType(0);
            try {
                fTPFile.setTimestamp(super.parseTimestamp(str2));
            } catch (ParseException e) {
                e.printStackTrace();
                z = false;
            }
        } else {
            z = false;
        }
        return z;
    }

    private boolean parseSimpleEntry(FTPFile fTPFile, String str) {
        boolean z = false;
        if (str != null) {
            z = false;
            if (str.length() > 0) {
                fTPFile.setRawListing(str);
                fTPFile.setName(str.split(" ")[0]);
                fTPFile.setType(0);
                z = true;
            }
        }
        return z;
    }

    private boolean parseUnixList(FTPFile fTPFile, String str) {
        return this.unixFTPEntryParser.parseFTPEntry(str) != null;
    }

    @Override // org.apache.commons.net.ftp.parser.ConfigurableFTPFileEntryParserImpl
    protected FTPClientConfig getDefaultConfiguration() {
        return new FTPClientConfig(FTPClientConfig.SYST_MVS, DEFAULT_DATE_FORMAT, null, null, null, null);
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    public FTPFile parseFTPEntry(String str) {
        boolean z = false;
        FTPFile fTPFile = new FTPFile();
        if (this.isType == 0) {
            z = parseFileList(fTPFile, str);
        } else if (this.isType == 1) {
            boolean parseMemberList = parseMemberList(fTPFile, str);
            z = parseMemberList;
            if (!parseMemberList) {
                z = parseSimpleEntry(fTPFile, str);
            }
        } else if (this.isType == 2) {
            z = parseUnixList(fTPFile, str);
        } else if (this.isType == 3) {
            z = parseJeslevel1List(fTPFile, str);
        } else if (this.isType == 4) {
            z = parseJeslevel2List(fTPFile, str);
        }
        FTPFile fTPFile2 = fTPFile;
        if (!z) {
            fTPFile2 = null;
        }
        return fTPFile2;
    }

    @Override // org.apache.commons.net.ftp.FTPFileEntryParserImpl, org.apache.commons.net.ftp.FTPFileEntryParser
    public List<String> preParse(List<String> list) {
        if (list != null && list.size() > 0) {
            String str = list.get(0);
            if (str.indexOf("Volume") >= 0 && str.indexOf("Dsname") >= 0) {
                setType(0);
                super.setRegex(FILE_LIST_REGEX);
            } else if (str.indexOf(Manifest.ATTRIBUTE_NAME) >= 0 && str.indexOf("Id") >= 0) {
                setType(1);
                super.setRegex(MEMBER_LIST_REGEX);
            } else if (str.indexOf("total") == 0) {
                setType(2);
                this.unixFTPEntryParser = new UnixFTPEntryParser();
            } else if (str.indexOf("Spool Files") >= 30) {
                setType(3);
                super.setRegex(JES_LEVEL_1_LIST_REGEX);
            } else if (str.indexOf("JOBNAME") != 0 || str.indexOf("JOBID") <= 8) {
                setType(-1);
            } else {
                setType(4);
                super.setRegex(JES_LEVEL_2_LIST_REGEX);
            }
            if (this.isType != 3) {
                list.remove(0);
            }
        }
        return list;
    }

    void setType(int i) {
        this.isType = i;
    }
}
