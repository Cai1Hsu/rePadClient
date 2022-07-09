package com.mongodb;

import com.mongodb.DBPort;
import com.mongodb.MongoException;
import com.mongodb.WriteRequest;
import com.mongodb.util.JSON;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.io.OutputBuffer;
import org.bson.io.PoolOutputBuffer;
import org.bson.types.ObjectId;
import org.bson.util.Assertions;

/* loaded from: classes.dex */
class DBCollectionImpl extends DBCollection {
    private static final int QUERY_DOCUMENT_HEADROOM = 16384;
    private static final Level TRACE_LEVEL;
    private static final Logger TRACE_LOGGER = Logger.getLogger("com.mongodb.TRACE");
    private final DBApiLayer db;
    private final String namespace;

    DBCollectionImpl(DBApiLayer db, String name) {
        super(db, name);
        this.namespace = db._root + "." + name;
        this.db = db;
    }

    @Override // com.mongodb.DBCollection
    QueryResultIterator find(DBObject ref, DBObject fields, int numToSkip, int batchSize, int limit, int options, ReadPreference readPref, DBDecoder decoder) {
        return find(ref, fields, numToSkip, batchSize, limit, options, readPref, decoder, DefaultDBEncoder.FACTORY.create());
    }

    @Override // com.mongodb.DBCollection
    QueryResultIterator find(DBObject ref, DBObject fields, int numToSkip, int batchSize, int limit, int options, ReadPreference readPref, DBDecoder decoder, DBEncoder encoder) {
        if (ref == null) {
            ref = new BasicDBObject();
        }
        if (willTrace()) {
            trace("find: " + this.namespace + " " + JSON.serialize(ref));
        }
        OutMessage query = OutMessage.query(this, options, numToSkip, QueryResultIterator.chooseBatchSize(batchSize, limit, 0), ref, fields, readPref, encoder, this.db.getMongo().getMaxBsonObjectSize() + 16384);
        Response res = this.db.getConnector().call(this._db, this, query, null, 2, readPref, decoder);
        return new QueryResultIterator(this.db, this, res, batchSize, limit, options, decoder);
    }

    @Override // com.mongodb.DBCollection
    public Cursor aggregate(List<DBObject> pipeline, AggregationOptions options, ReadPreference readPreference) {
        if (options == null) {
            throw new IllegalArgumentException("options can not be null");
        }
        DBObject last = pipeline.get(pipeline.size() - 1);
        DBObject command = prepareCommand(pipeline, options);
        CommandResult res = this._db.command(command, getOptions(), readPreference);
        res.throwOnError();
        String outCollection = (String) last.get("$out");
        if (outCollection != null) {
            DBCollection collection = this._db.getCollection(outCollection);
            return new DBCursor(collection, new BasicDBObject(), null, ReadPreference.primary());
        }
        Integer batchSize = options.getBatchSize();
        return new QueryResultIterator(res, this.db, this, batchSize == null ? 0 : batchSize.intValue(), getDecoder(), res.getServerUsed());
    }

    @Override // com.mongodb.DBCollection
    public List<Cursor> parallelScan(ParallelScanOptions options) {
        CommandResult res = this._db.command(new BasicDBObject("parallelCollectionScan", getName()).append("numCursors", (Object) Integer.valueOf(options.getNumCursors())), options.getReadPreference());
        res.throwOnError();
        List<Cursor> cursors = new ArrayList<>();
        for (DBObject cursorDocument : (List) res.get("cursors")) {
            cursors.add(new QueryResultIterator(cursorDocument, this.db, this, options.getBatchSize(), getDecoder(), res.getServerUsed()));
        }
        return cursors;
    }

    @Override // com.mongodb.DBCollection
    BulkWriteResult executeBulkWriteOperation(boolean ordered, List<WriteRequest> writeRequests, WriteConcern writeConcern, DBEncoder encoder) {
        Assertions.isTrue("no operations", !writeRequests.isEmpty());
        if (writeConcern == null) {
            throw new IllegalArgumentException("Write concern can not be null");
        }
        if (encoder == null) {
            encoder = DefaultDBEncoder.FACTORY.create();
        }
        DBPort port = this.db.getConnector().getPrimaryPort();
        try {
            BulkWriteBatchCombiner bulkWriteBatchCombiner = new BulkWriteBatchCombiner(port.getAddress(), writeConcern);
            for (Run run : getRunGenerator(ordered, writeRequests, writeConcern, encoder, port)) {
                try {
                    BulkWriteResult result = run.execute(port);
                    if (result.isAcknowledged()) {
                        bulkWriteBatchCombiner.addResult(result, run.indexMap);
                    }
                } catch (BulkWriteException e) {
                    bulkWriteBatchCombiner.addErrorResult(e, run.indexMap);
                    if (bulkWriteBatchCombiner.shouldStopSendingMoreBatches()) {
                        break;
                    }
                }
            }
            return bulkWriteBatchCombiner.getResult();
        } finally {
            this.db.getConnector().releasePort(port);
        }
    }

