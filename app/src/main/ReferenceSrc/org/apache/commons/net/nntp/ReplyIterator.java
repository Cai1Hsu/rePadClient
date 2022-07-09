package org.apache.commons.net.nntp;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import org.apache.commons.net.io.DotTerminatedMessageReader;
import org.apache.commons.net.io.Util;

/* loaded from: classes.jar:org/apache/commons/net/nntp/ReplyIterator.class */
class ReplyIterator implements Iterator<String>, Iterable<String> {
    private String line;
    private final BufferedReader reader;
    private Exception savedException;

    ReplyIterator(BufferedReader bufferedReader) throws IOException {
        this(bufferedReader, true);
    }

    ReplyIterator(BufferedReader bufferedReader, boolean z) throws IOException {
        this.reader = z ? new DotTerminatedMessageReader(bufferedReader) : bufferedReader;
        this.line = this.reader.readLine();
        if (this.line == null) {
            Util.closeQuietly(this.reader);
        }
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        if (this.savedException != null) {
            throw new NoSuchElementException(this.savedException.toString());
        }
        return this.line != null;
    }

    @Override // java.lang.Iterable
    public Iterator<String> iterator() {
        return this;
    }

    @Override // java.util.Iterator
    public String next() throws NoSuchElementException {
        if (this.savedException != null) {
            throw new NoSuchElementException(this.savedException.toString());
        }
        String str = this.line;
        if (str == null) {
            throw new NoSuchElementException();
        }
        try {
            this.line = this.reader.readLine();
            if (this.line == null) {
                Util.closeQuietly(this.reader);
            }
        } catch (IOException e) {
            this.savedException = e;
            Util.closeQuietly(this.reader);
        }
        return str;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }
}
