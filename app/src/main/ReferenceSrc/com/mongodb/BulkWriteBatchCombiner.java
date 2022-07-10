package com.mongodb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class BulkWriteBatchCombiner {
    private int insertedCount;
    private int matchedCount;
    private final boolean ordered;
    private int removedCount;
    private final ServerAddress serverAddress;
    private final WriteConcern writeConcern;
    private Integer modifiedCount = 0;
    private final Set<BulkWriteUpsert> writeUpserts = new TreeSet(new AnonymousClass1());
    private final Set<BulkWriteError> writeErrors = new TreeSet(new AnonymousClass2());
    private final List<WriteConcernError> writeConcernErrors = new ArrayList();

    /* renamed from: com.mongodb.BulkWriteBatchCombiner$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Comparator<BulkWriteUpsert> {
        AnonymousClass1() {
            BulkWriteBatchCombiner.this = r1;
        }

        public int compare(BulkWriteUpsert o1, BulkWriteUpsert o2) {
            if (o1.getIndex() < o2.getIndex()) {
                return -1;
            }
            return o1.getIndex() == o2.getIndex() ? 0 : 1;
        }
    }

    /* renamed from: com.mongodb.BulkWriteBatchCombiner$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements Comparator<BulkWriteError> {
        AnonymousClass2() {
            BulkWriteBatchCombiner.this = r1;
        }

        public int compare(BulkWriteError o1, BulkWriteError o2) {
            if (o1.getIndex() < o2.getIndex()) {
                return -1;
            }
            return o1.getIndex() == o2.getIndex() ? 0 : 1;
        }
    }

    public BulkWriteBatchCombiner(ServerAddress serverAddress, WriteConcern writeConcern) {
        this.writeConcern = (WriteConcern) Assertions.notNull("writeConcern", writeConcern);
        this.ordered = !writeConcern.getContinueOnError();
        this.serverAddress = (ServerAddress) Assertions.notNull("serverAddress", serverAddress);
    }

    public void addResult(BulkWriteResult result, IndexMap indexMap) {
        this.insertedCount += result.getInsertedCount();
        this.matchedCount += result.getMatchedCount();
        this.removedCount += result.getRemovedCount();
        if (result.isModifiedCountAvailable() && this.modifiedCount != null) {
            this.modifiedCount = Integer.valueOf(this.modifiedCount.intValue() + result.getModifiedCount());
        } else {
            this.modifiedCount = null;
        }
        mergeUpserts(result.getUpserts(), indexMap);
    }

    public void addErrorResult(BulkWriteException exception, IndexMap indexMap) {
        addResult(exception.getWriteResult(), indexMap);
        mergeWriteErrors(exception.getWriteErrors(), indexMap);
        mergeWriteConcernError(exception.getWriteConcernError());
    }

    public void addWriteErrorResult(BulkWriteError writeError, IndexMap indexMap) {
        Assertions.notNull("writeError", writeError);
        mergeWriteErrors(Arrays.asList(writeError), indexMap);
    }

    public void addWriteConcernErrorResult(WriteConcernError writeConcernError) {
        Assertions.notNull("writeConcernError", writeConcernError);
        mergeWriteConcernError(writeConcernError);
    }

    public void addErrorResult(List<BulkWriteError> writeErrors, WriteConcernError writeConcernError, IndexMap indexMap) {
        mergeWriteErrors(writeErrors, indexMap);
        mergeWriteConcernError(writeConcernError);
    }

    private void mergeWriteConcernError(WriteConcernError writeConcernError) {
        if (writeConcernError != null) {
            if (this.writeConcernErrors.isEmpty()) {
                this.writeConcernErrors.add(writeConcernError);
            } else if (!writeConcernError.equals(this.writeConcernErrors.get(this.writeConcernErrors.size() - 1))) {
                this.writeConcernErrors.add(writeConcernError);
            }
        }
    }

    private void mergeWriteErrors(List<BulkWriteError> newWriteErrors, IndexMap indexMap) {
        for (BulkWriteError cur : newWriteErrors) {
            this.writeErrors.add(new BulkWriteError(cur.getCode(), cur.getMessage(), cur.getDetails(), indexMap.map(cur.getIndex())));
        }
    }

    private void mergeUpserts(List<BulkWriteUpsert> upserts, IndexMap indexMap) {
        for (BulkWriteUpsert bulkWriteUpsert : upserts) {
            this.writeUpserts.add(new BulkWriteUpsert(indexMap.map(bulkWriteUpsert.getIndex()), bulkWriteUpsert.getId()));
        }
    }

    public BulkWriteResult getResult() {
        throwOnError();
        return createResult();
    }

    public boolean shouldStopSendingMoreBatches() {
        return this.ordered && hasWriteErrors();
    }

    private void throwOnError() {
        if (!this.writeErrors.isEmpty() || !this.writeConcernErrors.isEmpty()) {
            throw new BulkWriteException(createResult(), new ArrayList(this.writeErrors), this.writeConcernErrors.isEmpty() ? null : this.writeConcernErrors.get(this.writeConcernErrors.size() - 1), this.serverAddress);
        }
    }

    private BulkWriteResult createResult() {
        return this.writeConcern.callGetLastError() ? new AcknowledgedBulkWriteResult(this.insertedCount, this.matchedCount, this.removedCount, this.modifiedCount, new ArrayList(this.writeUpserts)) : new UnacknowledgedBulkWriteResult();
    }

    private boolean hasWriteErrors() {
        return !this.writeErrors.isEmpty();
    }
}
