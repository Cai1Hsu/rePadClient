package com.mongodb;

import java.util.concurrent.atomic.AtomicInteger;
import org.bson.io.OutputBuffer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class RequestMessage {
    static final AtomicInteger REQUEST_ID = new AtomicInteger(1);
    private final String collectionName;
    private final int id = REQUEST_ID.getAndIncrement();
    private final OpCode opCode;
    private MessageSettings settings;

    protected abstract RequestMessage encodeMessageBody(OutputBuffer outputBuffer, int i);

    public RequestMessage(String collectionName, OpCode opCode, MessageSettings settings) {
        this.collectionName = collectionName;
        this.settings = settings;
        this.opCode = opCode;
    }

    protected void writeMessagePrologue(OutputBuffer buffer) {
        buffer.writeInt(0);
        buffer.writeInt(this.id);
        buffer.writeInt(0);
        buffer.writeInt(this.opCode.getValue());
    }

    public int getId() {
        return this.id;
    }

    public OpCode getOpCode() {
        return this.opCode;
    }

    public String getNamespace() {
        if (getCollectionName() != null) {
            return getCollectionName();
        }
        return null;
    }

    public MessageSettings getSettings() {
        return this.settings;
    }

    public RequestMessage encode(OutputBuffer buffer) {
        int messageStartPosition = buffer.getPosition();
        writeMessagePrologue(buffer);
        RequestMessage nextMessage = encodeMessageBody(buffer, messageStartPosition);
        backpatchMessageLength(messageStartPosition, buffer);
        return nextMessage;
    }

    protected void backpatchMessageLength(int startPosition, OutputBuffer buffer) {
        int messageLength = buffer.getPosition() - startPosition;
        buffer.backpatchSize(messageLength);
    }

    public String getCollectionName() {
        return this.collectionName;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    enum OpCode {
        OP_REPLY(1),
        OP_MSG(1000),
        OP_UPDATE(2001),
        OP_INSERT(2002),
        OP_QUERY(2004),
        OP_GETMORE(2005),
        OP_DELETE(2006),
        OP_KILL_CURSORS(2007);
        
        private final int value;

        OpCode(int value) {
            this.value = value;
        }

        public int getValue() {
            return this.value;
        }
    }
}
