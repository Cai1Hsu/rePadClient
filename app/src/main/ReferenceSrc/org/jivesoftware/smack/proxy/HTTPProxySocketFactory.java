package org.jivesoftware.smack.proxy;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/proxy/HTTPProxySocketFactory.class */
class HTTPProxySocketFactory extends SocketFactory {
    private static final Pattern RESPONSE_PATTERN = Pattern.compile("HTTP/\\S+\\s(\\d+)\\s(.*)\\s*");
    private ProxyInfo proxy;

    public HTTPProxySocketFactory(ProxyInfo proxyInfo) {
        this.proxy = proxyInfo;
    }

    private Socket httpProxifiedSocket(String str, int i) throws IOException {
        String proxyUsername;
        int i2;
        String proxyAddress = this.proxy.getProxyAddress();
        Socket socket = new Socket(proxyAddress, this.proxy.getProxyPort());
        String str2 = "CONNECT " + str + ":" + i;
        socket.getOutputStream().write((str2 + " HTTP/1.1\r\nHost: " + str2 + (this.proxy.getProxyUsername() == null ? "" : "\r\nProxy-Authorization: Basic " + StringUtils.encodeBase64(proxyUsername + ":" + this.proxy.getProxyPassword())) + "\r\n\r\n").getBytes("UTF-8"));
        InputStream inputStream = socket.getInputStream();
        StringBuilder sb = new StringBuilder(100);
        int i3 = 0;
        do {
            char read = (char) inputStream.read();
            sb.append(read);
            if (sb.length() > 1024) {
                throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Recieved header of >1024 characters from " + proxyAddress + ", cancelling connection");
            }
            if (read == 65535) {
                throw new ProxyException(ProxyInfo.ProxyType.HTTP);
            }
            i2 = ((i3 == 0 || i3 == 2) && read == '\r') ? i3 + 1 : ((i3 == 1 || i3 == 3) && read == '\n') ? i3 + 1 : 0;
            i3 = i2;
        } while (i2 != 4);
        if (i2 != 4) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Never received blank line from " + proxyAddress + ", cancelling connection");
        }
        String readLine = new BufferedReader(new StringReader(sb.toString())).readLine();
        if (readLine == null) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Empty proxy response from " + proxyAddress + ", cancelling");
        }
        Matcher matcher = RESPONSE_PATTERN.matcher(readLine);
        if (!matcher.matches()) {
            throw new ProxyException(ProxyInfo.ProxyType.HTTP, "Unexpected proxy response from " + proxyAddress + ": " + readLine);
        }
        if (Integer.parseInt(matcher.group(1)) == 200) {
            return socket;
        }
        throw new ProxyException(ProxyInfo.ProxyType.HTTP);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i) throws IOException, UnknownHostException {
        return httpProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException, UnknownHostException {
        return httpProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i) throws IOException {
        return httpProxifiedSocket(inetAddress.getHostAddress(), i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws IOException {
        return httpProxifiedSocket(inetAddress.getHostAddress(), i);
    }
}
