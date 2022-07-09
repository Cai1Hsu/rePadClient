package org.apache.commons.net.ftp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.net.MalformedServerReplyException;
import org.apache.commons.net.ftp.parser.DefaultFTPFileEntryParserFactory;
import org.apache.commons.net.ftp.parser.FTPFileEntryParserFactory;
import org.apache.commons.net.ftp.parser.MLSxEntryParser;
import org.apache.commons.net.io.CRLFLineReader;
import org.apache.commons.net.io.CopyStreamAdapter;
import org.apache.commons.net.io.CopyStreamEvent;
import org.apache.commons.net.io.CopyStreamListener;
import org.apache.commons.net.io.FromNetASCIIInputStream;
import org.apache.commons.net.io.SocketInputStream;
import org.apache.commons.net.io.SocketOutputStream;
import org.apache.commons.net.io.ToNetASCIIOutputStream;
import org.apache.commons.net.io.Util;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTPClient.class */
public class FTPClient extends FTP implements Configurable {
    public static final int ACTIVE_LOCAL_DATA_CONNECTION_MODE = 0;
    public static final int ACTIVE_REMOTE_DATA_CONNECTION_MODE = 1;
    public static final String FTP_SYSTEM_TYPE = "org.apache.commons.net.ftp.systemType";
    public static final String FTP_SYSTEM_TYPE_DEFAULT = "org.apache.commons.net.ftp.systemType.default";
    public static final int PASSIVE_LOCAL_DATA_CONNECTION_MODE = 2;
    public static final int PASSIVE_REMOTE_DATA_CONNECTION_MODE = 3;
    public static final String SYSTEM_TYPE_PROPERTIES = "/systemType.properties";
    private static final Pattern __PARMS_PAT = Pattern.compile("(\\d{1,3},\\d{1,3},\\d{1,3},\\d{1,3}),(\\d{1,3}),(\\d{1,3})");
    private InetAddress __activeExternalHost;
    private int __activeMaxPort;
    private int __activeMinPort;
    private int __bufferSize;
    private long __controlKeepAliveTimeout;
    private CopyStreamListener __copyStreamListener;
    private int __dataConnectionMode;
    private FTPFileEntryParser __entryParser;
    private String __entryParserKey;
    private HashMap<String, Set<String>> __featuresMap;
    private int __fileFormat;
    private int __fileStructure;
    private int __fileTransferMode;
    private int __fileType;
    private String __passiveHost;
    private int __passivePort;
    private InetAddress __reportActiveExternalHost;
    private long __restartOffset;
    private String __systemName;
    private int __controlKeepAliveReplyTimeout = 1000;
    private boolean __autodetectEncoding = false;
    private int __dataTimeout = -1;
    private boolean __remoteVerificationEnabled = true;
    private FTPFileEntryParserFactory __parserFactory = new DefaultFTPFileEntryParserFactory();
    private FTPClientConfig __configuration = null;
    private boolean __listHiddenFiles = false;
    private boolean __useEPSVwithIPv4 = false;
    private final Random __random = new Random();

    /* loaded from: classes.jar:org/apache/commons/net/ftp/FTPClient$CSL.class */
    private static class CSL implements CopyStreamListener {
        private final int currentSoTimeout;
        private final long idle;
        private int notAcked;
        private final FTPClient parent;
        private long time = System.currentTimeMillis();

        CSL(FTPClient fTPClient, long j, int i) throws SocketException {
            this.idle = j;
            this.parent = fTPClient;
            this.currentSoTimeout = fTPClient.getSoTimeout();
            fTPClient.setSoTimeout(i);
        }

        @Override // org.apache.commons.net.io.CopyStreamListener
        public void bytesTransferred(long j, int i, long j2) {
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.time > this.idle) {
                try {
                    this.parent.__noop();
                } catch (SocketTimeoutException e) {
                    this.notAcked++;
                } catch (IOException e2) {
                }
                this.time = currentTimeMillis;
            }
        }

        @Override // org.apache.commons.net.io.CopyStreamListener
        public void bytesTransferred(CopyStreamEvent copyStreamEvent) {
            bytesTransferred(copyStreamEvent.getTotalBytesTransferred(), copyStreamEvent.getBytesTransferred(), copyStreamEvent.getStreamSize());
        }

