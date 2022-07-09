package org.apache.http;

import org.apache.http.util.CharArrayBuffer;

@Deprecated
/* loaded from: classes.jar:org/apache/http/FormattedHeader.class */
public interface FormattedHeader extends Header {
    CharArrayBuffer getBuffer();

    int getValuePos();
}
