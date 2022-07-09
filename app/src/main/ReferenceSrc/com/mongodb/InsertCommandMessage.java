package com.mongodb;

import java.util.List;
import org.bson.io.OutputBuffer;

/* loaded from: classes.dex */
class InsertCommandMessage extends BaseWriteCommandMessage {
    private final List<DBObject> documents;
    private final DBEncoder encoder;

    public InsertCommandMessage(MongoNamespace namespace, WriteConcern writeConcern, List<DBObject> documents, DBEncoder commandEncoder, DBEncoder encoder, MessageSettings settings) {
        super(namespace, writeConcern, commandEncoder, settings);
        this.documents = documents;
        this.encoder = encoder;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    protected String getCommandName() {
        return "insert";
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    public InsertCommandMessage writeTheWrites(OutputBuffer buffer, int commandStartPosition, BSONBinaryWriter writer) {
        InsertCommandMessage nextMessage = null;
        writer.writeStartArray("documents");
        writer.pushMaxDocumentSize(getSettings().getMaxDocumentSize());
        int i = 0;
        while (true) {
            if (i >= this.documents.size()) {
                break;
            }
            writer.mark();
            writer.encodeDocument(this.encoder, this.documents.get(i));
            if (!exceedsLimits(buffer.getPosition() - commandStartPosition, i + 1)) {
                i++;
            } else {
                writer.reset();
                nextMessage = new InsertCommandMessage(getWriteNamespace(), getWriteConcern(), this.documents.subList(i, this.documents.size()), getCommandEncoder(), this.encoder, getSettings());
                break;
            }
        }
        writer.popMaxDocumentSize();
        writer.writeEndArray();
        return nextMessage;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    public int getItemCount() {
        return this.documents.size();
    }
}
