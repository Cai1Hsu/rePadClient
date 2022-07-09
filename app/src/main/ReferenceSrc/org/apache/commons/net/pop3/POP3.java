package org.apache.commons.net.pop3;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandListener;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

/* loaded from: classes.jar:org/apache/commons/net/pop3/POP3.class */
public class POP3 extends SocketClient {
    public static final int AUTHORIZATION_STATE = 0;
    public static final int DEFAULT_PORT = 110;
    public static final int DISCONNECTED_STATE = -1;
    public static final int TRANSACTION_STATE = 1;
    public static final int UPDATE_STATE = 2;
    static final String _DEFAULT_ENCODING = "ISO-8859-1";
    static final String _ERROR = "-ERR";
    static final String _OK = "+OK";
    static final String _OK_INT = "+ ";
    String _lastReplyLine;
    int _replyCode;
    private int __popState = -1;
    BufferedReader _reader = null;
    BufferedWriter _writer = null;
    List<String> _replyLines = new ArrayList();
    protected ProtocolCommandSupport _commandSupport_ = new ProtocolCommandSupport(this);

    public POP3() {
        setDefaultPort(110);
    }

    private void __getReply() throws IOException {
        this._replyLines.clear();
        String readLine = this._reader.readLine();
        if (readLine == null) {
            throw new EOFException("Connection closed without indication.");
        }
        if (readLine.startsWith(_OK)) {
            this._replyCode = 0;
        } else if (readLine.startsWith(_ERROR)) {
            this._replyCode = 1;
        } else if (!readLine.startsWith(_OK_INT)) {
            throw new MalformedServerReplyException("Received invalid POP3 protocol response from server." + readLine);
        } else {
            this._replyCode = 2;
        }
        this._replyLines.add(readLine);
        this._lastReplyLine = readLine;
        fireReplyReceived(this._replyCode, getReplyString());
    }

    @Override // org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        this._reader = new CRLFLineReader(new InputStreamReader(this._input_, "ISO-8859-1"));
        this._writer = new BufferedWriter(new OutputStreamWriter(this._output_, "ISO-8859-1"));
        __getReply();
        setState(0);
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        this._reader = null;
        this._writer = null;
        this._lastReplyLine = null;
        this._replyLines.clear();
        setState(-1);
    }

    public void getAdditionalReply() throws IOException {
        String readLine = this._reader.readLine();
        while (true) {
            String str = readLine;
            if (str != null) {
                this._replyLines.add(str);
                if (str.equals(".")) {
                    return;
                }
                readLine = this._reader.readLine();
            } else {
                return;
            }
        }
    }

    @Override // org.apache.commons.net.SocketClient
    protected ProtocolCommandSupport getCommandSupport() {
        return this._commandSupport_;
    }

    public String getReplyString() {
        StringBuilder sb = new StringBuilder(256);
        for (String str : this._replyLines) {
            sb.append(str);
            sb.append("\r\n");
        }
        return sb.toString();
    }

    public String[] getReplyStrings() {
        return (String[]) this._replyLines.toArray(new String[this._replyLines.size()]);
    }

    public int getState() {
        return this.__popState;
    }

    public void removeProtocolCommandistener(ProtocolCommandListener protocolCommandListener) {
        removeProtocolCommandListener(protocolCommandListener);
    }

    public int sendCommand(int i) throws IOException {
        return sendCommand(POP3Command._commands[i], (String) null);
    }

    public int sendCommand(int i, String str) throws IOException {
        return sendCommand(POP3Command._commands[i], str);
    }

    public int sendCommand(String str) throws IOException {
        return sendCommand(str, (String) null);
    }

    public int sendCommand(String str, String str2) throws IOException {
        if (this._writer == null) {
            throw new IllegalStateException("Socket is not connected");
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        if (str2 != null) {
            sb.append(' ');
            sb.append(str2);
        }
        sb.append("\r\n");
        String sb2 = sb.toString();
        this._writer.write(sb2);
        this._writer.flush();
        fireCommandSent(str, sb2);
        __getReply();
        return this._replyCode;
    }

    public void setState(int i) {
        this.__popState = i;
    }
}
