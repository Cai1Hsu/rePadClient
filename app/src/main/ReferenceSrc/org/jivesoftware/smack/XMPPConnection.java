package org.jivesoftware.smack;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyStore;
import java.security.Provider;
import java.security.SecureRandom;
import java.security.Security;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import javax.net.ssl.KeyManager;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.PasswordCallback;
import org.apache.commons.net.imap.IMAPSClient;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.compression.XMPPInputOutputStream;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.dns.HostAddress;

/* loaded from: classes.jar:org/jivesoftware/smack/XMPPConnection.class */
public class XMPPConnection extends Connection {
    private Collection<String> compressionMethods;
    PacketReader packetReader;
    PacketWriter packetWriter;
    Socket socket;
    String connectionID = null;
    private String user = null;
    private boolean connected = false;
    private volatile boolean socketClosed = false;
    private boolean authenticated = false;
    private boolean wasAuthenticated = false;
    private boolean anonymous = false;
    private boolean usingTLS = false;
    Roster roster = null;
    private boolean serverAckdCompression = false;

    public XMPPConnection(String str) {
        super(new ConnectionConfiguration(str));
        this.config.setCompressionEnabled(false);
        this.config.setSASLAuthenticationEnabled(true);
        this.config.setDebuggerEnabled(DEBUG_ENABLED);
    }

    public XMPPConnection(String str, CallbackHandler callbackHandler) {
        super(new ConnectionConfiguration(str));
        this.config.setCompressionEnabled(false);
        this.config.setSASLAuthenticationEnabled(true);
        this.config.setDebuggerEnabled(DEBUG_ENABLED);
        this.config.setCallbackHandler(callbackHandler);
    }

    public XMPPConnection(ConnectionConfiguration connectionConfiguration) {
        super(connectionConfiguration);
    }

    public XMPPConnection(ConnectionConfiguration connectionConfiguration, CallbackHandler callbackHandler) {
        super(connectionConfiguration);
        connectionConfiguration.setCallbackHandler(callbackHandler);
    }

    private void connectUsingConfiguration(ConnectionConfiguration connectionConfiguration) throws XMPPException {
        boolean z;
        Iterator<HostAddress> it = connectionConfiguration.getHostAddresses().iterator();
        LinkedList<HostAddress> linkedList = new LinkedList();
        boolean z2 = false;
        do {
            if (it.hasNext()) {
                XMPPException xMPPException = null;
                HostAddress next = it.next();
                String fqdn = next.getFQDN();
                int port = next.getPort();
                try {
                    if (connectionConfiguration.getSocketFactory() == null) {
                        this.socket = new Socket(fqdn, port);
                        z = z2;
                    } else {
                        this.socket = connectionConfiguration.getSocketFactory().createSocket(fqdn, port);
                        z = z2;
                    }
                } catch (UnknownHostException e) {
                    String str = "Could not connect to " + fqdn + ":" + port + ".";
                    xMPPException = new XMPPException(str, new XMPPError(XMPPError.Condition.remote_server_timeout, str), e);
                    z = z2;
                } catch (IOException e2) {
                    String str2 = "XMPPError connecting to " + fqdn + ":" + port + ".";
                    xMPPException = new XMPPException(str2, new XMPPError(XMPPError.Condition.remote_server_error, str2), e2);
                    z = true;
                }
                if (xMPPException == null) {
                    connectionConfiguration.setUsedHostAddress(next);
                } else {
                    next.setException(xMPPException);
                    linkedList.add(next);
                    z2 = z;
                }
            }
            this.socketClosed = false;
            initConnection();
            return;
        } while (it.hasNext());
        StringBuilder sb = new StringBuilder();
        for (HostAddress hostAddress : linkedList) {
            sb.append(hostAddress.getErrorMessage());
            sb.append("; ");
        }
        throw new XMPPException(sb.toString(), z ? new XMPPError(XMPPError.Condition.remote_server_error) : new XMPPError(XMPPError.Condition.remote_server_timeout));
    }

