package org.apache.commons.net.ftp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

/* loaded from: classes.jar:org/apache/commons/net/ftp/FTPListParseEngine.class */
public class FTPListParseEngine {
    private final FTPFileEntryParser parser;
    private List<String> entries = new LinkedList();
    private ListIterator<String> _internalIterator = this.entries.listIterator();

    public FTPListParseEngine(FTPFileEntryParser fTPFileEntryParser) {
        this.parser = fTPFileEntryParser;
    }

    private void readStream(InputStream inputStream, String str) throws IOException {
        BufferedReader bufferedReader = str == null ? new BufferedReader(new InputStreamReader(inputStream)) : new BufferedReader(new InputStreamReader(inputStream, str));
        String readNextEntry = this.parser.readNextEntry(bufferedReader);
        while (true) {
            String str2 = readNextEntry;
            if (str2 == null) {
                bufferedReader.close();
                return;
            } else {
                this.entries.add(str2);
                readNextEntry = this.parser.readNextEntry(bufferedReader);
            }
        }
    }

    public FTPFile[] getFiles() throws IOException {
        return getFiles(FTPFileFilters.NON_NULL);
    }

    public FTPFile[] getFiles(FTPFileFilter fTPFileFilter) throws IOException {
        ArrayList arrayList = new ArrayList();
        for (String str : this.entries) {
            FTPFile parseFTPEntry = this.parser.parseFTPEntry(str);
            if (fTPFileFilter.accept(parseFTPEntry)) {
                arrayList.add(parseFTPEntry);
            }
        }
        return (FTPFile[]) arrayList.toArray(new FTPFile[arrayList.size()]);
    }

    public FTPFile[] getNext(int i) {
        LinkedList linkedList = new LinkedList();
        while (i > 0 && this._internalIterator.hasNext()) {
            linkedList.add(this.parser.parseFTPEntry(this._internalIterator.next()));
            i--;
        }
        return (FTPFile[]) linkedList.toArray(new FTPFile[linkedList.size()]);
    }

    public FTPFile[] getPrevious(int i) {
        LinkedList linkedList = new LinkedList();
        while (i > 0 && this._internalIterator.hasPrevious()) {
            linkedList.add(0, this.parser.parseFTPEntry(this._internalIterator.previous()));
            i--;
        }
        return (FTPFile[]) linkedList.toArray(new FTPFile[linkedList.size()]);
    }

    public boolean hasNext() {
        return this._internalIterator.hasNext();
    }

    public boolean hasPrevious() {
        return this._internalIterator.hasPrevious();
    }

    @Deprecated
    public void readServerList(InputStream inputStream) throws IOException {
        readServerList(inputStream, null);
    }

    public void readServerList(InputStream inputStream, String str) throws IOException {
        this.entries = new LinkedList();
        readStream(inputStream, str);
        this.parser.preParse(this.entries);
        resetIterator();
    }

    public void resetIterator() {
        this._internalIterator = this.entries.listIterator();
    }
}
