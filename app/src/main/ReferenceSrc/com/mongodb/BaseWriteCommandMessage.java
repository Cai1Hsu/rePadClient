package com.mongodb;

import com.mongodb.RequestMessage;
import org.bson.io.OutputBuffer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
abstract class BaseWriteCommandMessage extends RequestMessage {
    private static final int HEADROOM = 16384;
    private final DBEncoder commandEncoder;
    private final WriteConcern writeConcern;
    private final MongoNamespace writeNamespace;

    protected abstract String getCommandName();

    public abstract int getItemCount();

    protected abstract BaseWriteCommandMessage writeTheWrites(OutputBuffer outputBuffer, int i, BSONBinaryWriter bSONBinaryWriter);

    public BaseWriteCommandMessage(MongoNamespace writeNamespace, WriteConcern writeConcern, DBEncoder commandEncoder, MessageSettings settings) {
        super(new MongoNamespace(writeNamespace.getDatabaseName(), MongoNamespace.COMMAND_COLLECTION_NAME).getFullName(), RequestMessage.OpCode.OP_QUERY, settings);
        this.writeNamespace = writeNamespace;
        this.writeConcern = writeConcern;
        this.commandEncoder = commandEncoder;
    }

    public MongoNamespace getWriteNamespace() {
        return this.writeNamespace;
    }

    public WriteConcern getWriteConcern() {
        return this.writeConcern;
    }

    public DBEncoder getCommandEncoder() {
        return this.commandEncoder;
    }

    @Override // com.mongodb.RequestMessage
    public BaseWriteCommandMessage encode(OutputBuffer buffer) {
        return (BaseWriteCommandMessage) super.encode(buffer);
    }

    @Override // com.mongodb.RequestMessage
    public BaseWriteCommandMessage encodeMessageBody(OutputBuffer buffer, int messageStartPosition) {
        writeCommandHeader(buffer);
        int commandStartPosition = buffer.getPosition();
        BSONBinaryWriter writer = new BSONBinaryWriter(new BSONWriterSettings(), new BSONBinaryWriterSettings(getSettings().getMaxDocumentSize() + 16384), buffer);
        try {
            writer.writeStartDocument();
            writeCommandPrologue(writer);
            BaseWriteCommandMessage nextMessage = writeTheWrites(buffer, commandStartPosition, writer);
            writer.writeEndDocument();
            return nextMessage;
        } finally {
            writer.close();
        }
    }

    private void writeCommandHeader(OutputBuffer buffer) {
        buffer.writeInt(0);
        buffer.writeCString(getCollectionName());
        buffer.writeInt(0);
        buffer.writeInt(-1);
    }

    public boolean exceedsLimits(int batchLength, int batchItemCount) {
        return exceedsBatchLengthLimit(batchLength, batchItemCount) || exceedsBatchItemCountLimit(batchItemCount);
    }

    private boolean exceedsBatchLengthLimit(int batchLength, int batchItemCount) {
        return batchLength > getSettings().getMaxDocumentSize() && batchItemCount > 1;
    }

    private boolean exceedsBatchItemCountLimit(int batchItemCount) {
        return batchItemCount > getSettings().getMaxWriteBatchSize();
    }

    private void writeCommandPrologue(BSONBinaryWriter writer) {
        writer.writeString(getCommandName(), getWriteNamespace().getCollectionName());
        writer.writeBoolean("ordered", !getWriteConcern().getContinueOnError());
        if (!getWriteConcern().useServerDefault()) {
            writer.writeName("writeConcern");
            writer.encodeDocument(getCommandEncoder(), getWriteConcern().asDBObject());
        }
    }
}
