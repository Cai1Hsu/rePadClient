package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import org.apache.commons.net.util.Base64;
import org.apache.commons.net.util.SSLContextUtils;
import org.apache.commons.net.util.TrustManagerUtils;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTPSClient.class */
public class FTPSClient extends FTPClient {
    private static final String CMD_ADAT = "ADAT";
    private static final String CMD_AUTH = "AUTH";
    private static final String CMD_CCC = "CCC";
    private static final String CMD_CONF = "CONF";
    private static final String CMD_ENC = "ENC";
    private static final String CMD_MIC = "MIC";
    private static final String CMD_PBSZ = "PBSZ";
    private static final String CMD_PROT = "PROT";
    public static final int DEFAULT_FTPS_DATA_PORT = 989;
    public static final int DEFAULT_FTPS_PORT = 990;
    private static final String DEFAULT_PROTOCOL = "TLS";
    @Deprecated
    public static String KEYSTORE_ALGORITHM;
    @Deprecated
    public static String PROVIDER;
    @Deprecated
    public static String STORE_TYPE;
    @Deprecated
    public static String TRUSTSTORE_ALGORITHM;
    private String auth;
    private SSLContext context;
    private boolean isClientMode;
    private boolean isCreation;
    private final boolean isImplicit;
    private boolean isNeedClientAuth;
    private boolean isWantClientAuth;
    private KeyManager keyManager;
    private Socket plainSocket;
    private final String protocol;
    private String[] protocols;
    private String[] suites;
    private TrustManager trustManager;
    private static final String DEFAULT_PROT = "C";
    private static final String[] PROT_COMMAND_VALUE = {DEFAULT_PROT, "E", "S", "P"};

    public FTPSClient() {
        this("TLS", false);
    }

    public FTPSClient(String str) {
        this(str, false);
    }

    public FTPSClient(String str, boolean z) {
        this.auth = "TLS";
        this.isCreation = true;
        this.isClientMode = true;
        this.isNeedClientAuth = false;
        this.isWantClientAuth = false;
        this.suites = null;
        this.protocols = null;
        this.trustManager = TrustManagerUtils.getValidateServerCertificateTrustManager();
        this.keyManager = null;
        this.protocol = str;
        this.isImplicit = z;
        if (z) {
            setDefaultPort(DEFAULT_FTPS_PORT);
        }
    }

    public FTPSClient(SSLContext sSLContext) {
        this(false, sSLContext);
    }

    public FTPSClient(boolean z) {
        this("TLS", z);
    }

    public FTPSClient(boolean z, SSLContext sSLContext) {
        this("TLS", z);
        this.context = sSLContext;
    }

