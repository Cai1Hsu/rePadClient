package org.jivesoftware.smackx.filetransfer;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.StreamInitiation;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FileTransferManager.class */
public class FileTransferManager {
    private Connection connection;
    private final FileTransferNegotiator fileTransferNegotiator;
    private List<FileTransferListener> listeners;

    public FileTransferManager(Connection connection) {
        this.connection = connection;
        this.fileTransferNegotiator = FileTransferNegotiator.getInstanceFor(connection);
    }

    private void initListeners() {
        this.listeners = new ArrayList();
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smackx.filetransfer.FileTransferManager.1
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                FileTransferManager.this.fireNewRequest((StreamInitiation) packet);
            }
        }, new AndFilter(new PacketTypeFilter(StreamInitiation.class), new IQTypeFilter(IQ.Type.SET)));
    }

    public void addFileTransferListener(FileTransferListener fileTransferListener) {
        if (this.listeners == null) {
            initListeners();
        }
        synchronized (this.listeners) {
            this.listeners.add(fileTransferListener);
        }
    }

    protected IncomingFileTransfer createIncomingFileTransfer(FileTransferRequest fileTransferRequest) {
        if (fileTransferRequest == null) {
            throw new NullPointerException("RecieveRequest cannot be null");
        }
        IncomingFileTransfer incomingFileTransfer = new IncomingFileTransfer(fileTransferRequest, this.fileTransferNegotiator);
        incomingFileTransfer.setFileInfo(fileTransferRequest.getFileName(), fileTransferRequest.getFileSize());
        return incomingFileTransfer;
    }

    public OutgoingFileTransfer createOutgoingFileTransfer(String str) {
        if (str == null) {
            throw new IllegalArgumentException("userID was null");
        }
        if (StringUtils.isFullJID(str)) {
            return new OutgoingFileTransfer(this.connection.getUser(), str, this.fileTransferNegotiator.getNextStreamID(), this.fileTransferNegotiator);
        }
        throw new IllegalArgumentException("The provided user id was not a full JID (i.e. with resource part)");
    }

    protected void fireNewRequest(StreamInitiation streamInitiation) {
        FileTransferListener[] fileTransferListenerArr;
        synchronized (this.listeners) {
            fileTransferListenerArr = new FileTransferListener[this.listeners.size()];
            this.listeners.toArray(fileTransferListenerArr);
        }
        FileTransferRequest fileTransferRequest = new FileTransferRequest(this, streamInitiation);
        for (FileTransferListener fileTransferListener : fileTransferListenerArr) {
            fileTransferListener.fileTransferRequest(fileTransferRequest);
        }
    }

    protected void rejectIncomingFileTransfer(FileTransferRequest fileTransferRequest) {
        StreamInitiation streamInitiation = fileTransferRequest.getStreamInitiation();
        IQ createIQ = FileTransferNegotiator.createIQ(streamInitiation.getPacketID(), streamInitiation.getFrom(), streamInitiation.getTo(), IQ.Type.ERROR);
        createIQ.setError(new XMPPError(XMPPError.Condition.no_acceptable));
        this.connection.sendPacket(createIQ);
    }

    public void removeFileTransferListener(FileTransferListener fileTransferListener) {
        if (this.listeners == null) {
            return;
        }
        synchronized (this.listeners) {
            this.listeners.remove(fileTransferListener);
        }
    }
}
