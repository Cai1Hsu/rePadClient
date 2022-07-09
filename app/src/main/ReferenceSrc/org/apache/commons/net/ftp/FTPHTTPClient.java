package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.Inet6Address;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import org.apache.commons.net.util.Base64;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTPHTTPClient.class */
public class FTPHTTPClient extends FTPClient {
    private static final byte[] CRLF = {13, 10};
    private final Base64 base64;
    private final String proxyHost;
    private final String proxyPassword;
    private final int proxyPort;
    private final String proxyUsername;

    public FTPHTTPClient(String str, int i) {
        this(str, i, null, null);
    }

    public FTPHTTPClient(String str, int i, String str2, String str3) {
        this.base64 = new Base64();
        this.proxyHost = str;
        this.proxyPort = i;
        this.proxyUsername = str2;
        this.proxyPassword = str3;
    }

    private void tunnelHandshake(String str, int i, InputStream inputStream, OutputStream outputStream) throws IOException, UnsupportedEncodingException {
        outputStream.write(("CONNECT " + str + ":" + i + " HTTP/1.1").getBytes("UTF-8"));
        outputStream.write(CRLF);
        outputStream.write(("Host: " + str + ":" + i).getBytes("UTF-8"));
        outputStream.write(CRLF);
        if (this.proxyUsername != null && this.proxyPassword != null) {
            outputStream.write(("Proxy-Authorization: Basic " + this.base64.encodeToString((this.proxyUsername + ":" + this.proxyPassword).getBytes("UTF-8"))).getBytes("UTF-8"));
        }
        outputStream.write(CRLF);
        ArrayList<String> arrayList = new ArrayList();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        String readLine = bufferedReader.readLine();
        while (true) {
            String str2 = readLine;
            if (str2 == null || str2.length() <= 0) {
                break;
            }
            arrayList.add(str2);
            readLine = bufferedReader.readLine();
        }
        if (arrayList.size() == 0) {
            throw new IOException("No response from proxy");
        }
        String str3 = (String) arrayList.get(0);
        if (!str3.startsWith("HTTP/") || str3.length() < 12) {
            throw new IOException("Invalid response from proxy: " + str3);
        }
        if ("200".equals(str3.substring(9, 12))) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("HTTPTunnelConnector: connection failed\r\n");
        sb.append("Response received from the proxy:\r\n");
        for (String str4 : arrayList) {
            sb.append(str4);
            sb.append("\r\n");
        }
        throw new IOException(sb.toString());
    }

    @Override // org.apache.commons.net.ftp.FTPClient
    protected Socket _openDataConnection_(int i, String str) throws IOException {
        return super._openDataConnection_(i, str);
    }

    @Override // org.apache.commons.net.ftp.FTPClient
    protected Socket _openDataConnection_(String str, String str2) throws IOException {
        Socket socket;
        if (getDataConnectionMode() != 2) {
            throw new IllegalStateException("Only passive connection mode supported");
        }
        boolean z = getRemoteAddress() instanceof Inet6Address;
        if (!(isUseEPSVwithIPv4() || z) || epsv() != 229) {
            if (z) {
                socket = null;
            } else if (pasv() != 227) {
                socket = null;
            } else {
                _parsePassiveModeReply(this._replyLines.get(0));
            }
            return socket;
        }
        _parseExtendedPassiveModeReply(this._replyLines.get(0));
        Socket socket2 = new Socket(this.proxyHost, this.proxyPort);
        tunnelHandshake(getPassiveHost(), getPassivePort(), socket2.getInputStream(), socket2.getOutputStream());
        if (getRestartOffset() <= 0 || restart(getRestartOffset())) {
            socket = socket2;
            if (!FTPReply.isPositivePreliminary(sendCommand(str, str2))) {
                socket2.close();
                socket = null;
            }
        } else {
            socket2.close();
            socket = null;
        }
        return socket;
    }

    @Override // org.apache.commons.net.SocketClient
    public void connect(String str, int i) throws SocketException, IOException {
        this._socket_ = new Socket(this.proxyHost, this.proxyPort);
        this._input_ = this._socket_.getInputStream();
        this._output_ = this._socket_.getOutputStream();
        try {
            tunnelHandshake(str, i, this._input_, this._output_);
            super._connectAction_();
        } catch (Exception e) {
            IOException iOException = new IOException("Could not connect to " + str + " using port " + i);
            iOException.initCause(e);
            throw iOException;
        }
    }
}
