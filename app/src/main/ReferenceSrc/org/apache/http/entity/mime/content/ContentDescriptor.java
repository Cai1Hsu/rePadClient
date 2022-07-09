package org.apache.http.entity.mime.content;

/* loaded from: classes.jar:org/apache/http/entity/mime/content/ContentDescriptor.class */
public interface ContentDescriptor {
    String getCharset();

    long getContentLength();

    String getMediaType();

    String getMimeType();

    String getSubType();

    String getTransferEncoding();
}
