package org.apache.commons.io.input;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

/* loaded from: classes.jar:org/apache/commons/io/input/Tailer.class */
public class Tailer implements Runnable {
    private static final int DEFAULT_BUFSIZE = 4096;
    private static final int DEFAULT_DELAY_MILLIS = 1000;
    private static final String RAF_MODE = "r";
    private final long delayMillis;
    private final boolean end;
    private final File file;
    private final byte[] inbuf;
    private final TailerListener listener;
    private final boolean reOpen;
    private volatile boolean run;

    public Tailer(File file, TailerListener tailerListener) {
        this(file, tailerListener, 1000L);
    }

    public Tailer(File file, TailerListener tailerListener, long j) {
        this(file, tailerListener, j, false);
    }

    public Tailer(File file, TailerListener tailerListener, long j, boolean z) {
        this(file, tailerListener, j, z, 4096);
    }

    public Tailer(File file, TailerListener tailerListener, long j, boolean z, int i) {
        this(file, tailerListener, j, z, false, i);
    }

    public Tailer(File file, TailerListener tailerListener, long j, boolean z, boolean z2) {
        this(file, tailerListener, j, z, z2, 4096);
    }

    public Tailer(File file, TailerListener tailerListener, long j, boolean z, boolean z2, int i) {
        this.run = true;
        this.file = file;
        this.delayMillis = j;
        this.end = z;
        this.inbuf = new byte[i];
        this.listener = tailerListener;
        tailerListener.init(this);
        this.reOpen = z2;
    }

    public static Tailer create(File file, TailerListener tailerListener) {
        return create(file, tailerListener, 1000L, false);
    }

    public static Tailer create(File file, TailerListener tailerListener, long j) {
        return create(file, tailerListener, j, false);
    }

    public static Tailer create(File file, TailerListener tailerListener, long j, boolean z) {
        return create(file, tailerListener, j, z, 4096);
    }

    public static Tailer create(File file, TailerListener tailerListener, long j, boolean z, int i) {
        Tailer tailer = new Tailer(file, tailerListener, j, z, i);
        Thread thread = new Thread(tailer);
        thread.setDaemon(true);
        thread.start();
        return tailer;
    }

    public static Tailer create(File file, TailerListener tailerListener, long j, boolean z, boolean z2) {
        return create(file, tailerListener, j, z, z2, 4096);
    }

    public static Tailer create(File file, TailerListener tailerListener, long j, boolean z, boolean z2, int i) {
        Tailer tailer = new Tailer(file, tailerListener, j, z, z2, i);
        Thread thread = new Thread(tailer);
        thread.setDaemon(true);
        thread.start();
        return tailer;
    }

    private long readLines(RandomAccessFile randomAccessFile) throws IOException {
        int read;
        StringBuilder sb = new StringBuilder();
        long filePointer = randomAccessFile.getFilePointer();
        long j = filePointer;
        boolean z = false;
        while (this.run && (read = randomAccessFile.read(this.inbuf)) != -1) {
            for (int i = 0; i < read; i++) {
                byte b = this.inbuf[i];
                switch (b) {
                    case 10:
                        z = false;
                        this.listener.handle(sb.toString());
                        sb.setLength(0);
                        j = i + filePointer + 1;
                        break;
                    case 11:
                    case 12:
                    default:
                        boolean z2 = z;
                        if (z) {
                            z2 = false;
                            this.listener.handle(sb.toString());
                            sb.setLength(0);
                            j = i + filePointer + 1;
                        }
                        sb.append((char) b);
                        z = z2;
                        break;
                    case 13:
                        if (z) {
                            sb.append('\r');
                        }
                        z = true;
                        break;
                }
            }
            filePointer = randomAccessFile.getFilePointer();
        }
        randomAccessFile.seek(j);
        return j;
    }

    public long getDelay() {
        return this.delayMillis;
    }

    public File getFile() {
        return this.file;
    }

