package org.jivesoftware.smack.util;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smack/util/ObservableReader.class */
public class ObservableReader extends Reader {
    List<ReaderListener> listeners = new ArrayList();
    Reader wrappedReader;

    public ObservableReader(Reader reader) {
        this.wrappedReader = null;
        this.wrappedReader = reader;
    }

    public void addReaderListener(ReaderListener readerListener) {
        if (readerListener == null) {
            return;
        }
        synchronized (this.listeners) {
            if (!this.listeners.contains(readerListener)) {
                this.listeners.add(readerListener);
            }
        }
    }

    @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrappedReader.close();
    }

    @Override // java.io.Reader
    public void mark(int i) throws IOException {
        this.wrappedReader.mark(i);
    }

    @Override // java.io.Reader
    public boolean markSupported() {
        return this.wrappedReader.markSupported();
    }

    @Override // java.io.Reader
    public int read() throws IOException {
        return this.wrappedReader.read();
    }

    @Override // java.io.Reader
    public int read(char[] cArr) throws IOException {
        return this.wrappedReader.read(cArr);
    }

    @Override // java.io.Reader
    public int read(char[] cArr, int i, int i2) throws IOException {
        ReaderListener[] readerListenerArr;
        int read = this.wrappedReader.read(cArr, i, i2);
        if (read > 0) {
            String str = new String(cArr, i, read);
            synchronized (this.listeners) {
                readerListenerArr = new ReaderListener[this.listeners.size()];
                this.listeners.toArray(readerListenerArr);
            }
            for (ReaderListener readerListener : readerListenerArr) {
                readerListener.read(str);
            }
        }
        return read;
    }

    @Override // java.io.Reader
    public boolean ready() throws IOException {
        return this.wrappedReader.ready();
    }

    public void removeReaderListener(ReaderListener readerListener) {
        synchronized (this.listeners) {
            this.listeners.remove(readerListener);
        }
    }

    @Override // java.io.Reader
    public void reset() throws IOException {
        this.wrappedReader.reset();
    }

    @Override // java.io.Reader
    public long skip(long j) throws IOException {
        return this.wrappedReader.skip(j);
    }
}
