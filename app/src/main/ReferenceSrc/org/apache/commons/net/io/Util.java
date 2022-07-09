package org.apache.commons.net.io;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.net.Socket;

/* loaded from: classes.jar:org/apache/commons/net/io/Util.class */
public final class Util {
    public static final int DEFAULT_COPY_BUFFER_SIZE = 1024;

    private Util() {
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(Socket socket) {
        if (socket != null) {
            try {
                socket.close();
            } catch (IOException e) {
            }
        }
    }

    public static final long copyReader(Reader reader, Writer writer) throws CopyStreamException {
        return copyReader(reader, writer, 1024);
    }

    public static final long copyReader(Reader reader, Writer writer, int i) throws CopyStreamException {
        return copyReader(reader, writer, i, -1L, null);
    }

    public static final long copyReader(Reader reader, Writer writer, int i, long j, CopyStreamListener copyStreamListener) throws CopyStreamException {
        char[] cArr = new char[i];
        long j2 = 0;
        while (true) {
            long j3 = j2;
            try {
                int read = reader.read(cArr);
                if (read == -1) {
                    break;
                } else if (read == 0) {
                    int read2 = reader.read();
                    if (read2 < 0) {
                        break;
                    }
                    writer.write(read2);
                    long j4 = j2;
                    writer.flush();
                    long j5 = j2 + 1;
                    j2 = j5;
                    if (copyStreamListener != null) {
                        copyStreamListener.bytesTransferred(j5, read2, j);
                        j2 = j5;
                    }
                } else {
                    writer.write(cArr, 0, read);
                    long j6 = j2;
                    writer.flush();
                    long j7 = j2 + read;
                    j2 = j7;
                    if (copyStreamListener != null) {
                        copyStreamListener.bytesTransferred(j7, read, j);
                        j2 = j7;
                    }
                }
            } catch (IOException e) {
                throw new CopyStreamException("IOException caught while copying.", j3, e);
            }
        }
        return j2;
    }

    public static final long copyStream(InputStream inputStream, OutputStream outputStream) throws CopyStreamException {
        return copyStream(inputStream, outputStream, 1024);
    }

    public static final long copyStream(InputStream inputStream, OutputStream outputStream, int i) throws CopyStreamException {
        return copyStream(inputStream, outputStream, i, -1L, null);
    }

    public static final long copyStream(InputStream inputStream, OutputStream outputStream, int i, long j, CopyStreamListener copyStreamListener) throws CopyStreamException {
        return copyStream(inputStream, outputStream, i, j, copyStreamListener, true);
    }

    public static final long copyStream(InputStream inputStream, OutputStream outputStream, int i, long j, CopyStreamListener copyStreamListener, boolean z) throws CopyStreamException {
        byte[] bArr = new byte[i];
        long j2 = 0;
        while (true) {
            long j3 = j2;
            try {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    break;
                } else if (read == 0) {
                    int read2 = inputStream.read();
                    if (read2 < 0) {
                        break;
                    }
                    outputStream.write(read2);
                    if (z) {
                        outputStream.flush();
                    }
                    long j4 = j2 + 1;
                    j2 = j4;
                    if (copyStreamListener != null) {
                        copyStreamListener.bytesTransferred(j4, 1, j);
                        j2 = j4;
                    }
                } else {
                    outputStream.write(bArr, 0, read);
                    if (z) {
                        outputStream.flush();
                    }
                    long j5 = j2 + read;
                    j2 = j5;
                    if (copyStreamListener != null) {
                        copyStreamListener.bytesTransferred(j5, read, j);
                        j2 = j5;
                    }
                }
            } catch (IOException e) {
                throw new CopyStreamException("IOException caught while copying.", j3, e);
            }
        }
        return j2;
    }
}
