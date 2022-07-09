package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.net.SocketClient;

/* loaded from: classes.jar:org/apache/commons/net/telnet/Telnet.class */
class Telnet extends SocketClient {
    static final int DEFAULT_PORT = 23;
    protected static final int TERMINAL_TYPE = 24;
    protected static final int TERMINAL_TYPE_IS = 0;
    protected static final int TERMINAL_TYPE_SEND = 1;
    static final int _DO_MASK = 2;
    static final int _REQUESTED_DO_MASK = 8;
    static final int _REQUESTED_WILL_MASK = 4;
    static final int _WILL_MASK = 1;
    static final boolean debug = false;
    static final boolean debugoptions = false;
    private TelnetNotificationHandler __notifhand;
    int[] _doResponse;
    int[] _options;
    int[] _willResponse;
    private volatile boolean aytFlag;
    private Object aytMonitor;
    private TelnetOptionHandler[] optionHandlers;
    private volatile OutputStream spyStream;
    private String terminalType;
    static final byte[] _COMMAND_DO = {-1, -3};
    static final byte[] _COMMAND_DONT = {-1, -2};
    static final byte[] _COMMAND_WILL = {-1, -5};
    static final byte[] _COMMAND_WONT = {-1, -4};
    static final byte[] _COMMAND_SB = {-1, -6};
    static final byte[] _COMMAND_SE = {-1, -16};
    static final byte[] _COMMAND_IS = {24, 0};
    static final byte[] _COMMAND_AYT = {-1, -10};

    Telnet() {
        this.terminalType = null;
        this.aytMonitor = new Object();
        this.aytFlag = true;
        this.spyStream = null;
        this.__notifhand = null;
        setDefaultPort(23);
        this._doResponse = new int[256];
        this._willResponse = new int[256];
        this._options = new int[256];
        this.optionHandlers = new TelnetOptionHandler[256];
    }

    Telnet(String str) {
        this.terminalType = null;
        this.aytMonitor = new Object();
        this.aytFlag = true;
        this.spyStream = null;
        this.__notifhand = null;
        setDefaultPort(23);
        this._doResponse = new int[256];
        this._willResponse = new int[256];
        this._options = new int[256];
        this.terminalType = str;
        this.optionHandlers = new TelnetOptionHandler[256];
    }

