package org.jivesoftware.smackx.filetransfer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smackx.filetransfer.FileTransfer;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/IncomingFileTransfer.class */
public class IncomingFileTransfer extends FileTransfer {
    private InputStream inputStream;
    private FileTransferRequest recieveRequest;

    protected IncomingFileTransfer(FileTransferRequest fileTransferRequest, FileTransferNegotiator fileTransferNegotiator) {
        super(fileTransferRequest.getRequestor(), fileTransferRequest.getStreamID(), fileTransferNegotiator);
        this.recieveRequest = fileTransferRequest;
    }

    public void handleXMPPException(XMPPException xMPPException) {
        setStatus(FileTransfer.Status.error);
        setException(xMPPException);
    }

    public InputStream negotiateStream() throws XMPPException {
        setStatus(FileTransfer.Status.negotiating_transfer);
        final StreamNegotiator selectStreamNegotiator = this.negotiator.selectStreamNegotiator(this.recieveRequest);
        setStatus(FileTransfer.Status.negotiating_stream);
        FutureTask futureTask = new FutureTask(new Callable<InputStream>() { // from class: org.jivesoftware.smackx.filetransfer.IncomingFileTransfer.2
            @Override // java.util.concurrent.Callable
            public InputStream call() throws Exception {
                return selectStreamNegotiator.createIncomingStream(IncomingFileTransfer.this.recieveRequest.getStreamInitiation());
            }
        });
        futureTask.run();
        try {
            try {
                try {
                    InputStream inputStream = (InputStream) futureTask.get(15L, TimeUnit.SECONDS);
                    futureTask.cancel(true);
                    setStatus(FileTransfer.Status.negotiated);
                    return inputStream;
                } catch (ExecutionException e) {
                    throw new XMPPException("Error in execution", e);
                }
            } catch (InterruptedException e2) {
                throw new XMPPException("Interruption while executing", e2);
            } catch (TimeoutException e3) {
                throw new XMPPException("Request timed out", e3);
            }
        } catch (Throwable th) {
            futureTask.cancel(true);
            throw th;
        }
    }

    @Override // org.jivesoftware.smackx.filetransfer.FileTransfer
    public void cancel() {
        setStatus(FileTransfer.Status.cancelled);
    }

    public InputStream recieveFile() throws XMPPException {
        if (this.inputStream != null) {
            throw new IllegalStateException("Transfer already negotiated!");
        }
        try {
            this.inputStream = negotiateStream();
            return this.inputStream;
        } catch (XMPPException e) {
            setException(e);
            throw e;
        }
    }

    public void recieveFile(final File file) throws XMPPException {
        if (file != null) {
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    throw new XMPPException("Could not create file to write too", e);
                }
            }
            if (!file.canWrite()) {
                throw new IllegalArgumentException("Cannot write to provided file");
            }
            new Thread(new Runnable() { // from class: org.jivesoftware.smackx.filetransfer.IncomingFileTransfer.1
                /* JADX WARN: Removed duplicated region for block: B:10:0x0048  */
                /* JADX WARN: Removed duplicated region for block: B:32:0x006a A[EXC_TOP_SPLITTER, SYNTHETIC] */
                /* JADX WARN: Removed duplicated region for block: B:34:0x005c A[EXC_TOP_SPLITTER, SYNTHETIC] */
                /* JADX WARN: Removed duplicated region for block: B:40:? A[RETURN, SYNTHETIC] */
                @Override // java.lang.Runnable
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                */
                public void run() {
                    FileNotFoundException e2;
                    FileOutputStream fileOutputStream;
                    XMPPException e3;
                    try {
                        IncomingFileTransfer.this.inputStream = IncomingFileTransfer.this.negotiateStream();
                        try {
                            fileOutputStream = new FileOutputStream(file);
                            try {
                                IncomingFileTransfer.this.setStatus(FileTransfer.Status.in_progress);
                                IncomingFileTransfer.this.writeToStream(IncomingFileTransfer.this.inputStream, fileOutputStream);
                            } catch (FileNotFoundException e4) {
                                e2 = e4;
                                IncomingFileTransfer.this.setStatus(FileTransfer.Status.error);
                                IncomingFileTransfer.this.setError(FileTransfer.Error.bad_file);
                                IncomingFileTransfer.this.setException(e2);
                                if (IncomingFileTransfer.this.getStatus().equals(FileTransfer.Status.in_progress)) {
                                }
                                if (IncomingFileTransfer.this.inputStream != null) {
                                }
                                if (fileOutputStream == null) {
                                }
                            } catch (XMPPException e5) {
                                e3 = e5;
                                IncomingFileTransfer.this.setStatus(FileTransfer.Status.error);
                                IncomingFileTransfer.this.setError(FileTransfer.Error.stream);
                                IncomingFileTransfer.this.setException(e3);
                                if (IncomingFileTransfer.this.getStatus().equals(FileTransfer.Status.in_progress)) {
                                }
                                if (IncomingFileTransfer.this.inputStream != null) {
                                }
                                if (fileOutputStream == null) {
                                }
                            }
                        } catch (FileNotFoundException e6) {
                            e2 = e6;
                            fileOutputStream = null;
                        } catch (XMPPException e7) {
                            e3 = e7;
                            fileOutputStream = null;
                        }
                        if (IncomingFileTransfer.this.getStatus().equals(FileTransfer.Status.in_progress)) {
                            IncomingFileTransfer.this.setStatus(FileTransfer.Status.complete);
                        }
                        if (IncomingFileTransfer.this.inputStream != null) {
                            try {
                                IncomingFileTransfer.this.inputStream.close();
                            } catch (Throwable th) {
                            }
                        }
                        if (fileOutputStream == null) {
                            return;
                        }
                        try {
                            fileOutputStream.close();
                        } catch (Throwable th2) {
                        }
                    } catch (XMPPException e8) {
                        IncomingFileTransfer.this.handleXMPPException(e8);
                    }
                }
            }, "File Transfer " + this.streamID).start();
            return;
        }
        throw new IllegalArgumentException("File cannot be null");
    }
}