    private void initConnection() throws XMPPException {
        boolean z = true;
        if (this.packetReader != null) {
            z = this.packetWriter == null;
        }
        this.compressionHandler = null;
        this.serverAckdCompression = false;
        initReaderAndWriter();
        try {
            if (z) {
                this.packetWriter = new PacketWriter(this);
                this.packetReader = new PacketReader(this);
                if (this.config.isDebuggerEnabled()) {
                    addPacketListener(this.debugger.getReaderListener(), null);
                    if (this.debugger.getWriterListener() != null) {
                        addPacketSendingListener(this.debugger.getWriterListener(), null);
                    }
                }
            } else {
                this.packetWriter.init();
                this.packetReader.init();
            }
            this.packetWriter.startup();
            this.packetReader.startup();
            this.connected = true;
            if (z) {
                for (ConnectionCreationListener connectionCreationListener : getConnectionCreationListeners()) {
                    connectionCreationListener.connectionCreated(this);
                }
            } else if (!this.wasAuthenticated) {
                notifyReconnection();
            }
        } catch (XMPPException e) {
            if (this.packetWriter != null) {
                try {
                    this.packetWriter.shutdown();
                } catch (Throwable th) {
                }
                this.packetWriter = null;
            }
            if (this.packetReader != null) {
                try {
                    this.packetReader.shutdown();
                } catch (Throwable th2) {
                }
                this.packetReader = null;
            }
            if (this.reader != null) {
                try {
                    this.reader.close();
                } catch (Throwable th3) {
                }
                this.reader = null;
            }
            if (this.writer != null) {
                try {
                    this.writer.close();
                } catch (Throwable th4) {
                }
                this.writer = null;
            }
            if (this.socket != null) {
                try {
                    this.socket.close();
                } catch (Exception e2) {
                }
                this.socket = null;
            }
            setWasAuthenticated(this.authenticated);
            this.authenticated = false;
            this.connected = false;
            throw e;
        }
    }

    private void initReaderAndWriter() throws XMPPException {
        try {
            if (this.compressionHandler == null) {
                this.reader = new BufferedReader(new InputStreamReader(this.socket.getInputStream(), "UTF-8"));
                this.writer = new BufferedWriter(new OutputStreamWriter(this.socket.getOutputStream(), "UTF-8"));
            } else {
                try {
                    this.writer = new BufferedWriter(new OutputStreamWriter(this.compressionHandler.getOutputStream(this.socket.getOutputStream()), "UTF-8"));
                    this.reader = new BufferedReader(new InputStreamReader(this.compressionHandler.getInputStream(this.socket.getInputStream()), "UTF-8"));
                } catch (Exception e) {
                    e.printStackTrace();
                    this.compressionHandler = null;
                    this.reader = new BufferedReader(new InputStreamReader(this.socket.getInputStream(), "UTF-8"));
                    this.writer = new BufferedWriter(new OutputStreamWriter(this.socket.getOutputStream(), "UTF-8"));
                }
            }
            initDebugger();
        } catch (IOException e2) {
            throw new XMPPException("XMPPError establishing connection with server.", new XMPPError(XMPPError.Condition.remote_server_error, "XMPPError establishing connection with server."), e2);
        }
    }

    private XMPPInputOutputStream maybeGetCompressionHandler() {
        XMPPInputOutputStream xMPPInputOutputStream;
        if (this.compressionMethods != null) {
            Iterator<XMPPInputOutputStream> it = compressionHandlers.iterator();
            while (it.hasNext()) {
                xMPPInputOutputStream = it.next();
                if (xMPPInputOutputStream.isSupported()) {
                    if (this.compressionMethods.contains(xMPPInputOutputStream.getCompressionMethod())) {
                        break;
                    }
                }
            }
        }
        xMPPInputOutputStream = null;
        return xMPPInputOutputStream;
    }

