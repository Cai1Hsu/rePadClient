package org.jivesoftware.smackx.bytestreams.socks5;

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
import org.jivesoftware.smackx.bytestreams.socks5.packet.Bytestream;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/InitiationListener.class */
final class InitiationListener implements PacketListener {
    private final PacketFilter initFilter = new AndFilter(new PacketTypeFilter(Bytestream.class), new IQTypeFilter(IQ.Type.SET));
    private final ExecutorService initiationListenerExecutor = Executors.newCachedThreadPool();
    private final Socks5BytestreamManager manager;

    protected InitiationListener(Socks5BytestreamManager socks5BytestreamManager) {
        this.manager = socks5BytestreamManager;
    }

    public void processRequest(Packet packet) {
        Bytestream bytestream = (Bytestream) packet;
        if (this.manager.getIgnoredBytestreamRequests().remove(bytestream.getSessionID())) {
            return;
        }
        Socks5BytestreamRequest socks5BytestreamRequest = new Socks5BytestreamRequest(this.manager, bytestream);
        BytestreamListener userListener = this.manager.getUserListener(bytestream.getFrom());
        if (userListener != null) {
            userListener.incomingBytestreamRequest(socks5BytestreamRequest);
        } else if (this.manager.getAllRequestListeners().isEmpty()) {
            this.manager.replyRejectPacket(bytestream);
        } else {
            for (BytestreamListener bytestreamListener : this.manager.getAllRequestListeners()) {
                bytestreamListener.incomingBytestreamRequest(socks5BytestreamRequest);
            }
        }
    }

    protected PacketFilter getFilter() {
        return this.initFilter;
    }

    @Override // org.jivesoftware.smack.PacketListener
    public void processPacket(final Packet packet) {
        this.initiationListenerExecutor.execute(new Runnable() { // from class: org.jivesoftware.smackx.bytestreams.socks5.InitiationListener.1
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
