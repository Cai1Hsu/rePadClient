package org.jivesoftware.smack;

import java.io.IOException;
import java.io.Writer;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import org.jivesoftware.smack.packet.Packet;

/* loaded from: classes.jar:org/jivesoftware/smack/PacketWriter.class */
class PacketWriter {
    private XMPPConnection connection;
    volatile boolean done;
    private final BlockingQueue<Packet> queue = new ArrayBlockingQueue(500, true);
    private Writer writer;
    private Thread writerThread;

    protected PacketWriter(XMPPConnection xMPPConnection) {
        this.connection = xMPPConnection;
        init();
    }

    private Packet nextPacket() {
        Packet packet;
        Packet packet2 = null;
        while (true) {
            packet = packet2;
            if (this.done) {
                break;
            }
            packet2 = this.queue.poll();
            packet = packet2;
            if (packet2 != null) {
                break;
            }
            try {
                synchronized (this.queue) {
                    this.queue.wait();
                }
            } catch (InterruptedException e) {
            }
        }
        return packet;
    }

    public void writePackets(Thread thread) {
        try {
            openStream();
            while (!this.done && this.writerThread == thread) {
                Packet nextPacket = nextPacket();
                if (nextPacket != null) {
                    this.writer.write(nextPacket.toXML());
                    if (this.queue.isEmpty()) {
                        this.writer.flush();
                    }
                }
            }
            while (!this.queue.isEmpty()) {
                try {
                    this.writer.write(this.queue.remove().toXML());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            this.writer.flush();
            this.queue.clear();
            try {
                this.writer.write("</stream:stream>");
                this.writer.flush();
                try {
                    this.writer.close();
                } catch (Exception e2) {
                }
            } catch (Exception e3) {
                try {
                    this.writer.close();
                } catch (Exception e4) {
                }
            } catch (Throwable th) {
                try {
                    this.writer.close();
                } catch (Exception e5) {
                }
                throw th;
            }
        } catch (IOException e6) {
            if (this.done || this.connection.isSocketClosed()) {
                return;
            }
            this.done = true;
            if (this.connection.packetReader == null) {
                return;
            }
            this.connection.notifyConnectionError(e6);
        }
    }

    void cleanup() {
        this.connection.interceptors.clear();
        this.connection.sendListeners.clear();
    }

    protected void init() {
        this.writer = this.connection.writer;
        this.done = false;
        this.writerThread = new Thread() { // from class: org.jivesoftware.smack.PacketWriter.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                PacketWriter.this.writePackets(this);
            }
        };
        this.writerThread.setName("Smack Packet Writer (" + this.connection.connectionCounterValue + ")");
        this.writerThread.setDaemon(true);
    }

    void openStream() throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("<stream:stream");
        sb.append(" to=\"").append(this.connection.getServiceName()).append("\"");
        sb.append(" xmlns=\"jabber:client\"");
        sb.append(" xmlns:stream=\"http://etherx.jabber.org/streams\"");
        sb.append(" version=\"1.0\">");
        this.writer.write(sb.toString());
        this.writer.flush();
    }

    public void sendPacket(Packet packet) {
        if (!this.done) {
            this.connection.firePacketInterceptors(packet);
            try {
                this.queue.put(packet);
                synchronized (this.queue) {
                    this.queue.notifyAll();
                }
                this.connection.firePacketSendingListeners(packet);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    void setWriter(Writer writer) {
        this.writer = writer;
    }

    public void shutdown() {
        this.done = true;
        synchronized (this.queue) {
            this.queue.notifyAll();
        }
    }

    public void startup() {
        this.writerThread.start();
    }
}
