package com.mongodb;

import com.mongodb.DBPort;
import com.mongodb.OutMessage;
import java.util.concurrent.TimeUnit;

@Deprecated
/* loaded from: classes.dex */
public class InUseConnectionBean {
    private final long durationMS;
    private final int localPort;
    private final String namespace;
    private final int numDocuments;
    private final OutMessage.OpCode opCode;
    private final String query;
    private final String threadName;

    InUseConnectionBean(DBPort port, long currentNanoTime) {
        DBPort.ActiveState activeState = port.getActiveState();
        if (activeState == null) {
            this.durationMS = 0L;
            this.namespace = null;
            this.opCode = null;
            this.query = null;
            this.threadName = null;
            this.numDocuments = 0;
        } else {
            this.durationMS = TimeUnit.NANOSECONDS.toMillis(currentNanoTime - activeState.getStartTime());
            this.namespace = activeState.getNamespace();
            this.opCode = activeState.getOpCode();
            this.query = activeState.getQuery().toString();
            this.threadName = activeState.getThreadName();
            this.numDocuments = activeState.getNumDocuments();
        }
        this.localPort = port.getLocalPort();
    }

    public String getNamespace() {
        return this.namespace;
    }

    public OutMessage.OpCode getOpCode() {
        return this.opCode;
    }

    public String getQuery() {
        return this.query;
    }

    public int getLocalPort() {
        return this.localPort;
    }

    public long getDurationMS() {
        return this.durationMS;
    }

    public String getThreadName() {
        return this.threadName;
    }

    public int getNumDocuments() {
        return this.numDocuments;
    }
}