    @Override // com.mongodb.DBCollection
    public WriteResult insert(List<DBObject> list, WriteConcern concern, DBEncoder encoder) {
        return insert(list, true, concern, encoder);
    }

    protected WriteResult insert(List<DBObject> list, boolean shouldApply, WriteConcern concern, DBEncoder encoder) {
        WriteResult insertWithWriteProtocol;
        if (concern == null) {
            throw new IllegalArgumentException("Write concern can not be null");
        }
        if (encoder == null) {
            encoder = DefaultDBEncoder.FACTORY.create();
        }
        if (willTrace()) {
            for (DBObject o : list) {
                trace("save:  " + this.namespace + " " + JSON.serialize(o));
            }
        }
        DBPort port = this.db.getConnector().getPrimaryPort();
        try {
            if (useWriteCommands(concern, port)) {
                try {
                    insertWithWriteProtocol = translateBulkWriteResult(insertWithCommandProtocol(list, concern, encoder, port, shouldApply), WriteRequest.Type.INSERT, concern, port.getAddress());
                } catch (BulkWriteException e) {
                    throw translateBulkWriteException(e, WriteRequest.Type.INSERT);
                }
            } else {
                insertWithWriteProtocol = insertWithWriteProtocol(list, concern, encoder, port, shouldApply);
            }
            return insertWithWriteProtocol;
        } finally {
            this.db.getConnector().releasePort(port);
        }
    }

    @Override // com.mongodb.DBCollection
    public WriteResult remove(DBObject query, WriteConcern concern, DBEncoder encoder) {
        return remove(query, true, concern, encoder);
    }

    public WriteResult remove(DBObject query, boolean multi, WriteConcern concern, DBEncoder encoder) {
        WriteResult say;
        if (concern == null) {
            throw new IllegalArgumentException("Write concern can not be null");
        }
        if (encoder == null) {
            encoder = DefaultDBEncoder.FACTORY.create();
        }
        if (willTrace()) {
            trace("remove: " + this.namespace + " " + JSON.serialize(query));
        }
        DBPort port = this.db.getConnector().getPrimaryPort();
        try {
            if (useWriteCommands(concern, port)) {
                try {
                    say = translateBulkWriteResult(removeWithCommandProtocol(Arrays.asList(new RemoveRequest(query, multi)), concern, encoder, port), WriteRequest.Type.REMOVE, concern, port.getAddress());
                } catch (BulkWriteException e) {
                    throw translateBulkWriteException(e, WriteRequest.Type.REMOVE);
                }
            } else {
                say = this.db.getConnector().say(this._db, OutMessage.remove(this, encoder, query, multi), concern, port);
            }
            return say;
        } finally {
            this.db.getConnector().releasePort(port);
        }
    }

    @Override // com.mongodb.DBCollection
    public WriteResult update(DBObject query, DBObject o, boolean upsert, boolean multi, WriteConcern concern, DBEncoder encoder) {
        WriteResult say;
        if (o == null) {
            throw new IllegalArgumentException("update can not be null");
        }
        if (concern == null) {
            throw new IllegalArgumentException("Write concern can not be null");
        }
        if (encoder == null) {
            encoder = DefaultDBEncoder.FACTORY.create();
        }
        if (!o.keySet().isEmpty()) {
            String key = o.keySet().iterator().next();
            if (!key.startsWith("$")) {
                _checkObject(o, false, false);
            }
        }
        if (willTrace()) {
            trace("update: " + this.namespace + " " + JSON.serialize(query) + " " + JSON.serialize(o));
        }
        DBPort port = this.db.getConnector().getPrimaryPort();
        try {
            if (useWriteCommands(concern, port)) {
                try {
                    BulkWriteResult bulkWriteResult = updateWithCommandProtocol(Arrays.asList(new UpdateRequest(query, upsert, o, multi)), concern, encoder, port);
                    say = translateBulkWriteResult(bulkWriteResult, WriteRequest.Type.UPDATE, concern, port.getAddress());
                } catch (BulkWriteException e) {
                    throw translateBulkWriteException(e, WriteRequest.Type.UPDATE);
                }
            } else {
                say = this.db.getConnector().say(this._db, OutMessage.update(this, encoder, upsert, multi, query, o), concern, port);
            }
            return say;
        } finally {
            this.db.getConnector().releasePort(port);
        }
    }

