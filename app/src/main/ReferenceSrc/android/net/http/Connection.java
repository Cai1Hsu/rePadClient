package android.net.http;

import android.content.Context;
import org.apache.http.HttpHost;

/* loaded from: classes.jar:android/net/http/Connection.class */
abstract class Connection {
    protected SslCertificate mCertificate;
    protected AndroidHttpClientConnection mHttpClientConnection;

    protected Connection(Context context, HttpHost httpHost, RequestFeeder requestFeeder) {
        throw new RuntimeException("Stub!");
    }

    public String toString() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }
}
