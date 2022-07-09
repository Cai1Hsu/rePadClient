package org.apache.commons.net;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketException;
import javax.net.ServerSocketFactory;
import javax.net.SocketFactory;

/* loaded from: classes.jar:org/apache/commons/net/SocketClient.class */
public abstract class SocketClient {
    private static final int DEFAULT_CONNECT_TIMEOUT = 0;
    public static final String NETASCII_EOL = "\r\n";
    private ProtocolCommandSupport __commandSupport;
    private static final SocketFactory __DEFAULT_SOCKET_FACTORY = SocketFactory.getDefault();
    private static final ServerSocketFactory __DEFAULT_SERVER_SOCKET_FACTORY = ServerSocketFactory.getDefault();
    protected int connectTimeout = 0;
    private int receiveBufferSize = -1;
    private int sendBufferSize = -1;
    protected Socket _socket_ = null;
    protected InputStream _input_ = null;
    protected OutputStream _output_ = null;
    protected int _timeout_ = 0;
    protected int _defaultPort_ = 0;
    protected SocketFactory _socketFactory_ = __DEFAULT_SOCKET_FACTORY;
    protected ServerSocketFactory _serverSocketFactory_ = __DEFAULT_SERVER_SOCKET_FACTORY;

    private void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    private void closeQuietly(Socket socket) {
        if (socket != null) {
            try {
                socket.close();
            } catch (IOException e) {
            }
        }
    }

    protected void _connectAction_() throws IOException {
        this._socket_.setSoTimeout(this._timeout_);
        this._input_ = this._socket_.getInputStream();
        this._output_ = this._socket_.getOutputStream();
    }

    public void addProtocolCommandListener(ProtocolCommandListener protocolCommandListener) {
        getCommandSupport().addProtocolCommandListener(protocolCommandListener);
    }

    public void connect(String str) throws SocketException, IOException {
        connect(str, this._defaultPort_);
    }

    public void connect(String str, int i) throws SocketException, IOException {
        connect(InetAddress.getByName(str), i);
    }

    public void connect(String str, int i, InetAddress inetAddress, int i2) throws SocketException, IOException {
        connect(InetAddress.getByName(str), i, inetAddress, i2);
    }

    public void connect(InetAddress inetAddress) throws SocketException, IOException {
        connect(inetAddress, this._defaultPort_);
    }

    public void connect(InetAddress inetAddress, int i) throws SocketException, IOException {
        this._socket_ = this._socketFactory_.createSocket();
        if (this.receiveBufferSize != -1) {
            this._socket_.setReceiveBufferSize(this.receiveBufferSize);
        }
        if (this.sendBufferSize != -1) {
            this._socket_.setSendBufferSize(this.sendBufferSize);
        }
        this._socket_.connect(new InetSocketAddress(inetAddress, i), this.connectTimeout);
        _connectAction_();
    }

    public void connect(InetAddress inetAddress, int i, InetAddress inetAddress2, int i2) throws SocketException, IOException {
        this._socket_ = this._socketFactory_.createSocket();
        if (this.receiveBufferSize != -1) {
            this._socket_.setReceiveBufferSize(this.receiveBufferSize);
        }
        if (this.sendBufferSize != -1) {
            this._socket_.setSendBufferSize(this.sendBufferSize);
        }
        this._socket_.bind(new InetSocketAddress(inetAddress2, i2));
        this._socket_.connect(new InetSocketAddress(inetAddress, i), this.connectTimeout);
        _connectAction_();
    }

    protected void createCommandSupport() {
        this.__commandSupport = new ProtocolCommandSupport(this);
    }

    public void disconnect() throws IOException {
        closeQuietly(this._socket_);
        closeQuietly(this._input_);
        closeQuietly(this._output_);
        this._socket_ = null;
        this._input_ = null;
        this._output_ = null;
    }

    protected void fireCommandSent(String str, String str2) {
        if (getCommandSupport().getListenerCount() > 0) {
            getCommandSupport().fireCommandSent(str, str2);
        }
    }

