package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.HttpMessage;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.message.LineFormatter;
import org.apache.http.params.HttpParams;

@Deprecated
/* loaded from: classes.jar:org/apache/http/impl/io/HttpRequestWriter.class */
public class HttpRequestWriter extends AbstractMessageWriter {
    public HttpRequestWriter(SessionOutputBuffer sessionOutputBuffer, LineFormatter lineFormatter, HttpParams httpParams) {
        super(null, null, null);
        throw new RuntimeException("Stub!");
    }

    @Override // org.apache.http.impl.io.AbstractMessageWriter
    protected void writeHeadLine(HttpMessage httpMessage) throws IOException {
        throw new RuntimeException("Stub!");
    }
}
