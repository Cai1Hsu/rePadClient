package org.jivesoftware.smackx.bytestreams.socks5;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.SocketException;
import org.jivesoftware.smackx.bytestreams.BytestreamSession;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamSession.class */
public class Socks5BytestreamSession implements BytestreamSession {
    private final boolean isDirect;
    private final Socket socket;

    protected Socks5BytestreamSession(Socket socket, boolean z) {
        this.socket = socket;
        this.isDirect = z;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public void close() throws IOException {
        this.socket.close();
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public InputStream getInputStream() throws IOException {
        return this.socket.getInputStream();
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public OutputStream getOutputStream() throws IOException {
        return this.socket.getOutputStream();
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public int getReadTimeout() throws IOException {
        try {
            return this.socket.getSoTimeout();
        } catch (SocketException e) {
            throw new IOException("Error on underlying Socket");
        }
    }

    public boolean isDirect() {
        return this.isDirect;
    }

    public boolean isMediated() {
        return !this.isDirect;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public void setReadTimeout(int i) throws IOException {
        try {
            this.socket.setSoTimeout(i);
        } catch (SocketException e) {
            throw new IOException("Error on underlying Socket");
        }
    }
}
