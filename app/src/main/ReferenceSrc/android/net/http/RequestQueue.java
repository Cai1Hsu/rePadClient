package android.net.http;

import android.content.Context;
import android.net.compatibility.WebAddress;
import java.io.InputStream;
import java.util.Map;
import org.apache.http.HttpHost;

/* loaded from: classes.jar:android/net/http/RequestQueue.class */
public class RequestQueue implements RequestFeeder {
    public RequestQueue(Context context) {
        throw new RuntimeException("Stub!");
    }

    public RequestQueue(Context context, int i) {
        throw new RuntimeException("Stub!");
    }

    public void disablePlatformNotifications() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public void enablePlatformNotifications() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public HttpHost getProxyHost() {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.RequestFeeder
    public Request getRequest() {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // android.net.http.RequestFeeder
    public Request getRequest(HttpHost httpHost) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    @Override // android.net.http.RequestFeeder
    public boolean haveRequest(HttpHost httpHost) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public RequestHandle queueRequest(String str, WebAddress webAddress, String str2, Map<String, String> map, EventHandler eventHandler, InputStream inputStream, int i) {
        throw new RuntimeException("Stub!");
    }

    public RequestHandle queueRequest(String str, String str2, Map<String, String> map, EventHandler eventHandler, InputStream inputStream, int i) {
        throw new RuntimeException("Stub!");
    }

    protected void queueRequest(Request request, boolean z) {
        synchronized (this) {
            throw new RuntimeException("Stub!");
        }
    }

    public RequestHandle queueSynchronousRequest(String str, WebAddress webAddress, String str2, Map<String, String> map, EventHandler eventHandler, InputStream inputStream, int i) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.RequestFeeder
    public void requeueRequest(Request request) {
        throw new RuntimeException("Stub!");
    }

    public void shutdown() {
        throw new RuntimeException("Stub!");
    }

    public void startTiming() {
        throw new RuntimeException("Stub!");
    }

    public void stopTiming() {
        throw new RuntimeException("Stub!");
    }
}
