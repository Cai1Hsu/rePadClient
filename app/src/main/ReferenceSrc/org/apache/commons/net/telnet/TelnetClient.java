package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/commons/net/telnet/TelnetClient.class */
public class TelnetClient extends Telnet {
    private TelnetInputListener inputListener;
    protected boolean readerThread = true;
    private InputStream __input = null;
    private OutputStream __output = null;

    public TelnetClient() {
        super("VT100");
    }

    public TelnetClient(String str) {
        super(str);
    }

    void _closeOutputStream() throws IOException {
        this._output_.close();
    }

    @Override // org.apache.commons.net.telnet.Telnet, org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        TelnetInputStream telnetInputStream = new TelnetInputStream(this._input_, this, this.readerThread);
        if (this.readerThread) {
            telnetInputStream._start();
        }
        this.__input = new BufferedInputStream(telnetInputStream);
        this.__output = new TelnetOutputStream(this);
    }

    void _flushOutputStream() throws IOException {
        this._output_.flush();
    }

    @Override // org.apache.commons.net.telnet.Telnet
    public void addOptionHandler(TelnetOptionHandler telnetOptionHandler) throws InvalidTelnetOptionException, IOException {
        super.addOptionHandler(telnetOptionHandler);
    }

    @Override // org.apache.commons.net.telnet.Telnet
    public void deleteOptionHandler(int i) throws InvalidTelnetOptionException, IOException {
        super.deleteOptionHandler(i);
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        if (this.__input != null) {
            this.__input.close();
        }
        if (this.__output != null) {
            this.__output.close();
        }
        super.disconnect();
    }

    public InputStream getInputStream() {
        return this.__input;
    }

    public boolean getLocalOptionState(int i) {
        return _stateIsWill(i) && _requestedWill(i);
    }

    public OutputStream getOutputStream() {
        return this.__output;
    }

    public boolean getReaderThread() {
        return this.readerThread;
    }

    public boolean getRemoteOptionState(int i) {
        return _stateIsDo(i) && _requestedDo(i);
    }

    void notifyInputListener() {
        TelnetInputListener telnetInputListener;
        synchronized (this) {
            telnetInputListener = this.inputListener;
        }
        if (telnetInputListener != null) {
            telnetInputListener.telnetInputAvailable();
        }
    }

    public void registerInputListener(TelnetInputListener telnetInputListener) {
        synchronized (this) {
            this.inputListener = telnetInputListener;
        }
    }

    @Override // org.apache.commons.net.telnet.Telnet
    public void registerNotifHandler(TelnetNotificationHandler telnetNotificationHandler) {
        super.registerNotifHandler(telnetNotificationHandler);
    }

    public void registerSpyStream(OutputStream outputStream) {
        super._registerSpyStream(outputStream);
    }

    public boolean sendAYT(long j) throws IOException, IllegalArgumentException, InterruptedException {
        return _sendAYT(j);
    }

    public void sendCommand(byte b) throws IOException, IllegalArgumentException {
        _sendCommand(b);
    }

    public void sendSubnegotiation(int[] iArr) throws IOException, IllegalArgumentException {
        if (iArr.length < 1) {
            throw new IllegalArgumentException("zero length message");
        }
        _sendSubnegotiation(iArr);
    }

    public void setReaderThread(boolean z) {
        this.readerThread = z;
    }

    public void stopSpyStream() {
        super._stopSpyStream();
    }

    public void unregisterInputListener() {
        synchronized (this) {
            this.inputListener = null;
        }
    }

    @Override // org.apache.commons.net.telnet.Telnet
    public void unregisterNotifHandler() {
        super.unregisterNotifHandler();
    }
}
