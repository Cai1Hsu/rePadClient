package com.edutech.idauthentication;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;
import org.apache.http.conn.ssl.SSLSocketFactory;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MySSLSocketFactory extends SSLSocketFactory {
    SSLContext sslContext;

    public MySSLSocketFactory(KeyStore truststore) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        super(truststore);
        this.sslContext = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
        TrustManager tm = new AnonymousClass1();
        this.sslContext.init(null, new TrustManager[]{tm}, null);
    }

    /* renamed from: com.edutech.idauthentication.MySSLSocketFactory$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements X509TrustManager {
        AnonymousClass1() {
            MySSLSocketFactory.this = r1;
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }
    }

    public MySSLSocketFactory(SSLContext context) throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException, UnrecoverableKeyException {
        super(null);
        this.sslContext = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
        this.sslContext = context;
    }

    @Override // org.apache.http.conn.ssl.SSLSocketFactory, org.apache.http.conn.scheme.LayeredSocketFactory
    public Socket createSocket(Socket socket, String host, int port, boolean autoClose) throws IOException, UnknownHostException {
        return this.sslContext.getSocketFactory().createSocket(socket, host, port, autoClose);
    }

    @Override // org.apache.http.conn.ssl.SSLSocketFactory, org.apache.http.conn.scheme.SocketFactory
    public Socket createSocket() throws IOException {
        return this.sslContext.getSocketFactory().createSocket();
    }
}