    private boolean checkPROTValue(String str) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= PROT_COMMAND_VALUE.length) {
                z = false;
                break;
            } else if (PROT_COMMAND_VALUE[i].equals(str)) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private String extractPrefixedData(String str, String str2) {
        int indexOf = str2.indexOf(str);
        return indexOf == -1 ? null : str2.substring(str.length() + indexOf).trim();
    }

    private KeyManager getKeyManager() {
        return this.keyManager;
    }

    private void initSslContext() throws IOException {
        if (this.context == null) {
            this.context = SSLContextUtils.createSSLContext(this.protocol, getKeyManager(), getTrustManager());
        }
    }

    @Override // org.apache.commons.net.ftp.FTPClient, org.apache.commons.net.ftp.FTP, org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        if (this.isImplicit) {
            sslNegotiation();
        }
        super._connectAction_();
        if (!this.isImplicit) {
            execAUTH();
            sslNegotiation();
        }
    }

    @Override // org.apache.commons.net.ftp.FTPClient
    protected Socket _openDataConnection_(int i, String str) throws IOException {
        Socket _openDataConnection_ = super._openDataConnection_(i, str);
        _prepareDataSocket_(_openDataConnection_);
        if (_openDataConnection_ instanceof SSLSocket) {
            SSLSocket sSLSocket = (SSLSocket) _openDataConnection_;
            sSLSocket.setUseClientMode(this.isClientMode);
            sSLSocket.setEnableSessionCreation(this.isCreation);
            if (!this.isClientMode) {
                sSLSocket.setNeedClientAuth(this.isNeedClientAuth);
                sSLSocket.setWantClientAuth(this.isWantClientAuth);
            }
            if (this.suites != null) {
                sSLSocket.setEnabledCipherSuites(this.suites);
            }
            if (this.protocols != null) {
                sSLSocket.setEnabledProtocols(this.protocols);
            }
            sSLSocket.startHandshake();
        }
        return _openDataConnection_;
    }

    protected void _prepareDataSocket_(Socket socket) throws IOException {
    }

    @Override // org.apache.commons.net.ftp.FTPClient, org.apache.commons.net.ftp.FTP, org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        setSocketFactory(null);
        setServerSocketFactory(null);
    }

    public int execADAT(byte[] bArr) throws IOException {
        return bArr != null ? sendCommand(CMD_ADAT, new String(Base64.encodeBase64(bArr))) : sendCommand(CMD_ADAT);
    }

    public int execAUTH(String str) throws IOException {
        return sendCommand(CMD_AUTH, str);
    }

    protected void execAUTH() throws SSLException, IOException {
        int sendCommand = sendCommand(CMD_AUTH, this.auth);
        if (334 == sendCommand || 234 == sendCommand) {
            return;
        }
        throw new SSLException(getReplyString());
    }

    public int execCCC() throws IOException {
        return sendCommand(CMD_CCC);
    }

    public int execCONF(byte[] bArr) throws IOException {
        return bArr != null ? sendCommand(CMD_CONF, new String(Base64.encodeBase64(bArr))) : sendCommand(CMD_CONF, "");
    }

    public int execENC(byte[] bArr) throws IOException {
        return bArr != null ? sendCommand(CMD_ENC, new String(Base64.encodeBase64(bArr))) : sendCommand(CMD_ENC, "");
    }

    public int execMIC(byte[] bArr) throws IOException {
        return bArr != null ? sendCommand(CMD_MIC, new String(Base64.encodeBase64(bArr))) : sendCommand(CMD_MIC, "");
    }

    public void execPBSZ(long j) throws SSLException, IOException {
        if (j < 0 || 4294967295L < j) {
            throw new IllegalArgumentException();
        }
        if (200 == sendCommand(CMD_PBSZ, String.valueOf(j))) {
            return;
        }
        throw new SSLException(getReplyString());
    }

    public void execPROT(String str) throws SSLException, IOException {
        String str2 = str;
        if (str == null) {
            str2 = DEFAULT_PROT;
        }
        if (!checkPROTValue(str2)) {
            throw new IllegalArgumentException();
        }
        if (200 != sendCommand(CMD_PROT, str2)) {
            throw new SSLException(getReplyString());
        }
        if (DEFAULT_PROT.equals(str2)) {
            setSocketFactory(null);
            setServerSocketFactory(null);
            return;
        }
        setSocketFactory(new FTPSSocketFactory(this.context));
        setServerSocketFactory(new FTPSServerSocketFactory(this.context));
        initSslContext();
    }

    public String getAuthValue() {
        return this.auth;
    }

    public boolean getEnableSessionCreation() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getEnableSessionCreation() : false;
    }

    public String[] getEnabledCipherSuites() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getEnabledCipherSuites() : null;
    }

    public String[] getEnabledProtocols() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getEnabledProtocols() : null;
    }

    public boolean getNeedClientAuth() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getNeedClientAuth() : false;
    }

    public TrustManager getTrustManager() {
        return this.trustManager;
    }

    public boolean getUseClientMode() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getUseClientMode() : false;
    }

    public boolean getWantClientAuth() {
        return this._socket_ instanceof SSLSocket ? ((SSLSocket) this._socket_).getWantClientAuth() : false;
    }

    public byte[] parseADATReply(String str) {
        return str == null ? null : Base64.decodeBase64(extractPrefixedData("ADAT=", str));
    }

    public long parsePBSZ(long j) throws SSLException, IOException {
        execPBSZ(j);
        String extractPrefixedData = extractPrefixedData("PBSZ=", getReplyString());
        long j2 = j;
        if (extractPrefixedData != null) {
            long parseLong = Long.parseLong(extractPrefixedData);
            j2 = j;
            if (parseLong < j) {
                j2 = parseLong;
            }
        }
        return j2;
    }

    @Override // org.apache.commons.net.ftp.FTP
    public int sendCommand(String str, String str2) throws IOException {
        int sendCommand = super.sendCommand(str, str2);
        if (CMD_CCC.equals(str)) {
            if (200 != sendCommand) {
                throw new SSLException(getReplyString());
            }
            this._socket_.close();
            this._socket_ = this.plainSocket;
            this._controlInput_ = new BufferedReader(new InputStreamReader(this._socket_.getInputStream(), getControlEncoding()));
            this._controlOutput_ = new BufferedWriter(new OutputStreamWriter(this._socket_.getOutputStream(), getControlEncoding()));
        }
        return sendCommand;
    }

    public void setAuthValue(String str) {
        this.auth = str;
    }

    public void setEnabledCipherSuites(String[] strArr) {
        this.suites = new String[strArr.length];
        System.arraycopy(strArr, 0, this.suites, 0, strArr.length);
    }

    public void setEnabledProtocols(String[] strArr) {
        this.protocols = new String[strArr.length];
        System.arraycopy(strArr, 0, this.protocols, 0, strArr.length);
    }

    public void setEnabledSessionCreation(boolean z) {
        this.isCreation = z;
    }

    public void setKeyManager(KeyManager keyManager) {
        this.keyManager = keyManager;
    }

    public void setNeedClientAuth(boolean z) {
        this.isNeedClientAuth = z;
    }

    public void setTrustManager(TrustManager trustManager) {
        this.trustManager = trustManager;
    }

    public void setUseClientMode(boolean z) {
        this.isClientMode = z;
    }

    public void setWantClientAuth(boolean z) {
        this.isWantClientAuth = z;
    }

    protected void sslNegotiation() throws IOException {
        this.plainSocket = this._socket_;
        initSslContext();
        SSLSocket sSLSocket = (SSLSocket) this.context.getSocketFactory().createSocket(this._socket_, this._socket_.getInetAddress().getHostAddress(), this._socket_.getPort(), false);
        sSLSocket.setEnableSessionCreation(this.isCreation);
        sSLSocket.setUseClientMode(this.isClientMode);
        if (!this.isClientMode) {
            sSLSocket.setNeedClientAuth(this.isNeedClientAuth);
            sSLSocket.setWantClientAuth(this.isWantClientAuth);
        }
        if (this.protocols != null) {
            sSLSocket.setEnabledProtocols(this.protocols);
        }
        if (this.suites != null) {
            sSLSocket.setEnabledCipherSuites(this.suites);
        }
        sSLSocket.startHandshake();
        this._socket_ = sSLSocket;
        this._controlInput_ = new BufferedReader(new InputStreamReader(sSLSocket.getInputStream(), getControlEncoding()));
        this._controlOutput_ = new BufferedWriter(new OutputStreamWriter(sSLSocket.getOutputStream(), getControlEncoding()));
    }
}
