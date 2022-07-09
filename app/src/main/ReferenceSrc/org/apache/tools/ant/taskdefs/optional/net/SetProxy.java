package org.apache.tools.ant.taskdefs.optional.net;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.util.ProxySetup;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/net/SetProxy.class */
public class SetProxy extends Task {
    private static final int HTTP_PORT = 80;
    private static final int SOCKS_PORT = 1080;
    protected String proxyHost = null;
    protected int proxyPort = HTTP_PORT;
    private String socksProxyHost = null;
    private int socksProxyPort = SOCKS_PORT;
    private String nonProxyHosts = null;
    private String proxyUser = null;
    private String proxyPassword = null;

    /* renamed from: org.apache.tools.ant.taskdefs.optional.net.SetProxy$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/net/SetProxy$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/net/SetProxy$ProxyAuth.class */
    private static final class ProxyAuth extends Authenticator {
        private PasswordAuthentication auth;

        private ProxyAuth(String str, String str2) {
            this.auth = new PasswordAuthentication(str, str2.toCharArray());
        }

        ProxyAuth(String str, String str2, AnonymousClass1 anonymousClass1) {
            this(str, str2);
        }

        @Override // java.net.Authenticator
        protected PasswordAuthentication getPasswordAuthentication() {
            return this.auth;
        }
    }

    private void traceSettingInfo() {
        log(new StringBuffer().append("Setting proxy to ").append(this.proxyHost != null ? this.proxyHost : "''").append(":").append(this.proxyPort).toString(), 3);
    }

    public void applyWebProxySettings() {
        boolean z = false;
        Properties properties = System.getProperties();
        boolean z2 = false;
        if (this.proxyHost != null) {
            if (this.proxyHost.length() != 0) {
                traceSettingInfo();
                properties.put(ProxySetup.HTTP_PROXY_HOST, this.proxyHost);
                String num = Integer.toString(this.proxyPort);
                properties.put(ProxySetup.HTTP_PROXY_PORT, num);
                properties.put(ProxySetup.HTTPS_PROXY_HOST, this.proxyHost);
                properties.put(ProxySetup.HTTPS_PROXY_PORT, num);
                properties.put(ProxySetup.FTP_PROXY_HOST, this.proxyHost);
                properties.put(ProxySetup.FTP_PROXY_PORT, num);
                if (this.nonProxyHosts != null) {
                    properties.put(ProxySetup.HTTP_NON_PROXY_HOSTS, this.nonProxyHosts);
                    properties.put(ProxySetup.HTTPS_NON_PROXY_HOSTS, this.nonProxyHosts);
                    properties.put(ProxySetup.FTP_NON_PROXY_HOSTS, this.nonProxyHosts);
                }
                z2 = true;
                z = true;
                if (this.proxyUser != null) {
                    properties.put(ProxySetup.HTTP_PROXY_USERNAME, this.proxyUser);
                    properties.put(ProxySetup.HTTP_PROXY_PASSWORD, this.proxyPassword);
                    z = true;
                    z2 = true;
                }
            } else {
                log("resetting http proxy", 3);
                properties.remove(ProxySetup.HTTP_PROXY_HOST);
                properties.remove(ProxySetup.HTTP_PROXY_PORT);
                properties.remove(ProxySetup.HTTP_PROXY_USERNAME);
                properties.remove(ProxySetup.HTTP_PROXY_PASSWORD);
                properties.remove(ProxySetup.HTTPS_PROXY_HOST);
                properties.remove(ProxySetup.HTTPS_PROXY_PORT);
                properties.remove(ProxySetup.FTP_PROXY_HOST);
                properties.remove(ProxySetup.FTP_PROXY_PORT);
                z2 = false;
                z = true;
            }
        }
        boolean z3 = z2;
        if (this.socksProxyHost != null) {
            if (this.socksProxyHost.length() != 0) {
                properties.put(ProxySetup.SOCKS_PROXY_HOST, this.socksProxyHost);
                properties.put(ProxySetup.SOCKS_PROXY_PORT, Integer.toString(this.socksProxyPort));
                z3 = true;
                z = true;
                if (this.proxyUser != null) {
                    properties.put(ProxySetup.SOCKS_PROXY_USERNAME, this.proxyUser);
                    properties.put(ProxySetup.SOCKS_PROXY_PASSWORD, this.proxyPassword);
                    z = true;
                    z3 = true;
                }
            } else {
                log("resetting socks proxy", 3);
                properties.remove(ProxySetup.SOCKS_PROXY_HOST);
                properties.remove(ProxySetup.SOCKS_PROXY_PORT);
                properties.remove(ProxySetup.SOCKS_PROXY_USERNAME);
                properties.remove(ProxySetup.SOCKS_PROXY_PASSWORD);
                z3 = z2;
                z = true;
            }
        }
        if (this.proxyUser != null) {
            if (z3) {
                Authenticator.setDefault(new ProxyAuth(this.proxyUser, this.proxyPassword, null));
            } else if (!z) {
            } else {
                Authenticator.setDefault(new ProxyAuth("", "", null));
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        applyWebProxySettings();
    }

    public void setNonProxyHosts(String str) {
        this.nonProxyHosts = str;
    }

    public void setProxyHost(String str) {
        this.proxyHost = str;
    }

    public void setProxyPassword(String str) {
        this.proxyPassword = str;
    }

    public void setProxyPort(int i) {
        this.proxyPort = i;
    }

    public void setProxyUser(String str) {
        this.proxyUser = str;
    }

    public void setSocksProxyHost(String str) {
        this.socksProxyHost = str;
    }

    public void setSocksProxyPort(int i) {
        this.socksProxyPort = i;
    }
}