    @Override // java.lang.Runnable
    public void run() {
        RandomAccessFile randomAccessFile;
        RandomAccessFile randomAccessFile2;
        RandomAccessFile randomAccessFile3;
        Exception e;
        long j;
        long j2;
        RandomAccessFile randomAccessFile4;
        long j3;
        RandomAccessFile randomAccessFile5;
        long j4 = 0;
        long j5 = 0;
        RandomAccessFile randomAccessFile6 = null;
        while (true) {
            RandomAccessFile randomAccessFile7 = randomAccessFile6;
            randomAccessFile = randomAccessFile7;
            randomAccessFile2 = randomAccessFile7;
            try {
                j = j4;
                j2 = j5;
                randomAccessFile4 = randomAccessFile7;
                if (!this.run) {
                    break;
                }
                j = j4;
                j2 = j5;
                randomAccessFile4 = randomAccessFile7;
                if (randomAccessFile7 != null) {
                    break;
                }
                randomAccessFile = randomAccessFile7;
                randomAccessFile2 = randomAccessFile7;
                try {
                    randomAccessFile5 = new RandomAccessFile(this.file, RAF_MODE);
                } catch (FileNotFoundException e2) {
                    this.listener.fileNotFound();
                    randomAccessFile5 = randomAccessFile7;
                }
                if (randomAccessFile5 == null) {
                    randomAccessFile3 = randomAccessFile5;
                    randomAccessFile = randomAccessFile5;
                    try {
                        try {
                            try {
                                Thread.sleep(this.delayMillis);
                                randomAccessFile6 = randomAccessFile5;
                            } catch (Exception e3) {
                                e = e3;
                                randomAccessFile3 = randomAccessFile;
                                this.listener.handle(e);
                                IOUtils.closeQuietly(randomAccessFile);
                                return;
                            }
                        } catch (Throwable th) {
                            th = th;
                            IOUtils.closeQuietly(randomAccessFile3);
                            throw th;
                        }
                    } catch (InterruptedException e4) {
                        randomAccessFile6 = randomAccessFile5;
                    }
                } else {
                    if (this.end) {
                        RandomAccessFile randomAccessFile8 = randomAccessFile5;
                        j5 = this.file.length();
                    } else {
                        j5 = 0;
                    }
                    RandomAccessFile randomAccessFile9 = randomAccessFile5;
                    j4 = System.currentTimeMillis();
                    RandomAccessFile randomAccessFile10 = randomAccessFile5;
                    randomAccessFile5.seek(j5);
                    randomAccessFile6 = randomAccessFile5;
                }
            } catch (Exception e5) {
                e = e5;
                randomAccessFile3 = randomAccessFile;
                this.listener.handle(e);
                IOUtils.closeQuietly(randomAccessFile);
                return;
            } catch (Throwable th2) {
                th = th2;
                randomAccessFile3 = randomAccessFile2;
                IOUtils.closeQuietly(randomAccessFile3);
                throw th;
            }
        }
        while (true) {
            randomAccessFile = randomAccessFile4;
            randomAccessFile2 = randomAccessFile4;
            if (!this.run) {
                IOUtils.closeQuietly(randomAccessFile4);
                return;
            }
            RandomAccessFile randomAccessFile11 = randomAccessFile4;
            boolean isFileNewer = FileUtils.isFileNewer(this.file, j);
            RandomAccessFile randomAccessFile12 = randomAccessFile4;
            long length = this.file.length();
            if (length < j2) {
                this.listener.fileRotated();
                RandomAccessFile randomAccessFile13 = randomAccessFile4;
                try {
                    RandomAccessFile randomAccessFile14 = randomAccessFile4;
                    RandomAccessFile randomAccessFile15 = new RandomAccessFile(this.file, RAF_MODE);
                    j2 = 0;
                    randomAccessFile = randomAccessFile15;
                    try {
                        IOUtils.closeQuietly(randomAccessFile4);
                        randomAccessFile4 = randomAccessFile15;
                    } catch (FileNotFoundException e6) {
                        randomAccessFile4 = randomAccessFile15;
                        this.listener.fileNotFound();
                    }
                } catch (FileNotFoundException e7) {
                }
            } else {
                if (length > j2) {
                    j2 = readLines(randomAccessFile4);
                    RandomAccessFile randomAccessFile16 = randomAccessFile4;
                    j3 = System.currentTimeMillis();
                } else {
                    j3 = j;
                    if (isFileNewer) {
                        randomAccessFile4.seek(0L);
                        RandomAccessFile randomAccessFile17 = randomAccessFile4;
                        j2 = readLines(randomAccessFile4);
                        RandomAccessFile randomAccessFile18 = randomAccessFile4;
                        j3 = System.currentTimeMillis();
                    }
                }
                RandomAccessFile randomAccessFile19 = randomAccessFile4;
                if (this.reOpen) {
                    RandomAccessFile randomAccessFile20 = randomAccessFile4;
                    IOUtils.closeQuietly(randomAccessFile4);
                }
                RandomAccessFile randomAccessFile21 = randomAccessFile4;
                try {
                    Thread.sleep(this.delayMillis);
                } catch (InterruptedException e8) {
                }
                RandomAccessFile randomAccessFile22 = randomAccessFile4;
                if (this.run) {
                    RandomAccessFile randomAccessFile23 = randomAccessFile4;
                    if (this.reOpen) {
                        RandomAccessFile randomAccessFile24 = randomAccessFile4;
                        randomAccessFile4 = new RandomAccessFile(this.file, RAF_MODE);
                        randomAccessFile4.seek(j2);
                    }
                }
                j = j3;
            }
        }
    }

    public void stop() {
        this.run = false;
    }
}
