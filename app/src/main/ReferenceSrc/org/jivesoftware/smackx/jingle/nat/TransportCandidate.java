package org.jivesoftware.smackx.jingle.nat;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.tools.ant.util.FileUtils;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smackx.jingle.JingleSession;
import org.jivesoftware.smackx.jingle.SmackLogger;
import org.jivesoftware.smackx.jingle.nat.TransportResolverListener;

/* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportCandidate.class */
public abstract class TransportCandidate {
    private static final SmackLogger LOGGER = SmackLogger.getLogger(TransportCandidate.class);
    private CandidateEcho candidateEcho;
    private Connection connection;
    private Thread echoThread;
    private int generation;
    private String ip;
    private final List<TransportResolverListener.Checker> listeners;
    private String localIp;
    private String name;
    protected String password;
    private int port;
    private String sessionId;
    private TransportCandidate symmetric;

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho.class */
    public class CandidateEcho implements Runnable {
        TransportCandidate candidate;
        String id;
        String localUser;
        byte[] receive;
        String remoteUser;
        byte[] send;
        DatagramSocket socket;
        DatagramPacket sendPacket = null;
        List<DatagramListener> listeners = new ArrayList();
        List<ResultListener> resultListeners = new ArrayList();
        boolean enabled = true;
        boolean ended = false;
        long replyTries = 2;
        long tries = 10;