    @Override // org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        for (int i = 0; i < 256; i++) {
            this._doResponse[i] = 0;
            this._willResponse[i] = 0;
            this._options[i] = 0;
            if (this.optionHandlers[i] != null) {
                this.optionHandlers[i].setDo(false);
                this.optionHandlers[i].setWill(false);
            }
        }
        super._connectAction_();
        this._input_ = new BufferedInputStream(this._input_);
        this._output_ = new BufferedOutputStream(this._output_);
        for (int i2 = 0; i2 < 256; i2++) {
            if (this.optionHandlers[i2] != null) {
                if (this.optionHandlers[i2].getInitLocal()) {
                    _requestWill(this.optionHandlers[i2].getOptionCode());
                }
                if (this.optionHandlers[i2].getInitRemote()) {
                    _requestDo(this.optionHandlers[i2].getOptionCode());
                }
            }
        }
    }

    final void _processAYTResponse() {
        synchronized (this) {
            if (!this.aytFlag) {
                synchronized (this.aytMonitor) {
                    this.aytFlag = true;
                    this.aytMonitor.notifyAll();
                }
            }
        }
    }

    void _processCommand(int i) {
        if (this.__notifhand != null) {
            this.__notifhand.receivedNegotiation(5, i);
        }
    }

    void _processDo(int i) throws IOException {
        boolean z;
        if (this.__notifhand != null) {
            this.__notifhand.receivedNegotiation(1, i);
        }
        if (this.optionHandlers[i] != null) {
            z = this.optionHandlers[i].getAcceptLocal();
        } else {
            z = false;
            if (i == 24) {
                z = false;
                if (this.terminalType != null) {
                    z = false;
                    if (this.terminalType.length() > 0) {
                        z = true;
                    }
                }
            }
        }
        if (this._willResponse[i] > 0) {
            int[] iArr = this._willResponse;
            iArr[i] = iArr[i] - 1;
            if (this._willResponse[i] > 0 && _stateIsWill(i)) {
                int[] iArr2 = this._willResponse;
                iArr2[i] = iArr2[i] - 1;
            }
        }
        if (this._willResponse[i] == 0 && _requestedWont(i)) {
            if (z) {
                _setWantWill(i);
                _sendWill(i);
            } else {
                int[] iArr3 = this._willResponse;
                iArr3[i] = iArr3[i] + 1;
                _sendWont(i);
            }
        }
        _setWill(i);
    }

    void _processDont(int i) throws IOException {
        if (this.__notifhand != null) {
            this.__notifhand.receivedNegotiation(2, i);
        }
        if (this._willResponse[i] > 0) {
            int[] iArr = this._willResponse;
            iArr[i] = iArr[i] - 1;
            if (this._willResponse[i] > 0 && _stateIsWont(i)) {
                int[] iArr2 = this._willResponse;
                iArr2[i] = iArr2[i] - 1;
            }
        }
        if (this._willResponse[i] == 0 && _requestedWill(i)) {
            if (_stateIsWill(i) || _requestedWill(i)) {
                _sendWont(i);
            }
            _setWantWont(i);
        }
        _setWont(i);
    }

    void _processSuboption(int[] iArr, int i) throws IOException {
        if (i > 0) {
            if (this.optionHandlers[iArr[0]] != null) {
                _sendSubnegotiation(this.optionHandlers[iArr[0]].answerSubnegotiation(iArr, i));
            } else if (i <= 1 || iArr[0] != 24 || iArr[1] != 1) {
            } else {
                _sendTerminalType();
            }
        }
    }

    void _processWill(int i) throws IOException {
        if (this.__notifhand != null) {
            this.__notifhand.receivedNegotiation(3, i);
        }
        boolean z = false;
        if (this.optionHandlers[i] != null) {
            z = this.optionHandlers[i].getAcceptRemote();
        }
        if (this._doResponse[i] > 0) {
            int[] iArr = this._doResponse;
            iArr[i] = iArr[i] - 1;
            if (this._doResponse[i] > 0 && _stateIsDo(i)) {
                int[] iArr2 = this._doResponse;
                iArr2[i] = iArr2[i] - 1;
            }
        }
        if (this._doResponse[i] == 0 && _requestedDont(i)) {
            if (z) {
                _setWantDo(i);
                _sendDo(i);
            } else {
                int[] iArr3 = this._doResponse;
                iArr3[i] = iArr3[i] + 1;
                _sendDont(i);
            }
        }
        _setDo(i);
    }

    void _processWont(int i) throws IOException {
        if (this.__notifhand != null) {
            this.__notifhand.receivedNegotiation(4, i);
        }
        if (this._doResponse[i] > 0) {
            int[] iArr = this._doResponse;
            iArr[i] = iArr[i] - 1;
            if (this._doResponse[i] > 0 && _stateIsDont(i)) {
                int[] iArr2 = this._doResponse;
                iArr2[i] = iArr2[i] - 1;
            }
        }
        if (this._doResponse[i] == 0 && _requestedDo(i)) {
            if (_stateIsDo(i) || _requestedDo(i)) {
                _sendDont(i);
            }
            _setWantDont(i);
        }
        _setDont(i);
    }

    void _registerSpyStream(OutputStream outputStream) {
        this.spyStream = outputStream;
    }

    final void _requestDo(int i) throws IOException {
        synchronized (this) {
            if ((this._doResponse[i] != 0 || !_stateIsDo(i)) && !_requestedDo(i)) {
                _setWantDo(i);
                int[] iArr = this._doResponse;
                iArr[i] = iArr[i] + 1;
                _sendDo(i);
            }
        }
    }

    final void _requestDont(int i) throws IOException {
        synchronized (this) {
            if ((this._doResponse[i] != 0 || !_stateIsDont(i)) && !_requestedDont(i)) {
                _setWantDont(i);
                int[] iArr = this._doResponse;
                iArr[i] = iArr[i] + 1;
                _sendDont(i);
            }
        }
    }

    final void _requestWill(int i) throws IOException {
        synchronized (this) {
            if ((this._willResponse[i] != 0 || !_stateIsWill(i)) && !_requestedWill(i)) {
                _setWantWill(i);
                int[] iArr = this._doResponse;
                iArr[i] = iArr[i] + 1;
                _sendWill(i);
            }
        }
    }

    final void _requestWont(int i) throws IOException {
        synchronized (this) {
            if ((this._willResponse[i] != 0 || !_stateIsWont(i)) && !_requestedWont(i)) {
                _setWantWont(i);
                int[] iArr = this._doResponse;
                iArr[i] = iArr[i] + 1;
                _sendWont(i);
            }
        }
    }

    boolean _requestedDo(int i) {
        return (this._options[i] & 8) != 0;
    }

    boolean _requestedDont(int i) {
        return !_requestedDo(i);
    }

    boolean _requestedWill(int i) {
        return (this._options[i] & 4) != 0;
    }

    boolean _requestedWont(int i) {
        return !_requestedWill(i);
    }

    final boolean _sendAYT(long j) throws IOException, IllegalArgumentException, InterruptedException {
        boolean z;
        synchronized (this.aytMonitor) {
            synchronized (this) {
                this.aytFlag = false;
                this._output_.write(_COMMAND_AYT);
                this._output_.flush();
            }
            this.aytMonitor.wait(j);
            if (!this.aytFlag) {
                z = false;
                this.aytFlag = true;
            } else {
                z = true;
            }
        }
        return z;
    }

    final void _sendByte(int i) throws IOException {
        synchronized (this) {
            this._output_.write(i);
            _spyWrite(i);
        }
    }

    final void _sendCommand(byte b) throws IOException {
        synchronized (this) {
            this._output_.write(255);
            this._output_.write(b);
            this._output_.flush();
        }
    }

    final void _sendDo(int i) throws IOException {
        synchronized (this) {
            this._output_.write(_COMMAND_DO);
            this._output_.write(i);
            this._output_.flush();
        }
    }

    final void _sendDont(int i) throws IOException {
        synchronized (this) {
            this._output_.write(_COMMAND_DONT);
            this._output_.write(i);
            this._output_.flush();
        }
    }

    final void _sendSubnegotiation(int[] iArr) throws IOException {
        synchronized (this) {
            if (iArr != null) {
                this._output_.write(_COMMAND_SB);
                for (int i : iArr) {
                    byte b = (byte) i;
                    if (b == -1) {
                        this._output_.write(b);
                    }
                    this._output_.write(b);
                }
                this._output_.write(_COMMAND_SE);
                this._output_.flush();
            }
        }
    }

    final void _sendTerminalType() throws IOException {
        synchronized (this) {
            if (this.terminalType != null) {
                this._output_.write(_COMMAND_SB);
                this._output_.write(_COMMAND_IS);
                this._output_.write(this.terminalType.getBytes());
                this._output_.write(_COMMAND_SE);
                this._output_.flush();
            }
        }
    }

    final void _sendWill(int i) throws IOException {
        synchronized (this) {
            this._output_.write(_COMMAND_WILL);
            this._output_.write(i);
            this._output_.flush();
        }
    }

    final void _sendWont(int i) throws IOException {
        synchronized (this) {
            this._output_.write(_COMMAND_WONT);
            this._output_.write(i);
            this._output_.flush();
        }
    }

    void _setDo(int i) throws IOException {
        int[] iArr = this._options;
        iArr[i] = iArr[i] | 2;
        if (!_requestedDo(i) || this.optionHandlers[i] == null) {
            return;
        }
        this.optionHandlers[i].setDo(true);
        int[] startSubnegotiationRemote = this.optionHandlers[i].startSubnegotiationRemote();
        if (startSubnegotiationRemote == null) {
            return;
        }
        _sendSubnegotiation(startSubnegotiationRemote);
    }

    void _setDont(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] & (-3);
        if (this.optionHandlers[i] != null) {
            this.optionHandlers[i].setDo(false);
        }
    }

    void _setWantDo(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] | 8;
    }

    void _setWantDont(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] & (-9);
    }

    void _setWantWill(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] | 4;
    }

    void _setWantWont(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] & (-5);
    }

    void _setWill(int i) throws IOException {
        int[] iArr = this._options;
        iArr[i] = iArr[i] | 1;
        if (!_requestedWill(i) || this.optionHandlers[i] == null) {
            return;
        }
        this.optionHandlers[i].setWill(true);
        int[] startSubnegotiationLocal = this.optionHandlers[i].startSubnegotiationLocal();
        if (startSubnegotiationLocal == null) {
            return;
        }
        _sendSubnegotiation(startSubnegotiationLocal);
    }

    void _setWont(int i) {
        int[] iArr = this._options;
        iArr[i] = iArr[i] & (-2);
        if (this.optionHandlers[i] != null) {
            this.optionHandlers[i].setWill(false);
        }
    }

    void _spyRead(int i) {
        OutputStream outputStream = this.spyStream;
        if (outputStream == null || i == 13) {
            return;
        }
        try {
            outputStream.write(i);
            if (i == 10) {
                outputStream.write(13);
            }
            outputStream.flush();
        } catch (IOException e) {
            this.spyStream = null;
        }
    }

    void _spyWrite(int i) {
        OutputStream outputStream;
        if ((!_stateIsDo(1) || !_requestedDo(1)) && (outputStream = this.spyStream) != null) {
            try {
                outputStream.write(i);
                outputStream.flush();
            } catch (IOException e) {
                this.spyStream = null;
            }
        }
    }

    boolean _stateIsDo(int i) {
        return (this._options[i] & 2) != 0;
    }

    boolean _stateIsDont(int i) {
        return !_stateIsDo(i);
    }

    boolean _stateIsWill(int i) {
        return (this._options[i] & 1) != 0;
    }

    boolean _stateIsWont(int i) {
        return !_stateIsWill(i);
    }

    void _stopSpyStream() {
        this.spyStream = null;
    }

    void addOptionHandler(TelnetOptionHandler telnetOptionHandler) throws InvalidTelnetOptionException, IOException {
        int optionCode = telnetOptionHandler.getOptionCode();
        if (TelnetOption.isValidOption(optionCode)) {
            if (this.optionHandlers[optionCode] != null) {
                throw new InvalidTelnetOptionException("Already registered option", optionCode);
            }
            this.optionHandlers[optionCode] = telnetOptionHandler;
            if (!isConnected()) {
                return;
            }
            if (telnetOptionHandler.getInitLocal()) {
                _requestWill(optionCode);
            }
            if (!telnetOptionHandler.getInitRemote()) {
                return;
            }
            _requestDo(optionCode);
            return;
        }
        throw new InvalidTelnetOptionException("Invalid Option Code", optionCode);
    }

    void deleteOptionHandler(int i) throws InvalidTelnetOptionException, IOException {
        if (TelnetOption.isValidOption(i)) {
            if (this.optionHandlers[i] == null) {
                throw new InvalidTelnetOptionException("Unregistered option", i);
            }
            TelnetOptionHandler telnetOptionHandler = this.optionHandlers[i];
            this.optionHandlers[i] = null;
            if (telnetOptionHandler.getWill()) {
                _requestWont(i);
            }
            if (!telnetOptionHandler.getDo()) {
                return;
            }
            _requestDont(i);
            return;
        }
        throw new InvalidTelnetOptionException("Invalid Option Code", i);
    }

    public void registerNotifHandler(TelnetNotificationHandler telnetNotificationHandler) {
        this.__notifhand = telnetNotificationHandler;
    }

    public void unregisterNotifHandler() {
        this.__notifhand = null;
    }
}