    private void requestStreamCompression(String str) {
        try {
            this.writer.write("<compress xmlns='http://jabber.org/protocol/compress'>");
            this.writer.write("<method>" + str + "</method></compress>");
            this.writer.flush();
        } catch (IOException e) {
            notifyConnectionError(e);
        }
    }

    private void setWasAuthenticated(boolean z) {
        if (!this.wasAuthenticated) {
            this.wasAuthenticated = z;
        }
    }

    private boolean useCompression() {
        boolean z;
        if (this.authenticated) {
            throw new IllegalStateException("Compression should be negotiated before authentication.");
        }
        XMPPInputOutputStream maybeGetCompressionHandler = maybeGetCompressionHandler();
        this.compressionHandler = maybeGetCompressionHandler;
        if (maybeGetCompressionHandler != null) {
            requestStreamCompression(this.compressionHandler.getCompressionMethod());
            synchronized (this) {
                try {
                    wait(SmackConfiguration.getPacketReplyTimeout() * 5);
                } catch (InterruptedException e) {
                }
            }
            z = isUsingCompression();
        } else {
            z = false;
        }
        return z;
    }

    public void addPacketWriterInterceptor(PacketInterceptor packetInterceptor, PacketFilter packetFilter) {
        addPacketInterceptor(packetInterceptor, packetFilter);
    }

    public void addPacketWriterListener(PacketListener packetListener, PacketFilter packetFilter) {
        addPacketSendingListener(packetListener, packetFilter);
    }

