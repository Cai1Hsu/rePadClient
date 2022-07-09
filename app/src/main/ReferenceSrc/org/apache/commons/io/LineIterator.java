package org.apache.commons.io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes.jar:org/apache/commons/io/LineIterator.class */
public class LineIterator implements Iterator<String> {
    private final BufferedReader bufferedReader;
    private String cachedLine;
    private boolean finished = false;

    public LineIterator(Reader reader) throws IllegalArgumentException {
        if (reader == null) {
            throw new IllegalArgumentException("Reader must not be null");
        }
        if (reader instanceof BufferedReader) {
            this.bufferedReader = (BufferedReader) reader;
        } else {
            this.bufferedReader = new BufferedReader(reader);
        }
    }

    public static void closeQuietly(LineIterator lineIterator) {
        if (lineIterator != null) {
            lineIterator.close();
        }
    }

    public void close() {
        this.finished = true;
        IOUtils.closeQuietly((Reader) this.bufferedReader);
        this.cachedLine = null;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        boolean z = true;
        if (this.cachedLine == null) {
            if (this.finished) {
                z = false;
            } else {
                while (true) {
                    try {
                        String readLine = this.bufferedReader.readLine();
                        if (readLine != null) {
                            if (isValidLine(readLine)) {
                                this.cachedLine = readLine;
                                break;
                            }
                        } else {
                            this.finished = true;
                            z = false;
                            break;
                        }
                    } catch (IOException e) {
                        close();
                        throw new IllegalStateException(e);
                    }
                }
            }
        }
        return z;
    }

    protected boolean isValidLine(String str) {
        return true;
    }

    @Override // java.util.Iterator
    public String next() {
        return nextLine();
    }

    public String nextLine() {
        if (!hasNext()) {
            throw new NoSuchElementException("No more lines");
        }
        String str = this.cachedLine;
        this.cachedLine = null;
        return str;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Remove unsupported on LineIterator");
    }
}
