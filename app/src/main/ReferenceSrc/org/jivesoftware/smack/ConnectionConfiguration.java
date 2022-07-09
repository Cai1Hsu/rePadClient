package org.jivesoftware.smack;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.SSLContext;
import javax.security.auth.callback.CallbackHandler;
import org.jivesoftware.smack.proxy.ProxyInfo;
import org.jivesoftware.smack.util.DNSUtil;
import org.jivesoftware.smack.util.dns.HostAddress;

/* loaded from: classes.jar:org/jivesoftware/smack/ConnectionConfiguration.class */
public class ConnectionConfiguration implements Cloneable {
    private CallbackHandler callbackHandler;
    private SSLContext customSSLContext;
    private String host;
    protected List<HostAddress> hostAddresses;
    private String keystorePath;
    private String keystoreType;
    private String password;
    private String pkcs11Library;
    private int port;
    protected ProxyInfo proxy;
    private String resource;
    private String serviceName;
    private SocketFactory socketFactory;
    private String truststorePassword;
    private String truststorePath;
    private String truststoreType;
    private String username;
    private boolean verifyChainEnabled = false;
    private boolean verifyRootCAEnabled = false;
    private boolean selfSignedCertificateEnabled = false;
    private boolean expiredCertificatesCheckEnabled = false;
    private boolean notMatchingDomainCheckEnabled = false;
    private boolean compressionEnabled = false;
    private boolean saslAuthenticationEnabled = true;
    private boolean debuggerEnabled = Connection.DEBUG_ENABLED;
    private boolean reconnectionAllowed = true;
    private boolean sendPresence = true;
    private boolean rosterLoadedAtLogin = true;
    private SecurityMode securityMode = SecurityMode.enabled;

    /* loaded from: classes.jar:org/jivesoftware/smack/ConnectionConfiguration$SecurityMode.class */
    public enum SecurityMode {
        required,
        enabled,
        disabled
    }

    public ConnectionConfiguration(String str) {
        this.hostAddresses = DNSUtil.resolveXMPPDomain(str);
        init(str, ProxyInfo.forDefaultProxy());
    }

    public ConnectionConfiguration(String str, int i) {
        initHostAddresses(str, i);
        init(str, ProxyInfo.forDefaultProxy());
    }

    public ConnectionConfiguration(String str, int i, String str2) {
        initHostAddresses(str, i);
        init(str2, ProxyInfo.forDefaultProxy());
    }

    public ConnectionConfiguration(String str, int i, String str2, ProxyInfo proxyInfo) {
        initHostAddresses(str, i);
        init(str2, proxyInfo);
    }

    public ConnectionConfiguration(String str, int i, ProxyInfo proxyInfo) {
        initHostAddresses(str, i);
        init(str, proxyInfo);
    }

    public ConnectionConfiguration(String str, ProxyInfo proxyInfo) {
        this.hostAddresses = DNSUtil.resolveXMPPDomain(str);
        init(str, proxyInfo);
    }

