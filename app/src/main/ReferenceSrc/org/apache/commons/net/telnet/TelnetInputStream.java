package org.apache.commons.net.telnet;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;

/* loaded from: classes.jar:org/apache/commons/net/telnet/TelnetInputStream.class */
final class TelnetInputStream extends BufferedInputStream implements Runnable {
    private static final int EOF = -1;
    private static final int WOULD_BLOCK = -2;
    static final int _STATE_CR = 8;
    static final int _STATE_DATA = 0;
    static final int _STATE_DO = 4;
    static final int _STATE_DONT = 5;
    static final int _STATE_IAC = 1;
    static final int _STATE_IAC_SB = 9;
    static final int _STATE_SB = 6;
    static final int _STATE_SE = 7;
    static final int _STATE_WILL = 2;
    static final int _STATE_WONT = 3;
    private int __bytesAvailable;
    private final TelnetClient __client;
    private boolean __hasReachedEOF;
    private IOException __ioException;
    private volatile boolean __isClosed;
    private final int[] __queue;
    private int __queueHead;
    private int __queueTail;
    private boolean __readIsWaiting;
    private int __receiveState;
    private final int[] __suboption;
    private int __suboption_count;
    private final Thread __thread;
    private volatile boolean __threaded;

    TelnetInputStream(InputStream inputStream, TelnetClient telnetClient) {
        this(inputStream, telnetClient, true);
    }

    TelnetInputStream(InputStream inputStream, TelnetClient telnetClient, boolean z) {
        super(inputStream);
        this.__suboption = new int[512];
        this.__suboption_count = 0;
        this.__client = telnetClient;
        this.__receiveState = 0;
        this.__isClosed = true;
        this.__hasReachedEOF = false;
        this.__queue = new int[2049];
        this.__queueHead = 0;
        this.__queueTail = 0;
        this.__bytesAvailable = 0;
        this.__ioException = null;
        this.__readIsWaiting = false;
        this.__threaded = false;
        if (z) {
            this.__thread = new Thread(this);
        } else {
            this.__thread = null;
        }
    }

    private boolean __processChar(int i) throws InterruptedException {
        boolean z = false;
        synchronized (this.__queue) {
            if (this.__bytesAvailable == 0) {
                z = true;
            }
            while (this.__bytesAvailable >= this.__queue.length - 1) {
                if (!this.__threaded) {
                    throw new IllegalStateException("Queue is full! Cannot process another character.");
                }
                this.__queue.notify();
                try {
                    this.__queue.wait();
                } catch (InterruptedException e) {
                    throw e;
                }
            }
            if (this.__readIsWaiting && this.__threaded) {
                this.__queue.notify();
            }
            this.__queue[this.__queueTail] = i;
            this.__bytesAvailable++;
            int i2 = this.__queueTail + 1;
            this.__queueTail = i2;
            if (i2 >= this.__queue.length) {
                this.__queueTail = 0;
            }
        }
        return z;
    }