    protected void fireReplyReceived(int i, String str) {
        if (getCommandSupport().getListenerCount() > 0) {
            getCommandSupport().fireReplyReceived(i, str);
        }
    }

    protected ProtocolCommandSupport getCommandSupport() {
        return this.__commandSupport;
    }

    public int getConnectTimeout() {
        return this.connectTimeout;
    }

    public int getDefaultPort() {
        return this._defaultPort_;
    }

    public int getDefaultTimeout() {
        return this._timeout_;
    }

    public boolean getKeepAlive() throws SocketException {
        return this._socket_.getKeepAlive();
    }

    public InetAddress getLocalAddress() {
        return this._socket_.getLocalAddress();
    }

    public int getLocalPort() {
        return this._socket_.getLocalPort();
    }

    protected int getReceiveBufferSize() {
        return this.receiveBufferSize;
    }

    public InetAddress getRemoteAddress() {
        return this._socket_.getInetAddress();
    }

    public int getRemotePort() {
        return this._socket_.getPort();
    }

    protected int getSendBufferSize() {
        return this.sendBufferSize;
    }

    public ServerSocketFactory getServerSocketFactory() {
        return this._serverSocketFactory_;
    }

    public int getSoLinger() throws SocketException {
        return this._socket_.getSoLinger();
    }

    public int getSoTimeout() throws SocketException {
        return this._socket_.getSoTimeout();
    }

    public boolean getTcpNoDelay() throws SocketException {
        return this._socket_.getTcpNoDelay();
    }

    public boolean isAvailable() {
        boolean z = false;
        if (isConnected()) {
            try {
                if (this._socket_.getInetAddress() == null) {
                    z = false;
                } else {
                    z = false;
                    if (this._socket_.getPort() != 0) {
                        z = false;
                        if (this._socket_.getRemoteSocketAddress() != null) {
                            z = false;
                            if (!this._socket_.isClosed()) {
                                z = false;
                                if (!this._socket_.isInputShutdown()) {
                                    z = false;
                                    if (!this._socket_.isOutputShutdown()) {
                                        this._socket_.getInputStream();
                                        this._socket_.getOutputStream();
                                        z = true;
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (IOException e) {
                z = false;
            }
        }
        return z;
    }

    public boolean isConnected() {
        return this._socket_ == null ? false : this._socket_.isConnected();
    }

    public void removeProtocolCommandListener(ProtocolCommandListener protocolCommandListener) {
        getCommandSupport().removeProtocolCommandListener(protocolCommandListener);
    }

    public void setConnectTimeout(int i) {
        this.connectTimeout = i;
    }

    public void setDefaultPort(int i) {
        this._defaultPort_ = i;
    }

    public void setDefaultTimeout(int i) {
        this._timeout_ = i;
    }

    public void setKeepAlive(boolean z) throws SocketException {
        this._socket_.setKeepAlive(z);
    }

    public void setReceiveBufferSize(int i) throws SocketException {
        this.receiveBufferSize = i;
    }

    public void setSendBufferSize(int i) throws SocketException {
        this.sendBufferSize = i;
    }

    public void setServerSocketFactory(ServerSocketFactory serverSocketFactory) {
        if (serverSocketFactory == null) {
            this._serverSocketFactory_ = __DEFAULT_SERVER_SOCKET_FACTORY;
        } else {
            this._serverSocketFactory_ = serverSocketFactory;
        }
    }

    public void setSoLinger(boolean z, int i) throws SocketException {
        this._socket_.setSoLinger(z, i);
    }

    public void setSoTimeout(int i) throws SocketException {
        this._socket_.setSoTimeout(i);
    }

    public void setSocketFactory(SocketFactory socketFactory) {
        if (socketFactory == null) {
            this._socketFactory_ = __DEFAULT_SOCKET_FACTORY;
        } else {
            this._socketFactory_ = socketFactory;
        }
    }

    public void setTcpNoDelay(boolean z) throws SocketException {
        this._socket_.setTcpNoDelay(z);
    }

    public boolean verifyRemote(Socket socket) {
        return socket.getInetAddress().equals(getRemoteAddress());
    }
}
