package com.mongodb;

import com.mongodb.DBApiLayer;
import com.mongodb.MongoException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import org.bson.BSONObject;
import org.jivesoftware.smackx.Form;

/* loaded from: classes.dex */
class QueryResultIterator implements Cursor {
    private int _batchSize;
    private final DBCollectionImpl _collection;
    private Iterator<DBObject> _cur;
    private int _curSize;
    private long _cursorId;
    private final DBApiLayer _db;
    private final DBDecoder _decoder;
    private final ServerAddress _host;
    private final int _limit;
    private int _numFetched;
    private int _numGetMores;
    private final OptionalFinalizer _optionalFinalizer;
    private final int _options;
    private final List<Integer> _sizes;
    private boolean closed;

    QueryResultIterator(DBApiLayer db, DBCollectionImpl collection, Response res, int batchSize, int limit, int options, DBDecoder decoder) {
        this._sizes = new ArrayList();
        this._numGetMores = 0;
        this._numFetched = 0;
        this._db = db;
        this._collection = collection;
        this._batchSize = batchSize;
        this._limit = limit;
        this._options = options;
        this._host = res._host;
        this._decoder = decoder;
        initFromQueryResponse(res);
        this._optionalFinalizer = getOptionalFinalizer(collection);
    }

    QueryResultIterator(DBObject cursorDocument, DBApiLayer db, DBCollectionImpl collection, int batchSize, DBDecoder decoder, ServerAddress serverAddress) {
        this._sizes = new ArrayList();
        this._numGetMores = 0;
        this._numFetched = 0;
        this._db = db;
        this._collection = collection;
        this._batchSize = batchSize;
        this._host = serverAddress;
        this._limit = 0;
        this._options = 0;
        this._decoder = decoder;
        initFromCursorDocument(cursorDocument);
        this._optionalFinalizer = getOptionalFinalizer(collection);
    }

    static int chooseBatchSize(int batchSize, int limit, int fetched) {
        int res;
        int bs = Math.abs(batchSize);
        int remaining = limit > 0 ? limit - fetched : 0;
        if (bs == 0 && remaining > 0) {
            res = remaining;
        } else if (bs > 0 && remaining == 0) {
            res = bs;
        } else {
            res = Math.min(bs, remaining);
        }
        if (batchSize < 0) {
            res = -res;
        }
        if (res == 1) {
            return -1;
        }
        return res;
    }

    @Override // java.util.Iterator
    public DBObject next() {
        if (this.closed) {
            throw new IllegalStateException("Iterator has been closed");
        }
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        return this._cur.next();
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        if (this.closed) {
            throw new IllegalStateException("Iterator has been closed");
        }
        if (this._cur.hasNext()) {
            return true;
        }
        while (this._cursorId != 0) {
            getMore();
            if (this._curSize > 0) {
                return true;
            }
        }
        return false;
    }

    private void getMore() {
        Response res = this._db._connector.call(this._collection.getDB(), this._collection, OutMessage.getMore(this._collection, this._cursorId, getGetMoreBatchSize()), this._host, this._decoder);
        this._numGetMores++;
        initFromQueryResponse(res);
    }

    private int getGetMoreBatchSize() {
        return chooseBatchSize(this._batchSize, this._limit, this._numFetched);
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("can't remove a document via a query result iterator");
    }

    public void setBatchSize(int size) {
        this._batchSize = size;
    }

    @Override // com.mongodb.Cursor
    public long getCursorId() {
        return this._cursorId;
    }

    int numGetMores() {
        return this._numGetMores;
    }

    List<Integer> getSizes() {
        return Collections.unmodifiableList(this._sizes);
    }

    @Override // com.mongodb.Cursor, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (!this.closed) {
            this.closed = true;
            killCursor();
        }
    }

    private void initFromQueryResponse(Response response) {
        init(response._flags, response.cursor(), response.size(), response.iterator());
    }

    private void initFromCursorDocument(DBObject cursorDocument) {
        Map cursor = (Map) cursorDocument.get("cursor");
        if (cursor != null) {
            long cursorId = ((Long) cursor.get("id")).longValue();
            List<DBObject> firstBatch = (List) cursor.get("firstBatch");
            init(0, cursorId, firstBatch.size(), firstBatch.iterator());
            return;
        }
        List<DBObject> result = (List) cursorDocument.get(Form.TYPE_RESULT);
        init(0, 0L, result.size(), result.iterator());
    }

    private void init(int flags, long cursorId, int size, Iterator<DBObject> iterator) {
        this._curSize = size;
        this._cur = iterator;
        this._sizes.add(Integer.valueOf(size));
        this._numFetched += size;
        throwOnQueryFailure(this._cursorId, flags);
        this._cursorId = cursorId;
        if (cursorId != 0 && this._limit > 0 && this._limit - this._numFetched <= 0) {
            killCursor();
        }
    }

    private void throwOnQueryFailure(long cursorId, int flags) {
        if ((flags & 2) > 0) {
            BSONObject errorDocument = this._cur.next();
            if (ServerError.getCode(errorDocument) == 50) {
                throw new MongoExecutionTimeoutException(ServerError.getCode(errorDocument), ServerError.getMsg(errorDocument, null));
            }
            throw new MongoException(ServerError.getCode(errorDocument), ServerError.getMsg(errorDocument, null));
        } else if ((flags & 1) > 0) {
            throw new MongoException.CursorNotFound(cursorId, this._host);
        }
    }

    void killCursor() {
        if (this._cursorId != 0) {
            try {
                this._db.killCursors(this._host, Arrays.asList(Long.valueOf(this._cursorId)));
                this._cursorId = 0L;
            } catch (MongoException e) {
                this._db.addDeadCursor(new DBApiLayer.DeadCursor(this._cursorId, this._host));
            }
        }
    }

    @Override // com.mongodb.Cursor
    public ServerAddress getServerAddress() {
        return this._host;
    }

    boolean hasFinalizer() {
        return this._optionalFinalizer != null;
    }

    private OptionalFinalizer getOptionalFinalizer(DBCollectionImpl coll) {
        if (!coll.getDB().getMongo().getMongoOptions().isCursorFinalizerEnabled() || this._cursorId == 0) {
            return null;
        }
        return new OptionalFinalizer();
    }

    /* loaded from: classes.dex */
    private class OptionalFinalizer {
        private OptionalFinalizer() {
            QueryResultIterator.this = r1;
        }

        protected void finalize() throws Throwable {
            if (!QueryResultIterator.this.closed && QueryResultIterator.this._cursorId != 0) {
                QueryResultIterator.this._db.addDeadCursor(new DBApiLayer.DeadCursor(QueryResultIterator.this._cursorId, QueryResultIterator.this._host));
            }
            super.finalize();
        }
    }
}
