package org.jivesoftware.smackx.filetransfer;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.jivesoftware.smack.XMPPException;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FileTransfer.class */
public abstract class FileTransfer {
    private static final int BUFFER_SIZE = 8192;
    private Error error;
    private Exception exception;
    private String fileName;
    private String filePath;
    private long fileSize;
    protected FileTransferNegotiator negotiator;
    private String peer;
    protected String streamID;
    private Status status = Status.initial;
    private final Object statusMonitor = new Object();
    protected long amountWritten = -1;

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FileTransfer$Error.class */
    public enum Error {
        none("No error"),
        not_acceptable("The peer did not find any of the provided stream mechanisms acceptable."),
        bad_file("The provided file to transfer does not exist or could not be read."),
        no_response("The remote user did not respond or the connection timed out."),
        connection("An error occured over the socket connected to send the file."),
        stream("An error occured while sending or recieving the file.");
        
        private final String msg;

        Error(String str) {
            this.msg = str;
        }

        public String getMessage() {
            return this.msg;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.msg;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FileTransfer$Status.class */
    public enum Status {
        error("Error"),
        initial("Initial"),
        negotiating_transfer("Negotiating Transfer"),
        refused("Refused"),
        negotiating_stream("Negotiating Stream"),
        negotiated("Negotiated"),
        in_progress("In Progress"),
        complete("Complete"),
        cancelled("Cancelled");
        
        private String status;

        Status(String str) {
            this.status = str;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.status;
        }
    }

    protected FileTransfer(String str, String str2, FileTransferNegotiator fileTransferNegotiator) {
        this.peer = str;
        this.streamID = str2;
        this.negotiator = fileTransferNegotiator;
    }

    public abstract void cancel();

    public long getAmountWritten() {
        return this.amountWritten;
    }

    public Error getError() {
        return this.error;
    }

    public Exception getException() {
        return this.exception;
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public long getFileSize() {
        return this.fileSize;
    }

    public String getPeer() {
        return this.peer;
    }

    public double getProgress() {
        return (this.amountWritten <= 0 || this.fileSize <= 0) ? 0.0d : this.amountWritten / this.fileSize;
    }

    public Status getStatus() {
        return this.status;
    }

    public String getStreamID() {
        return this.streamID;
    }

    public boolean isDone() {
        return this.status == Status.cancelled || this.status == Status.error || this.status == Status.complete || this.status == Status.refused;
    }

    protected void setError(Error error) {
        this.error = error;
    }

    protected void setException(Exception exc) {
        this.exception = exc;
    }

    protected void setFileInfo(String str, long j) {
        this.fileName = str;
        this.fileSize = j;
    }

    protected void setFileInfo(String str, String str2, long j) {
        this.filePath = str;
        this.fileName = str2;
        this.fileSize = j;
    }

    protected void setStatus(Status status) {
        synchronized (this.statusMonitor) {
            this.status = status;
        }
    }

    protected boolean updateStatus(Status status, Status status2) {
        boolean z;
        synchronized (this.statusMonitor) {
            if (status != this.status) {
                z = false;
            } else {
                this.status = status2;
                z = true;
            }
        }
        return z;
    }

    protected void writeToStream(InputStream inputStream, OutputStream outputStream) throws XMPPException {
        byte[] bArr = new byte[8192];
        int i = 0;
        this.amountWritten = 0L;
        do {
            try {
                outputStream.write(bArr, 0, i);
                this.amountWritten += i;
                try {
                    i = inputStream.read(bArr);
                    if (i == -1) {
                        break;
                    }
                } catch (IOException e) {
                    throw new XMPPException("error reading from input stream", e);
                }
            } catch (IOException e2) {
                throw new XMPPException("error writing to output stream", e2);
            }
        } while (!getStatus().equals(Status.cancelled));
        if (getStatus().equals(Status.cancelled) || getError() != Error.none || this.amountWritten == this.fileSize) {
            return;
        }
        setStatus(Status.error);
        this.error = Error.connection;
    }
}
