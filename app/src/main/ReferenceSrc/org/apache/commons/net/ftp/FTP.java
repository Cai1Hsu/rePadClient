package org.apache.commons.net.ftp;

import com.edutech.publicedu.log.LogHelp;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ProtocolCommandSupport;
import org.apache.commons.net.SocketClient;
import org.apache.commons.net.io.CRLFLineReader;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTP.class */
public class FTP extends SocketClient {
    public static final int ASCII_FILE_TYPE = 0;
    public static final int BINARY_FILE_TYPE = 2;
    public static final int BLOCK_TRANSFER_MODE = 11;
    public static final int CARRIAGE_CONTROL_TEXT_FORMAT = 6;
    public static final int COMPRESSED_TRANSFER_MODE = 12;
    public static final String DEFAULT_CONTROL_ENCODING = "ISO-8859-1";
    public static final int DEFAULT_DATA_PORT = 20;
    public static final int DEFAULT_PORT = 21;
    public static final int EBCDIC_FILE_TYPE = 1;
    public static final int FILE_STRUCTURE = 7;
    public static final int LOCAL_FILE_TYPE = 3;
    public static final int NON_PRINT_TEXT_FORMAT = 4;
    public static final int PAGE_STRUCTURE = 9;
    public static final int RECORD_STRUCTURE = 8;
    public static final int STREAM_TRANSFER_MODE = 10;
    public static final int TELNET_TEXT_FORMAT = 5;
    private static final String __modes = "AEILNTCFRPSBC";
    protected BufferedReader _controlInput_;
    protected BufferedWriter _controlOutput_;
    protected int _replyCode;
    protected boolean strictMultilineParsing = false;
    protected ArrayList<String> _replyLines = new ArrayList<>();
    protected boolean _newReplyString = false;
    protected String _replyString = null;
    protected String _controlEncoding = "ISO-8859-1";
    protected ProtocolCommandSupport _commandSupport_ = new ProtocolCommandSupport(this);

    public FTP() {
        setDefaultPort(21);
    }

    private String __buildMessage(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        if (str2 != null) {
            sb.append(' ');
            sb.append(str2);
        }
        sb.append("\r\n");
        return sb.toString();
    }

    private void __getReply() throws IOException {
        __getReply(true);
    }

    private void __getReply(boolean z) throws IOException {
        this._newReplyString = true;
        this._replyLines.clear();
        String readLine = this._controlInput_.readLine();
        if (readLine == null) {
            throw new FTPConnectionClosedException("Connection closed without indication.");
        }
        int length = readLine.length();
        if (length < 3) {
            throw new MalformedServerReplyException("Truncated server reply: " + readLine);
        }
        try {
            String substring = readLine.substring(0, 3);
            this._replyCode = Integer.parseInt(substring);
            this._replyLines.add(readLine);
            if (length > 3 && readLine.charAt(3) == '-') {
                while (true) {
                    String readLine2 = this._controlInput_.readLine();
                    if (readLine2 == null) {
                        throw new FTPConnectionClosedException("Connection closed without indication.");
                    }
                    this._replyLines.add(readLine2);
                    if (isStrictMultilineParsing()) {
                        if (!__strictCheck(readLine2, substring)) {
                            break;
                        }
                    } else if (!__lenientCheck(readLine2)) {
                        break;
                    }
                }
            }
            fireReplyReceived(this._replyCode, getReplyString());
            if (this._replyCode != 421) {
                return;
            }
            throw new FTPConnectionClosedException("FTP response 421 received.  Server closed connection.");
        } catch (NumberFormatException e) {
            throw new MalformedServerReplyException("Could not parse response code.\nServer Reply: " + readLine);
        }
    }

    private boolean __lenientCheck(String str) {
        boolean z = false;
        if (str.length() < 4 || str.charAt(3) == '-' || !Character.isDigit(str.charAt(0))) {
            z = true;
        }
        return z;
    }

    private void __send(String str) throws IOException, FTPConnectionClosedException, SocketException {
        try {
            this._controlOutput_.write(str);
            this._controlOutput_.flush();
        } catch (SocketException e) {
            if (isConnected()) {
                throw e;
            }
            throw new FTPConnectionClosedException("Connection unexpectedly closed.");
        }
    }

