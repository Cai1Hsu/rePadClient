package org.jivesoftware.smack.proxy;

import java.io.IOException;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: classes.jar:org/jivesoftware/smack/proxy/ProxyException.class */
public class ProxyException extends IOException {
    public ProxyException(ProxyInfo.ProxyType proxyType) {
        super("Proxy Exception " + proxyType.toString() + " : Unknown Error");
    }

    public ProxyException(ProxyInfo.ProxyType proxyType, String str) {
        super("Proxy Exception " + proxyType.toString() + " : " + str);
    }

    public ProxyException(ProxyInfo.ProxyType proxyType, String str, Throwable th) {
        super("Proxy Exception " + proxyType.toString() + " : " + str + ", " + th);
    }
}