    private int __read(boolean z) throws IOException {
        int i;
        while (true) {
            if (z || super.available() != 0) {
                int read = super.read();
                if (read < 0) {
                    i = -1;
                } else {
                    i = read & 255;
                    synchronized (this.__client) {
                        this.__client._processAYTResponse();
                    }
                    this.__client._spyRead(i);
                    switch (this.__receiveState) {
                        case 1:
                            switch (i) {
                                case 240:
                                    this.__receiveState = 0;
                                    continue;
                                case TelnetCommand.NOP /* 241 */:
                                case 242:
                                case TelnetCommand.BREAK /* 243 */:
                                case TelnetCommand.IP /* 244 */:
                                case TelnetCommand.AO /* 245 */:
                                case TelnetCommand.AYT /* 246 */:
                                case TelnetCommand.EC /* 247 */:
                                case TelnetCommand.EL /* 248 */:
                                case TelnetCommand.GA /* 249 */:
                                default:
                                    this.__receiveState = 0;
                                    this.__client._processCommand(i);
                                    continue;
                                    continue;
                                case 250:
                                    this.__suboption_count = 0;
                                    this.__receiveState = 6;
                                    continue;
                                case 251:
                                    this.__receiveState = 2;
                                    continue;
                                case TelnetCommand.WONT /* 252 */:
                                    this.__receiveState = 3;
                                    continue;
                                case TelnetCommand.DO /* 253 */:
                                    this.__receiveState = 4;
                                    continue;
                                case TelnetCommand.DONT /* 254 */:
                                    this.__receiveState = 5;
                                    continue;
                                case 255:
                                    this.__receiveState = 0;
                                    break;
                            }
                        case 2:
                            synchronized (this.__client) {
                                this.__client._processWill(i);
                                this.__client._flushOutputStream();
                            }
                            this.__receiveState = 0;
                            continue;
                        case 3:
                            synchronized (this.__client) {
                                this.__client._processWont(i);
                                this.__client._flushOutputStream();
                            }
                            this.__receiveState = 0;
                            continue;
                        case 4:
                            synchronized (this.__client) {
                                this.__client._processDo(i);
                                this.__client._flushOutputStream();
                            }
                            this.__receiveState = 0;
                            continue;
                        case 5:
                            synchronized (this.__client) {
                                this.__client._processDont(i);
                                this.__client._flushOutputStream();
                            }
                            this.__receiveState = 0;
                            continue;
                        case 6:
                            switch (i) {
                                case 255:
                                    this.__receiveState = 9;
                                    continue;
                                default:
                                    if (this.__suboption_count < this.__suboption.length) {
                                        int[] iArr = this.__suboption;
                                        int i2 = this.__suboption_count;
                                        this.__suboption_count = i2 + 1;
                                        iArr[i2] = i;
                                    }
                                    this.__receiveState = 6;
                                    continue;
                                    continue;
                            }
                        case 8:
                            if (i != 0) {
                                break;
                            } else {
                                continue;
                            }
                        case 9:
                            switch (i) {
                                case 240:
                                    synchronized (this.__client) {
                                        this.__client._processSuboption(this.__suboption, this.__suboption_count);
                                        this.__client._flushOutputStream();
                                    }
                                    this.__receiveState = 0;
                                    break;
                                case 255:
                                    if (this.__suboption_count < this.__suboption.length) {
                                        int[] iArr2 = this.__suboption;
                                        int i3 = this.__suboption_count;
                                        this.__suboption_count = i3 + 1;
                                        iArr2[i3] = i;
                                    }
                                    this.__receiveState = 6;
                                    continue;
                                default:
                                    this.__receiveState = 6;
                                    continue;
                            }
                    }
                    if (i == 255) {
                        this.__receiveState = 1;
                    } else if (i == 13) {
                        synchronized (this.__client) {
                            if (this.__client._requestedDont(0)) {
                                this.__receiveState = 8;
                            } else {
                                this.__receiveState = 0;
                            }
                        }
                    } else {
                        this.__receiveState = 0;
                    }
                }
            } else {
                i = -2;
            }
        }
        return i;
    }

