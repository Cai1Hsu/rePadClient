package org.jivesoftware.smack.proxy;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import javax.net.SocketFactory;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: classes.jar:org/jivesoftware/smack/proxy/Socks5ProxySocketFactory.class */
public class Socks5ProxySocketFactory extends SocketFactory {
    private ProxyInfo proxy;

    public Socks5ProxySocketFactory(ProxyInfo proxyInfo) {
        this.proxy = proxyInfo;
    }

    private void fill(InputStream inputStream, byte[] bArr, int i) throws IOException {
        int i2 = 0;
        while (true) {
            int i3 = i2;
            if (i3 < i) {
                int read = inputStream.read(bArr, i3, i - i3);
                if (read <= 0) {
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS5, "stream is closed");
                }
                i2 = i3 + read;
            } else {
                return;
            }
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:62:0x02bc -> B:14:0x00c2). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:63:0x02c0 -> B:41:0x01f2). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:64:0x02c4 -> B:48:0x0229). Please submit an issue!!! */
    private Socket socks5ProxifiedSocket(String str, int i) throws IOException {
        Socket socket;
        String proxyAddress = this.proxy.getProxyAddress();
        int proxyPort = this.proxy.getProxyPort();
        String proxyUsername = this.proxy.getProxyUsername();
        String proxyPassword = this.proxy.getProxyPassword();
        try {
            socket = new Socket(proxyAddress, proxyPort);
            try {
                InputStream inputStream = socket.getInputStream();
                OutputStream outputStream = socket.getOutputStream();
                socket.setTcpNoDelay(true);
                byte[] bArr = new byte[1024];
                int i2 = 0 + 1;
                bArr[0] = (byte) 5;
                int i3 = i2 + 1;
                bArr[i2] = (byte) 2;
                int i4 = i3 + 1;
                bArr[i3] = (byte) 0;
                bArr[i4] = (byte) 2;
                outputStream.write(bArr, 0, i4 + 1);
                fill(inputStream, bArr, 2);
                boolean z = false;
                switch (bArr[1] & 255) {
                    case 0:
                        z = true;
                        break;
                    case 1:
                        break;
                    case 2:
                        z = false;
                        if (proxyUsername != null) {
                            z = false;
                            if (proxyPassword != null) {
                                int i5 = 0 + 1;
                                bArr[0] = (byte) 1;
                                bArr[i5] = (byte) proxyUsername.length();
                                System.arraycopy(proxyUsername.getBytes(), 0, bArr, i5 + 1, proxyUsername.length());
                                int length = proxyUsername.length() + 2;
                                int i6 = length + 1;
                                bArr[length] = (byte) proxyPassword.length();
                                System.arraycopy(proxyPassword.getBytes(), 0, bArr, i6, proxyPassword.length());
                                outputStream.write(bArr, 0, i6 + proxyPassword.length());
                                fill(inputStream, bArr, 2);
                                z = false;
                                if (bArr[1] == 0) {
                                    z = true;
                                    break;
                                }
                            }
                        }
                        break;
                    default:
                        z = false;
                        break;
                }
                if (!z) {
                    try {
                        socket.close();
                    } catch (Exception e) {
                    }
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS5, "fail in SOCKS5 proxy");
                }
                int i7 = 0 + 1;
                bArr[0] = (byte) 5;
                int i8 = i7 + 1;
                bArr[i7] = (byte) 1;
                int i9 = i8 + 1;
                bArr[i8] = (byte) 0;
                byte[] bytes = str.getBytes();
                int length2 = bytes.length;
                int i10 = i9 + 1;
                bArr[i9] = (byte) 3;
                bArr[i10] = (byte) length2;
                System.arraycopy(bytes, 0, bArr, i10 + 1, length2);
                int i11 = length2 + 5;
                int i12 = i11 + 1;
                bArr[i11] = (byte) (i >>> 8);
                bArr[i12] = (byte) (i & 255);
                outputStream.write(bArr, 0, i12 + 1);
                fill(inputStream, bArr, 4);
                if (bArr[1] != 0) {
                    try {
                        socket.close();
                    } catch (Exception e2) {
                    }
                    throw new ProxyException(ProxyInfo.ProxyType.SOCKS5, "server returns " + ((int) bArr[1]));
                }
                switch (bArr[3] & 255) {
                    case 1:
                        fill(inputStream, bArr, 6);
                        break;
                    case 3:
                        fill(inputStream, bArr, 1);
                        fill(inputStream, bArr, (bArr[0] & 255) + 2);
                        break;
                    case 4:
                        fill(inputStream, bArr, 18);
                        break;
                }
                return socket;
            } catch (RuntimeException e3) {
                e = e3;
                throw e;
            } catch (Exception e4) {
                e = e4;
                if (socket != null) {
                    try {
                        socket.close();
                    } catch (Exception e5) {
                    }
                }
                String str2 = "ProxySOCKS5: " + e.toString();
                if (!(e instanceof Throwable)) {
                    throw new IOException(str2);
                }
                throw new ProxyException(ProxyInfo.ProxyType.SOCKS5, str2, e);
            }
        } catch (RuntimeException e6) {
            e = e6;
        } catch (Exception e7) {
            e = e7;
            socket = null;
        }
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i) throws IOException, UnknownHostException {
        return socks5ProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(String str, int i, InetAddress inetAddress, int i2) throws IOException, UnknownHostException {
        return socks5ProxifiedSocket(str, i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i) throws IOException {
        return socks5ProxifiedSocket(inetAddress.getHostAddress(), i);
    }

    @Override // javax.net.SocketFactory
    public Socket createSocket(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws IOException {
        return socks5ProxifiedSocket(inetAddress.getHostAddress(), i);
    }
}
