package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTPFileEntryParser.class */
public interface FTPFileEntryParser {
    FTPFile parseFTPEntry(String str);

    List<String> preParse(List<String> list);

    String readNextEntry(BufferedReader bufferedReader) throws IOException;
}
