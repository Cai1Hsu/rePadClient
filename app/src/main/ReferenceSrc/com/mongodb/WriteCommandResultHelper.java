package com.mongodb;

import com.mongodb.WriteRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class WriteCommandResultHelper {
    public static boolean hasError(CommandResult commandResult) {
        return (commandResult.get("writeErrors") == null && commandResult.get("writeConcernError") == null) ? false : true;
    }

    public static BulkWriteResult getBulkWriteResult(WriteRequest.Type type, CommandResult commandResult) {
        int count = getCount(commandResult);
        List<BulkWriteUpsert> upsertedItems = getUpsertedItems(commandResult);
        return new AcknowledgedBulkWriteResult(type, count - upsertedItems.size(), getModifiedCount(type, commandResult), upsertedItems);
    }

    public static BulkWriteException getBulkWriteException(WriteRequest.Type type, CommandResult commandResult) {
        if (!hasError(commandResult)) {
            throw new MongoInternalException("This method should not have been called");
        }
        return new BulkWriteException(getBulkWriteResult(type, commandResult), getWriteErrors(commandResult), getWriteConcernError(commandResult), commandResult.getServerUsed());
    }

    private static List<BulkWriteError> getWriteErrors(CommandResult commandResult) {
        List<BulkWriteError> writeErrors = new ArrayList<>();
        List<DBObject> writeErrorsDocuments = (List) commandResult.get("writeErrors");
        if (writeErrorsDocuments != null) {
            for (DBObject cur : writeErrorsDocuments) {
                writeErrors.add(new BulkWriteError(((Integer) cur.get("code")).intValue(), (String) cur.get("errmsg"), getErrInfo(cur), ((Integer) cur.get("index")).intValue()));
            }
        }
        return writeErrors;
    }

    private static WriteConcernError getWriteConcernError(CommandResult commandResult) {
        DBObject writeConcernErrorDocument = (DBObject) commandResult.get("writeConcernError");
        if (writeConcernErrorDocument == null) {
            return null;
        }
        return new WriteConcernError(((Integer) writeConcernErrorDocument.get("code")).intValue(), (String) writeConcernErrorDocument.get("errmsg"), getErrInfo(writeConcernErrorDocument));
    }

    private static List<BulkWriteUpsert> getUpsertedItems(CommandResult commandResult) {
        List<DBObject> upsertedValue = (List) commandResult.get("upserted");
        if (upsertedValue == null) {
            return Collections.emptyList();
        }
        List<BulkWriteUpsert> bulkWriteUpsertList = new ArrayList<>();
        for (DBObject upsertedItem : upsertedValue) {
            bulkWriteUpsertList.add(new BulkWriteUpsert(((Number) upsertedItem.get("index")).intValue(), upsertedItem.get("_id")));
        }
        return bulkWriteUpsertList;
    }

    private static int getCount(CommandResult commandResult) {
        return commandResult.getInt("n");
    }

    private static Integer getModifiedCount(WriteRequest.Type type, CommandResult commandResult) {
        Integer modifiedCount = (Integer) commandResult.get("nModified");
        if (modifiedCount == null && type != WriteRequest.Type.UPDATE && type != WriteRequest.Type.REPLACE) {
            return 0;
        }
        return modifiedCount;
    }

    private static DBObject getErrInfo(DBObject response) {
        DBObject errInfo = (DBObject) response.get("errInfo");
        return errInfo != null ? errInfo : new BasicDBObject();
    }

    private WriteCommandResultHelper() {
    }
}
