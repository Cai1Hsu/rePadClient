package org.jivesoftware.smackx.bytestreams.socks5;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Arrays;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.bytestreams.socks5.packet.Bytestream;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/Socks5Client.class */
class Socks5Client {
    protected String digest;
    protected Bytestream.StreamHost streamHost;

    public Socks5Client(Bytestream.StreamHost streamHost, String str) {
        this.streamHost = streamHost;
        this.digest = str;
    }

    private byte[] createSocks5ConnectRequest() {
        byte[] bytes = this.digest.getBytes();
        byte[] bArr = new byte[bytes.length + 7];
        bArr[0] = (byte) 5;
        bArr[1] = (byte) 1;
        bArr[2] = (byte) 0;
        bArr[3] = (byte) 3;
        bArr[4] = (byte) bytes.length;
        System.arraycopy(bytes, 0, bArr, 5, bytes.length);
        bArr[bArr.length - 2] = (byte) 0;
        bArr[bArr.length - 1] = (byte) 0;
        return bArr;
    }

    protected boolean establish(Socket socket) throws IOException {
        DataInputStream dataInputStream = new DataInputStream(socket.getInputStream());
        DataOutputStream dataOutputStream = new DataOutputStream(socket.getOutputStream());
        dataOutputStream.write(new byte[]{5, 1, 0});
        dataOutputStream.flush();
        byte[] bArr = new byte[2];
        dataInputStream.readFully(bArr);
        boolean z = false;
        if (bArr[0] == 5) {
            if (bArr[1] != 0) {
                z = false;
            } else {
                byte[] createSocks5ConnectRequest = createSocks5ConnectRequest();
                dataOutputStream.write(createSocks5ConnectRequest);
                dataOutputStream.flush();
                try {
                    byte[] receiveSocks5Message = Socks5Utils.receiveSocks5Message(dataInputStream);
                    createSocks5ConnectRequest[1] = (byte) 0;
                    z = Arrays.equals(createSocks5ConnectRequest, receiveSocks5Message);
                } catch (XMPPException e) {
                    z = false;
                }
            }
        }
        return z;
    }

    public Socket getSocket(int i) throws IOException, XMPPException, InterruptedException, TimeoutException {
        FutureTask futureTask = new FutureTask(new Callable<Socket>() { // from class: org.jivesoftware.smackx.bytestreams.socks5.Socks5Client.1
            @Override // java.util.concurrent.Callable
            public Socket call() throws Exception {
                Socket socket = new Socket();
                socket.connect(new InetSocketAddress(Socks5Client.this.streamHost.getAddress(), Socks5Client.this.streamHost.getPort()));
                if (!Socks5Client.this.establish(socket)) {
                    socket.close();
                    throw new XMPPException("establishing connection to SOCKS5 proxy failed");
                }
                return socket;
            }
        });
        new Thread(futureTask).start();
        try {
            return (Socket) futureTask.get(i, TimeUnit.MILLISECONDS);
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            if (cause != null) {
                if (cause instanceof IOException) {
                    throw ((IOException) cause);
                }
                if (cause instanceof XMPPException) {
                    throw ((XMPPException) cause);
                }
            }
            throw new IOException("Error while connection to SOCKS5 proxy");
        }
    }
}