    @Override // org.jivesoftware.smack.Connection
    public void connect() throws XMPPException {
        connectUsingConfiguration(this.config);
        if (!this.connected || !this.wasAuthenticated) {
            return;
        }
        try {
            if (isAnonymous()) {
                loginAnonymously();
            } else {
                login(this.config.getUsername(), this.config.getPassword(), this.config.getResource());
            }
            notifyReconnection();
        } catch (XMPPException e) {
            e.printStackTrace();
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public void disconnect(Presence presence) {
        synchronized (this) {
            if (this.packetReader != null && this.packetWriter != null && isConnected()) {
                shutdown(presence);
                if (this.roster != null) {
                    this.roster.cleanup();
                    this.roster = null;
                }
                this.wasAuthenticated = false;
                this.packetWriter.cleanup();
                this.packetReader.cleanup();
            }
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public String getConnectionID() {
        return !isConnected() ? null : this.connectionID;
    }

    @Override // org.jivesoftware.smack.Connection
    public Roster getRoster() {
        Roster roster;
        synchronized (this) {
            if (!isAuthenticated() || isAnonymous()) {
                if (this.roster == null) {
                    this.roster = new Roster(this);
                }
                roster = this.roster;
            } else {
                if (!this.config.isRosterLoadedAtLogin()) {
                    this.roster.reload();
                }
                if (!this.roster.rosterInitialized) {
                    try {
                        synchronized (this.roster) {
                            long packetReplyTimeout = SmackConfiguration.getPacketReplyTimeout();
                            long currentTimeMillis = System.currentTimeMillis();
                            while (true) {
                                long j = currentTimeMillis;
                                if (this.roster.rosterInitialized || packetReplyTimeout <= 0) {
                                    break;
                                }
                                this.roster.wait(packetReplyTimeout);
                                long currentTimeMillis2 = System.currentTimeMillis();
                                packetReplyTimeout -= currentTimeMillis2 - j;
                                currentTimeMillis = currentTimeMillis2;
                            }
                        }
                    } catch (InterruptedException e) {
                    }
                }
                roster = this.roster;
            }
        }
        return roster;
    }

    @Override // org.jivesoftware.smack.Connection
    public String getUser() {
        return !isAuthenticated() ? null : this.user;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isAnonymous() {
        return this.anonymous;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isAuthenticated() {
        return this.authenticated;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isConnected() {
        return this.connected;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isSecureConnection() {
        return isUsingTLS();
    }

    public boolean isSocketClosed() {
        return this.socketClosed;
    }

    @Override // org.jivesoftware.smack.Connection
    public boolean isUsingCompression() {
        return this.compressionHandler != null && this.serverAckdCompression;
    }

    public boolean isUsingTLS() {
        return this.usingTLS;
    }

    @Override // org.jivesoftware.smack.Connection
    public void login(String str, String str2, String str3) throws XMPPException {
        synchronized (this) {
            if (!isConnected()) {
                throw new IllegalStateException("Not connected to server.");
            }
            if (this.authenticated) {
                throw new IllegalStateException("Already logged in to server.");
            }
            String trim = str.toLowerCase().trim();
            String authenticate = (!this.config.isSASLAuthenticationEnabled() || !this.saslAuthentication.hasNonAnonymousAuthentication()) ? new NonSASLAuthentication(this).authenticate(trim, str2, str3) : str2 != null ? this.saslAuthentication.authenticate(trim, str2, str3) : this.saslAuthentication.authenticate(trim, str3, this.config.getCallbackHandler());
            if (authenticate != null) {
                this.user = authenticate;
                this.config.setServiceName(StringUtils.parseServer(authenticate));
            } else {
                this.user = trim + "@" + getServiceName();
                if (str3 != null) {
                    this.user += "/" + str3;
                }
            }
            if (this.config.isCompressionEnabled()) {
                useCompression();
            }
            this.authenticated = true;
            this.anonymous = false;
            if (this.roster == null) {
                this.roster = new Roster(this);
            }
            if (this.config.isRosterLoadedAtLogin()) {
                this.roster.reload();
            }
            if (this.config.isSendPresence()) {
                this.packetWriter.sendPacket(new Presence(Presence.Type.available));
            }
            this.config.setLoginInfo(trim, str2, str3);
            if (this.config.isDebuggerEnabled() && this.debugger != null) {
                this.debugger.userHasLogged(this.user);
            }
        }
    }

    @Override // org.jivesoftware.smack.Connection
    public void loginAnonymously() throws XMPPException {
        synchronized (this) {
            if (!isConnected()) {
                throw new IllegalStateException("Not connected to server.");
            }
            if (this.authenticated) {
                throw new IllegalStateException("Already logged in to server.");
            }
            String authenticateAnonymously = (!this.config.isSASLAuthenticationEnabled() || !this.saslAuthentication.hasAnonymousAuthentication()) ? new NonSASLAuthentication(this).authenticateAnonymously() : this.saslAuthentication.authenticateAnonymously();
            this.user = authenticateAnonymously;
            this.config.setServiceName(StringUtils.parseServer(authenticateAnonymously));
            if (this.config.isCompressionEnabled()) {
                useCompression();
            }
            this.packetWriter.sendPacket(new Presence(Presence.Type.available));
            this.authenticated = true;
            this.anonymous = true;
            if (this.config.isDebuggerEnabled() && this.debugger != null) {
                this.debugger.userHasLogged(this.user);
            }
        }
    }

    void notifyConnectionError(Exception exc) {
        synchronized (this) {
            if (!this.packetReader.done || !this.packetWriter.done) {
                this.packetReader.done = true;
                this.packetWriter.done = true;
                shutdown(new Presence(Presence.Type.unavailable));
                exc.printStackTrace();
                for (ConnectionListener connectionListener : getConnectionListeners()) {
                    try {
                        connectionListener.connectionClosedOnError(exc);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    protected void notifyReconnection() {
        for (ConnectionListener connectionListener : getConnectionListeners()) {
            try {
                connectionListener.reconnectionSuccessful();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x00c2 A[Catch: NullPointerException -> 0x01f7, TRY_ENTER, TryCatch #4 {NullPointerException -> 0x01f7, blocks: (B:16:0x00c2, B:18:0x00cb, B:35:0x01e6), top: B:48:0x00bf }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x01e6 A[Catch: NullPointerException -> 0x01f7, TRY_ENTER, TRY_LEAVE, TryCatch #4 {NullPointerException -> 0x01f7, blocks: (B:16:0x00c2, B:18:0x00cb, B:35:0x01e6), top: B:48:0x00bf }] */
    /* JADX WARN: Removed duplicated region for block: B:6:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    void proceedTLSReceived() throws Exception {
        KeyStore keyStore;
        KeyManagerFactory keyManagerFactory;
        SSLContext customSSLContext = this.config.getCustomSSLContext();
        KeyManager[] keyManagerArr = null;
        PasswordCallback passwordCallback = null;
        if (this.config.getCallbackHandler() != null && customSSLContext == null) {
            if (this.config.getKeystoreType().equals("NONE")) {
                keyStore = null;
                passwordCallback = null;
            } else if (this.config.getKeystoreType().equals("PKCS11")) {
                try {
                    Provider provider = (Provider) Class.forName("sun.security.pkcs11.SunPKCS11").getConstructor(InputStream.class).newInstance(new ByteArrayInputStream(("name = SmartCard\nlibrary = " + this.config.getPKCS11Library()).getBytes()));
                    Security.addProvider(provider);
                    keyStore = KeyStore.getInstance("PKCS11", provider);
                    passwordCallback = new PasswordCallback("PKCS11 Password: ", false);
                } catch (Exception e) {
                }
                try {
                    this.config.getCallbackHandler().handle(new Callback[]{passwordCallback});
                    keyStore.load(null, passwordCallback.getPassword());
                } catch (Exception e2) {
                    keyStore = null;
                    passwordCallback = null;
                    keyManagerFactory = KeyManagerFactory.getInstance("SunX509");
                    if (passwordCallback == null) {
                    }
                    keyManagerArr = keyManagerFactory.getKeyManagers();
                    SSLContext sSLContext = customSSLContext;
                    if (customSSLContext == null) {
                    }
                    Socket socket = this.socket;
                    this.socket = sSLContext.getSocketFactory().createSocket(socket, socket.getInetAddress().getHostAddress(), socket.getPort(), true);
                    this.socket.setSoTimeout(0);
                    this.socket.setKeepAlive(true);
                    initReaderAndWriter();
                    ((SSLSocket) this.socket).startHandshake();
                    this.usingTLS = true;
                    this.packetWriter.setWriter(this.writer);
                    this.packetWriter.openStream();
                }
            } else if (this.config.getKeystoreType().equals("Apple")) {
                keyStore = KeyStore.getInstance("KeychainStore", "Apple");
                keyStore.load(null, null);
            } else {
                keyStore = KeyStore.getInstance(this.config.getKeystoreType());
                try {
                    passwordCallback = new PasswordCallback("Keystore Password: ", false);
                } catch (Exception e3) {
                }
                try {
                    this.config.getCallbackHandler().handle(new Callback[]{passwordCallback});
                    keyStore.load(new FileInputStream(this.config.getKeystorePath()), passwordCallback.getPassword());
                } catch (Exception e4) {
                    keyStore = null;
                    passwordCallback = null;
                    keyManagerFactory = KeyManagerFactory.getInstance("SunX509");
                    if (passwordCallback == null) {
                    }
                    keyManagerArr = keyManagerFactory.getKeyManagers();
                    SSLContext sSLContext2 = customSSLContext;
                    if (customSSLContext == null) {
                    }
                    Socket socket2 = this.socket;
                    this.socket = sSLContext2.getSocketFactory().createSocket(socket2, socket2.getInetAddress().getHostAddress(), socket2.getPort(), true);
                    this.socket.setSoTimeout(0);
                    this.socket.setKeepAlive(true);
                    initReaderAndWriter();
                    ((SSLSocket) this.socket).startHandshake();
                    this.usingTLS = true;
                    this.packetWriter.setWriter(this.writer);
                    this.packetWriter.openStream();
                }
            }
            keyManagerFactory = KeyManagerFactory.getInstance("SunX509");
            try {
                if (passwordCallback == null) {
                    keyManagerFactory.init(keyStore, null);
                } else {
                    keyManagerFactory.init(keyStore, passwordCallback.getPassword());
                    passwordCallback.clearPassword();
                }
                keyManagerArr = keyManagerFactory.getKeyManagers();
            } catch (NullPointerException e5) {
                keyManagerArr = null;
            }
        }
        SSLContext sSLContext22 = customSSLContext;
        if (customSSLContext == null) {
            sSLContext22 = SSLContext.getInstance(IMAPSClient.DEFAULT_PROTOCOL);
            sSLContext22.init(keyManagerArr, new TrustManager[]{new ServerTrustManager(getServiceName(), this.config)}, new SecureRandom());
        }
        Socket socket22 = this.socket;
        this.socket = sSLContext22.getSocketFactory().createSocket(socket22, socket22.getInetAddress().getHostAddress(), socket22.getPort(), true);
        this.socket.setSoTimeout(0);
        this.socket.setKeepAlive(true);
        initReaderAndWriter();
        ((SSLSocket) this.socket).startHandshake();
        this.usingTLS = true;
        this.packetWriter.setWriter(this.writer);
        this.packetWriter.openStream();
    }

    public void removePacketWriterInterceptor(PacketInterceptor packetInterceptor) {
        removePacketInterceptor(packetInterceptor);
    }

    public void removePacketWriterListener(PacketListener packetListener) {
        removePacketSendingListener(packetListener);
    }

    @Override // org.jivesoftware.smack.Connection
    public void sendPacket(Packet packet) {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected to server.");
        }
        if (packet == null) {
            throw new NullPointerException("Packet is null.");
        }
        this.packetWriter.sendPacket(packet);
    }

    void setAvailableCompressionMethods(Collection<String> collection) {
        this.compressionMethods = collection;
    }

    protected void shutdown(Presence presence) {
        if (this.packetWriter != null) {
            this.packetWriter.sendPacket(presence);
        }
        setWasAuthenticated(this.authenticated);
        this.authenticated = false;
        if (this.packetReader != null) {
            this.packetReader.shutdown();
        }
        if (this.packetWriter != null) {
            this.packetWriter.shutdown();
        }
        try {
            Thread.sleep(150L);
        } catch (Exception e) {
        }
        this.socketClosed = true;
        try {
            this.socket.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        this.connected = false;
        if (this.reader != null) {
            try {
                this.reader.close();
            } catch (Throwable th) {
            }
            this.reader = null;
        }
        if (this.writer != null) {
            try {
                this.writer.close();
            } catch (Throwable th2) {
            }
            this.writer = null;
        }
        try {
            this.socket.close();
        } catch (Exception e3) {
        }
        this.saslAuthentication.init();
    }

    void startStreamCompression() throws Exception {
        this.serverAckdCompression = true;
        initReaderAndWriter();
        this.packetWriter.setWriter(this.writer);
        this.packetWriter.openStream();
        synchronized (this) {
            notify();
        }
    }

    void startTLSReceived(boolean z) {
        if (z && this.config.getSecurityMode() == ConnectionConfiguration.SecurityMode.disabled) {
            notifyConnectionError(new IllegalStateException("TLS required by server but not allowed by connection configuration"));
        } else if (this.config.getSecurityMode() == ConnectionConfiguration.SecurityMode.disabled) {
        } else {
            try {
                this.writer.write("<starttls xmlns=\"urn:ietf:params:xml:ns:xmpp-tls\"/>");
                this.writer.flush();
            } catch (IOException e) {
                notifyConnectionError(e);
            }
        }
    }

    void streamCompressionDenied() {
        synchronized (this) {
            notify();
        }
    }
}
