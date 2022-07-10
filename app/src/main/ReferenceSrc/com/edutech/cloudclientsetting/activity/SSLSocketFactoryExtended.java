package com.edutech.cloudclientsetting.activity;

import android.util.Log;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class SSLSocketFactoryExtended extends SSLSocketFactory {
    private String[] mCiphers;
    private String[] mProtocols;
    private SSLContext mSSLContext;

    public SSLSocketFactoryExtended() throws NoSuchAlgorithmException, KeyManagementException {
        initSSLSocketFactoryEx(null, null, null);
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getDefaultCipherSuites() {
        return this.mCiphers;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getSupportedCipherSuites() {
        return this.mCiphers;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public Socket createSocket(Socket s, String host, int port, boolean autoClose) throws IOException {
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        SSLSocket ss = (SSLSocket) factory.createSocket(s, host, port, autoClose);
        ss.setEnabledProtocols(this.mProtocols);
        ss.setEnabledCipherSuites(this.mCiphers);
        return ss;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress address, int port, InetAddress localAddress, int localPort) throws IOException {
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        SSLSocket ss = (SSLSocket) factory.createSocket(address, port, localAddress, localPort);
        ss.setEnabledProtocols(this.mProtocols);
        ss.setEnabledCipherSuites(this.mCiphers);
        return ss;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port, InetAddress localHost, int localPort) throws IOException {
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        SSLSocket ss = (SSLSocket) factory.createSocket(host, port, localHost, localPort);
        ss.setEnabledProtocols(this.mProtocols);
        ss.setEnabledCipherSuites(this.mCiphers);
        return ss;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress host, int port) throws IOException {
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        SSLSocket ss = (SSLSocket) factory.createSocket(host, port);
        ss.setEnabledProtocols(this.mProtocols);
        ss.setEnabledCipherSuites(this.mCiphers);
        return ss;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String host, int port) throws IOException {
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        SSLSocket ss = (SSLSocket) factory.createSocket(host, port);
        ss.setEnabledProtocols(this.mProtocols);
        ss.setEnabledCipherSuites(this.mCiphers);
        return ss;
    }

    private void initSSLSocketFactoryEx(KeyManager[] km, TrustManager[] tm, SecureRandom random) throws NoSuchAlgorithmException, KeyManagementException {
        this.mSSLContext = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
        TrustManager[] trustAllCerts = {new AnonymousClass1()};
        this.mSSLContext.init(null, trustAllCerts, null);
        this.mProtocols = GetProtocolList();
        this.mCiphers = GetCipherList();
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.SSLSocketFactoryExtended$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements X509TrustManager {
        AnonymousClass1() {
            SSLSocketFactoryExtended.this = r1;
        }

        @Override // javax.net.ssl.X509TrustManager
        public X509Certificate[] getAcceptedIssuers() {
            X509Certificate[] myTrustedAnchors = new X509Certificate[0];
            return myTrustedAnchors;
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkClientTrusted(X509Certificate[] certs, String authType) {
        }

        @Override // javax.net.ssl.X509TrustManager
        public void checkServerTrusted(X509Certificate[] certs, String authType) {
        }
    }

    protected String[] GetProtocolList() {
        String[] protocols = {"TLSv1", "TLSv1.1", "TLSv1.2", "TLSv1.3"};
        SSLSocket socket = null;
        try {
            try {
                SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
                socket = (SSLSocket) factory.createSocket();
                String[] availableProtocols = socket.getSupportedProtocols();
                if (socket != null) {
                    try {
                        socket.close();
                    } catch (IOException e) {
                    }
                }
                List<String> resultList = new ArrayList<>();
                for (int i = 0; i < protocols.length; i++) {
                    int idx = Arrays.binarySearch(availableProtocols, protocols[i]);
                    if (idx >= 0) {
                        resultList.add(protocols[i]);
                    }
                }
                return (String[]) resultList.toArray(new String[0]);
            } catch (Throwable th) {
                if (socket != null) {
                    try {
                        socket.close();
                    } catch (IOException e2) {
                    }
                }
                throw th;
            }
        } catch (Exception e3) {
            String[] strArr = {"TLSv1"};
            if (socket == null) {
                return strArr;
            }
            try {
                socket.close();
                return strArr;
            } catch (IOException e4) {
                return strArr;
            }
        }
    }

    protected String[] GetCipherList() {
        String[] supportedCipherSuites;
        List<String> resultList = new ArrayList<>();
        SSLSocketFactory factory = this.mSSLContext.getSocketFactory();
        for (String s : factory.getSupportedCipherSuites()) {
            Log.e("CipherSuite type = ", s);
            resultList.add(s);
        }
        return (String[]) resultList.toArray(new String[resultList.size()]);
    }
}
