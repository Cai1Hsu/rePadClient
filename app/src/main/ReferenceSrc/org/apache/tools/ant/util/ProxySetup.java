package org.apache.tools.ant.util;

import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/util/ProxySetup.class */
public class ProxySetup {
    public static final String FTP_NON_PROXY_HOSTS = "ftp.nonProxyHosts";
    public static final String FTP_PROXY_HOST = "ftp.proxyHost";
    public static final String FTP_PROXY_PORT = "ftp.proxyPort";
    public static final String HTTPS_NON_PROXY_HOSTS = "https.nonProxyHosts";
    public static final String HTTPS_PROXY_HOST = "https.proxyHost";
    public static final String HTTPS_PROXY_PORT = "https.proxyPort";
    public static final String HTTP_NON_PROXY_HOSTS = "http.nonProxyHosts";
    public static final String HTTP_PROXY_HOST = "http.proxyHost";
    public static final String HTTP_PROXY_PASSWORD = "http.proxyPassword";
    public static final String HTTP_PROXY_PORT = "http.proxyPort";
    public static final String HTTP_PROXY_USERNAME = "http.proxyUser";
    public static final String SOCKS_PROXY_HOST = "socksProxyHost";
    public static final String SOCKS_PROXY_PASSWORD = "java.net.socks.password";
    public static final String SOCKS_PROXY_PORT = "socksProxyPort";
    public static final String SOCKS_PROXY_USERNAME = "java.net.socks.username";
    public static final String USE_SYSTEM_PROXIES = "java.net.useSystemProxies";
    private Project owner;

    public ProxySetup(Project project) {
        this.owner = project;
    }

    public static String getSystemProxySetting() {
        String str;
        try {
            str = System.getProperty(USE_SYSTEM_PROXIES);
        } catch (SecurityException e) {
            str = null;
        }
        return str;
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x001a, code lost:
        if (org.apache.tools.ant.Project.toBoolean(r0) != false) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void enableProxies() {
        String str;
        if (getSystemProxySetting() == null) {
            String property = this.owner.getProperty(USE_SYSTEM_PROXIES);
            if (property != null) {
                str = property;
            }
            str = "true";
            String stringBuffer = new StringBuffer().append("setting java.net.useSystemProxies to ").append(str).toString();
            try {
                this.owner.log(stringBuffer, 4);
                System.setProperty(USE_SYSTEM_PROXIES, str);
            } catch (SecurityException e) {
                this.owner.log(new StringBuffer().append("Security Exception when ").append(stringBuffer).toString());
            }
        }
    }
}
