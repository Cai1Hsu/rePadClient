package android.net.http;

/* loaded from: classes.jar:android/net/http/LoggingEventHandler.class */
public class LoggingEventHandler implements EventHandler {
    public LoggingEventHandler() {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void certificate(SslCertificate sslCertificate) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void data(byte[] bArr, int i) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void endData() {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void error(int i, String str) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public boolean handleSslErrorRequest(SslError sslError) {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void headers(Headers headers) {
        throw new RuntimeException("Stub!");
    }

    public void locationChanged(String str, boolean z) {
        throw new RuntimeException("Stub!");
    }

    public void requestSent() {
        throw new RuntimeException("Stub!");
    }

    @Override // android.net.http.EventHandler
    public void status(int i, int i2, int i3, String str) {
        throw new RuntimeException("Stub!");
    }
}
