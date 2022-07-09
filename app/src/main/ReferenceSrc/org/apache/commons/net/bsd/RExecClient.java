package org.apache.commons.net.bsd;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.SocketInputStream;

/* loaded from: classes.jar:org/apache/commons/net/bsd/RExecClient.class */
public class RExecClient extends SocketClient {
    public static final int DEFAULT_PORT = 512;
    private boolean __remoteVerificationEnabled;
    protected InputStream _errorStream_ = null;

    public RExecClient() {
        setDefaultPort(512);
    }

    InputStream _createErrorStream() throws IOException {
        ServerSocket createServerSocket = this._serverSocketFactory_.createServerSocket(0, 1, getLocalAddress());
        this._output_.write(Integer.toString(createServerSocket.getLocalPort()).getBytes());
        this._output_.write(0);
        this._output_.flush();
        Socket accept = createServerSocket.accept();
        createServerSocket.close();
        if (!this.__remoteVerificationEnabled || verifyRemote(accept)) {
            return new SocketInputStream(accept, accept.getInputStream());
        }
        accept.close();
        throw new IOException("Security violation: unexpected connection attempt by " + accept.getInetAddress().getHostAddress());
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        if (this._errorStream_ != null) {
            this._errorStream_.close();
        }
        this._errorStream_ = null;
        super.disconnect();
    }

    public InputStream getErrorStream() {
        return this._errorStream_;
    }

    public InputStream getInputStream() {
        return this._input_;
    }

    public OutputStream getOutputStream() {
        return this._output_;
    }

    public final boolean isRemoteVerificationEnabled() {
        return this.__remoteVerificationEnabled;
    }

    public void rexec(String str, String str2, String str3) throws IOException {
        rexec(str, str2, str3, false);
    }

    public void rexec(String str, String str2, String str3, boolean z) throws IOException {
        if (z) {
            this._errorStream_ = _createErrorStream();
        } else {
            this._output_.write(0);
        }
        this._output_.write(str.getBytes());
        this._output_.write(0);
        this._output_.write(str2.getBytes());
        this._output_.write(0);
        this._output_.write(str3.getBytes());
        this._output_.write(0);
        this._output_.flush();
        int read = this._input_.read();
        if (read <= 0) {
            if (read >= 0) {
                return;
            }
            throw new IOException("Server closed connection.");
        }
        StringBuilder sb = new StringBuilder();
        while (true) {
            int read2 = this._input_.read();
            if (read2 == -1 || read2 == 10) {
                break;
            }
            sb.append((char) read2);
        }
        throw new IOException(sb.toString());
    }

    public final void setRemoteVerificationEnabled(boolean z) {
        this.__remoteVerificationEnabled = z;
    }
}