    @Override // com.mongodb.DBCollection
    public void drop() {
        this.db._collections.remove(getName());
        super.drop();
    }

    @Override // com.mongodb.DBCollection
    public void doapply(DBObject o) {
    }

    private WriteResult translateBulkWriteResult(BulkWriteResult bulkWriteResult, WriteRequest.Type type, WriteConcern writeConcern, ServerAddress serverAddress) {
        CommandResult commandResult = new CommandResult(serverAddress);
        addBulkWriteResultToCommandResult(bulkWriteResult, type, commandResult);
        return new WriteResult(commandResult, writeConcern);
    }

    private MongoException translateBulkWriteException(BulkWriteException e, WriteRequest.Type type) {
        BulkWriteError lastError = e.getWriteErrors().isEmpty() ? null : e.getWriteErrors().get(e.getWriteErrors().size() - 1);
        CommandResult commandResult = new CommandResult(e.getServerAddress());
        addBulkWriteResultToCommandResult(e.getWriteResult(), type, commandResult);
        if (e.getWriteConcernError() != null) {
            commandResult.putAll(e.getWriteConcernError().getDetails());
        }
        if (lastError != null) {
            commandResult.put("err", (Object) lastError.getMessage());
            commandResult.put("code", (Object) Integer.valueOf(lastError.getCode()));
            commandResult.putAll(lastError.getDetails());
        } else if (e.getWriteConcernError() != null) {
            commandResult.put("err", (Object) e.getWriteConcernError().getMessage());
            commandResult.put("code", (Object) Integer.valueOf(e.getWriteConcernError().getCode()));
        }
        return commandResult.getException();
    }

    private void addBulkWriteResultToCommandResult(BulkWriteResult bulkWriteResult, WriteRequest.Type type, CommandResult commandResult) {
        commandResult.put("ok", (Object) 1);
        if (type == WriteRequest.Type.INSERT) {
            commandResult.put("n", (Object) 0);
        } else if (type == WriteRequest.Type.REMOVE) {
            commandResult.put("n", (Object) Integer.valueOf(bulkWriteResult.getRemovedCount()));
        } else if (type == WriteRequest.Type.UPDATE || type == WriteRequest.Type.REPLACE) {
            commandResult.put("n", (Object) Integer.valueOf(bulkWriteResult.getMatchedCount() + bulkWriteResult.getUpserts().size()));
            if (bulkWriteResult.getMatchedCount() > 0) {
                commandResult.put("updatedExisting", (Object) true);
            } else {
                commandResult.put("updatedExisting", (Object) false);
            }
            if (!bulkWriteResult.getUpserts().isEmpty()) {
                commandResult.put("upserted", bulkWriteResult.getUpserts().get(0).getId());
            }
        }
    }

    @Override // com.mongodb.DBCollection
    public void createIndex(DBObject keys, DBObject options, DBEncoder encoder) {
        DBTCPConnector connector = this.db.getConnector();
        final DBPort port = this.db.getConnector().getPrimaryPort();
        try {
            DBObject index = defaultOptions(keys);
            index.putAll(options);
            index.put("key", keys);
            if (connector.getServerDescription(port.getAddress()).getVersion().compareTo(new ServerVersion(2, 6)) >= 0) {
                final BasicDBObject createIndexes = new BasicDBObject("createIndexes", getName());
                BasicDBList list = new BasicDBList();
                list.add(index);
                createIndexes.put("indexes", (Object) list);
                CommandResult commandResult = (CommandResult) connector.doOperation(this.db, port, new DBPort.Operation<CommandResult>() { // from class: com.mongodb.DBCollectionImpl.1
                    @Override // com.mongodb.DBPort.Operation
                    public CommandResult execute() throws IOException {
                        return port.runCommand(DBCollectionImpl.this.db, createIndexes);
                    }
                });
                try {
                    commandResult.throwOnError();
                } catch (CommandFailureException e) {
                    if (e.getCode() == 11000) {
                        throw new MongoException.DuplicateKey(commandResult);
                    }
                    throw e;
                }
            } else {
                this.db.doGetCollection("system.indexes").insertWithWriteProtocol(Arrays.asList(index), WriteConcern.SAFE, DefaultDBEncoder.FACTORY.create(), port, false);
            }
        } finally {
            connector.releasePort(port);
        }
    }