    private boolean __strictCheck(String str, String str2) {
        return !str.startsWith(str2) || str.charAt(3) != ' ';
    }

    protected void __getReplyNoReport() throws IOException {
        __getReply(false);
    }

    protected void __noop() throws IOException {
        __send(__buildMessage(FTPCommand.getCommand(32), null));
        __getReplyNoReport();
    }

    @Override // org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        this._controlInput_ = new CRLFLineReader(new InputStreamReader(this._input_, getControlEncoding()));
        this._controlOutput_ = new BufferedWriter(new OutputStreamWriter(this._output_, getControlEncoding()));
        if (this.connectTimeout <= 0) {
            __getReply();
            if (!FTPReply.isPositivePreliminary(this._replyCode)) {
                return;
            }
            __getReply();
            return;
        }
        int soTimeout = this._socket_.getSoTimeout();
        this._socket_.setSoTimeout(this.connectTimeout);
        try {
            try {
                __getReply();
                if (FTPReply.isPositivePreliminary(this._replyCode)) {
                    __getReply();
                }
            } catch (SocketTimeoutException e) {
                IOException iOException = new IOException("Timed out waiting for initial connect reply");
                iOException.initCause(e);
                throw iOException;
            }
        } finally {
            this._socket_.setSoTimeout(soTimeout);
        }
    }

    public int abor() throws IOException {
        return sendCommand(21);
    }

    public int acct(String str) throws IOException {
        return sendCommand(2, str);
    }

    public int allo(int i) throws IOException {
        return sendCommand(17, Integer.toString(i));
    }

    public int allo(int i, int i2) throws IOException {
        return sendCommand(17, Integer.toString(i) + " R " + Integer.toString(i2));
    }

    public int appe(String str) throws IOException {
        return sendCommand(16, str);
    }

    public int cdup() throws IOException {
        return sendCommand(4);
    }

    public int cwd(String str) throws IOException {
        return sendCommand(3, str);
    }

    public int dele(String str) throws IOException {
        return sendCommand(22, str);
    }

    @Override // org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        this._controlInput_ = null;
        this._controlOutput_ = null;
        this._newReplyString = false;
        this._replyString = null;
    }

    public int eprt(InetAddress inetAddress, int i) throws IOException {
        StringBuilder sb = new StringBuilder();
        String hostAddress = inetAddress.getHostAddress();
        int indexOf = hostAddress.indexOf("%");
        String str = hostAddress;
        if (indexOf > 0) {
            str = hostAddress.substring(0, indexOf);
        }
        sb.append("|");
        if (inetAddress instanceof Inet4Address) {
            sb.append(LogHelp.TYPE_GUIDANCE);
        } else if (inetAddress instanceof Inet6Address) {
            sb.append(LogHelp.TYPE_MYWORK);
        }
        sb.append("|");
        sb.append(str);
        sb.append("|");
        sb.append(i);
        sb.append("|");
        return sendCommand(37, sb.toString());
    }

    public int epsv() throws IOException {
        return sendCommand(36);
    }

    public int feat() throws IOException {
        return sendCommand(34);
    }

    @Override // org.apache.commons.net.SocketClient
    protected ProtocolCommandSupport getCommandSupport() {
        return this._commandSupport_;
    }

    public String getControlEncoding() {
        return this._controlEncoding;
    }

    public int getReply() throws IOException {
        __getReply();
        return this._replyCode;
    }

    public int getReplyCode() {
        return this._replyCode;
    }

    public String getReplyString() {
        String sb;
        if (!this._newReplyString) {
            sb = this._replyString;
        } else {
            StringBuilder sb2 = new StringBuilder(256);
            Iterator<String> it = this._replyLines.iterator();
            while (it.hasNext()) {
                sb2.append(it.next());
                sb2.append("\r\n");
            }
            this._newReplyString = false;
            sb = sb2.toString();
            this._replyString = sb;
        }
        return sb;
    }

    public String[] getReplyStrings() {
        return (String[]) this._replyLines.toArray(new String[this._replyLines.size()]);
    }

    public int help() throws IOException {
        return sendCommand(31);
    }

    public int help(String str) throws IOException {
        return sendCommand(31, str);
    }

    public boolean isStrictMultilineParsing() {
        return this.strictMultilineParsing;
    }

    public int list() throws IOException {
        return sendCommand(26);
    }

    public int list(String str) throws IOException {
        return sendCommand(26, str);
    }

    public int mdtm(String str) throws IOException {
        return sendCommand(33, str);
    }

    public int mfmt(String str, String str2) throws IOException {
        return sendCommand(35, str2 + " " + str);
    }

    public int mkd(String str) throws IOException {
        return sendCommand(24, str);
    }

    public int mlsd() throws IOException {
        return sendCommand(38);
    }

    public int mlsd(String str) throws IOException {
        return sendCommand(38, str);
    }

    public int mlst() throws IOException {
        return sendCommand(39);
    }

    public int mlst(String str) throws IOException {
        return sendCommand(39, str);
    }

    public int mode(int i) throws IOException {
        return sendCommand(12, __modes.substring(i, i + 1));
    }

    public int nlst() throws IOException {
        return sendCommand(27);
    }

    public int nlst(String str) throws IOException {
        return sendCommand(27, str);
    }

    public int noop() throws IOException {
        return sendCommand(32);
    }

    public int pass(String str) throws IOException {
        return sendCommand(1, str);
    }

    public int pasv() throws IOException {
        return sendCommand(9);
    }

    public int port(InetAddress inetAddress, int i) throws IOException {
        StringBuilder sb = new StringBuilder(24);
        sb.append(inetAddress.getHostAddress().replace('.', ','));
        sb.append(',');
        sb.append(i >>> 8);
        sb.append(',');
        sb.append(i & 255);
        return sendCommand(8, sb.toString());
    }

    public int pwd() throws IOException {
        return sendCommand(25);
    }

    public int quit() throws IOException {
        return sendCommand(7);
    }

    public int rein() throws IOException {
        return sendCommand(6);
    }

    public int rest(String str) throws IOException {
        return sendCommand(18, str);
    }

    public int retr(String str) throws IOException {
        return sendCommand(13, str);
    }

    public int rmd(String str) throws IOException {
        return sendCommand(23, str);
    }

    public int rnfr(String str) throws IOException {
        return sendCommand(19, str);
    }

    public int rnto(String str) throws IOException {
        return sendCommand(20, str);
    }

    public int sendCommand(int i) throws IOException {
        return sendCommand(i, (String) null);
    }

    public int sendCommand(int i, String str) throws IOException {
        return sendCommand(FTPCommand.getCommand(i), str);
    }

    public int sendCommand(String str) throws IOException {
        return sendCommand(str, (String) null);
    }

    public int sendCommand(String str, String str2) throws IOException {
        if (this._controlOutput_ == null) {
            throw new IOException("Connection is not open");
        }
        String __buildMessage = __buildMessage(str, str2);
        __send(__buildMessage);
        fireCommandSent(str, __buildMessage);
        __getReply();
        return this._replyCode;
    }

    public void setControlEncoding(String str) {
        this._controlEncoding = str;
    }

    public void setStrictMultilineParsing(boolean z) {
        this.strictMultilineParsing = z;
    }

    public int site(String str) throws IOException {
        return sendCommand(28, str);
    }

    public int smnt(String str) throws IOException {
        return sendCommand(5, str);
    }

    public int stat() throws IOException {
        return sendCommand(30);
    }

    public int stat(String str) throws IOException {
        return sendCommand(30, str);
    }

    public int stor(String str) throws IOException {
        return sendCommand(14, str);
    }

    public int stou() throws IOException {
        return sendCommand(15);
    }

    public int stou(String str) throws IOException {
        return sendCommand(15, str);
    }

    public int stru(int i) throws IOException {
        return sendCommand(11, __modes.substring(i, i + 1));
    }

    public int syst() throws IOException {
        return sendCommand(29);
    }

    public int type(int i) throws IOException {
        return sendCommand(10, __modes.substring(i, i + 1));
    }

    public int type(int i, int i2) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append(__modes.charAt(i));
        sb.append(' ');
        if (i == 3) {
            sb.append(i2);
        } else {
            sb.append(__modes.charAt(i2));
        }
        return sendCommand(10, sb.toString());
    }

    public int user(String str) throws IOException {
        return sendCommand(0, str);
    }
}
