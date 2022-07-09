package org.jivesoftware.smack.proxy;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: classes.jar:org/jivesoftware/smack/proxy/Socks4ProxySocketFactory.class */
public class Socks4ProxySocketFactory extends SocketFactory {
    private ProxyInfo proxy;

    public Socks4ProxySocketFactory(ProxyInfo proxyInfo) {
        this.proxy = proxyInfo;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:53:0x01b2 -> B:47:0x017e). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x01b6 -> B:35:0x0126). Please submit an issue!!! */
    private Socket socks4ProxifiedSocket(String str, int i) throws IOException {
        Socket socket;
        UnknownHostException e;
        String proxyAddress = this.proxy.getProxyAddress();
        int proxyPort = this.proxy.getProxyPort();
        String proxyUsername = this.proxy.getProxyUsername();
        this.proxy.getProxyPassword();
        try {
            socket = new Socket(proxyAddress, proxyPort);
        } catch (RuntimeException e2) {
            e = e2;
        } catch (Exception e3) {
            e = e3;
            socket = null;
        }
        try {
            InputStream inputStream = socket.getInputStream();
            OutputStream outputStream = socket.getOutputStream();
            socket.setTcpNoDelay(true);
            byte[] bArr = new byte[1024];
            int i2 = 0 + 1;
            bArr[0] = (byte) 4;
            int i3 = i2 + 1;
            bArr[i2] = (byte) 1;
            int i4 = i3 + 1;
            bArr[i3] = (byte) (i >>> 8);
            bArr[i4] = (byte) (i & 255);
            try {
                byte[] address = InetAddress.getByName(str).getAddress();
                int i5 = 0;
                int i6 = i4 + 1;
                while (true) {
                    try {
                        if (i5 >= address.length) {
                            break;
                        }
                        bArr[i6] = address[i5];
                        i5++;
                        i6++;
                    } catch (UnknownHostException e4) {
                        e = e4;
                        throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, e.toString(), e);
                    }
                }
                int i7 = i6;
                if (proxyUsername != null) {
                    System.arraycopy(proxyUsername.getBytes(), 0, bArr, i6, proxyUsername.length());
                    i7 = i6 + proxyUsername.length();
                }
                bArr[i7] = (byte) 0;
                outputStream.write(bArr, 0, i7 + 1);
                int i8 = 0;
                while (true) {
                    int i9 = i8;
                    if (i9 >= 6) {
                        if (bArr[0] != 0) {
                            throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, "server returns VN " + ((int) bArr[0]));
                        }
                        if (bArr[1] == 90) {
                            inputStream.read(new byte[2], 0, 2);
                            return socket;
                        }
                        try {
                            socket.close();
                        } catch (Exception e5) {
                        }
                        throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, "ProxySOCKS4: server returns CD " + ((int) bArr[1]));
                    }
                    int read = inputStream.read(bArr, i9, 6 - i9);
                    if (read <= 0) {
                        throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, "stream is closed");
                    }
                    i8 = i9 + read;
                }
            } catch (UnknownHostException e6) {
                e = e6;
            }
        } catch (RuntimeException e7) {
            e = e7;
            throw e;
        } catch (Exception e8) {
            e = e8;
            if (socket != null) {
                try {
                    socket.close();
                } catch (Exception e9) {
                }
            }
            throw new ProxyException(ProxyInfo.ProxyType.SOCKS4, e.toString());
        }
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i) throws IOException, UnknownHostException {
        return socks4ProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException, UnknownHostException {
        return socks4ProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i) throws IOException {
        return socks4ProxifiedSocket(inetAddress.getHostAddress(), i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws IOException {
        return socks4ProxifiedSocket(inetAddress.getHostAddress(), i);
    }
}
