package org.apache.commons.net.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;

/* loaded from: classes.jar:org/apache/commons/net/io/DotTerminatedMessageReader.class */
public final class DotTerminatedMessageReader extends BufferedReader {
    private static final char CR = '\r';
    private static final int DOT = 46;
    private static final char LF = '\n';
    private boolean atBeginning = true;
    private boolean eof = false;
    private boolean seenCR;

    public DotTerminatedMessageReader(Reader reader) {
        super(reader);
    }

    @Override // java.io.BufferedReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this.lock) {
            if (!this.eof) {
                do {
                } while (read() != -1);
                this.eof = true;
                this.atBeginning = false;
            } else {
                this.eof = true;
                this.atBeginning = false;
            }
        }
    }

    @Override // java.io.BufferedReader, java.io.Reader
    public int read() throws IOException {
        int read;
        synchronized (this.lock) {
            if (this.eof) {
                read = -1;
            } else {
                read = super.read();
                if (read == -1) {
                    this.eof = true;
                    read = -1;
                } else {
                    if (this.atBeginning) {
                        this.atBeginning = false;
                        if (read == 46) {
                            mark(2);
                            read = super.read();
                            if (read == -1) {
                                this.eof = true;
                                read = 46;
                            } else if (read != 46) {
                                if (read == 13) {
                                    int read2 = super.read();
                                    if (read2 == -1) {
                                        reset();
                                        read = 46;
                                    } else if (read2 == 10) {
                                        this.atBeginning = true;
                                        this.eof = true;
                                        read = -1;
                                    }
                                }
                                reset();
                                read = 46;
                            }
                        }
                    }
                    if (this.seenCR) {
                        this.seenCR = false;
                        if (read == 10) {
                            this.atBeginning = true;
                        }
                    }
                    if (read == 13) {
                        this.seenCR = true;
                    }
                }
            }
        }
        return read;
    }

    @Override // java.io.Reader
    public int read(char[] cArr) throws IOException {
        return read(cArr, 0, cArr.length);
    }

    @Override // java.io.BufferedReader, java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        int i3;
        int i4;
        synchronized (this.lock) {
            if (i2 < 1) {
                i4 = 0;
            } else {
                int read = read();
                if (read == -1) {
                    i4 = -1;
                } else {
                    int i5 = i2;
                    int i6 = i;
                    int i7 = read;
                    while (true) {
                        i3 = i6 + 1;
                        cArr[i6] = (char) i7;
                        i5--;
                        if (i5 <= 0) {
                            break;
                        }
                        i7 = read();
                        if (i7 == -1) {
                            break;
                        }
                        i6 = i3;
                    }
                    i4 = i3 - i;
                }
            }
        }
        return i4;
    }

    @Override // java.io.BufferedReader
    public String readLine() throws IOException {
        String str;
        StringBuilder sb = new StringBuilder();
        synchronized (this.lock) {
            while (true) {
                int read = read();
                if (read == -1) {
                    String sb2 = sb.toString();
                    str = sb2;
                    if (sb2.length() == 0) {
                        str = null;
                    }
                } else if (read == 10 && this.atBeginning) {
                    str = sb.substring(0, sb.length() - 1);
                    break;
                } else {
                    sb.append((char) read);
                }
            }
        }
        return str;
    }
}
