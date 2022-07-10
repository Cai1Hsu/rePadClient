package com.mongodb;

import java.util.List;
import org.bson.io.OutputBuffer;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class UpdateCommandMessage extends BaseWriteCommandMessage {
    private final DBEncoder encoder;
    private final List<ModifyRequest> updates;

    public UpdateCommandMessage(MongoNamespace writeNamespace, WriteConcern writeConcern, List<ModifyRequest> updates, DBEncoder commandEncoder, DBEncoder encoder, MessageSettings settings) {
        super(writeNamespace, writeConcern, commandEncoder, settings);
        this.updates = updates;
        this.encoder = encoder;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    public UpdateCommandMessage writeTheWrites(OutputBuffer buffer, int commandStartPosition, BSONBinaryWriter writer) {
        UpdateCommandMessage nextMessage = null;
        writer.writeStartArray("updates");
        int i = 0;
        while (true) {
            if (i >= this.updates.size()) {
                break;
            }
            writer.mark();
            ModifyRequest update = this.updates.get(i);
            writer.writeStartDocument();
            writer.pushMaxDocumentSize(getSettings().getMaxDocumentSize());
            writer.writeName("q");
            writer.encodeDocument(getCommandEncoder(), update.getQuery());
            writer.writeName("u");
            writer.encodeDocument(this.encoder, update.getUpdateDocument());
            if (update.isMulti()) {
                writer.writeBoolean("multi", update.isMulti());
            }
            if (update.isUpsert()) {
                writer.writeBoolean("upsert", update.isUpsert());
            }
            writer.popMaxDocumentSize();
            writer.writeEndDocument();
            if (!exceedsLimits(buffer.getPosition() - commandStartPosition, i + 1)) {
                i++;
            } else {
                writer.reset();
                nextMessage = new UpdateCommandMessage(getWriteNamespace(), getWriteConcern(), this.updates.subList(i, this.updates.size()), getCommandEncoder(), this.encoder, getSettings());
                break;
            }
        }
        writer.writeEndArray();
        return nextMessage;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    public int getItemCount() {
        return this.updates.size();
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    protected String getCommandName() {
        return "update";
    }
}