        void cleanUp() throws IOException {
            while (true) {
                int i = this.notAcked;
                this.notAcked = i - 1;
                if (i <= 0) {
                    this.parent.setSoTimeout(this.currentSoTimeout);
                    return;
                }
                this.parent.__getReplyNoReport();
            }
        }
    }

    /* loaded from: classes.jar:org/apache/commons/net/ftp/FTPClient$PropertiesSingleton.class */
    private static class PropertiesSingleton {
        static final Properties PROPERTIES;

        static {
            InputStream resourceAsStream = FTPClient.class.getResourceAsStream(FTPClient.SYSTEM_TYPE_PROPERTIES);
            Properties properties = null;
            if (resourceAsStream != null) {
                properties = new Properties();
                try {
                    properties.load(resourceAsStream);
                    try {
                        resourceAsStream.close();
                    } catch (IOException e) {
                    }
                } catch (IOException e2) {
                    try {
                        resourceAsStream.close();
                    } catch (IOException e3) {
                    }
                } catch (Throwable th) {
                    try {
                        resourceAsStream.close();
                    } catch (IOException e4) {
                    }
                    throw th;
                }
            }
            PROPERTIES = properties;
        }

        private PropertiesSingleton() {
        }
    }

    public FTPClient() {
        __initDefaults();
    }

    private void __initDefaults() {
        this.__dataConnectionMode = 0;
        this.__passiveHost = null;
        this.__passivePort = -1;
        this.__activeExternalHost = null;
        this.__reportActiveExternalHost = null;
        this.__activeMinPort = 0;
        this.__activeMaxPort = 0;
        this.__fileType = 0;
        this.__fileStructure = 7;
        this.__fileFormat = 4;
        this.__fileTransferMode = 10;
        this.__restartOffset = 0L;
        this.__systemName = null;
        this.__entryParser = null;
        this.__entryParserKey = "";
        this.__bufferSize = 1024;
        this.__featuresMap = null;
    }

    private CopyStreamListener __mergeListeners(CopyStreamListener copyStreamListener) {
        CopyStreamAdapter copyStreamAdapter;
        if (copyStreamListener == null) {
            copyStreamAdapter = this.__copyStreamListener;
        } else {
            copyStreamAdapter = copyStreamListener;
            if (this.__copyStreamListener != null) {
                CopyStreamAdapter copyStreamAdapter2 = new CopyStreamAdapter();
                copyStreamAdapter2.addCopyStreamListener(copyStreamListener);
                copyStreamAdapter2.addCopyStreamListener(this.__copyStreamListener);
                copyStreamAdapter = copyStreamAdapter2;
            }
        }
        return copyStreamAdapter;
    }

    private String __parsePathname(String str) {
        int indexOf = str.indexOf(34) + 1;
        return str.substring(indexOf, str.indexOf(34, indexOf));
    }

    private boolean __storeFile(int i, String str, InputStream inputStream) throws IOException {
        return _storeFile(FTPCommand.getCommand(i), str, inputStream);
    }

    private OutputStream __storeFileStream(int i, String str) throws IOException {
        return _storeFileStream(FTPCommand.getCommand(i), str);
    }

    private int getActivePort() {
        return (this.__activeMinPort <= 0 || this.__activeMaxPort < this.__activeMinPort) ? 0 : this.__activeMaxPort == this.__activeMinPort ? this.__activeMaxPort : this.__random.nextInt((this.__activeMaxPort - this.__activeMinPort) + 1) + this.__activeMinPort;
    }

    private InetAddress getHostAddress() {
        return this.__activeExternalHost != null ? this.__activeExternalHost : getLocalAddress();
    }

    private static Properties getOverrideProperties() {
        return PropertiesSingleton.PROPERTIES;
    }

    private InetAddress getReportHostAddress() {
        return this.__reportActiveExternalHost != null ? this.__reportActiveExternalHost : getHostAddress();
    }

    private boolean initFeatureMap() throws IOException {
        String substring;
        boolean z = true;
        if (this.__featuresMap == null) {
            boolean isPositiveCompletion = FTPReply.isPositiveCompletion(feat());
            this.__featuresMap = new HashMap<>();
            if (isPositiveCompletion) {
                String[] replyStrings = getReplyStrings();
                int length = replyStrings.length;
                int i = 0;
                while (true) {
                    z = true;
                    if (i >= length) {
                        break;
                    }
                    String str = replyStrings[i];
                    if (str.startsWith(" ")) {
                        String str2 = "";
                        int indexOf = str.indexOf(32, 1);
                        if (indexOf > 0) {
                            substring = str.substring(1, indexOf);
                            str2 = str.substring(indexOf + 1);
                        } else {
                            substring = str.substring(1);
                        }
                        String upperCase = substring.toUpperCase(Locale.ENGLISH);
                        Set<String> set = this.__featuresMap.get(upperCase);
                        HashSet hashSet = set;
                        if (set == null) {
                            hashSet = new HashSet();
                            this.__featuresMap.put(upperCase, hashSet);
                        }
                        hashSet.add(str2);
                    }
                    i++;
                }
            } else {
                z = false;
            }
        }
        return z;
    }

    private FTPListParseEngine initiateListParsing(FTPFileEntryParser fTPFileEntryParser, String str) throws IOException {
        FTPListParseEngine fTPListParseEngine = new FTPListParseEngine(fTPFileEntryParser);
        Socket _openDataConnection_ = _openDataConnection_(26, getListArguments(str));
        if (_openDataConnection_ != null) {
            try {
                fTPListParseEngine.readServerList(_openDataConnection_.getInputStream(), getControlEncoding());
                Util.closeQuietly(_openDataConnection_);
                completePendingCommand();
            } catch (Throwable th) {
                Util.closeQuietly(_openDataConnection_);
                throw th;
            }
        }
        return fTPListParseEngine;
    }

    private FTPListParseEngine initiateMListParsing(String str) throws IOException {
        FTPListParseEngine fTPListParseEngine = new FTPListParseEngine(MLSxEntryParser.getInstance());
        Socket _openDataConnection_ = _openDataConnection_(38, str);
        if (_openDataConnection_ != null) {
            try {
                fTPListParseEngine.readServerList(_openDataConnection_.getInputStream(), getControlEncoding());
            } finally {
                Util.closeQuietly(_openDataConnection_);
                completePendingCommand();
            }
        }
        return fTPListParseEngine;
    }

    @Override // org.apache.commons.net.ftp.FTP, org.apache.commons.net.SocketClient
    protected void _connectAction_() throws IOException {
        super._connectAction_();
        __initDefaults();
        if (this.__autodetectEncoding) {
            ArrayList arrayList = new ArrayList(this._replyLines);
            int i = this._replyCode;
            if (hasFeature("UTF8") || hasFeature("UTF-8")) {
                setControlEncoding("UTF-8");
                this._controlInput_ = new CRLFLineReader(new InputStreamReader(this._input_, getControlEncoding()));
                this._controlOutput_ = new BufferedWriter(new OutputStreamWriter(this._output_, getControlEncoding()));
            }
            this._replyLines.clear();
            this._replyLines.addAll(arrayList);
            this._replyCode = i;
        }
    }

    protected Socket _openDataConnection_(int i, String str) throws IOException {
        return _openDataConnection_(FTPCommand.getCommand(i), str);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00ba A[Catch: all -> 0x011e, TRY_ENTER, TryCatch #0 {all -> 0x011e, blocks: (B:13:0x003c, B:16:0x005d, B:19:0x007e, B:21:0x0087, B:24:0x00a0, B:27:0x00ba, B:29:0x00c1, B:31:0x00cc), top: B:71:0x0039 }] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01ea  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected Socket _openDataConnection_(String str, String str2) throws IOException {
        Socket socket;
        Socket socket2;
        if (this.__dataConnectionMode == 0 || this.__dataConnectionMode == 2) {
            boolean z = getRemoteAddress() instanceof Inet6Address;
            if (this.__dataConnectionMode == 0) {
                ServerSocket createServerSocket = this._serverSocketFactory_.createServerSocket(getActivePort(), 1, getHostAddress());
                try {
                    if (z) {
                        if (!FTPReply.isPositiveCompletion(eprt(getReportHostAddress(), createServerSocket.getLocalPort()))) {
                            createServerSocket.close();
                            socket = null;
                        }
                        if (this.__restartOffset <= 0 && !restart(this.__restartOffset)) {
                            createServerSocket.close();
                            socket = null;
                        } else if (FTPReply.isPositivePreliminary(sendCommand(str, str2))) {
                            createServerSocket.close();
                            socket = null;
                        } else {
                            if (this.__dataTimeout >= 0) {
                                createServerSocket.setSoTimeout(this.__dataTimeout);
                            }
                            socket2 = createServerSocket.accept();
                            if (!this.__remoteVerificationEnabled && !verifyRemote(socket2)) {
                                socket2.close();
                                throw new IOException("Host attempting data connection " + socket2.getInetAddress().getHostAddress() + " is not same as server " + getRemoteAddress().getHostAddress());
                            }
                            socket = socket2;
                            if (this.__dataTimeout >= 0) {
                                socket2.setSoTimeout(this.__dataTimeout);
                                socket = socket2;
                            }
                        }
                    } else {
                        if (!FTPReply.isPositiveCompletion(port(getReportHostAddress(), createServerSocket.getLocalPort()))) {
                            createServerSocket.close();
                            socket = null;
                        }
                        if (this.__restartOffset <= 0) {
                        }
                        if (FTPReply.isPositivePreliminary(sendCommand(str, str2))) {
                        }
                    }
                } finally {
                    createServerSocket.close();
                }
            } else {
                boolean z2 = true;
                if (!isUseEPSVwithIPv4()) {
                    z2 = z;
                }
                if (z2 && epsv() == 229) {
                    _parseExtendedPassiveModeReply(this._replyLines.get(0));
                } else if (z) {
                    socket = null;
                } else if (pasv() != 227) {
                    socket = null;
                } else {
                    _parsePassiveModeReply(this._replyLines.get(0));
                }
                Socket createSocket = this._socketFactory_.createSocket();
                createSocket.connect(new InetSocketAddress(this.__passiveHost, this.__passivePort), this.connectTimeout);
                if (this.__restartOffset <= 0 || restart(this.__restartOffset)) {
                    socket2 = createSocket;
                    if (!FTPReply.isPositivePreliminary(sendCommand(str, str2))) {
                        createSocket.close();
                        socket = null;
                    }
                    if (!this.__remoteVerificationEnabled) {
                    }
                    socket = socket2;
                    if (this.__dataTimeout >= 0) {
                    }
                } else {
                    createSocket.close();
                    socket = null;
                }
            }
        } else {
            socket = null;
        }
        return socket;
    }

    protected void _parseExtendedPassiveModeReply(String str) throws MalformedServerReplyException {
        String trim = str.substring(str.indexOf(40) + 1, str.indexOf(41)).trim();
        char charAt = trim.charAt(0);
        char charAt2 = trim.charAt(1);
        char charAt3 = trim.charAt(2);
        char charAt4 = trim.charAt(trim.length() - 1);
        if (charAt == charAt2 && charAt2 == charAt3 && charAt3 == charAt4) {
            try {
                int parseInt = Integer.parseInt(trim.substring(3, trim.length() - 1));
                this.__passiveHost = getRemoteAddress().getHostAddress();
                this.__passivePort = parseInt;
                return;
            } catch (NumberFormatException e) {
                throw new MalformedServerReplyException("Could not parse extended passive host information.\nServer Reply: " + trim);
            }
        }
        throw new MalformedServerReplyException("Could not parse extended passive host information.\nServer Reply: " + trim);
    }

    protected void _parsePassiveModeReply(String str) throws MalformedServerReplyException {
        Matcher matcher = __PARMS_PAT.matcher(str);
        if (!matcher.find()) {
            throw new MalformedServerReplyException("Could not parse passive host information.\nServer Reply: " + str);
        }
        this.__passiveHost = matcher.group(1).replace(',', '.');
        try {
            this.__passivePort = (Integer.parseInt(matcher.group(2)) << 8) | Integer.parseInt(matcher.group(3));
            try {
                if (!InetAddress.getByName(this.__passiveHost).isSiteLocalAddress() || getRemoteAddress().isSiteLocalAddress()) {
                    return;
                }
                String hostAddress = getRemoteAddress().getHostAddress();
                fireReplyReceived(0, "[Replacing site local address " + this.__passiveHost + " with " + hostAddress + "]\n");
                this.__passiveHost = hostAddress;
            } catch (UnknownHostException e) {
                throw new MalformedServerReplyException("Could not parse passive host information.\nServer Reply: " + str);
            }
        } catch (NumberFormatException e2) {
            throw new MalformedServerReplyException("Could not parse passive port information.\nServer Reply: " + str);
        }
    }

    protected boolean _retrieveFile(String str, String str2, OutputStream outputStream) throws IOException {
        boolean z = false;
        Socket _openDataConnection_ = _openDataConnection_(str, str2);
        if (_openDataConnection_ != null) {
            FilterInputStream bufferedInputStream = new BufferedInputStream(_openDataConnection_.getInputStream(), getBufferSize());
            FilterInputStream filterInputStream = bufferedInputStream;
            if (this.__fileType == 0) {
                filterInputStream = new FromNetASCIIInputStream(bufferedInputStream);
            }
            CSL csl = null;
            if (this.__controlKeepAliveTimeout > 0) {
                csl = new CSL(this, this.__controlKeepAliveTimeout, this.__controlKeepAliveReplyTimeout);
            }
            try {
                Util.copyStream(filterInputStream, outputStream, getBufferSize(), -1L, __mergeListeners(csl), false);
                Util.closeQuietly(_openDataConnection_);
                if (csl != null) {
                    csl.cleanUp();
                }
                z = completePendingCommand();
            } catch (Throwable th) {
                Util.closeQuietly(_openDataConnection_);
                throw th;
            }
        }
        return z;
    }

    protected InputStream _retrieveFileStream(String str, String str2) throws IOException {
        SocketInputStream socketInputStream;
        Socket _openDataConnection_ = _openDataConnection_(str, str2);
        if (_openDataConnection_ == null) {
            socketInputStream = null;
        } else {
            InputStream inputStream = _openDataConnection_.getInputStream();
            FromNetASCIIInputStream fromNetASCIIInputStream = inputStream;
            if (this.__fileType == 0) {
                fromNetASCIIInputStream = new FromNetASCIIInputStream(new BufferedInputStream(inputStream, getBufferSize()));
            }
            socketInputStream = new SocketInputStream(_openDataConnection_, fromNetASCIIInputStream);
        }
        return socketInputStream;
    }

    protected boolean _storeFile(String str, String str2, InputStream inputStream) throws IOException {
        boolean z = false;
        Socket _openDataConnection_ = _openDataConnection_(str, str2);
        if (_openDataConnection_ != null) {
            OutputStream bufferedOutputStream = new BufferedOutputStream(_openDataConnection_.getOutputStream(), getBufferSize());
            OutputStream outputStream = bufferedOutputStream;
            if (this.__fileType == 0) {
                outputStream = new ToNetASCIIOutputStream(bufferedOutputStream);
            }
            CSL csl = null;
            if (this.__controlKeepAliveTimeout > 0) {
                csl = new CSL(this, this.__controlKeepAliveTimeout, this.__controlKeepAliveReplyTimeout);
            }
            try {
                Util.copyStream(inputStream, outputStream, getBufferSize(), -1L, __mergeListeners(csl), false);
                outputStream.close();
                _openDataConnection_.close();
                if (csl != null) {
                    csl.cleanUp();
                }
                z = completePendingCommand();
            } catch (IOException e) {
                Util.closeQuietly(_openDataConnection_);
                throw e;
            }
        }
        return z;
    }

    protected OutputStream _storeFileStream(String str, String str2) throws IOException {
        SocketOutputStream socketOutputStream;
        Socket _openDataConnection_ = _openDataConnection_(str, str2);
        if (_openDataConnection_ == null) {
            socketOutputStream = null;
        } else {
            OutputStream outputStream = _openDataConnection_.getOutputStream();
            ToNetASCIIOutputStream toNetASCIIOutputStream = outputStream;
            if (this.__fileType == 0) {
                toNetASCIIOutputStream = new ToNetASCIIOutputStream(new BufferedOutputStream(outputStream, getBufferSize()));
            }
            socketOutputStream = new SocketOutputStream(_openDataConnection_, toNetASCIIOutputStream);
        }
        return socketOutputStream;
    }

    public boolean abort() throws IOException {
        return FTPReply.isPositiveCompletion(abor());
    }

    public boolean allocate(int i) throws IOException {
        return FTPReply.isPositiveCompletion(allo(i));
    }

    public boolean allocate(int i, int i2) throws IOException {
        return FTPReply.isPositiveCompletion(allo(i, i2));
    }

    public boolean appendFile(String str, InputStream inputStream) throws IOException {
        return __storeFile(16, str, inputStream);
    }

    public OutputStream appendFileStream(String str) throws IOException {
        return __storeFileStream(16, str);
    }

    public boolean changeToParentDirectory() throws IOException {
        return FTPReply.isPositiveCompletion(cdup());
    }

    public boolean changeWorkingDirectory(String str) throws IOException {
        return FTPReply.isPositiveCompletion(cwd(str));
    }

    public boolean completePendingCommand() throws IOException {
        return FTPReply.isPositiveCompletion(getReply());
    }

    @Override // org.apache.commons.net.ftp.Configurable
    public void configure(FTPClientConfig fTPClientConfig) {
        this.__configuration = fTPClientConfig;
    }

    public boolean deleteFile(String str) throws IOException {
        return FTPReply.isPositiveCompletion(dele(str));
    }

    @Override // org.apache.commons.net.ftp.FTP, org.apache.commons.net.SocketClient
    public void disconnect() throws IOException {
        super.disconnect();
        __initDefaults();
    }

    public boolean doCommand(String str, String str2) throws IOException {
        return FTPReply.isPositiveCompletion(sendCommand(str, str2));
    }

    public String[] doCommandAsStrings(String str, String str2) throws IOException {
        return FTPReply.isPositiveCompletion(sendCommand(str, str2)) ? getReplyStrings() : null;
    }

    public void enterLocalActiveMode() {
        this.__dataConnectionMode = 0;
        this.__passiveHost = null;
        this.__passivePort = -1;
    }

    public void enterLocalPassiveMode() {
        this.__dataConnectionMode = 2;
        this.__passiveHost = null;
        this.__passivePort = -1;
    }

    public boolean enterRemoteActiveMode(InetAddress inetAddress, int i) throws IOException {
        boolean z = true;
        if (FTPReply.isPositiveCompletion(port(inetAddress, i))) {
            this.__dataConnectionMode = 1;
            this.__passiveHost = null;
            this.__passivePort = -1;
        } else {
            z = false;
        }
        return z;
    }

    public boolean enterRemotePassiveMode() throws IOException {
        boolean z = false;
        if (pasv() == 227) {
            this.__dataConnectionMode = 3;
            _parsePassiveModeReply(this._replyLines.get(0));
            z = true;
        }
        return z;
    }

    public String featureValue(String str) throws IOException {
        String[] featureValues = featureValues(str);
        return featureValues != null ? featureValues[0] : null;
    }

    public String[] featureValues(String str) throws IOException {
        String[] strArr;
        if (!initFeatureMap()) {
            strArr = null;
        } else {
            Set<String> set = this.__featuresMap.get(str.toUpperCase(Locale.ENGLISH));
            strArr = null;
            if (set != null) {
                strArr = (String[]) set.toArray(new String[set.size()]);
            }
        }
        return strArr;
    }

    public boolean features() throws IOException {
        return FTPReply.isPositiveCompletion(feat());
    }

    public boolean getAutodetectUTF8() {
        return this.__autodetectEncoding;
    }

    public int getBufferSize() {
        return this.__bufferSize;
    }

    public int getControlKeepAliveReplyTimeout() {
        return this.__controlKeepAliveReplyTimeout;
    }

    public long getControlKeepAliveTimeout() {
        return this.__controlKeepAliveTimeout / 1000;
    }

    public CopyStreamListener getCopyStreamListener() {
        return this.__copyStreamListener;
    }

    public int getDataConnectionMode() {
        return this.__dataConnectionMode;
    }

    protected String getListArguments(String str) {
        String str2 = str;
        if (getListHiddenFiles()) {
            if (str != null) {
                StringBuilder sb = new StringBuilder(str.length() + 3);
                sb.append("-a ");
                sb.append(str);
                str2 = sb.toString();
            } else {
                str2 = "-a";
            }
        }
        return str2;
    }

    public boolean getListHiddenFiles() {
        return this.__listHiddenFiles;
    }

    public String getModificationTime(String str) throws IOException {
        return FTPReply.isPositiveCompletion(mdtm(str)) ? getReplyString() : null;
    }

    public String getPassiveHost() {
        return this.__passiveHost;
    }

    public int getPassivePort() {
        return this.__passivePort;
    }

    public long getRestartOffset() {
        return this.__restartOffset;
    }

    public String getStatus() throws IOException {
        return FTPReply.isPositiveCompletion(stat()) ? getReplyString() : null;
    }

    public String getStatus(String str) throws IOException {
        return FTPReply.isPositiveCompletion(stat(str)) ? getReplyString() : null;
    }

    @Deprecated
    public String getSystemName() throws IOException {
        if (this.__systemName == null && FTPReply.isPositiveCompletion(syst())) {
            this.__systemName = this._replyLines.get(this._replyLines.size() - 1).substring(4);
        }
        return this.__systemName;
    }

    public String getSystemType() throws IOException {
        if (this.__systemName == null) {
            if (FTPReply.isPositiveCompletion(syst())) {
                this.__systemName = this._replyLines.get(this._replyLines.size() - 1).substring(4);
            } else {
                String property = System.getProperty(FTP_SYSTEM_TYPE_DEFAULT);
                if (property == null) {
                    throw new IOException("Unable to determine system type - response: " + getReplyString());
                }
                this.__systemName = property;
            }
        }
        return this.__systemName;
    }

    public boolean hasFeature(String str) throws IOException {
        return !initFeatureMap() ? false : this.__featuresMap.containsKey(str.toUpperCase(Locale.ENGLISH));
    }

    public boolean hasFeature(String str, String str2) throws IOException {
        Set<String> set;
        boolean z = false;
        if (initFeatureMap() && (set = this.__featuresMap.get(str.toUpperCase(Locale.ENGLISH))) != null) {
            z = set.contains(str2);
        }
        return z;
    }

    public FTPListParseEngine initiateListParsing() throws IOException {
        return initiateListParsing(null);
    }

    public FTPListParseEngine initiateListParsing(String str) throws IOException {
        return initiateListParsing((String) null, str);
    }

    public FTPListParseEngine initiateListParsing(String str, String str2) throws IOException {
        if (this.__entryParser == null || !this.__entryParserKey.equals(str)) {
            if (str != null) {
                this.__entryParser = this.__parserFactory.createFileEntryParser(str);
                this.__entryParserKey = str;
            } else if (this.__configuration != null) {
                this.__entryParser = this.__parserFactory.createFileEntryParser(this.__configuration);
                this.__entryParserKey = this.__configuration.getServerSystemKey();
            } else {
                String property = System.getProperty(FTP_SYSTEM_TYPE);
                String str3 = property;
                if (property == null) {
                    String systemType = getSystemType();
                    Properties overrideProperties = getOverrideProperties();
                    str3 = systemType;
                    if (overrideProperties != null) {
                        String property2 = overrideProperties.getProperty(systemType);
                        str3 = systemType;
                        if (property2 != null) {
                            str3 = property2;
                        }
                    }
                }
                this.__entryParser = this.__parserFactory.createFileEntryParser(str3);
                this.__entryParserKey = str3;
            }
        }
        return initiateListParsing(this.__entryParser, str2);
    }

    public boolean isRemoteVerificationEnabled() {
        return this.__remoteVerificationEnabled;
    }

    public boolean isUseEPSVwithIPv4() {
        return this.__useEPSVwithIPv4;
    }

    public FTPFile[] listDirectories() throws IOException {
        return listDirectories(null);
    }

    public FTPFile[] listDirectories(String str) throws IOException {
        return listFiles(str, FTPFileFilters.DIRECTORIES);
    }

    public FTPFile[] listFiles() throws IOException {
        return listFiles(null);
    }

    public FTPFile[] listFiles(String str) throws IOException {
        return initiateListParsing((String) null, str).getFiles();
    }

    public FTPFile[] listFiles(String str, FTPFileFilter fTPFileFilter) throws IOException {
        return initiateListParsing((String) null, str).getFiles(fTPFileFilter);
    }

    public String listHelp() throws IOException {
        return FTPReply.isPositiveCompletion(help()) ? getReplyString() : null;
    }

    public String listHelp(String str) throws IOException {
        return FTPReply.isPositiveCompletion(help(str)) ? getReplyString() : null;
    }

    public String[] listNames() throws IOException {
        return listNames(null);
    }

    public String[] listNames(String str) throws IOException {
        String[] strArr;
        Socket _openDataConnection_ = _openDataConnection_(27, getListArguments(str));
        if (_openDataConnection_ == null) {
            strArr = null;
        } else {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(_openDataConnection_.getInputStream(), getControlEncoding()));
            ArrayList arrayList = new ArrayList();
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                arrayList.add(readLine);
            }
            bufferedReader.close();
            _openDataConnection_.close();
            strArr = null;
            if (completePendingCommand()) {
                strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
            }
        }
        return strArr;
    }

    public boolean login(String str, String str2) throws IOException {
        user(str);
        return FTPReply.isPositiveCompletion(this._replyCode) ? true : !FTPReply.isPositiveIntermediate(this._replyCode) ? false : FTPReply.isPositiveCompletion(pass(str2));
    }

    public boolean login(String str, String str2, String str3) throws IOException {
        boolean z = true;
        user(str);
        if (!FTPReply.isPositiveCompletion(this._replyCode)) {
            if (!FTPReply.isPositiveIntermediate(this._replyCode)) {
                z = false;
            } else {
                pass(str2);
                if (!FTPReply.isPositiveCompletion(this._replyCode)) {
                    z = !FTPReply.isPositiveIntermediate(this._replyCode) ? false : FTPReply.isPositiveCompletion(acct(str3));
                }
            }
        }
        return z;
    }

    public boolean logout() throws IOException {
        return FTPReply.isPositiveCompletion(quit());
    }

    public boolean makeDirectory(String str) throws IOException {
        return FTPReply.isPositiveCompletion(mkd(str));
    }

    public FTPFile[] mlistDir() throws IOException {
        return mlistDir(null);
    }

    public FTPFile[] mlistDir(String str) throws IOException {
        return initiateMListParsing(str).getFiles();
    }

    public FTPFile[] mlistDir(String str, FTPFileFilter fTPFileFilter) throws IOException {
        return initiateMListParsing(str).getFiles(fTPFileFilter);
    }

    public FTPFile mlistFile(String str) throws IOException {
        return FTPReply.isPositiveCompletion(sendCommand(39, str)) ? MLSxEntryParser.parseEntry(getReplyStrings()[1].substring(1)) : null;
    }

    public String printWorkingDirectory() throws IOException {
        return pwd() != 257 ? null : __parsePathname(this._replyLines.get(this._replyLines.size() - 1));
    }

    boolean reinitialize() throws IOException {
        boolean z;
        rein();
        if (FTPReply.isPositiveCompletion(this._replyCode) || (FTPReply.isPositivePreliminary(this._replyCode) && FTPReply.isPositiveCompletion(getReply()))) {
            __initDefaults();
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean remoteAppend(String str) throws IOException {
        return (this.__dataConnectionMode == 1 || this.__dataConnectionMode == 3) ? FTPReply.isPositivePreliminary(appe(str)) : false;
    }

    public boolean remoteRetrieve(String str) throws IOException {
        return (this.__dataConnectionMode == 1 || this.__dataConnectionMode == 3) ? FTPReply.isPositivePreliminary(retr(str)) : false;
    }

    public boolean remoteStore(String str) throws IOException {
        return (this.__dataConnectionMode == 1 || this.__dataConnectionMode == 3) ? FTPReply.isPositivePreliminary(stor(str)) : false;
    }

    public boolean remoteStoreUnique() throws IOException {
        return (this.__dataConnectionMode == 1 || this.__dataConnectionMode == 3) ? FTPReply.isPositivePreliminary(stou()) : false;
    }

    public boolean remoteStoreUnique(String str) throws IOException {
        return (this.__dataConnectionMode == 1 || this.__dataConnectionMode == 3) ? FTPReply.isPositivePreliminary(stou(str)) : false;
    }

    public boolean removeDirectory(String str) throws IOException {
        return FTPReply.isPositiveCompletion(rmd(str));
    }

    public boolean rename(String str, String str2) throws IOException {
        return !FTPReply.isPositiveIntermediate(rnfr(str)) ? false : FTPReply.isPositiveCompletion(rnto(str2));
    }

    protected boolean restart(long j) throws IOException {
        this.__restartOffset = 0L;
        return FTPReply.isPositiveIntermediate(rest(Long.toString(j)));
    }

    public boolean retrieveFile(String str, OutputStream outputStream) throws IOException {
        return _retrieveFile(FTPCommand.getCommand(13), str, outputStream);
    }

    public InputStream retrieveFileStream(String str) throws IOException {
        return _retrieveFileStream(FTPCommand.getCommand(13), str);
    }

    public boolean sendNoOp() throws IOException {
        return FTPReply.isPositiveCompletion(noop());
    }

    public boolean sendSiteCommand(String str) throws IOException {
        return FTPReply.isPositiveCompletion(site(str));
    }

    public void setActiveExternalIPAddress(String str) throws UnknownHostException {
        this.__activeExternalHost = InetAddress.getByName(str);
    }

    public void setActivePortRange(int i, int i2) {
        this.__activeMinPort = i;
        this.__activeMaxPort = i2;
    }

    public void setAutodetectUTF8(boolean z) {
        this.__autodetectEncoding = z;
    }

    public void setBufferSize(int i) {
        this.__bufferSize = i;
    }

    public void setControlKeepAliveReplyTimeout(int i) {
        this.__controlKeepAliveReplyTimeout = i;
    }

    public void setControlKeepAliveTimeout(long j) {
        this.__controlKeepAliveTimeout = 1000 * j;
    }

    public void setCopyStreamListener(CopyStreamListener copyStreamListener) {
        this.__copyStreamListener = copyStreamListener;
    }

    public void setDataTimeout(int i) {
        this.__dataTimeout = i;
    }

    public boolean setFileStructure(int i) throws IOException {
        boolean z;
        if (FTPReply.isPositiveCompletion(stru(i))) {
            this.__fileStructure = i;
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean setFileTransferMode(int i) throws IOException {
        boolean z;
        if (FTPReply.isPositiveCompletion(mode(i))) {
            this.__fileTransferMode = i;
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean setFileType(int i) throws IOException {
        boolean z;
        if (FTPReply.isPositiveCompletion(type(i))) {
            this.__fileType = i;
            this.__fileFormat = 4;
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean setFileType(int i, int i2) throws IOException {
        boolean z;
        if (FTPReply.isPositiveCompletion(type(i, i2))) {
            this.__fileType = i;
            this.__fileFormat = i2;
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public void setListHiddenFiles(boolean z) {
        this.__listHiddenFiles = z;
    }

    public boolean setModificationTime(String str, String str2) throws IOException {
        return FTPReply.isPositiveCompletion(mfmt(str, str2));
    }

    public void setParserFactory(FTPFileEntryParserFactory fTPFileEntryParserFactory) {
        this.__parserFactory = fTPFileEntryParserFactory;
    }

    public void setRemoteVerificationEnabled(boolean z) {
        this.__remoteVerificationEnabled = z;
    }

    public void setReportActiveExternalIPAddress(String str) throws UnknownHostException {
        this.__reportActiveExternalHost = InetAddress.getByName(str);
    }

    public void setRestartOffset(long j) {
        if (j >= 0) {
            this.__restartOffset = j;
        }
    }

    public void setUseEPSVwithIPv4(boolean z) {
        this.__useEPSVwithIPv4 = z;
    }

    public boolean storeFile(String str, InputStream inputStream) throws IOException {
        return __storeFile(14, str, inputStream);
    }

    public OutputStream storeFileStream(String str) throws IOException {
        return __storeFileStream(14, str);
    }

    public boolean storeUniqueFile(InputStream inputStream) throws IOException {
        return __storeFile(15, null, inputStream);
    }

    public boolean storeUniqueFile(String str, InputStream inputStream) throws IOException {
        return __storeFile(15, str, inputStream);
    }

    public OutputStream storeUniqueFileStream() throws IOException {
        return __storeFileStream(15, null);
    }

    public OutputStream storeUniqueFileStream(String str) throws IOException {
        return __storeFileStream(15, str);
    }

    public boolean structureMount(String str) throws IOException {
        return FTPReply.isPositiveCompletion(smnt(str));
    }
}
