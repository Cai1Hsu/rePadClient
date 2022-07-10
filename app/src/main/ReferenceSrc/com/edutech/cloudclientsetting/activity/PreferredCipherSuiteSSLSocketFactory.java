package com.edutech.cloudclientsetting.activity;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PreferredCipherSuiteSSLSocketFactory extends SSLSocketFactory {
    private static final String PREFERRED_CIPHER_SUITE = "SSL_RSA_WITH_RC4_128_MD5";
    private final SSLSocketFactory delegate;

    public PreferredCipherSuiteSSLSocketFactory(SSLSocketFactory delegate) {
        this.delegate = delegate;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getDefaultCipherSuites() {
        return setupPreferredDefaultCipherSuites(this.delegate);
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public String[] getSupportedCipherSuites() {
        return setupPreferredSupportedCipherSuites(this.delegate);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String arg0, int arg1) throws IOException, UnknownHostException {
        Socket socket = this.delegate.createSocket(arg0, arg1);
        String[] cipherSuites = setupPreferredDefaultCipherSuites(this.delegate);
        ((SSLSocket) socket).setEnabledCipherSuites(cipherSuites);
        return socket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress arg0, int arg1) throws IOException {
        Socket socket = this.delegate.createSocket(arg0, arg1);
        String[] cipherSuites = setupPreferredDefaultCipherSuites(this.delegate);
        ((SSLSocket) socket).setEnabledCipherSuites(cipherSuites);
        return socket;
    }

    @Override // javax.net.ssl.SSLSocketFactory
    public Socket createSocket(Socket arg0, String arg1, int arg2, boolean arg3) throws IOException {
        Socket socket = this.delegate.createSocket(arg0, arg1, arg2, arg3);
        String[] cipherSuites = setupPreferredDefaultCipherSuites(this.delegate);
        ((SSLSocket) socket).setEnabledCipherSuites(cipherSuites);
        return socket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String arg0, int arg1, InetAddress arg2, int arg3) throws IOException, UnknownHostException {
        Socket socket = this.delegate.createSocket(arg0, arg1, arg2, arg3);
        String[] cipherSuites = setupPreferredDefaultCipherSuites(this.delegate);
        ((SSLSocket) socket).setEnabledCipherSuites(cipherSuites);
        return socket;
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress arg0, int arg1, InetAddress arg2, int arg3) throws IOException {
        Socket socket = this.delegate.createSocket(arg0, arg1, arg2, arg3);
        String[] cipherSuites = setupPreferredDefaultCipherSuites(this.delegate);
        ((SSLSocket) socket).setEnabledCipherSuites(cipherSuites);
        return socket;
    }

    private static String[] setupPreferredDefaultCipherSuites(SSLSocketFactory sslSocketFactory) {
        String[] defaultCipherSuites = sslSocketFactory.getDefaultCipherSuites();
        ArrayList<String> suitesList = new ArrayList<>(Arrays.asList(defaultCipherSuites));
        suitesList.remove(PREFERRED_CIPHER_SUITE);
        suitesList.add(0, PREFERRED_CIPHER_SUITE);
        return (String[]) suitesList.toArray(new String[suitesList.size()]);
    }

    private static String[] setupPreferredSupportedCipherSuites(SSLSocketFactory sslSocketFactory) {
        String[] supportedCipherSuites = sslSocketFactory.getSupportedCipherSuites();
        ArrayList<String> suitesList = new ArrayList<>(Arrays.asList(supportedCipherSuites));
        suitesList.remove(PREFERRED_CIPHER_SUITE);
        suitesList.add(0, PREFERRED_CIPHER_SUITE);
        return (String[]) suitesList.toArray(new String[suitesList.size()]);
    }
}
