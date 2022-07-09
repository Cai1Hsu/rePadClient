package com.mongodb;

import java.util.List;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.bson.io.OutputBuffer;

/* loaded from: classes.dex */
class DeleteCommandMessage extends BaseWriteCommandMessage {
    private final List<RemoveRequest> deletes;
    private final DBEncoder queryEncoder;

    public DeleteCommandMessage(MongoNamespace namespace, WriteConcern writeConcern, List<RemoveRequest> deletes, DBEncoder commandEncoder, DBEncoder queryEncoder, MessageSettings settings) {
        super(namespace, writeConcern, commandEncoder, settings);
        this.deletes = deletes;
        this.queryEncoder = queryEncoder;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    protected String getCommandName() {
        return HotDeploymentTool.ACTION_DELETE;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    protected BaseWriteCommandMessage writeTheWrites(OutputBuffer buffer, int commandStartPosition, BSONBinaryWriter writer) {
        DeleteCommandMessage nextMessage = null;
        writer.writeStartArray("deletes");
        int i = 0;
        while (true) {
            if (i >= this.deletes.size()) {
                break;
            }
            writer.mark();
            RemoveRequest remove = this.deletes.get(i);
            writer.writeStartDocument();
            writer.pushMaxDocumentSize(getSettings().getMaxDocumentSize());
            writer.writeName("q");
            writer.encodeDocument(getCommandEncoder(), remove.getQuery());
            writer.writeInt32("limit", remove.isMulti() ? 0 : 1);
            writer.popMaxDocumentSize();
            writer.writeEndDocument();
            if (!exceedsLimits(buffer.getPosition() - commandStartPosition, i + 1)) {
                i++;
            } else {
                writer.reset();
                nextMessage = new DeleteCommandMessage(getWriteNamespace(), getWriteConcern(), this.deletes.subList(i, this.deletes.size()), getCommandEncoder(), this.queryEncoder, getSettings());
                break;
            }
        }
        writer.writeEndArray();
        return nextMessage;
    }

    @Override // com.mongodb.BaseWriteCommandMessage
    public int getItemCount() {
        return this.deletes.size();
    }
}