    public BulkWriteResult insertWithCommandProtocol(List<DBObject> list, WriteConcern writeConcern, DBEncoder encoder, DBPort port, boolean shouldApply) {
        if (shouldApply) {
            applyRulesForInsert(list);
        }
        BaseWriteCommandMessage message = new InsertCommandMessage(getNamespace(), writeConcern, list, DefaultDBEncoder.FACTORY.create(), encoder, getMessageSettings(port));
        return writeWithCommandProtocol(port, WriteRequest.Type.INSERT, message, writeConcern);
    }

    private void applyRulesForInsert(List<DBObject> list) {
        for (DBObject o : list) {
            _checkObject(o, false, false);
            apply(o);
            Object id = o.get("_id");
            if (id instanceof ObjectId) {
                ((ObjectId) id).notNew();
            }
        }
    }

    public BulkWriteResult removeWithCommandProtocol(List<RemoveRequest> removeList, WriteConcern writeConcern, DBEncoder encoder, DBPort port) {
        BaseWriteCommandMessage message = new DeleteCommandMessage(getNamespace(), writeConcern, removeList, DefaultDBEncoder.FACTORY.create(), encoder, getMessageSettings(port));
        return writeWithCommandProtocol(port, WriteRequest.Type.REMOVE, message, writeConcern);
    }

    public BulkWriteResult updateWithCommandProtocol(List<ModifyRequest> updates, WriteConcern writeConcern, DBEncoder encoder, DBPort port) {
        BaseWriteCommandMessage message = new UpdateCommandMessage(getNamespace(), writeConcern, updates, DefaultDBEncoder.FACTORY.create(), encoder, getMessageSettings(port));
        return writeWithCommandProtocol(port, WriteRequest.Type.UPDATE, message, writeConcern);
    }

    private BulkWriteResult writeWithCommandProtocol(DBPort port, WriteRequest.Type type, BaseWriteCommandMessage message, WriteConcern writeConcern) {
        int batchNum = 0;
        int currentRangeStartIndex = 0;
        BulkWriteBatchCombiner bulkWriteBatchCombiner = new BulkWriteBatchCombiner(port.getAddress(), writeConcern);
        do {
            batchNum++;
            BaseWriteCommandMessage nextMessage = sendWriteCommandMessage(message, batchNum, port);
            int itemCount = nextMessage != null ? message.getItemCount() - nextMessage.getItemCount() : message.getItemCount();
            IndexMap indexMap = IndexMap.create(currentRangeStartIndex, itemCount);
            CommandResult commandResult = receiveWriteCommandMessage(port);
            if ((willTrace() && nextMessage != null) || batchNum > 1) {
                getLogger().fine(String.format("Received response for batch %d", Integer.valueOf(batchNum)));
            }
            if (WriteCommandResultHelper.hasError(commandResult)) {
                bulkWriteBatchCombiner.addErrorResult(WriteCommandResultHelper.getBulkWriteException(type, commandResult), indexMap);
            } else {
                bulkWriteBatchCombiner.addResult(WriteCommandResultHelper.getBulkWriteResult(type, commandResult), indexMap);
            }
            currentRangeStartIndex += itemCount;
            message = nextMessage;
            if (message == null) {
                break;
            }
        } while (!bulkWriteBatchCombiner.shouldStopSendingMoreBatches());
        return bulkWriteBatchCombiner.getResult();
    }

    public boolean useWriteCommands(WriteConcern concern, DBPort port) {
        return concern.callGetLastError() && this.db.getConnector().getServerDescription(port.getAddress()).getVersion().compareTo(new ServerVersion(2, 6)) >= 0;
    }

    private MessageSettings getMessageSettings(DBPort port) {
        ServerDescription serverDescription = this.db.getConnector().getServerDescription(port.getAddress());
        return MessageSettings.builder().maxDocumentSize(serverDescription.getMaxDocumentSize()).maxMessageSize(serverDescription.getMaxMessageSize()).maxWriteBatchSize(serverDescription.getMaxWriteBatchSize()).build();
    }

    public int getMaxWriteBatchSize(DBPort port) {
        return this.db.getConnector().getServerDescription(port.getAddress()).getMaxWriteBatchSize();
    }

    private MongoNamespace getNamespace() {
        return new MongoNamespace(getDB().getName(), getName());
    }

