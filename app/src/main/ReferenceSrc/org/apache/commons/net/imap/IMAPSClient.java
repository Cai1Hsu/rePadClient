package org.apache.commons.net.imap;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import org.apache.commons.net.io.CRLFLineReader;
import org.apache.commons.net.util.SSLContextUtils;

/* loaded from: classes.jar:org/apache/commons/net/imap/IMAPSClient.class */
public class IMAPSClient extends IMAPClient {
    public static final int DEFAULT_IMAPS_PORT = 993;
    public static final String DEFAULT_PROTOCOL = "TLS";
    private SSLContext context;
    private final boolean isImplicit;
    private KeyManager keyManager;
    private final String protocol;
    private String[] protocols;
    private String[] suites;
    private TrustManager trustManager;

    public IMAPSClient() {
        this(DEFAULT_PROTOCOL, false);
    }

    public IMAPSClient(String str) {
        this(str, false);
    }

    public IMAPSClient(String str, boolean z) {
        this(str, z, null);
    }

    public IMAPSClient(String str, boolean z, SSLContext sSLContext) {
        this.context = null;
        this.suites = null;
        this.protocols = null;
        this.trustManager = null;
        this.keyManager = null;
        setDefaultPort(DEFAULT_IMAPS_PORT);
        this.protocol = str;
        this.isImplicit = z;
        this.context = sSLContext;
    }

    public IMAPSClient(SSLContext sSLContext) {
        this(false, sSLContext);
    }

    public IMAPSClient(boolean z) {
        this(DEFAULT_PROTOCOL, z);
    }

    public IMAPSClient(boolean z, SSLContext sSLContext) {
        this(DEFAULT_PROTOCOL, z, sSLContext);
    }

    private KeyManager getKeyManager() {
        return this.keyManager;
    }

    private void initSSLContext() throws IOException {
        if (this.context == null) {
            this.context = SSLContextUtils.createSSLContext(this.protocol, getKeyManager(), getTrustManager());
        }
    }

    private void performSSLNegotiation() throws IOException {
        initSSLContext();
        SSLSocket sSLSocket = (SSLSocket) this.context.getSocketFactory().createSocket(this._socket_, getRemoteAddress().getHostAddress(), getRemotePort(), true);
        sSLSocket.setEnableSessionCreation(true);
        sSLSocket.setUseClientMode(true);
        if (this.protocols != null) {
            sSLSocket.setEnabledProtocols(this.protocols);
        }
        if (this.suites != null) {
            sSLSocket.setEnabledCipherSuites(this.suites);
        }
        sSLSocket.startHandshake();
        this._socket_ = sSLSocket;
        this._input_ = sSLSocket.getInputStream();
        this._output_ = sSLSocket.getOutputStream();
        this._reader = new CRLFLineReader(new InputStreamReader(this._input_, "ISO-8859-1"));
        this.__writer = new BufferedWriter(new OutputStreamWriter(this._output_, "ISO-8859-1"));
    }

    @Override // org.apache.commons.net.imap.IMAP, org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        if (this.isImplicit) {
            performSSLNegotiation();
        }
        super._connectAction_();
    }

    public boolean execTLS() throws SSLException, IOException {
        boolean z;
        if (sendCommand(IMAPCommand.getCommand(IMAPCommand.STARTTLS)) != 0) {
            z = false;
        } else {
            performSSLNegotiation();
            z = true;
        }
        return z;
    }

    public String[] getEnabledCipherSuites() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getEnabledCipherSuites() : null;
    }

    public String[] getEnabledProtocols() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getEnabledProtocols() : null;
    }

    public TrustManager getTrustManager() {
        return this.trustManager;
    }

    public void setEnabledCipherSuites(String[] strArr) {
        this.suites = new String[strArr.length];
        System.arraycopy(strArr, 0, this.suites, 0, strArr.length);
    }

    public void setEnabledProtocols(String[] strArr) {
        this.protocols = new String[strArr.length];
        System.arraycopy(strArr, 0, this.protocols, 0, strArr.length);
    }

    public void setKeyManager(KeyManager keyManager) {
        this.keyManager = keyManager;
    }

    public void setTrustManager(TrustManager trustManager) {
        this.trustManager = trustManager;
    }
}
