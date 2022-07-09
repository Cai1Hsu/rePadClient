package org.jivesoftware.smackx.filetransfer;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smackx.filetransfer.FileTransfer;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/OutgoingFileTransfer.class */
public class OutgoingFileTransfer extends FileTransfer {
    private static int RESPONSE_TIMEOUT = 60000;
    private NegotiationProgress callback;
    private String initiator;
    private OutputStream outputStream;
    private Thread transferThread;

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/OutgoingFileTransfer$NegotiationProgress.class */
    public interface NegotiationProgress {
        void errorEstablishingStream(Exception exc);

        void outputStreamEstablished(OutputStream outputStream);

        void statusUpdated(FileTransfer.Status status, FileTransfer.Status status2);
    }

    protected OutgoingFileTransfer(String str, String str2, String str3, FileTransferNegotiator fileTransferNegotiator) {
        super(str2, str3, fileTransferNegotiator);
        this.initiator = str;
    }

    private void checkTransferThread() {
        if ((this.transferThread == null || !this.transferThread.isAlive()) && !isDone()) {
            return;
        }
        throw new IllegalStateException("File transfer in progress or has already completed.");
    }

    public static int getResponseTimeout() {
        return RESPONSE_TIMEOUT;
    }

    public void handleXMPPException(XMPPException xMPPException) {
        XMPPError xMPPError = xMPPException.getXMPPError();
        if (xMPPError != null) {
            int code = xMPPError.getCode();
            if (code == 403) {
                setStatus(FileTransfer.Status.refused);
                return;
            } else if (code == 400) {
                setStatus(FileTransfer.Status.error);
                setError(FileTransfer.Error.not_acceptable);
            } else {
                setStatus(FileTransfer.Status.error);
            }
        }
        setException(xMPPException);
    }

    public OutputStream negotiateStream(String str, long j, String str2) throws XMPPException {
        OutputStream outputStream;
        if (!updateStatus(FileTransfer.Status.initial, FileTransfer.Status.negotiating_transfer)) {
            throw new XMPPException("Illegal state change");
        }
        StreamNegotiator negotiateOutgoingTransfer = this.negotiator.negotiateOutgoingTransfer(getPeer(), this.streamID, str, j, str2, RESPONSE_TIMEOUT);
        if (negotiateOutgoingTransfer == null) {
            setStatus(FileTransfer.Status.error);
            setError(FileTransfer.Error.no_response);
            outputStream = null;
        } else if (!updateStatus(FileTransfer.Status.negotiating_transfer, FileTransfer.Status.negotiating_stream)) {
            throw new XMPPException("Illegal state change");
        } else {
            this.outputStream = negotiateOutgoingTransfer.createOutgoingStream(this.streamID, this.initiator, getPeer());
            if (!updateStatus(FileTransfer.Status.negotiating_stream, FileTransfer.Status.negotiated)) {
                throw new XMPPException("Illegal state change");
            }
            outputStream = this.outputStream;
        }
        return outputStream;
    }

    public static void setResponseTimeout(int i) {
        RESPONSE_TIMEOUT = i;
    }

    @Override // org.jivesoftware.smackx.filetransfer.FileTransfer
    public void cancel() {
        setStatus(FileTransfer.Status.cancelled);
    }

    public long getBytesSent() {
        return this.amountWritten;
    }

    protected OutputStream getOutputStream() {
        return getStatus().equals(FileTransfer.Status.negotiated) ? this.outputStream : null;
    }

    public OutputStream sendFile(String str, long j, String str2) throws XMPPException {
        OutputStream outputStream;
        synchronized (this) {
            if (isDone() || this.outputStream != null) {
                throw new IllegalStateException("The negotation process has already been attempted on this file transfer");
            }
            try {
                setFileInfo(str, j);
                this.outputStream = negotiateStream(str, j, str2);
                outputStream = this.outputStream;
            } catch (XMPPException e) {
                handleXMPPException(e);
                throw e;
            }
        }
        return outputStream;
    }

