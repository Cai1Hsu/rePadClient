package org.apache.commons.net.ftp.parser;

import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPFileEntryParser;
import org.apache.commons.net.ftp.FTPFileEntryParserImpl;

/* loaded from: classes.jar:org/apache/commons/net/ftp/parser/CompositeFileEntryParser.class */
public class CompositeFileEntryParser extends FTPFileEntryParserImpl {
    private FTPFileEntryParser cachedFtpFileEntryParser = null;
    private final FTPFileEntryParser[] ftpFileEntryParsers;

    public CompositeFileEntryParser(FTPFileEntryParser[] fTPFileEntryParserArr) {
        this.ftpFileEntryParsers = fTPFileEntryParserArr;
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x0013, code lost:
        if (r4 != null) goto L6;
     */
    @Override // org.apache.commons.net.ftp.FTPFileEntryParser
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public FTPFile parseFTPEntry(String str) {
        FTPFile fTPFile;
        if (this.cachedFtpFileEntryParser != null) {
            fTPFile = this.cachedFtpFileEntryParser.parseFTPEntry(str);
        } else {
            for (int i = 0; i < this.ftpFileEntryParsers.length; i++) {
                FTPFileEntryParser fTPFileEntryParser = this.ftpFileEntryParsers[i];
                FTPFile parseFTPEntry = fTPFileEntryParser.parseFTPEntry(str);
                if (parseFTPEntry != null) {
                    this.cachedFtpFileEntryParser = fTPFileEntryParser;
                    fTPFile = parseFTPEntry;
                    break;
                }
            }
            fTPFile = null;
        }
        return fTPFile;
    }
}