    private BaseWriteCommandMessage sendWriteCommandMessage(BaseWriteCommandMessage message, int batchNum, final DBPort port) {
        final PoolOutputBuffer buffer = new PoolOutputBuffer();
        try {
            BaseWriteCommandMessage nextMessage = message.encode((OutputBuffer) buffer);
            if (nextMessage != null || batchNum > 1) {
                getLogger().fine(String.format("Sending batch %d", Integer.valueOf(batchNum)));
            }
            this.db.getConnector().doOperation(getDB(), port, new DBPort.Operation<Void>() { // from class: com.mongodb.DBCollectionImpl.2
                @Override // com.mongodb.DBPort.Operation
                public Void execute() throws IOException {
                    buffer.pipe(port.getOutputStream());
                    return null;
                }
            });
            return nextMessage;
        } finally {
            buffer.reset();
        }
    }

    private CommandResult receiveWriteCommandMessage(final DBPort port) {
        return (CommandResult) this.db.getConnector().doOperation(getDB(), port, new DBPort.Operation<CommandResult>() { // from class: com.mongodb.DBCollectionImpl.3
            @Override // com.mongodb.DBPort.Operation
            public CommandResult execute() throws IOException {
                Response response = new Response(port.getAddress(), null, port.getInputStream(), DefaultDBDecoder.FACTORY.create());
                CommandResult writeCommandResult = new CommandResult(port.getAddress());
                writeCommandResult.putAll(response.get(0));
                writeCommandResult.throwOnError();
                return writeCommandResult;
            }
        });
    }

    private WriteResult insertWithWriteProtocol(List<DBObject> list, WriteConcern concern, DBEncoder encoder, DBPort port, boolean shouldApply) {
        if (shouldApply) {
            applyRulesForInsert(list);
        }
        WriteResult last = null;
        int cur = 0;
        int maxsize = this.db._mongo.getMaxBsonObjectSize();
        while (cur < list.size()) {
            OutMessage om = OutMessage.insert(this, encoder, concern);
            while (true) {
                if (cur < list.size()) {
                    DBObject o = list.get(cur);
                    om.putObject(o);
                    if (om.size() <= maxsize * 2) {
                        cur++;
                    } else {
                        cur++;
                        break;
                    }
                }
            }
            last = this.db.getConnector().say(this._db, om, concern, port);
        }
        return last;
    }

    private Iterable<Run> getRunGenerator(boolean ordered, List<WriteRequest> writeRequests, WriteConcern writeConcern, DBEncoder encoder, DBPort port) {
        return ordered ? new OrderedRunGenerator(writeRequests, writeConcern, encoder, port) : new UnorderedRunGenerator(writeRequests, writeConcern, encoder, port);
    }

    static {
        TRACE_LEVEL = Boolean.getBoolean("DB.TRACE") ? Level.INFO : Level.FINEST;
    }

    private boolean willTrace() {
        return TRACE_LOGGER.isLoggable(TRACE_LEVEL);
    }

    private void trace(String s) {
        TRACE_LOGGER.log(TRACE_LEVEL, s);
    }

    private Logger getLogger() {
        return TRACE_LOGGER;
    }

    /* loaded from: classes.dex */
    private class OrderedRunGenerator implements Iterable<Run> {
        private final DBEncoder encoder;
        private final int maxBatchWriteSize;
        private final WriteConcern writeConcern;
        private final List<WriteRequest> writeRequests;

        public OrderedRunGenerator(List<WriteRequest> writeRequests, WriteConcern writeConcern, DBEncoder encoder, DBPort port) {
            DBCollectionImpl.this = r2;
            this.writeRequests = writeRequests;
            this.writeConcern = writeConcern.continueOnError(false);
            this.encoder = encoder;
            this.maxBatchWriteSize = r2.getMaxWriteBatchSize(port);
        }