    public void sendFile(final File file, final String str) throws XMPPException {
        synchronized (this) {
            checkTransferThread();
            if (file == null || !file.exists() || !file.canRead()) {
                throw new IllegalArgumentException("Could not read file");
            }
            setFileInfo(file.getAbsolutePath(), file.getName(), file.length());
            this.transferThread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.filetransfer.OutgoingFileTransfer.2
                /* JADX DEBUG: Failed to insert an additional move for type inference into block B:46:0x0130 */
                /* JADX DEBUG: Failed to insert an additional move for type inference into block B:63:0x0051 */
                /* JADX WARN: Multi-variable type inference failed */
                /* JADX WARN: Type inference failed for: r8v1 */
                /* JADX WARN: Type inference failed for: r8v10, types: [java.io.IOException] */
                /* JADX WARN: Type inference failed for: r8v11 */
                /* JADX WARN: Type inference failed for: r8v12 */
                /* JADX WARN: Type inference failed for: r8v14, types: [java.io.IOException] */
                /* JADX WARN: Type inference failed for: r8v3 */
                /* JADX WARN: Type inference failed for: r8v5 */
                /* JADX WARN: Type inference failed for: r8v6, types: [java.io.IOException] */
                /* JADX WARN: Type inference failed for: r8v9 */
                @Override // java.lang.Runnable
                public void run() {
                    Throwable th;
                    FileInputStream fileInputStream;
                    FileInputStream fileInputStream2;
                    XMPPException e;
                    FileNotFoundException e2;
                    try {
                        OutgoingFileTransfer.this.outputStream = OutgoingFileTransfer.this.negotiateStream(file.getName(), file.length(), str);
                        if (OutgoingFileTransfer.this.outputStream == null || !OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.negotiated, FileTransfer.Status.in_progress)) {
                            return;
                        }
                        ?? e3 = null;
                        try {
                            try {
                                e3 = 0;
                                fileInputStream2 = new FileInputStream(file);
                            } catch (Throwable th2) {
                                th = th2;
                                fileInputStream = e3 == true ? 1 : 0;
                            }
                        } catch (FileNotFoundException e4) {
                            e2 = e4;
                            fileInputStream2 = null;
                        } catch (XMPPException e5) {
                            e = e5;
                            fileInputStream2 = null;
                        }
                        try {
                            OutgoingFileTransfer.this.writeToStream(fileInputStream2, OutgoingFileTransfer.this.outputStream);
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (IOException e6) {
                                    e3 = e6;
                                }
                            }
                            OutgoingFileTransfer.this.outputStream.flush();
                            OutgoingFileTransfer.this.outputStream.close();
                        } catch (FileNotFoundException e7) {
                            e2 = e7;
                            OutgoingFileTransfer.this.setStatus(FileTransfer.Status.error);
                            FileInputStream fileInputStream3 = fileInputStream2;
                            OutgoingFileTransfer.this.setError(FileTransfer.Error.bad_file);
                            e3 = fileInputStream2;
                            OutgoingFileTransfer.this.setException(e2);
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (IOException e8) {
                                    e3 = e8;
                                }
                            }
                            OutgoingFileTransfer.this.outputStream.flush();
                            OutgoingFileTransfer.this.outputStream.close();
                            OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.in_progress, FileTransfer.Status.complete);
                        } catch (XMPPException e9) {
                            e = e9;
                            OutgoingFileTransfer.this.setStatus(FileTransfer.Status.error);
                            e3 = fileInputStream2;
                            OutgoingFileTransfer.this.setException(e);
                            if (fileInputStream2 != null) {
                                try {
                                    fileInputStream2.close();
                                } catch (IOException e10) {
                                    e3 = e10;
                                }
                            }
                            OutgoingFileTransfer.this.outputStream.flush();
                            OutgoingFileTransfer.this.outputStream.close();
                            OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.in_progress, FileTransfer.Status.complete);
                        } catch (Throwable th3) {
                            fileInputStream = fileInputStream2;
                            th = th3;
                            if (fileInputStream != null) {
                                try {
                                    fileInputStream.close();
                                } catch (IOException e11) {
                                    throw th;
                                }
                            }
                            OutgoingFileTransfer.this.outputStream.flush();
                            OutgoingFileTransfer.this.outputStream.close();
                            throw th;
                        }
                        OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.in_progress, FileTransfer.Status.complete);
                    } catch (XMPPException e12) {
                        OutgoingFileTransfer.this.handleXMPPException(e12);
                    }
                }
            }, "File Transfer " + this.streamID);
            this.transferThread.start();
        }
    }

    public void sendFile(final String str, final long j, final String str2, final NegotiationProgress negotiationProgress) {
        synchronized (this) {
            if (negotiationProgress == null) {
                throw new IllegalArgumentException("Callback progress cannot be null.");
            }
            checkTransferThread();
            if (isDone() || this.outputStream != null) {
                throw new IllegalStateException("The negotation process has already been attempted for this file transfer");
            }
            setFileInfo(str, j);
            this.callback = negotiationProgress;
            this.transferThread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.filetransfer.OutgoingFileTransfer.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        OutgoingFileTransfer.this.outputStream = OutgoingFileTransfer.this.negotiateStream(str, j, str2);
                        negotiationProgress.outputStreamEstablished(OutgoingFileTransfer.this.outputStream);
                    } catch (XMPPException e) {
                        OutgoingFileTransfer.this.handleXMPPException(e);
                    }
                }
            }, "File Transfer Negotiation " + this.streamID);
            this.transferThread.start();
        }
    }

    public void sendStream(final InputStream inputStream, final String str, final long j, final String str2) {
        synchronized (this) {
            checkTransferThread();
            setFileInfo(str, j);
            this.transferThread = new Thread(new Runnable() { // from class: org.jivesoftware.smackx.filetransfer.OutgoingFileTransfer.3
                /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[IGET] complete} */
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        OutgoingFileTransfer.this.outputStream = OutgoingFileTransfer.this.negotiateStream(str, j, str2);
                        if (OutgoingFileTransfer.this.outputStream == null) {
                            return;
                        }
                        try {
                            if (!OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.negotiated, FileTransfer.Status.in_progress)) {
                                return;
                            }
                            try {
                                OutgoingFileTransfer.this.writeToStream(inputStream, OutgoingFileTransfer.this.outputStream);
                                try {
                                    if (inputStream != null) {
                                        inputStream.close();
                                    }
                                    OutgoingFileTransfer.this.outputStream.flush();
                                    OutgoingFileTransfer.this.outputStream.close();
                                } catch (IOException e) {
                                }
                            } catch (XMPPException e2) {
                                OutgoingFileTransfer.this.setStatus(FileTransfer.Status.error);
                                OutgoingFileTransfer.this.setException(e2);
                                try {
                                    if (inputStream != null) {
                                        inputStream.close();
                                    }
                                    OutgoingFileTransfer.this.outputStream.flush();
                                    OutgoingFileTransfer.this.outputStream.close();
                                } catch (IOException e3) {
                                }
                            }
                            OutgoingFileTransfer.this.updateStatus(FileTransfer.Status.in_progress, FileTransfer.Status.complete);
                        } catch (Throwable th) {
                            try {
                                if (inputStream != null) {
                                    inputStream.close();
                                }
                                OutgoingFileTransfer.this.outputStream.flush();
                                OutgoingFileTransfer.this.outputStream.close();
                            } catch (IOException e4) {
                            }
                            throw th;
                        }
                    } catch (XMPPException e5) {
                        OutgoingFileTransfer.this.handleXMPPException(e5);
                    }
                }
            }, "File Transfer " + this.streamID);
            this.transferThread.start();
        }
    }

    @Override // org.jivesoftware.smackx.filetransfer.FileTransfer
    protected void setException(Exception exc) {
        super.setException(exc);
        if (this.callback != null) {
            this.callback.errorEstablishingStream(exc);
        }
    }

    protected void setOutputStream(OutputStream outputStream) {
        if (this.outputStream == null) {
            this.outputStream = outputStream;
        }
    }

    @Override // org.jivesoftware.smackx.filetransfer.FileTransfer
    protected void setStatus(FileTransfer.Status status) {
        FileTransfer.Status status2 = getStatus();
        super.setStatus(status);
        if (this.callback != null) {
            this.callback.statusUpdated(status2, status);
        }
    }

    @Override // org.jivesoftware.smackx.filetransfer.FileTransfer
    protected boolean updateStatus(FileTransfer.Status status, FileTransfer.Status status2) {
        boolean updateStatus = super.updateStatus(status, status2);
        if (this.callback != null && updateStatus) {
            this.callback.statusUpdated(status, status2);
        }
        return updateStatus;
    }
}
