package org.jivesoftware.smackx.bytestreams.ibb;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketTimeoutException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.util.SyncPacketSend;
import org.jivesoftware.smackx.bytestreams.BytestreamSession;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamManager;
import org.jivesoftware.smackx.bytestreams.ibb.packet.Close;
import org.jivesoftware.smackx.bytestreams.ibb.packet.Data;
import org.jivesoftware.smackx.bytestreams.ibb.packet.DataPacketExtension;
import org.jivesoftware.smackx.bytestreams.ibb.packet.Open;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession.class */
public class InBandBytestreamSession implements BytestreamSession {
    private final Open byteStreamRequest;
    private final Connection connection;
    private IBBInputStream inputStream;
    private IBBOutputStream outputStream;
    private String remoteJID;
    private boolean closeBothStreamsEnabled = false;
    private boolean isClosed = false;

    /* renamed from: org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession$1 */
    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$org$jivesoftware$smackx$bytestreams$ibb$InBandBytestreamManager$StanzaType = new int[InBandBytestreamManager.StanzaType.values().length];

        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:8:0x0024 -> B:11:0x0014). Please submit an issue!!! */
        static {
            try {
                $SwitchMap$org$jivesoftware$smackx$bytestreams$ibb$InBandBytestreamManager$StanzaType[InBandBytestreamManager.StanzaType.IQ.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$org$jivesoftware$smackx$bytestreams$ibb$InBandBytestreamManager$StanzaType[InBandBytestreamManager.StanzaType.MESSAGE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$IBBDataPacketFilter.class */
    private class IBBDataPacketFilter implements PacketFilter {
        private IBBDataPacketFilter() {
            InBandBytestreamSession.this = r4;
        }

        /* synthetic */ IBBDataPacketFilter(InBandBytestreamSession inBandBytestreamSession, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.jivesoftware.smack.filter.PacketFilter
        public boolean accept(Packet packet) {
            boolean z;
            if (!packet.getFrom().equalsIgnoreCase(InBandBytestreamSession.this.remoteJID)) {
                z = false;
            } else {
                PacketExtension extension = packet.getExtension("data", InBandBytestreamManager.NAMESPACE);
                z = false;
                if (extension != null) {
                    z = false;
                    if (extension instanceof DataPacketExtension) {
                        z = false;
                        if (((DataPacketExtension) extension).getSessionID().equals(InBandBytestreamSession.this.byteStreamRequest.getSessionID())) {
                            z = true;
                        }
                    }
                }
            }
            return z;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$IBBInputStream.class */
    private abstract class IBBInputStream extends InputStream {
        private byte[] buffer;
        protected final BlockingQueue<DataPacketExtension> dataQueue = new LinkedBlockingQueue();
        private int bufferPointer = -1;
        private long seq = -1;
        private boolean isClosed = false;
        private boolean closeInvoked = false;
        private int readTimeout = 0;
        private final PacketListener dataPacketListener = getDataPacketListener();

        public IBBInputStream() {
            InBandBytestreamSession.this = r5;
            r5.connection.addPacketListener(this.dataPacketListener, getDataPacketFilter());
        }

        private void checkClosed() throws IOException {
            if ((!this.isClosed || !this.dataQueue.isEmpty()) && !this.closeInvoked) {
                return;
            }
            this.dataQueue.clear();
            throw new IOException("Stream is closed");
        }

        public void cleanup() {
            InBandBytestreamSession.this.connection.removePacketListener(this.dataPacketListener);
        }

        public void closeInternal() {
            if (this.isClosed) {
                return;
            }
            this.isClosed = true;
        }

        private boolean loadBuffer() throws IOException {
            boolean z;
            DataPacketExtension dataPacketExtension;
            long seq;
            synchronized (this) {
                DataPacketExtension dataPacketExtension2 = null;
                try {
                    if (this.readTimeout == 0) {
                        while (true) {
                            dataPacketExtension = dataPacketExtension2;
                            if (dataPacketExtension2 != null) {
                                break;
                            } else if (this.isClosed && this.dataQueue.isEmpty()) {
                                z = false;
                                break;
                            } else {
                                dataPacketExtension2 = this.dataQueue.poll(1000L, TimeUnit.MILLISECONDS);
                            }
                        }
                    } else {
                        DataPacketExtension poll = this.dataQueue.poll(this.readTimeout, TimeUnit.MILLISECONDS);
                        dataPacketExtension = poll;
                        if (poll == null) {
                            throw new SocketTimeoutException();
                        }
                    }
                    if (this.seq == 65535) {
                        this.seq = -1L;
                    }
                    seq = dataPacketExtension.getSeq();
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    z = false;
                }
                if (seq - 1 != this.seq) {
                    InBandBytestreamSession.this.close();
                    throw new IOException("Packets out of sequence");
                }
                this.seq = seq;
                this.buffer = dataPacketExtension.getDecodedData();
                this.bufferPointer = 0;
                z = true;
            }
            return z;
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.isClosed) {
                return;
            }
            this.closeInvoked = true;
            InBandBytestreamSession.this.closeByLocal(true);
        }

        protected abstract PacketFilter getDataPacketFilter();

        protected abstract PacketListener getDataPacketListener();

        @Override // java.io.InputStream
        public boolean markSupported() {
            return false;
        }

        @Override // java.io.InputStream
        public int read() throws IOException {
            int i = -1;
            synchronized (this) {
                checkClosed();
                if ((this.bufferPointer != -1 && this.bufferPointer < this.buffer.length) || loadBuffer()) {
                    byte[] bArr = this.buffer;
                    int i2 = this.bufferPointer;
                    this.bufferPointer = i2 + 1;
                    i = bArr[i2] & 255;
                }
            }
            return i;
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr) throws IOException {
            int read;
            synchronized (this) {
                read = read(bArr, 0, bArr.length);
            }
            return read;
        }

        @Override // java.io.InputStream
        public int read(byte[] bArr, int i, int i2) throws IOException {
            int i3 = -1;
            synchronized (this) {
                if (bArr == null) {
                    throw new NullPointerException();
                }
                if (i < 0 || i > bArr.length || i2 < 0 || i + i2 > bArr.length || i + i2 < 0) {
                    throw new IndexOutOfBoundsException();
                }
                if (i2 == 0) {
                    i3 = 0;
                } else {
                    checkClosed();
                    if ((this.bufferPointer != -1 && this.bufferPointer < this.buffer.length) || loadBuffer()) {
                        int length = this.buffer.length - this.bufferPointer;
                        i3 = i2;
                        if (i2 > length) {
                            i3 = length;
                        }
                        System.arraycopy(this.buffer, this.bufferPointer, bArr, i, i3);
                        this.bufferPointer += i3;
                    }
                }
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$IBBOutputStream.class */
    private abstract class IBBOutputStream extends OutputStream {
        protected final byte[] buffer;
        protected int bufferPointer = 0;
        protected long seq = 0;
        protected boolean isClosed = false;

        public IBBOutputStream() {
            InBandBytestreamSession.this = r5;
            this.buffer = new byte[(r5.byteStreamRequest.getBlockSize() / 4) * 3];
        }

        private void flushBuffer() throws IOException {
            synchronized (this) {
                if (this.bufferPointer != 0) {
                    writeToXML(new DataPacketExtension(InBandBytestreamSession.this.byteStreamRequest.getSessionID(), this.seq, StringUtils.encodeBase64(this.buffer, 0, this.bufferPointer, false)));
                    this.bufferPointer = 0;
                    this.seq = this.seq + 1 == 65535 ? 0L : this.seq + 1;
                }
            }
        }

        private void writeOut(byte[] bArr, int i, int i2) throws IOException {
            synchronized (this) {
                if (this.isClosed) {
                    throw new IOException("Stream is closed");
                }
                int i3 = 0;
                if (i2 > this.buffer.length - this.bufferPointer) {
                    i3 = this.buffer.length - this.bufferPointer;
                    System.arraycopy(bArr, i, this.buffer, this.bufferPointer, i3);
                    this.bufferPointer += i3;
                    flushBuffer();
                }
                System.arraycopy(bArr, i + i3, this.buffer, this.bufferPointer, i2 - i3);
                this.bufferPointer += i2 - i3;
            }
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.isClosed) {
                return;
            }
            InBandBytestreamSession.this.closeByLocal(false);
        }

        protected void closeInternal(boolean z) {
            if (this.isClosed) {
                return;
            }
            this.isClosed = true;
            if (!z) {
                return;
            }
            try {
                flushBuffer();
            } catch (IOException e) {
            }
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            synchronized (this) {
                if (this.isClosed) {
                    throw new IOException("Stream is closed");
                }
                flushBuffer();
            }
        }

        @Override // java.io.OutputStream
        public void write(int i) throws IOException {
            synchronized (this) {
                if (this.isClosed) {
                    throw new IOException("Stream is closed");
                }
                if (this.bufferPointer >= this.buffer.length) {
                    flushBuffer();
                }
                byte[] bArr = this.buffer;
                int i2 = this.bufferPointer;
                this.bufferPointer = i2 + 1;
                bArr[i2] = (byte) i;
            }
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr) throws IOException {
            synchronized (this) {
                write(bArr, 0, bArr.length);
            }
        }

        @Override // java.io.OutputStream
        public void write(byte[] bArr, int i, int i2) throws IOException {
            synchronized (this) {
                if (bArr == null) {
                    throw new NullPointerException();
                }
                if (i < 0 || i > bArr.length || i2 < 0 || i + i2 > bArr.length || i + i2 < 0) {
                    throw new IndexOutOfBoundsException();
                }
                if (i2 != 0) {
                    if (this.isClosed) {
                        throw new IOException("Stream is closed");
                    }
                    if (i2 >= this.buffer.length) {
                        writeOut(bArr, i, this.buffer.length);
                        write(bArr, this.buffer.length + i, i2 - this.buffer.length);
                    } else {
                        writeOut(bArr, i, i2);
                    }
                }
            }
        }

        protected abstract void writeToXML(DataPacketExtension dataPacketExtension) throws IOException;
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$IQIBBInputStream.class */
    private class IQIBBInputStream extends IBBInputStream {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private IQIBBInputStream() {
            super();
            InBandBytestreamSession.this = r4;
        }

        /* synthetic */ IQIBBInputStream(InBandBytestreamSession inBandBytestreamSession, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBInputStream
        protected PacketFilter getDataPacketFilter() {
            return new AndFilter(new PacketTypeFilter(Data.class), new IBBDataPacketFilter(InBandBytestreamSession.this, null));
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBInputStream
        protected PacketListener getDataPacketListener() {
            return new PacketListener() { // from class: org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IQIBBInputStream.1
                private long lastSequence = -1;

                @Override // org.jivesoftware.smack.PacketListener
                public void processPacket(Packet packet) {
                    DataPacketExtension dataPacketExtension = (DataPacketExtension) packet.getExtension("data", InBandBytestreamManager.NAMESPACE);
                    if (dataPacketExtension.getSeq() <= this.lastSequence) {
                        InBandBytestreamSession.this.connection.sendPacket(IQ.createErrorResponse((IQ) packet, new XMPPError(XMPPError.Condition.unexpected_request)));
                    } else if (dataPacketExtension.getDecodedData() == null) {
                        InBandBytestreamSession.this.connection.sendPacket(IQ.createErrorResponse((IQ) packet, new XMPPError(XMPPError.Condition.bad_request)));
                    } else {
                        IQIBBInputStream.this.dataQueue.offer(dataPacketExtension);
                        InBandBytestreamSession.this.connection.sendPacket(IQ.createResultIQ((IQ) packet));
                        this.lastSequence = dataPacketExtension.getSeq();
                        if (this.lastSequence != 65535) {
                            return;
                        }
                        this.lastSequence = -1L;
                    }
                }
            };
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$IQIBBOutputStream.class */
    private class IQIBBOutputStream extends IBBOutputStream {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private IQIBBOutputStream() {
            super();
            InBandBytestreamSession.this = r4;
        }

        /* synthetic */ IQIBBOutputStream(InBandBytestreamSession inBandBytestreamSession, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBOutputStream
        protected void writeToXML(DataPacketExtension dataPacketExtension) throws IOException {
            synchronized (this) {
                Data data = new Data(dataPacketExtension);
                data.setTo(InBandBytestreamSession.this.remoteJID);
                try {
                    SyncPacketSend.getReply(InBandBytestreamSession.this.connection, data);
                } catch (XMPPException e) {
                    if (!this.isClosed) {
                        InBandBytestreamSession.this.close();
                        throw new IOException("Error while sending Data: " + e.getMessage());
                    }
                }
            }
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$MessageIBBInputStream.class */
    private class MessageIBBInputStream extends IBBInputStream {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private MessageIBBInputStream() {
            super();
            InBandBytestreamSession.this = r4;
        }

        /* synthetic */ MessageIBBInputStream(InBandBytestreamSession inBandBytestreamSession, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBInputStream
        protected PacketFilter getDataPacketFilter() {
            return new AndFilter(new PacketTypeFilter(Message.class), new IBBDataPacketFilter(InBandBytestreamSession.this, null));
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBInputStream
        protected PacketListener getDataPacketListener() {
            return new PacketListener() { // from class: org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.MessageIBBInputStream.1
                @Override // org.jivesoftware.smack.PacketListener
                public void processPacket(Packet packet) {
                    DataPacketExtension dataPacketExtension = (DataPacketExtension) packet.getExtension("data", InBandBytestreamManager.NAMESPACE);
                    if (dataPacketExtension.getDecodedData() == null) {
                        return;
                    }
                    MessageIBBInputStream.this.dataQueue.offer(dataPacketExtension);
                }
            };
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InBandBytestreamSession$MessageIBBOutputStream.class */
    private class MessageIBBOutputStream extends IBBOutputStream {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        private MessageIBBOutputStream() {
            super();
            InBandBytestreamSession.this = r4;
        }

        /* synthetic */ MessageIBBOutputStream(InBandBytestreamSession inBandBytestreamSession, AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession.IBBOutputStream
        protected void writeToXML(DataPacketExtension dataPacketExtension) {
            synchronized (this) {
                Message message = new Message(InBandBytestreamSession.this.remoteJID);
                message.addExtension(dataPacketExtension);
                InBandBytestreamSession.this.connection.sendPacket(message);
            }
        }
    }

    protected InBandBytestreamSession(Connection connection, Open open, String str) {
        this.connection = connection;
        this.byteStreamRequest = open;
        this.remoteJID = str;
        switch (AnonymousClass1.$SwitchMap$org$jivesoftware$smackx$bytestreams$ibb$InBandBytestreamManager$StanzaType[open.getStanza().ordinal()]) {
            case 1:
                this.inputStream = new IQIBBInputStream(this, null);
                this.outputStream = new IQIBBOutputStream(this, null);
                return;
            case 2:
                this.inputStream = new MessageIBBInputStream(this, null);
                this.outputStream = new MessageIBBOutputStream(this, null);
                return;
            default:
                return;
        }
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public void close() throws IOException {
        closeByLocal(true);
        closeByLocal(false);
    }

    protected void closeByLocal(boolean z) throws IOException {
        synchronized (this) {
            if (!this.isClosed) {
                if (this.closeBothStreamsEnabled) {
                    this.inputStream.closeInternal();
                    this.outputStream.closeInternal(true);
                } else if (z) {
                    this.inputStream.closeInternal();
                } else {
                    this.outputStream.closeInternal(true);
                }
                if (this.inputStream.isClosed && this.outputStream.isClosed) {
                    this.isClosed = true;
                    Close close = new Close(this.byteStreamRequest.getSessionID());
                    close.setTo(this.remoteJID);
                    try {
                        SyncPacketSend.getReply(this.connection, close);
                        this.inputStream.cleanup();
                        InBandBytestreamManager.getByteStreamManager(this.connection).getSessions().remove(this);
                    } catch (XMPPException e) {
                        throw new IOException("Error while closing stream: " + e.getMessage());
                    }
                }
            }
        }
    }

    protected void closeByPeer(Close close) {
        this.inputStream.closeInternal();
        this.inputStream.cleanup();
        this.outputStream.closeInternal(false);
        this.connection.sendPacket(IQ.createResultIQ(close));
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public InputStream getInputStream() {
        return this.inputStream;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public OutputStream getOutputStream() {
        return this.outputStream;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public int getReadTimeout() {
        return this.inputStream.readTimeout;
    }

    public boolean isCloseBothStreamsEnabled() {
        return this.closeBothStreamsEnabled;
    }

    public void setCloseBothStreamsEnabled(boolean z) {
        this.closeBothStreamsEnabled = z;
    }

    @Override // org.jivesoftware.smackx.bytestreams.BytestreamSession
    public void setReadTimeout(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("Timeout must be >= 0");
        }
        this.inputStream.readTimeout = i;
    }
}
