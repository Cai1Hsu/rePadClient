package org.jivesoftware.smackx.muc;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/ConnectionDetachedPacketCollector.class */
class ConnectionDetachedPacketCollector {
    private int maxPackets;
    private ArrayBlockingQueue<Packet> resultQueue;

    public ConnectionDetachedPacketCollector() {
        this(SmackConfiguration.getPacketCollectorSize());
    }

    public ConnectionDetachedPacketCollector(int i) {
        this.maxPackets = SmackConfiguration.getPacketCollectorSize();
        this.resultQueue = new ArrayBlockingQueue<>(i);
    }

    public Packet nextResult() {
        try {
            return this.resultQueue.take();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public Packet nextResult(long j) {
        try {
            return this.resultQueue.poll(j, TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public Packet pollResult() {
        return this.resultQueue.poll();
    }

    protected void processPacket(Packet packet) {
        if (packet == null) {
            return;
        }
        while (!this.resultQueue.offer(packet)) {
            this.resultQueue.poll();
        }
    }
}