    void _start() {
        if (this.__thread == null) {
            return;
        }
        this.__isClosed = false;
        int priority = Thread.currentThread().getPriority() + 1;
        int i = priority;
        if (priority > 10) {
            i = 10;
        }
        this.__thread.setPriority(i);
        this.__thread.setDaemon(true);
        this.__thread.start();
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        int i;
        int available;
        synchronized (this.__queue) {
            i = this.__bytesAvailable;
            available = super.available();
        }
        return i + available;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        super.close();
        synchronized (this.__queue) {
            this.__hasReachedEOF = true;
            this.__isClosed = true;
            if (this.__thread != null && this.__thread.isAlive()) {
                this.__thread.interrupt();
            }
            this.__queue.notifyAll();
        }
        this.__threaded = false;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i;
        synchronized (this.__queue) {
            while (this.__ioException == null) {
                if (this.__bytesAvailable != 0) {
                    i = this.__queue[this.__queueHead];
                    int i2 = this.__queueHead + 1;
                    this.__queueHead = i2;
                    if (i2 >= this.__queue.length) {
                        this.__queueHead = 0;
                    }
                    this.__bytesAvailable--;
                    if (this.__bytesAvailable == 0 && this.__threaded) {
                        this.__queue.notify();
                    }
                } else if (this.__hasReachedEOF) {
                    i = -1;
                } else if (this.__threaded) {
                    this.__queue.notify();
                    try {
                        this.__readIsWaiting = true;
                        this.__queue.wait();
                        this.__readIsWaiting = false;
                    } catch (InterruptedException e) {
                        throw new InterruptedIOException("Fatal thread interruption during read.");
                    }
                } else {
                    this.__readIsWaiting = true;
                    boolean z = true;
                    do {
                        try {
                            i = __read(z);
                            if (i >= 0 || i == -2) {
                                if (i != -2) {
                                    try {
                                        __processChar(i);
                                    } catch (InterruptedException e2) {
                                        if (this.__isClosed) {
                                            i = -1;
                                        }
                                    }
                                }
                                z = false;
                                if (super.available() <= 0) {
                                    break;
                                }
                            }
                        } catch (InterruptedIOException e3) {
                            synchronized (this.__queue) {
                                this.__ioException = e3;
                                this.__queue.notifyAll();
                                try {
                                    this.__queue.wait(100L);
                                } catch (InterruptedException e4) {
                                }
                                i = -1;
                            }
                        }
                    } while (this.__bytesAvailable < this.__queue.length - 1);
                    this.__readIsWaiting = false;
                }
            }
            IOException iOException = this.__ioException;
            this.__ioException = null;
            throw iOException;
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.BufferedInputStream, java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3;
        int i4;
        if (i2 < 1) {
            i4 = 0;
        } else {
            synchronized (this.__queue) {
                i3 = i2;
                if (i2 > this.__bytesAvailable) {
                    i3 = this.__bytesAvailable;
                }
            }
            int read = read();
            i4 = -1;
            if (read != -1) {
                int i5 = i3;
                int i6 = i;
                int i7 = read;
                do {
                    int i8 = i6;
                    i6 = i8 + 1;
                    bArr[i8] = (byte) i7;
                    i5--;
                    if (i5 <= 0) {
                        break;
                    }
                    i7 = read();
                } while (i7 != -1);
                i4 = i6 - i;
            }
        }
        return i4;
    }

    @Override // java.lang.Runnable
    public void run() {
        int __read;
        this.__threaded = true;
        while (!this.__isClosed) {
            try {
                try {
                    __read = __read(true);
                } catch (InterruptedIOException e) {
                    synchronized (this.__queue) {
                        this.__ioException = e;
                        this.__queue.notifyAll();
                        try {
                            this.__queue.wait(100L);
                        } catch (InterruptedException e2) {
                            if (this.__isClosed) {
                                break;
                            }
                        }
                    }
                } catch (RuntimeException e3) {
                    super.close();
                }
                if (__read < 0) {
                    break;
                }
                boolean z = false;
                try {
                    z = __processChar(__read);
                } catch (InterruptedException e4) {
                    if (this.__isClosed) {
                        break;
                    }
                }
                if (z) {
                    this.__client.notifyInputListener();
                }
            } catch (IOException e5) {
                synchronized (this.__queue) {
                    this.__ioException = e5;
                    this.__client.notifyInputListener();
                }
            }
        }
        synchronized (this.__queue) {
            this.__isClosed = true;
            this.__hasReachedEOF = true;
            this.__queue.notify();
        }
        this.__threaded = false;
    }
}