    private void initHostAddresses(String str, int i) {
        this.hostAddresses = new ArrayList(1);
        try {
            this.hostAddresses.add(new HostAddress(str, i));
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    public CallbackHandler getCallbackHandler() {
        return this.callbackHandler;
    }

    public SSLContext getCustomSSLContext() {
        return this.customSSLContext;
    }

    public String getHost() {
        return this.host;
    }

    public List<HostAddress> getHostAddresses() {
        return Collections.unmodifiableList(this.hostAddresses);
    }

    public String getKeystorePath() {
        return this.keystorePath;
    }

    public String getKeystoreType() {
        return this.keystoreType;
    }

    public String getPKCS11Library() {
        return this.pkcs11Library;
    }

    String getPassword() {
        return this.password;
    }

    public int getPort() {
        return this.port;
    }

    String getResource() {
        return this.resource;
    }

    public SecurityMode getSecurityMode() {
        return this.securityMode;
    }

    public String getServiceName() {
        return this.serviceName;
    }

    public SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    public String getTruststorePassword() {
        return this.truststorePassword;
    }

    public String getTruststorePath() {
        return this.truststorePath;
    }

    public String getTruststoreType() {
        return this.truststoreType;
    }

    String getUsername() {
        return this.username;
    }

    protected void init(String str, ProxyInfo proxyInfo) {
        this.serviceName = str;
        this.proxy = proxyInfo;
        String property = System.getProperty("java.home");
        StringBuilder sb = new StringBuilder();
        sb.append(property).append(File.separator).append("lib");
        sb.append(File.separator).append("security");
        sb.append(File.separator).append("cacerts");
        this.truststorePath = sb.toString();
        this.truststoreType = "jks";
        this.truststorePassword = "changeit";
        this.keystorePath = System.getProperty("javax.net.ssl.keyStore");
        this.keystoreType = "jks";
        this.pkcs11Library = "pkcs11.config";
        this.socketFactory = proxyInfo.getSocketFactory();
    }

    public boolean isCompressionEnabled() {
        return this.compressionEnabled;
    }

    public boolean isDebuggerEnabled() {
        return this.debuggerEnabled;
    }

    public boolean isExpiredCertificatesCheckEnabled() {
        return this.expiredCertificatesCheckEnabled;
    }

    public boolean isNotMatchingDomainCheckEnabled() {
        return this.notMatchingDomainCheckEnabled;
    }

    public boolean isReconnectionAllowed() {
        return this.reconnectionAllowed;
    }

    public boolean isRosterLoadedAtLogin() {
        return this.rosterLoadedAtLogin;
    }

    public boolean isSASLAuthenticationEnabled() {
        return this.saslAuthenticationEnabled;
    }

    public boolean isSelfSignedCertificateEnabled() {
        return this.selfSignedCertificateEnabled;
    }

    boolean isSendPresence() {
        return this.sendPresence;
    }

    public boolean isVerifyChainEnabled() {
        return this.verifyChainEnabled;
    }

    public boolean isVerifyRootCAEnabled() {
        return this.verifyRootCAEnabled;
    }

    public void setCallbackHandler(CallbackHandler callbackHandler) {
        this.callbackHandler = callbackHandler;
    }

    public void setCompressionEnabled(boolean z) {
        this.compressionEnabled = z;
    }

    public void setCustomSSLContext(SSLContext sSLContext) {
        this.customSSLContext = sSLContext;
    }

    public void setDebuggerEnabled(boolean z) {
        this.debuggerEnabled = z;
    }

    public void setExpiredCertificatesCheckEnabled(boolean z) {
        this.expiredCertificatesCheckEnabled = z;
    }

    public void setKeystorePath(String str) {
        this.keystorePath = str;
    }

    public void setKeystoreType(String str) {
        this.keystoreType = str;
    }

    void setLoginInfo(String str, String str2, String str3) {
        this.username = str;
        this.password = str2;
        this.resource = str3;
    }

    public void setNotMatchingDomainCheckEnabled(boolean z) {
        this.notMatchingDomainCheckEnabled = z;
    }

    public void setPKCS11Library(String str) {
        this.pkcs11Library = str;
    }

    public void setReconnectionAllowed(boolean z) {
        this.reconnectionAllowed = z;
    }

    public void setRosterLoadedAtLogin(boolean z) {
        this.rosterLoadedAtLogin = z;
    }

    public void setSASLAuthenticationEnabled(boolean z) {
        this.saslAuthenticationEnabled = z;
    }

    public void setSecurityMode(SecurityMode securityMode) {
        this.securityMode = securityMode;
    }

    public void setSelfSignedCertificateEnabled(boolean z) {
        this.selfSignedCertificateEnabled = z;
    }

    public void setSendPresence(boolean z) {
        this.sendPresence = z;
    }

    public void setServiceName(String str) {
        this.serviceName = str;
    }

    public void setSocketFactory(SocketFactory socketFactory) {
        this.socketFactory = socketFactory;
    }

    public void setTruststorePassword(String str) {
        this.truststorePassword = str;
    }

    public void setTruststorePath(String str) {
        this.truststorePath = str;
    }

    public void setTruststoreType(String str) {
        this.truststoreType = str;
    }

    public void setUsedHostAddress(HostAddress hostAddress) {
        this.host = hostAddress.getFQDN();
        this.port = hostAddress.getPort();
    }

    public void setVerifyChainEnabled(boolean z) {
        this.verifyChainEnabled = z;
    }

    public void setVerifyRootCAEnabled(boolean z) {
        this.verifyRootCAEnabled = z;
    }
}
