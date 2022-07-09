package org.jivesoftware.smack.util;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:org/jivesoftware/smack/util/ObservableWriter.class */
public class ObservableWriter extends Writer {
    List<WriterListener> listeners = new ArrayList();
    Writer wrappedWriter;

    public ObservableWriter(Writer writer) {
        this.wrappedWriter = null;
        this.wrappedWriter = writer;
    }

    private void notifyListeners(String str) {
        WriterListener[] writerListenerArr;
        synchronized (this.listeners) {
            writerListenerArr = new WriterListener[this.listeners.size()];
            this.listeners.toArray(writerListenerArr);
        }
        for (WriterListener writerListener : writerListenerArr) {
            writerListener.write(str);
        }
    }

    public void addWriterListener(WriterListener writerListener) {
        if (writerListener == null) {
            return;
        }
        synchronized (this.listeners) {
            if (!this.listeners.contains(writerListener)) {
                this.listeners.add(writerListener);
            }
        }
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrappedWriter.close();
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.wrappedWriter.flush();
    }

    public void removeWriterListener(WriterListener writerListener) {
        synchronized (this.listeners) {
            this.listeners.remove(writerListener);
        }
    }

    @Override // java.io.Writer
    public void write(int i) throws IOException {
        this.wrappedWriter.write(i);
    }

    @Override // java.io.Writer
    public void write(String str) throws IOException {
        this.wrappedWriter.write(str);
        notifyListeners(str);
    }

    @Override // java.io.Writer
    public void write(String str, int i, int i2) throws IOException {
        this.wrappedWriter.write(str, i, i2);
        notifyListeners(str.substring(i, i + i2));
    }

    @Override // java.io.Writer
    public void write(char[] cArr) throws IOException {
        this.wrappedWriter.write(cArr);
        notifyListeners(new String(cArr));
    }

    @Override // java.io.Writer
    public void write(char[] cArr, int i, int i2) throws IOException {
        this.wrappedWriter.write(cArr, i, i2);
        notifyListeners(new String(cArr, i, i2));
    }
}
