package org.jivesoftware.smackx.filetransfer;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.OrFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.packet.StreamInitiation;

/* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator.class */
public class FaultTolerantNegotiator extends StreamNegotiator {
    private Connection connection;
    private PacketFilter primaryFilter;
    private StreamNegotiator primaryNegotiator;
    private PacketFilter secondaryFilter;
    private StreamNegotiator secondaryNegotiator;

    /* loaded from: classes.jar:org/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator$NegotiatorService.class */
    private class NegotiatorService implements Callable<InputStream> {
        private PacketCollector collector;

        NegotiatorService(PacketCollector packetCollector) {
            FaultTolerantNegotiator.this = r4;
            this.collector = packetCollector;
        }

        @Override // java.util.concurrent.Callable
        public InputStream call() throws Exception {
            Packet nextResult = this.collector.nextResult(SmackConfiguration.getPacketReplyTimeout() * 2);
            if (nextResult == null) {
                throw new XMPPException("No response from remote client");
            }
            return FaultTolerantNegotiator.this.determineNegotiator(nextResult).negotiateIncomingStream(nextResult);
        }
    }

    public FaultTolerantNegotiator(Connection connection, StreamNegotiator streamNegotiator, StreamNegotiator streamNegotiator2) {
        this.primaryNegotiator = streamNegotiator;
        this.secondaryNegotiator = streamNegotiator2;
        this.connection = connection;
    }

    public StreamNegotiator determineNegotiator(Packet packet) {
        return this.primaryFilter.accept(packet) ? this.primaryNegotiator : this.secondaryNegotiator;
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public void cleanup() {
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public InputStream createIncomingStream(StreamInitiation streamInitiation) throws XMPPException {
        Throwable th;
        PacketCollector createPacketCollector = this.connection.createPacketCollector(getInitiationPacketFilter(streamInitiation.getFrom(), streamInitiation.getSessionID()));
        this.connection.sendPacket(super.createInitiationAccept(streamInitiation, getNamespaces()));
        ExecutorService newFixedThreadPool = Executors.newFixedThreadPool(2);
        ExecutorCompletionService executorCompletionService = new ExecutorCompletionService(newFixedThreadPool);
        ArrayList<Future> arrayList = new ArrayList();
        InputStream inputStream = null;
        try {
            arrayList.add(executorCompletionService.submit(new NegotiatorService(createPacketCollector)));
            arrayList.add(executorCompletionService.submit(new NegotiatorService(createPacketCollector)));
            int i = 0;
            XMPPException xMPPException = null;
            while (inputStream == null) {
                try {
                    if (i >= arrayList.size()) {
                        break;
                    }
                    int i2 = i + 1;
                    try {
                        Future poll = executorCompletionService.poll(10L, TimeUnit.SECONDS);
                        i = i2;
                        if (poll != null) {
                            try {
                                inputStream = (InputStream) poll.get();
                            } catch (InterruptedException e) {
                            } catch (ExecutionException e2) {
                                xMPPException = new XMPPException(e2.getCause());
                            }
                            i = i2;
                        }
                    } catch (InterruptedException e3) {
                        i = i2;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    for (Future future : arrayList) {
                        future.cancel(true);
                    }
                    createPacketCollector.cancel();
                    newFixedThreadPool.shutdownNow();
                    throw th;
                }
            }
            for (Future future2 : arrayList) {
                future2.cancel(true);
            }
            createPacketCollector.cancel();
            newFixedThreadPool.shutdownNow();
            if (inputStream != null) {
                return inputStream;
            }
            if (xMPPException == null) {
                throw new XMPPException("File transfer negotiation failed.");
            }
            throw xMPPException;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public OutputStream createOutgoingStream(String str, String str2, String str3) throws XMPPException {
        OutputStream createOutgoingStream;
        try {
            createOutgoingStream = this.primaryNegotiator.createOutgoingStream(str, str2, str3);
        } catch (XMPPException e) {
            createOutgoingStream = this.secondaryNegotiator.createOutgoingStream(str, str2, str3);
        }
        return createOutgoingStream;
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public PacketFilter getInitiationPacketFilter(String str, String str2) {
        if (this.primaryFilter == null || this.secondaryFilter == null) {
            this.primaryFilter = this.primaryNegotiator.getInitiationPacketFilter(str, str2);
            this.secondaryFilter = this.secondaryNegotiator.getInitiationPacketFilter(str, str2);
        }
        return new OrFilter(this.primaryFilter, this.secondaryFilter);
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    public String[] getNamespaces() {
        String[] namespaces = this.primaryNegotiator.getNamespaces();
        String[] namespaces2 = this.secondaryNegotiator.getNamespaces();
        String[] strArr = new String[namespaces.length + namespaces2.length];
        System.arraycopy(namespaces, 0, strArr, 0, namespaces.length);
        System.arraycopy(namespaces2, 0, strArr, namespaces.length, namespaces2.length);
        return strArr;
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    final Packet initiateIncomingStream(Connection connection, StreamInitiation streamInitiation) {
        throw new UnsupportedOperationException("Initiation handled by createIncomingStream method");
    }

    @Override // org.jivesoftware.smackx.filetransfer.StreamNegotiator
    InputStream negotiateIncomingStream(Packet packet) throws XMPPException {
        throw new UnsupportedOperationException("Negotiation only handled by create incoming stream method.");
    }
}
