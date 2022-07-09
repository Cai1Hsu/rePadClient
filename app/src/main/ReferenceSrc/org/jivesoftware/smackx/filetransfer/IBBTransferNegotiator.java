package org.jivesoftware.smackx.filetransfer;

import java.io.InputStream;
import java.io.OutputStream;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.FromContainsFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamManager;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamRequest;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamSession;
import org.jivesoftware.smackx.bytestreams.ibb.packet.Open;
import org.jivesoftware.smackx.packet.StreamInitiation;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/IBBTransferNegotiator.class */
public class IBBTransferNegotiator extends StreamNegotiator {
    private Connection connection;
    private InBandBytestreamManager manager;

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/IBBTransferNegotiator$ByteStreamRequest.class */
    private static class ByteStreamRequest extends InBandBytestreamRequest {
        private ByteStreamRequest(InBandBytestreamManager inBandBytestreamManager, Open open) {
            super(inBandBytestreamManager, open);
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/IBBTransferNegotiator$IBBOpenSidFilter.class */
    private static class IBBOpenSidFilter extends PacketTypeFilter {
        private String sessionID;

        public IBBOpenSidFilter(String str) {
            super(Open.class);
            if (str == null) {
                throw new IllegalArgumentException("StreamID cannot be null");
            }
            this.sessionID = str;
        }

        @Override // org.jivesoftware.smack.filter.PacketTypeFilter, org.jivesoftware.smack.filter.PacketFilter
        public boolean accept(Packet packet) {
            boolean z = false;
            if (super.accept(packet)) {
                Open open = (Open) packet;
                z = false;
                if (this.sessionID.equals(open.getSessionID())) {
                    z = false;
                    if (IQ.Type.SET.equals(open.getType())) {
                        z = true;
                    }
                }
            }
            return z;
        }
    }

    protected IBBTransferNegotiator(Connection connection) {
        this.connection = connection;
        this.manager = InBandBytestreamManager.getByteStreamManager(connection);
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public void cleanup() {
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public InputStream createIncomingStream(StreamInitiation streamInitiation) throws XMPPException {
        this.manager.ignoreBytestreamRequestOnce(streamInitiation.getSessionID());
        return negotiateIncomingStream(initiateIncomingStream(this.connection, streamInitiation));
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public OutputStream createOutgoingStream(String str, String str2, String str3) throws XMPPException {
        InBandBytestreamSession establishSession = this.manager.establishSession(str3, str);
        establishSession.setCloseBothStreamsEnabled(true);
        return establishSession.getOutputStream();
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public PacketFilter getInitiationPacketFilter(String str, String str2) {
        this.manager.ignoreBytestreamRequestOnce(str2);
        return new AndFilter(new FromContainsFilter(str), new IBBOpenSidFilter(str2));
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public String[] getNamespaces() {
        return new String[]{InBandBytestreamManager.NAMESPACE};
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    InputStream negotiateIncomingStream(Packet packet) throws XMPPException {
        InBandBytestreamSession accept = new ByteStreamRequest(this.manager, (Open) packet).accept();
        accept.setCloseBothStreamsEnabled(true);
        return accept.getInputStream();
    }
}