        @Override // java.lang.Iterable
        public Iterator<Run> iterator() {
            return new Iterator<Run>() { // from class: com.mongodb.DBCollectionImpl.OrderedRunGenerator.1
                private int curIndex;

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.curIndex < OrderedRunGenerator.this.writeRequests.size();
                }

                @Override // java.util.Iterator
                public Run next() {
                    Run run = new Run(((WriteRequest) OrderedRunGenerator.this.writeRequests.get(this.curIndex)).getType(), OrderedRunGenerator.this.writeConcern, OrderedRunGenerator.this.encoder);
                    int startIndexOfNextRun = getStartIndexOfNextRun();
                    for (int i = this.curIndex; i < startIndexOfNextRun; i++) {
                        run.add((WriteRequest) OrderedRunGenerator.this.writeRequests.get(i), i);
                    }
                    this.curIndex = startIndexOfNextRun;
                    return run;
                }

                private int getStartIndexOfNextRun() {
                    WriteRequest.Type type = ((WriteRequest) OrderedRunGenerator.this.writeRequests.get(this.curIndex)).getType();
                    int i = this.curIndex;
                    while (i < OrderedRunGenerator.this.writeRequests.size()) {
                        if (i != this.curIndex + OrderedRunGenerator.this.maxBatchWriteSize && ((WriteRequest) OrderedRunGenerator.this.writeRequests.get(i)).getType() == type) {
                            i++;
                        } else {
                            return i;
                        }
                    }
                    int i2 = OrderedRunGenerator.this.writeRequests.size();
                    return i2;
                }

                @Override // java.util.Iterator
                public void remove() {
                    throw new UnsupportedOperationException("Not implemented");
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private class UnorderedRunGenerator implements Iterable<Run> {
        private final DBEncoder encoder;
        private final int maxBatchWriteSize;
        private final WriteConcern writeConcern;
        private final List<WriteRequest> writeRequests;

        public UnorderedRunGenerator(List<WriteRequest> writeRequests, WriteConcern writeConcern, DBEncoder encoder, DBPort port) {
            DBCollectionImpl.this = r2;
            this.writeRequests = writeRequests;
            this.writeConcern = writeConcern.continueOnError(true);
            this.encoder = encoder;
            this.maxBatchWriteSize = r2.getMaxWriteBatchSize(port);
        }

        @Override // java.lang.Iterable
        public Iterator<Run> iterator() {
            return new Iterator<Run>() { // from class: com.mongodb.DBCollectionImpl.UnorderedRunGenerator.1
                private int curIndex;
                private final Map<WriteRequest.Type, Run> runs = new TreeMap(new Comparator<WriteRequest.Type>() { // from class: com.mongodb.DBCollectionImpl.UnorderedRunGenerator.1.1
                    public int compare(WriteRequest.Type first, WriteRequest.Type second) {
                        return first.compareTo(second);
                    }
                });

                @Override // java.util.Iterator
                public boolean hasNext() {
                    return this.curIndex < UnorderedRunGenerator.this.writeRequests.size() || !this.runs.isEmpty();
                }

                @Override // java.util.Iterator
                public Run next() {
                    while (this.curIndex < UnorderedRunGenerator.this.writeRequests.size()) {
                        WriteRequest writeRequest = (WriteRequest) UnorderedRunGenerator.this.writeRequests.get(this.curIndex);
                        Run run = this.runs.get(writeRequest.getType());
                        if (run == null) {
                            run = new Run(writeRequest.getType(), UnorderedRunGenerator.this.writeConcern, UnorderedRunGenerator.this.encoder);
                            this.runs.put(run.type, run);
                        }
                        run.add(writeRequest, this.curIndex);
                        this.curIndex++;
                        if (run.size() == UnorderedRunGenerator.this.maxBatchWriteSize) {
                            return this.runs.remove(run.type);
                        }
                    }
                    return this.runs.remove(this.runs.keySet().iterator().next());
                }

                @Override // java.util.Iterator
                public void remove() {
                    throw new UnsupportedOperationException("Not implemented");
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private class Run {
        private final DBEncoder encoder;
        private final WriteRequest.Type type;
        private final WriteConcern writeConcern;
        private final List<WriteRequest> writeRequests = new ArrayList();
        private IndexMap indexMap = IndexMap.create();

        Run(WriteRequest.Type type, WriteConcern writeConcern, DBEncoder encoder) {
            DBCollectionImpl.this = r2;
            this.type = type;
            this.writeConcern = writeConcern;
            this.encoder = encoder;
        }

        void add(WriteRequest writeRequest, int originalIndex) {
            this.indexMap = this.indexMap.add(this.writeRequests.size(), originalIndex);
            this.writeRequests.add(writeRequest);
        }

        public int size() {
            return this.writeRequests.size();
        }

        BulkWriteResult execute(DBPort port) {
            if (this.type == WriteRequest.Type.UPDATE) {
                return executeUpdates(getWriteRequestsAsModifyRequests(), port);
            }
            if (this.type == WriteRequest.Type.REPLACE) {
                return executeReplaces(getWriteRequestsAsModifyRequests(), port);
            }
            if (this.type == WriteRequest.Type.INSERT) {
                return executeInserts(getWriteRequestsAsInsertRequests(), port);
            }
            if (this.type == WriteRequest.Type.REMOVE) {
                return executeRemoves(getWriteRequestsAsRemoveRequests(), port);
            }
            throw new MongoInternalException(String.format("Unsupported write of type %s", this.type));
        }

        private List getWriteRequestsAsRaw() {
            return this.writeRequests;
        }

        private List<RemoveRequest> getWriteRequestsAsRemoveRequests() {
            return getWriteRequestsAsRaw();
        }

        private List<InsertRequest> getWriteRequestsAsInsertRequests() {
            return getWriteRequestsAsRaw();
        }

        private List<ModifyRequest> getWriteRequestsAsModifyRequests() {
            return getWriteRequestsAsRaw();
        }

        BulkWriteResult executeUpdates(final List<ModifyRequest> updateRequests, final DBPort port) {
            for (ModifyRequest request : updateRequests) {
                for (String key : request.getUpdateDocument().keySet()) {
                    if (!key.startsWith("$")) {
                        throw new IllegalArgumentException("Update document keys must start with $: " + key);
                    }
                }
            }
            return new RunExecutor(port) { // from class: com.mongodb.DBCollectionImpl.Run.1
                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                BulkWriteResult executeWriteCommandProtocol() {
                    return DBCollectionImpl.this.updateWithCommandProtocol(updateRequests, Run.this.writeConcern, Run.this.encoder, port);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteResult executeWriteProtocol(int i) {
                    ModifyRequest update = (ModifyRequest) updateRequests.get(i);
                    WriteResult writeResult = DBCollectionImpl.this.update(update.getQuery(), update.getUpdateDocument(), update.isUpsert(), update.isMulti(), Run.this.writeConcern, Run.this.encoder);
                    return addMissingUpserted(update, writeResult);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteRequest.Type getType() {
                    return WriteRequest.Type.UPDATE;
                }
            }.execute();
        }

        BulkWriteResult executeReplaces(final List<ModifyRequest> replaceRequests, final DBPort port) {
            for (ModifyRequest request : replaceRequests) {
                DBCollectionImpl.this._checkObject(request.getUpdateDocument(), false, false);
            }
            return new RunExecutor(port) { // from class: com.mongodb.DBCollectionImpl.Run.2
                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                BulkWriteResult executeWriteCommandProtocol() {
                    return DBCollectionImpl.this.updateWithCommandProtocol(replaceRequests, Run.this.writeConcern, Run.this.encoder, port);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteResult executeWriteProtocol(int i) {
                    ModifyRequest update = (ModifyRequest) replaceRequests.get(i);
                    WriteResult writeResult = DBCollectionImpl.this.update(update.getQuery(), update.getUpdateDocument(), update.isUpsert(), update.isMulti(), Run.this.writeConcern, Run.this.encoder);
                    return addMissingUpserted(update, writeResult);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteRequest.Type getType() {
                    return WriteRequest.Type.REPLACE;
                }
            }.execute();
        }

        BulkWriteResult executeRemoves(final List<RemoveRequest> removeRequests, final DBPort port) {
            return new RunExecutor(port) { // from class: com.mongodb.DBCollectionImpl.Run.3
                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                BulkWriteResult executeWriteCommandProtocol() {
                    return DBCollectionImpl.this.removeWithCommandProtocol(removeRequests, Run.this.writeConcern, Run.this.encoder, port);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteResult executeWriteProtocol(int i) {
                    RemoveRequest removeRequest = (RemoveRequest) removeRequests.get(i);
                    return DBCollectionImpl.this.remove(removeRequest.getQuery(), removeRequest.isMulti(), Run.this.writeConcern, Run.this.encoder);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteRequest.Type getType() {
                    return WriteRequest.Type.REMOVE;
                }
            }.execute();
        }

        BulkWriteResult executeInserts(final List<InsertRequest> insertRequests, final DBPort port) {
            return new RunExecutor(port) { // from class: com.mongodb.DBCollectionImpl.Run.4
                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                BulkWriteResult executeWriteCommandProtocol() {
                    List<DBObject> documents = new ArrayList<>(insertRequests.size());
                    for (InsertRequest cur : insertRequests) {
                        documents.add(cur.getDocument());
                    }
                    return DBCollectionImpl.this.insertWithCommandProtocol(documents, Run.this.writeConcern, Run.this.encoder, port, true);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteResult executeWriteProtocol(int i) {
                    return DBCollectionImpl.this.insert(Arrays.asList(((InsertRequest) insertRequests.get(i)).getDocument()), Run.this.writeConcern, Run.this.encoder);
                }

                @Override // com.mongodb.DBCollectionImpl.Run.RunExecutor
                WriteRequest.Type getType() {
                    return WriteRequest.Type.INSERT;
                }
            }.execute();
        }

        /* loaded from: classes.dex */
        private abstract class RunExecutor {
            private final DBPort port;

            abstract BulkWriteResult executeWriteCommandProtocol();

            abstract WriteResult executeWriteProtocol(int i);

            abstract WriteRequest.Type getType();

            RunExecutor(DBPort port) {
                Run.this = r1;
                this.port = port;
            }

            BulkWriteResult getResult(WriteResult writeResult) {
                int count = getCount(writeResult);
                List<BulkWriteUpsert> upsertedItems = getUpsertedItems(writeResult);
                Integer modifiedCount = (getType() == WriteRequest.Type.UPDATE || getType() == WriteRequest.Type.REPLACE) ? null : 0;
                return new AcknowledgedBulkWriteResult(getType(), count - upsertedItems.size(), modifiedCount, upsertedItems);
            }

            BulkWriteResult execute() {
                return DBCollectionImpl.this.useWriteCommands(Run.this.writeConcern, this.port) ? executeWriteCommandProtocol() : executeWriteProtocol();
            }

            private BulkWriteResult executeWriteProtocol() {
                BulkWriteBatchCombiner bulkWriteBatchCombiner = new BulkWriteBatchCombiner(this.port.getAddress(), Run.this.writeConcern);
                for (int i = 0; i < Run.this.writeRequests.size(); i++) {
                    IndexMap indexMap = IndexMap.create(i, 1);
                    try {
                        WriteResult writeResult = executeWriteProtocol(i);
                        if (Run.this.writeConcern.callGetLastError()) {
                            bulkWriteBatchCombiner.addResult(getResult(writeResult), indexMap);
                        }
                    } catch (WriteConcernException writeException) {
                        if (isWriteConcernError(writeException.getCommandResult())) {
                            bulkWriteBatchCombiner.addResult(getResult(new WriteResult(writeException.getCommandResult(), Run.this.writeConcern)), indexMap);
                            bulkWriteBatchCombiner.addWriteConcernErrorResult(getWriteConcernError(writeException.getCommandResult()));
                        } else {
                            bulkWriteBatchCombiner.addWriteErrorResult(getBulkWriteError(writeException), indexMap);
                        }
                        if (bulkWriteBatchCombiner.shouldStopSendingMoreBatches()) {
                            break;
                        }
                    }
                }
                return bulkWriteBatchCombiner.getResult();
            }

            private int getCount(WriteResult writeResult) {
                if (getType() == WriteRequest.Type.INSERT) {
                    return 1;
                }
                return writeResult.getN();
            }

            List<BulkWriteUpsert> getUpsertedItems(WriteResult writeResult) {
                return writeResult.getUpsertedId() == null ? Collections.emptyList() : Arrays.asList(new BulkWriteUpsert(0, writeResult.getUpsertedId()));
            }

            private BulkWriteError getBulkWriteError(WriteConcernException writeException) {
                return new BulkWriteError(writeException.getCode(), writeException.getCommandResult().getString("err"), getErrorResponseDetails(writeException.getCommandResult()), 0);
            }

            private boolean isWriteConcernError(CommandResult commandResult) {
                return commandResult.get("wtimeout") != null;
            }

            private WriteConcernError getWriteConcernError(CommandResult commandResult) {
                return new WriteConcernError(commandResult.getCode(), getWriteConcernErrorMessage(commandResult), getErrorResponseDetails(commandResult));
            }

            private String getWriteConcernErrorMessage(CommandResult commandResult) {
                return commandResult.getString("err");
            }

            private DBObject getErrorResponseDetails(DBObject response) {
                DBObject details = new BasicDBObject();
                for (String key : response.keySet()) {
                    if (!Arrays.asList("ok", "err", "code").contains(key)) {
                        details.put(key, response.get(key));
                    }
                }
                return details;
            }

            WriteResult addMissingUpserted(ModifyRequest update, WriteResult writeResult) {
                if (update.isUpsert() && Run.this.writeConcern.callGetLastError() && !writeResult.isUpdateOfExisting() && writeResult.getUpsertedId() == null) {
                    DBObject updateDocument = update.getUpdateDocument();
                    DBObject query = update.getQuery();
                    if (updateDocument.containsField("_id")) {
                        CommandResult commandResult = writeResult.getLastError();
                        commandResult.put("upserted", updateDocument.get("_id"));
                        return new WriteResult(commandResult, writeResult.getLastConcern());
                    } else if (query.containsField("_id")) {
                        CommandResult commandResult2 = writeResult.getLastError();
                        commandResult2.put("upserted", query.get("_id"));
                        return new WriteResult(commandResult2, writeResult.getLastConcern());
                    } else {
                        return writeResult;
                    }
                }
                return writeResult;
            }
        }
    }
}