        public CandidateEcho(TransportCandidate transportCandidate, JingleSession jingleSession) throws UnknownHostException, SocketException {
            TransportCandidate.this = r7;
            this.socket = null;
            this.localUser = null;
            this.remoteUser = null;
            this.id = null;
            this.send = null;
            this.receive = null;
            this.candidate = null;
            this.socket = new DatagramSocket(transportCandidate.getPort(), InetAddress.getByName(transportCandidate.getLocalIp()));
            this.localUser = jingleSession.getInitiator();
            this.remoteUser = jingleSession.getResponder();
            this.id = jingleSession.getSid();
            this.candidate = transportCandidate;
            int ceil = (int) Math.ceil(this.id.length() / 2.0f);
            String str = this.id.substring(0, ceil) + ";" + this.localUser;
            String str2 = this.id.substring(ceil) + ";" + this.remoteUser;
            try {
                if (jingleSession.getConnection().getUser().equals(jingleSession.getInitiator())) {
                    this.send = str.getBytes("UTF-8");
                    this.receive = str2.getBytes("UTF-8");
                } else {
                    this.receive = str.getBytes("UTF-8");
                    this.send = str2.getBytes("UTF-8");
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        public void fireTestResult(TestResult testResult, TransportCandidate transportCandidate) {
            for (ResultListener resultListener : this.resultListeners) {
                resultListener.testFinished(testResult, transportCandidate);
            }
        }

        public void addListener(DatagramListener datagramListener) {
            this.listeners.add(datagramListener);
        }

        public void addResultListener(ResultListener resultListener) {
            this.resultListeners.add(resultListener);
        }

        public void cancel() {
            this.enabled = false;
            this.socket.close();
        }

        public void removeListener(DatagramListener datagramListener) {
            this.listeners.remove(datagramListener);
        }

        public void removeResultListener(ResultListener resultListener) {
            this.resultListeners.remove(resultListener);
        }

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x0186 -> B:32:0x016e). Please submit an issue!!! */
        @Override // java.lang.Runnable
        public void run() {
            try {
                TransportCandidate.LOGGER.debug("Listening for ECHO: " + this.socket.getLocalAddress().getHostAddress() + ":" + this.socket.getLocalPort());
                while (true) {
                    DatagramPacket datagramPacket = new DatagramPacket(new byte[FTPReply.FILE_STATUS_OK], FTPReply.FILE_STATUS_OK);
                    this.socket.receive(datagramPacket);
                    boolean z = false;
                    ByteBuffer wrap = ByteBuffer.wrap(datagramPacket.getData());
                    byte[] bArr = new byte[datagramPacket.getLength()];
                    wrap.get(bArr, 0, datagramPacket.getLength());
                    datagramPacket.setData(bArr);
                    Iterator<DatagramListener> it = this.listeners.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        boolean datagramReceived = it.next().datagramReceived(datagramPacket);
                        z = datagramReceived;
                        if (datagramReceived) {
                            z = datagramReceived;
                            break;
                        }
                    }
                    long j = 100 / this.replyTries;
                    String[] split = new String(datagramPacket.getData(), "UTF-8").split(";");
                    String str = split[0];
                    String[] split2 = split[1].split(":");
                    String str2 = split2[0];
                    String str3 = split2[1];
                    if (str.equals(this.candidate.getPassword()) && !z) {
                        byte[] bArr2 = null;
                        try {
                            bArr2 = (TransportCandidate.this.password + ";" + this.candidate.getIp() + ":" + this.candidate.getPort()).getBytes("UTF-8");
                        } catch (UnsupportedEncodingException e) {
                            e.printStackTrace();
                        }
                        datagramPacket.setData(bArr2);
                        datagramPacket.setLength(bArr2.length);
                        datagramPacket.setAddress(InetAddress.getByName(str2));
                        datagramPacket.setPort(Integer.parseInt(str3));
                        for (int i = 0; i < this.replyTries; i++) {
                            this.socket.send(datagramPacket);
                            if (this.enabled) {
                                try {
                                    Thread.sleep(j);
                                } catch (InterruptedException e2) {
                                    e2.printStackTrace();
                                }
                            }
                        }
                    }
                }
            } catch (SocketException e3) {
                if (this.enabled) {
                }
            } catch (UnknownHostException e4) {
                if (this.enabled) {
                }
            } catch (IOException e5) {
                if (this.enabled) {
                }
            } catch (Exception e6) {
                if (this.enabled) {
                }
            }
        }

        public void testASync(final TransportCandidate transportCandidate, final String str) {
            new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TransportCandidate.CandidateEcho.1
                /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x00e3 -> B:23:0x00db). Please submit an issue!!! */
                @Override // java.lang.Runnable
                public void run() {
                    DatagramListener datagramListener = new DatagramListener() { // from class: org.jivesoftware.smackx.jingle.nat.TransportCandidate.CandidateEcho.1.1
                        @Override // org.jivesoftware.smackx.jingle.nat.DatagramListener
                        public boolean datagramReceived(DatagramPacket datagramPacket) {
                            String str2;
                            String str3;
                            String str4;
                            boolean z = true;
                            try {
                                TransportCandidate.LOGGER.debug("ECHO Received to: " + CandidateEcho.this.candidate.getIp() + ":" + CandidateEcho.this.candidate.getPort() + "  data: " + new String(datagramPacket.getData(), "UTF-8"));
                                String[] split = new String(datagramPacket.getData(), "UTF-8").split(";");
                                str2 = split[0];
                                String[] split2 = split[1].split(":");
                                str3 = split2[0];
                                str4 = split2[1];
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                            if (str2.equals(str) && transportCandidate.getIp().indexOf(str3) != -1 && transportCandidate.getPort() == Integer.parseInt(str4)) {
                                TransportCandidate.LOGGER.debug("ECHO OK: " + CandidateEcho.this.candidate.getIp() + ":" + CandidateEcho.this.candidate.getPort() + " <-> " + transportCandidate.getIp() + ":" + transportCandidate.getPort());
                                TestResult testResult = new TestResult();
                                testResult.setResult(true);
                                CandidateEcho.this.ended = true;
                                CandidateEcho.this.fireTestResult(testResult, transportCandidate);
                                return z;
                            }
                            TransportCandidate.LOGGER.debug("ECHO Wrong Data: " + datagramPacket.getAddress().getHostAddress() + ":" + datagramPacket.getPort());
                            z = false;
                            return z;
                        }
                    };
                    CandidateEcho.this.addListener(datagramListener);
                    byte[] bArr = null;
                    try {
                        bArr = new String(str + ";" + TransportCandidate.this.getIp() + ":" + TransportCandidate.this.getPort()).getBytes("UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    DatagramPacket datagramPacket = new DatagramPacket(bArr, bArr.length);
                    try {
                        datagramPacket.setAddress(InetAddress.getByName(transportCandidate.getIp()));
                    } catch (UnknownHostException e2) {
                        e2.printStackTrace();
                    }
                    datagramPacket.setPort(transportCandidate.getPort());
                    int i = 0;
                    while (true) {
                        try {
                            if (i < CandidateEcho.this.tries) {
                                CandidateEcho.this.socket.send(datagramPacket);
                                if (!CandidateEcho.this.ended) {
                                    try {
                                        Thread.sleep(200L);
                                    } catch (InterruptedException e3) {
                                        e3.printStackTrace();
                                    }
                                    i++;
                                }
                            }
                        } catch (IOException e4) {
                        }
                        try {
                            Thread.sleep(FileUtils.FAT_FILE_TIMESTAMP_GRANULARITY);
                        } catch (InterruptedException e5) {
                            e5.printStackTrace();
                        }
                        CandidateEcho.this.removeListener(datagramListener);
                        return;
                    }
                }
            }).start();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel.class */
    public static class Channel {
        private String value;
        public static final Channel MYRTPVOICE = new Channel("myrtpvoice");
        public static final Channel MYRTCPVOICE = new Channel("myrtcpvoice");

        public Channel(String str) {
            this.value = str;
        }

        public static Channel fromString(String str) {
            Channel channel;
            if (str == null) {
                channel = MYRTPVOICE;
            } else {
                String lowerCase = str.toLowerCase();
                channel = lowerCase.equals("myrtpvoice") ? MYRTPVOICE : lowerCase.equals("tcp") ? MYRTCPVOICE : MYRTPVOICE;
            }
            return channel;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (obj == null) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else {
                    Channel channel = (Channel) obj;
                    if (this.value == null) {
                        if (channel.value != null) {
                            z = false;
                        }
                    } else if (!this.value.equals(channel.value)) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public boolean isNull() {
            boolean z = true;
            if (this.value != null && this.value.length() != 0) {
                z = false;
            }
            return z;
        }

        public String toString() {
            return this.value;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed.class */
    public static class Fixed extends TransportCandidate {
        public Fixed() {
        }

        public Fixed(String str, int i) {
            super(str, i);
        }

        public Fixed(String str, int i, int i2) {
            super(str, i, i2);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol.class */
    public static class Protocol {
        private String value;
        public static final Protocol UDP = new Protocol("udp");
        public static final Protocol TCP = new Protocol("tcp");
        public static final Protocol TCPACT = new Protocol("tcp-act");
        public static final Protocol TCPPASS = new Protocol("tcp-pass");
        public static final Protocol SSLTCP = new Protocol("ssltcp");

        public Protocol(String str) {
            this.value = str;
        }

        public static Protocol fromString(String str) {
            Protocol protocol;
            if (str == null) {
                protocol = UDP;
            } else {
                String lowerCase = str.toLowerCase();
                protocol = lowerCase.equals("udp") ? UDP : lowerCase.equals("tcp") ? TCP : lowerCase.equals("tcp-act") ? TCPACT : lowerCase.equals("tcp-pass") ? TCPPASS : lowerCase.equals("ssltcp") ? SSLTCP : UDP;
            }
            return protocol;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (obj == null) {
                    z = false;
                } else if (getClass() != obj.getClass()) {
                    z = false;
                } else {
                    Protocol protocol = (Protocol) obj;
                    if (this.value == null) {
                        if (protocol.value != null) {
                            z = false;
                        }
                    } else if (!this.value.equals(protocol.value)) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public boolean isNull() {
            boolean z = true;
            if (this.value != null && this.value.length() != 0) {
                z = false;
            }
            return z;
        }

        public String toString() {
            return this.value;
        }
    }

    public TransportCandidate() {
        this(null, 0, 0);
    }

    public TransportCandidate(String str, int i) {
        this(str, i, 0);
    }

    public TransportCandidate(String str, int i, int i2) {
        this.candidateEcho = null;
        this.echoThread = null;
        this.listeners = new ArrayList();
        this.ip = str;
        this.port = i;
        this.generation = i2;
    }

    public void addCandidateEcho(JingleSession jingleSession) throws SocketException, UnknownHostException {
        this.candidateEcho = new CandidateEcho(this, jingleSession);
        this.echoThread = new Thread(this.candidateEcho);
        this.echoThread.start();
    }

    public void addListener(TransportResolverListener.Checker checker) {
        synchronized (this.listeners) {
            this.listeners.add(checker);
        }
    }

    public void check(List<TransportCandidate> list) {
        Thread thread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.jingle.nat.TransportCandidate.1
            @Override // java.lang.Runnable
            public void run() {
                boolean z;
                try {
                    InetAddress.getByName(TransportCandidate.this.getIp());
                    z = true;
                } catch (Exception e) {
                    z = false;
                }
                TransportCandidate.this.triggerCandidateChecked(z);
            }
        }, "Transport candidate check");
        thread.setName("Transport candidate test");
        thread.start();
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x009e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null) {
                z = false;
            } else if (getClass() != obj.getClass()) {
                z = false;
            } else {
                TransportCandidate transportCandidate = (TransportCandidate) obj;
                if (this.generation != transportCandidate.generation) {
                    z = false;
                } else if (getIp() == null) {
                    if (transportCandidate.getIp() != null) {
                        z = false;
                    }
                    if (getPort() == transportCandidate.getPort()) {
                        z = false;
                    } else if (getName() == null) {
                        if (transportCandidate.getName() != null) {
                            z = false;
                        }
                        if (getPort() != transportCandidate.getPort()) {
                            z = false;
                        }
                    } else {
                        if (!getName().equals(transportCandidate.getName())) {
                            z = false;
                        }
                        if (getPort() != transportCandidate.getPort()) {
                        }
                    }
                } else {
                    if (!getIp().equals(transportCandidate.getIp())) {
                        z = false;
                    }
                    if (getPort() == transportCandidate.getPort()) {
                    }
                }
            }
        }
        return z;
    }

    public CandidateEcho getCandidateEcho() {
        return this.candidateEcho;
    }

    public Connection getConnection() {
        return this.connection;
    }

    public int getGeneration() {
        return this.generation;
    }

    public String getIp() {
        return this.ip;
    }

    public List<TransportResolverListener.Checker> getListenersList() {
        ArrayList arrayList;
        synchronized (this.listeners) {
            arrayList = new ArrayList(this.listeners);
        }
        return arrayList;
    }

    public String getLocalIp() {
        return this.localIp == null ? this.ip : this.localIp;
    }

    public String getName() {
        return this.name;
    }

    public String getPassword() {
        return this.password;
    }

    public int getPort() {
        return this.port;
    }

    public String getSessionId() {
        return this.sessionId;
    }

    public TransportCandidate getSymmetric() {
        return this.symmetric;
    }

    public boolean isNull() {
        boolean z;
        if (this.ip == null) {
            z = true;
        } else {
            z = true;
            if (this.ip.length() != 0) {
                z = true;
                if (this.port >= 0) {
                    z = false;
                }
            }
        }
        return z;
    }

    public void removeCandidateEcho() {
        if (this.candidateEcho != null) {
            this.candidateEcho.cancel();
        }
        this.candidateEcho = null;
        this.echoThread = null;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public void setGeneration(int i) {
        this.generation = i;
    }

    public void setIp(String str) {
        this.ip = str;
    }

    public void setLocalIp(String str) {
        this.localIp = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setPort(int i) {
        this.port = i;
    }

    public void setSessionId(String str) {
        this.sessionId = str;
    }

    public void setSymmetric(TransportCandidate transportCandidate) {
        this.symmetric = transportCandidate;
    }

    void triggerCandidateChecked(boolean z) {
        for (TransportResolverListener.Checker checker : getListenersList()) {
            checker.candidateChecked(this, z);
        }
    }
}
