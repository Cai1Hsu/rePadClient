package com.edutech.cloudclientsetting.activity;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/PreferredCipherSuiteSSLSocketFactory.class */
public class PreferredCipherSuiteSSLSocketFactory extends SSLSocketFactory {
    private static final String PREFERRED_CIPHER_SUITE = "SSL_RSA_WITH_RC4_128_MD5";
    private final SSLSocketFactory delegate;

    public PreferredCipherSuiteSSLSocketFactory(SSLSocketFactory sSLSocketFactory) {
        this.delegate = sSLSocketFactory;
    }

    private static String[] setupPreferredDefaultCipherSuites(SSLSocketFactory sSLSocketFactory) {
        ArrayList arrayList = new ArrayList(Arrays.asList(sSLSocketFactory.getDefaultCipherSuites()));
        arrayList.remove(PREFERRED_CIPHER_SUITE);
        arrayList.add(0, PREFERRED_CIPHER_SUITE);
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    private static String[] setupPreferredSupportedCipherSuites(SSLSocketFactory sSLSocketFactory) {
        ArrayList arrayList = new ArrayList(Arrays.asList(sSLSocketFactory.getSupportedCipherSuites()));
        arrayList.remove(PREFERRED_CIPHER_SUITE);
        arrayList.add(0, PREFERRED_CIPHER_SUITE);
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i) throws IOException, UnknownHostException {
        Socket createSocket = this.delegate.createSocket(str, i);
        ((SSLSocket) createSocket).setEnabledCipherSuites(setupPreferredDefaultCipherSuites(this.delegate));
        return createSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException, UnknownHostException {
        Socket createSocket = this.delegate.createSocket(str, i, inetAddress, i2);
        ((SSLSocket) createSocket).setEnabledCipherSuites(setupPreferredDefaultCipherSuites(this.delegate));
        return createSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i) throws IOException {
        Socket createSocket = this.delegate.createSocket(inetAddress, i);
        ((SSLSocket) createSocket).setEnabledCipherSuites(setupPreferredDefaultCipherSuites(this.delegate));
        return createSocket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws IOException {
        Socket createSocket = this.delegate.createSocket(inetAddress, i, inetAddress2, i2);
        ((SSLSocket) createSocket).setEnabledCipherSuites(setupPreferredDefaultCipherSuites(this.delegate));
        return createSocket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public Socket createSocket(Socket socket, String str, int i, boolean z) throws IOException {
        Socket createSocket = this.delegate.createSocket(socket, str, i, z);
        ((SSLSocket) createSocket).setEnabledCipherSuites(setupPreferredDefaultCipherSuites(this.delegate));
        return createSocket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getDefaultCipherSuites() {
        return setupPreferredDefaultCipherSuites(this.delegate);
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getSupportedCipherSuites() {
        return setupPreferredSupportedCipherSuites(this.delegate);
    }
}
