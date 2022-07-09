package org.apache.commons.net.tftp;

import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import org.apache.commons.net.io.FromNetASCIIOutputStream;
import org.apache.commons.net.io.ToNetASCIIInputStream;

/* loaded from: classes.jar:org/apache/commons/net/tftp/TFTPClient.class */
public class TFTPClient extends TFTP {
    public static final int DEFAULT_MAX_TIMEOUTS = 5;
    private int __maxTimeouts = 5;

    public int getMaxTimeouts() {
        return this.__maxTimeouts;
    }

    public int receiveFile(String str, int i, OutputStream outputStream, String str2) throws UnknownHostException, IOException {
        return receiveFile(str, i, outputStream, InetAddress.getByName(str2), 69);
    }

    public int receiveFile(String str, int i, OutputStream outputStream, String str2, int i2) throws UnknownHostException, IOException {
        return receiveFile(str, i, outputStream, InetAddress.getByName(str2), i2);
    }

    public int receiveFile(String str, int i, OutputStream outputStream, InetAddress inetAddress) throws IOException {
        return receiveFile(str, i, outputStream, inetAddress, 69);
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x01d4, code lost:
        r15 = r22;
        r10 = r18;
        r12 = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x024b, code lost:
        bufferedSend(new org.apache.commons.net.tftp.TFTPErrorPacket(r0.getAddress(), r0.getPort(), 5, "Unexpected host or port."));
        r22 = r15;
        r16 = r10;
        r21 = r12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int receiveFile(String str, int i, OutputStream outputStream, InetAddress inetAddress, int i2) throws IOException {
        int i3;
        int i4;
        TFTPReadRequestPacket tFTPReadRequestPacket;
        TFTPAckPacket tFTPAckPacket = new TFTPAckPacket(inetAddress, i2, 0);
        beginBufferedOps();
        int i5 = 0;
        int i6 = 0;
        int i7 = 1;
        FromNetASCIIOutputStream fromNetASCIIOutputStream = outputStream;
        if (i == 0) {
            fromNetASCIIOutputStream = new FromNetASCIIOutputStream(outputStream);
        }
        TFTPReadRequestPacket tFTPReadRequestPacket2 = new TFTPReadRequestPacket(inetAddress, i2, str, i);
        InetAddress inetAddress2 = inetAddress;
        TFTPReadRequestPacket tFTPReadRequestPacket3 = tFTPReadRequestPacket2;
        int i8 = 0;
        int i9 = 0;
        do {
            bufferedSend(tFTPReadRequestPacket3);
            InetAddress inetAddress3 = inetAddress2;
            i3 = i9;
            while (true) {
                try {
                    TFTPPacket bufferedReceive = bufferedReceive();
                    int i10 = i6;
                    inetAddress2 = inetAddress3;
                    if (i8 == 0) {
                        int port = bufferedReceive.getPort();
                        tFTPAckPacket.setPort(port);
                        i10 = port;
                        inetAddress2 = inetAddress3;
                        if (!inetAddress3.equals(bufferedReceive.getAddress())) {
                            inetAddress2 = bufferedReceive.getAddress();
                            tFTPAckPacket.setAddress(inetAddress2);
                            tFTPReadRequestPacket3.setAddress(inetAddress2);
                            i10 = port;
                        }
                    }
                    if (inetAddress2.equals(bufferedReceive.getAddress()) && bufferedReceive.getPort() == i10) {
                        switch (bufferedReceive.getType()) {
                            case 3:
                                TFTPDataPacket tFTPDataPacket = (TFTPDataPacket) bufferedReceive;
                                int dataLength = tFTPDataPacket.getDataLength();
                                int blockNumber = tFTPDataPacket.getBlockNumber();
                                if (blockNumber != i7) {
                                    discardPackets();
                                    i3 = dataLength;
                                    i6 = i10;
                                    i8 = blockNumber;
                                    inetAddress3 = inetAddress2;
                                    if (blockNumber == (i7 == 0 ? 65535 : i7 - 1)) {
                                        i4 = i5;
                                        i3 = dataLength;
                                        i6 = i10;
                                        i8 = blockNumber;
                                        tFTPReadRequestPacket = tFTPReadRequestPacket3;
                                        break;
                                    }
                                } else {
                                    try {
                                        fromNetASCIIOutputStream.write(tFTPDataPacket.getData(), tFTPDataPacket.getDataOffset(), dataLength);
                                        int i11 = i7 + 1;
                                        i7 = i11;
                                        if (i11 > 65535) {
                                            i7 = 0;
                                        }
                                        tFTPAckPacket.setBlockNumber(blockNumber);
                                        tFTPReadRequestPacket = tFTPAckPacket;
                                        i4 = i5 + dataLength;
                                        i8 = blockNumber;
                                        i6 = i10;
                                        i3 = dataLength;
                                        break;
                                    } catch (IOException e) {
                                        bufferedSend(new TFTPErrorPacket(inetAddress2, i10, 3, "File write failed."));
                                        endBufferedOps();
                                        throw e;
                                    }
                                }
                            case 4:
                            default:
                                endBufferedOps();
                                throw new IOException("Received unexpected packet type.");
                            case 5:
                                TFTPErrorPacket tFTPErrorPacket = (TFTPErrorPacket) bufferedReceive;
                                endBufferedOps();
                                throw new IOException("Error code " + tFTPErrorPacket.getError() + " received: " + tFTPErrorPacket.getMessage());
                        }
                    }
                } catch (InterruptedIOException e2) {
                    i4 = i5;
                    tFTPReadRequestPacket = tFTPReadRequestPacket3;
                    inetAddress2 = inetAddress3;
                    if (0 + 1 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (SocketException e3) {
                    i4 = i5;
                    tFTPReadRequestPacket = tFTPReadRequestPacket3;
                    inetAddress2 = inetAddress3;
                    if (0 + 1 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (TFTPPacketException e4) {
                    endBufferedOps();
                    throw new IOException("Bad packet: " + e4.getMessage());
                }
            }
        } while (i3 == 512);
        bufferedSend(tFTPReadRequestPacket);
        endBufferedOps();
        return i4;
    }

    public void sendFile(String str, int i, InputStream inputStream, String str2) throws UnknownHostException, IOException {
        sendFile(str, i, inputStream, InetAddress.getByName(str2), 69);
    }

    public void sendFile(String str, int i, InputStream inputStream, String str2, int i2) throws UnknownHostException, IOException {
        sendFile(str, i, inputStream, InetAddress.getByName(str2), i2);
    }

    public void sendFile(String str, int i, InputStream inputStream, InetAddress inetAddress) throws IOException {
        sendFile(str, i, inputStream, inetAddress, 69);
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x01c2, code lost:
        endBufferedOps();
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x01c6, code lost:
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void sendFile(String str, int i, InputStream inputStream, InetAddress inetAddress, int i2) throws IOException {
        int i3;
        boolean z;
        int i4;
        TFTPWriteRequestPacket tFTPWriteRequestPacket;
        boolean z2;
        InetAddress inetAddress2;
        TFTPPacket bufferedReceive;
        int i5;
        int read;
        TFTPDataPacket tFTPDataPacket = new TFTPDataPacket(inetAddress, i2, 0, this._sendBuffer, 4, 0);
        boolean z3 = true;
        beginBufferedOps();
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        ToNetASCIIInputStream toNetASCIIInputStream = inputStream;
        if (i == 0) {
            toNetASCIIInputStream = new ToNetASCIIInputStream(inputStream);
        }
        TFTPWriteRequestPacket tFTPWriteRequestPacket2 = new TFTPWriteRequestPacket(inetAddress, i2, str, i);
        InetAddress inetAddress3 = inetAddress;
        TFTPWriteRequestPacket tFTPWriteRequestPacket3 = tFTPWriteRequestPacket2;
        boolean z4 = false;
        while (true) {
            bufferedSend(tFTPWriteRequestPacket3);
            int i9 = i7;
            while (true) {
                try {
                    bufferedReceive = bufferedReceive();
                    z2 = z3;
                    inetAddress2 = inetAddress3;
                    if (z3) {
                        int port = bufferedReceive.getPort();
                        tFTPDataPacket.setPort(port);
                        i9 = port;
                        z2 = false;
                        inetAddress2 = inetAddress3;
                        if (!inetAddress3.equals(bufferedReceive.getAddress())) {
                            inetAddress2 = bufferedReceive.getAddress();
                            tFTPDataPacket.setAddress(inetAddress2);
                            tFTPWriteRequestPacket3.setAddress(inetAddress2);
                            z2 = false;
                            i9 = port;
                        }
                    }
                    if (inetAddress2.equals(bufferedReceive.getAddress()) && bufferedReceive.getPort() == i9) {
                        switch (bufferedReceive.getType()) {
                            case 4:
                                if (((TFTPAckPacket) bufferedReceive).getBlockNumber() == i8) {
                                    int i10 = i8 + 1;
                                    int i11 = i10;
                                    if (i10 > 65535) {
                                        i11 = 0;
                                    }
                                    if (!z4) {
                                        int i12 = 512;
                                        int i13 = 4;
                                        int i14 = 0;
                                        while (true) {
                                            i5 = i14;
                                            if (i12 > 0 && (read = toNetASCIIInputStream.read(this._sendBuffer, i13, i12)) > 0) {
                                                i13 += read;
                                                i12 -= read;
                                                i14 = i5 + read;
                                            }
                                        }
                                        if (i5 < 512) {
                                            z4 = true;
                                        }
                                        tFTPDataPacket.setBlockNumber(i11);
                                        tFTPDataPacket.setData(this._sendBuffer, 4, i5);
                                        tFTPWriteRequestPacket = tFTPDataPacket;
                                        i4 = i11;
                                        z = z4;
                                        i3 = i5;
                                        break;
                                    } else {
                                        break;
                                    }
                                } else {
                                    discardPackets();
                                    z3 = z2;
                                    inetAddress3 = inetAddress2;
                                }
                                break;
                            case 5:
                                TFTPErrorPacket tFTPErrorPacket = (TFTPErrorPacket) bufferedReceive;
                                endBufferedOps();
                                throw new IOException("Error code " + tFTPErrorPacket.getError() + " received: " + tFTPErrorPacket.getMessage());
                            default:
                                endBufferedOps();
                                throw new IOException("Received unexpected packet type.");
                        }
                    }
                } catch (InterruptedIOException e) {
                    i4 = i8;
                    z2 = z3;
                    z = z4;
                    tFTPWriteRequestPacket = tFTPWriteRequestPacket3;
                    i3 = i6;
                    inetAddress2 = inetAddress3;
                    if (0 + 1 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (SocketException e2) {
                    i4 = i8;
                    z2 = z3;
                    z = z4;
                    tFTPWriteRequestPacket = tFTPWriteRequestPacket3;
                    i3 = i6;
                    inetAddress2 = inetAddress3;
                    if (0 + 1 >= this.__maxTimeouts) {
                        endBufferedOps();
                        throw new IOException("Connection timed out.");
                    }
                } catch (TFTPPacketException e3) {
                    endBufferedOps();
                    throw new IOException("Bad packet: " + e3.getMessage());
                }
            }
            bufferedSend(new TFTPErrorPacket(bufferedReceive.getAddress(), bufferedReceive.getPort(), 5, "Unexpected host or port."));
            i3 = i6;
            tFTPWriteRequestPacket = tFTPWriteRequestPacket3;
            z = z4;
            i4 = i8;
            i8 = i4;
            i7 = i9;
            z3 = z2;
            z4 = z;
            tFTPWriteRequestPacket3 = tFTPWriteRequestPacket;
            i6 = i3;
            inetAddress3 = inetAddress2;
            if (i3 <= 0) {
                i8 = i4;
                i7 = i9;
                z3 = z2;
                z4 = z;
                tFTPWriteRequestPacket3 = tFTPWriteRequestPacket;
                i6 = i3;
                inetAddress3 = inetAddress2;
                if (!z) {
                }
            }
        }
    }

    public void setMaxTimeouts(int i) {
        if (i < 1) {
            this.__maxTimeouts = 1;
        } else {
            this.__maxTimeouts = i;
        }
    }
}
