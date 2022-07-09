package android.net.http;

import java.io.File;

/* loaded from: classes.jar:android/net/http/HttpsConnection.class */
public class HttpsConnection extends Connection {
    protected SslCertificate mCertificate;
    protected AndroidHttpClientConnection mHttpClientConnection;

    HttpsConnection() {
        super(null, null, null);
        throw new RuntimeException("Stub!");
    }

    public static void initializeEngine(File file) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.Connection
    public /* bridge */ /* synthetic */ String toString() {
        return super.toString();
    }
}
