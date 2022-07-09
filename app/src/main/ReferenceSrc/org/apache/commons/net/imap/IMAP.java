package org.apache.commons.net.imap;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

/* loaded from: classes.jar:org/apache/commons/net/imap/IMAP.class */
public class IMAP extends SocketClient {
    public static final int DEFAULT_PORT = 143;
    protected static final String __DEFAULT_ENCODING = "ISO-8859-1";
    private int _replyCode;
    private char[] _initialID = {'A', 'A', 'A', 'A'};
    private IMAPState __state = IMAPState.DISCONNECTED_STATE;
    protected BufferedReader _reader = null;
    protected BufferedWriter __writer = null;
    private List<String> _replyLines = new ArrayList();

    /* loaded from: classes.jar:org/apache/commons/net/imap/IMAP$IMAPState.class */
    public enum IMAPState {
        DISCONNECTED_STATE,
        NOT_AUTH_STATE,
        AUTH_STATE,
        LOGOUT_STATE
    }

    public IMAP() {
        setDefaultPort(DEFAULT_PORT);
        createCommandSupport();
    }

    private void __getReply() throws IOException {
        __getReply(true);
    }

    private void __getReply(boolean z) throws IOException {
        this._replyLines.clear();
        String readLine = this._reader.readLine();
        if (readLine == null) {
            throw new EOFException("Connection closed without indication.");
        }
        this._replyLines.add(readLine);
        if (z) {
            while (IMAPReply.isUntagged(readLine)) {
                readLine = this._reader.readLine();
                if (readLine == null) {
                    throw new EOFException("Connection closed without indication.");
                }
                this._replyLines.add(readLine);
            }
            this._replyCode = IMAPReply.getReplyCode(readLine);
        } else {
            this._replyCode = IMAPReply.getUntaggedReplyCode(readLine);
        }
        fireReplyReceived(this._replyCode, getReplyString());
    }

    private int sendCommandWithID(String str, String str2, String str3) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (str != null) {
            sb.append(str);
            sb.append(' ');
        }
        sb.append(str2);
        if (str3 != null) {
            sb.append(' ');
            sb.append(str3);
        }
        sb.append("\r\n");
        String sb2 = sb.toString();
        this.__writer.write(sb2);
        this.__writer.flush();
        fireCommandSent(str2, sb2);
        __getReply();
        return this._replyCode;
    }

    @Override // org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        this._reader = new CRLFLineReader(new InputStreamReader(this._input_, "ISO-8859-1"));
        this.__writer = new BufferedWriter(new OutputStreamWriter(this._output_, "ISO-8859-1"));
        int soTimeout = getSoTimeout();
        if (soTimeout <= 0) {
            setSoTimeout(this.connectTimeout);
        }
        __getReply(false);
        if (soTimeout <= 0) {
            setSoTimeout(soTimeout);
        }
        setState(IMAPState.NOT_AUTH_STATE);
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        this._reader = null;
        this.__writer = null;
        this._replyLines.clear();
        setState(IMAPState.DISCONNECTED_STATE);
    }

    public boolean doCommand(IMAPCommand iMAPCommand) throws IOException {
        return IMAPReply.isSuccess(sendCommand(iMAPCommand));
    }

    public boolean doCommand(IMAPCommand iMAPCommand, String str) throws IOException {
        return IMAPReply.isSuccess(sendCommand(iMAPCommand, str));
    }

    protected String generateCommandID() {
        char[] cArr;
        String str = new String(this._initialID);
        boolean z = true;
        for (int length = this._initialID.length - 1; z && length >= 0; length--) {
            if (this._initialID[length] == 'Z') {
                this._initialID[length] = (char) 65;
            } else {
                this._initialID[length] = (char) (cArr[length] + 1);
                z = false;
            }
        }
        return str;
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

    public IMAPState getState() {
        return this.__state;
    }

    public int sendCommand(String str) throws IOException {
        return sendCommand(str, (String) null);
    }

    public int sendCommand(String str, String str2) throws IOException {
        return sendCommandWithID(generateCommandID(), str, str2);
    }

    public int sendCommand(IMAPCommand iMAPCommand) throws IOException {
        return sendCommand(iMAPCommand, (String) null);
    }

    public int sendCommand(IMAPCommand iMAPCommand, String str) throws IOException {
        return sendCommand(iMAPCommand.getIMAPCommand(), str);
    }

    public int sendData(String str) throws IOException {
        return sendCommandWithID(null, str, null);
    }

    protected void setState(IMAPState iMAPState) {
        this.__state = iMAPState;
    }
}
