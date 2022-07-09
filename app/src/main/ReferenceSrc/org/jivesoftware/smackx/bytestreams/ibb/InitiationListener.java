package org.jivesoftware.smackx.bytestreams.ibb;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.bytestreams.BytestreamListener;
import org.jivesoftware.smackx.bytestreams.ibb.packet.Open;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/InitiationListener.class */
class InitiationListener implements PacketListener {
    private final PacketFilter initFilter = new AndFilter(new PacketTypeFilter(Open.class), new IQTypeFilter(IQ.Type.SET));
    private final ExecutorService initiationListenerExecutor = Executors.newCachedThreadPool();
    private final InBandBytestreamManager manager;

    protected InitiationListener(InBandBytestreamManager inBandBytestreamManager) {
        this.manager = inBandBytestreamManager;
    }

    public void processRequest(Packet packet) {
        Open open = (Open) packet;
        if (open.getBlockSize() > this.manager.getMaximumBlockSize()) {
            this.manager.replyResourceConstraintPacket(open);
        } else if (!this.manager.getIgnoredBytestreamRequests().remove(open.getSessionID())) {
            InBandBytestreamRequest inBandBytestreamRequest = new InBandBytestreamRequest(this.manager, open);
            BytestreamListener userListener = this.manager.getUserListener(open.getFrom());
            if (userListener != null) {
                userListener.incomingBytestreamRequest(inBandBytestreamRequest);
            } else if (this.manager.getAllRequestListeners().isEmpty()) {
                this.manager.replyRejectPacket(open);
            } else {
                for (BytestreamListener bytestreamListener : this.manager.getAllRequestListeners()) {
                    bytestreamListener.incomingBytestreamRequest(inBandBytestreamRequest);
                }
            }
        }
    }

    protected PacketFilter getFilter() {
        return this.initFilter;
    }

    @Override // org.jivesoftware.smack.PacketListener
    public void processPacket(final Packet packet) {
        this.initiationListenerExecutor.execute(new Runnable() { // from class: org.jivesoftware.smackx.bytestreams.ibb.InitiationListener.1
            @Override // java.lang.Runnable
            public void run() {
                InitiationListener.this.processRequest(packet);
            }
        });
    }

    protected void shutdown() {
        this.initiationListenerExecutor.shutdownNow();
    }
}
