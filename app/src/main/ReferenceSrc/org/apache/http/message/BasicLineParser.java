package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.ParseException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
/* loaded from: classes.jar:org/apache/http/message/BasicLineParser.class */
public class BasicLineParser implements LineParser {
    public static final BasicLineParser DEFAULT = null;
    protected final ProtocolVersion protocol;

    public BasicLineParser() {
        throw new RuntimeException("Stub!");
    }

    public BasicLineParser(ProtocolVersion protocolVersion) {
        throw new RuntimeException("Stub!");
    }

    public static final Header parseHeader(String str, LineParser lineParser) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    public static final ProtocolVersion parseProtocolVersion(String str, LineParser lineParser) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    public static final RequestLine parseRequestLine(String str, LineParser lineParser) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    public static final StatusLine parseStatusLine(String str, LineParser lineParser) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    protected ProtocolVersion createProtocolVersion(int i, int i2) {
        throw new RuntimeException("Stub!");
    }

    protected RequestLine createRequestLine(String str, String str2, ProtocolVersion protocolVersion) {
        throw new RuntimeException("Stub!");
    }

    protected StatusLine createStatusLine(ProtocolVersion protocolVersion, int i, String str) {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.message.LineParser
    public boolean hasProtocolVersion(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.message.LineParser
    public Header parseHeader(CharArrayBuffer charArrayBuffer) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.message.LineParser
    public ProtocolVersion parseProtocolVersion(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.message.LineParser
    public RequestLine parseRequestLine(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.message.LineParser
    public StatusLine parseStatusLine(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) throws ParseException {
        throw new RuntimeException("Stub!");
    }

    protected void skipWhitespace(CharArrayBuffer charArrayBuffer, ParserCursor parserCursor) {
        throw new RuntimeException("Stub!");
    }
}
