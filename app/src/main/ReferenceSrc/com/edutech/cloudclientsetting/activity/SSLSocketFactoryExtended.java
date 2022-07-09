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
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import org.apache.commons.net.imap.IMAPSClient;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/SSLSocketFactoryExtended.class */
public class SSLSocketFactoryExtended extends SSLSocketFactory {
    private String[] mCiphers;
    private String[] mProtocols;
    private SSLContext mSSLContext;

    public SSLSocketFactoryExtended() throws NoSuchAlgorithmException, KeyManagementException {
        initSSLSocketFactoryEx(null, null, null);
    }

    private void initSSLSocketFactoryEx(KeyManager[] keyManagerArr, TrustManager[] trustManagerArr, SecureRandom secureRandom) throws NoSuchAlgorithmException, KeyManagementException {
        this.mSSLContext = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
        this.mSSLContext.init(null, new TrustManager[]{new X509TrustManager() { // from class: com.edutech.cloudclientsetting.activity.SSLSocketFactoryExtended.1
            @Override // javax.net.ssl.X509TrustManager
            public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) {
            }

            @Override // javax.net.ssl.X509TrustManager
            public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) {
            }

            @Override // javax.net.ssl.X509TrustManager
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        }}, null);
        this.mProtocols = GetProtocolList();
        this.mCiphers = GetCipherList();
    }

    protected String[] GetCipherList() {
        String[] supportedCipherSuites;
        ArrayList arrayList = new ArrayList();
        for (String str : this.mSSLContext.getSocketFactory().getSupportedCipherSuites()) {
            Log.e("CipherSuite type = ", str);
            arrayList.add(str);
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE]}, finally: {[MOVE, MOVE_EXCEPTION, MOVE, INVOKE, MOVE_EXCEPTION, IF] complete} */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00b8 -> B:8:0x0043). Please submit an issue!!! */
    protected String[] GetProtocolList() {
        String[] strArr;
        String[] strArr2 = {"TLSv1", "TLSv1.1", "TLSv1.2", "TLSv1.3"};
        SSLSocket sSLSocket = null;
        SSLSocket sSLSocket2 = null;
        try {
            try {
                SSLSocket sSLSocket3 = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket();
                sSLSocket2 = sSLSocket3;
                sSLSocket = sSLSocket3;
                String[] supportedProtocols = sSLSocket3.getSupportedProtocols();
                if (sSLSocket3 != null) {
                    try {
                        sSLSocket3.close();
                    } catch (IOException e) {
                    }
                }
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < strArr2.length; i++) {
                    if (Arrays.binarySearch(supportedProtocols, strArr2[i]) >= 0) {
                        arrayList.add(strArr2[i]);
                    }
                }
                strArr = (String[]) arrayList.toArray(new String[0]);
            } catch (Exception e2) {
                sSLSocket = sSLSocket2;
                String[] strArr3 = new String[1];
                strArr3[0] = "TLSv1";
                strArr = strArr3;
                if (sSLSocket2 != null) {
                    try {
                        sSLSocket2.close();
                        strArr = strArr3;
                    } catch (IOException e3) {
                        strArr = strArr3;
                    }
                }
            }
            return strArr;
        } catch (Throwable th) {
            if (sSLSocket != null) {
                try {
                    sSLSocket.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket(str, i);
        sSLSocket.setEnabledProtocols(this.mProtocols);
        sSLSocket.setEnabledCipherSuites(this.mCiphers);
        return sSLSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket(str, i, inetAddress, i2);
        sSLSocket.setEnabledProtocols(this.mProtocols);
        sSLSocket.setEnabledCipherSuites(this.mCiphers);
        return sSLSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket(inetAddress, i);
        sSLSocket.setEnabledProtocols(this.mProtocols);
        sSLSocket.setEnabledCipherSuites(this.mCiphers);
        return sSLSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket(inetAddress, i, inetAddress2, i2);
        sSLSocket.setEnabledProtocols(this.mProtocols);
        sSLSocket.setEnabledCipherSuites(this.mCiphers);
        return sSLSocket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public Socket createSocket(Socket socket, String str, int i, boolean z) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.mSSLContext.getSocketFactory().createSocket(socket, str, i, z);
        sSLSocket.setEnabledProtocols(this.mProtocols);
        sSLSocket.setEnabledCipherSuites(this.mCiphers);
        return sSLSocket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getDefaultCipherSuites() {
        return this.mCiphers;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getSupportedCipherSuites() {
        return this.mCiphers;
    }
}
