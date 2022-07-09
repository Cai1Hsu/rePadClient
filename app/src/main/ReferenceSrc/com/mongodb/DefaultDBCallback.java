package com.mongodb;

import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.bson.BSONObject;
import org.bson.BasicBSONCallback;
import org.bson.types.ObjectId;

/* loaded from: classes.dex */
public class DefaultDBCallback extends BasicBSONCallback implements DBCallback {
    public static DBCallbackFactory FACTORY = new DefaultFactory();
    static final Logger LOGGER = Logger.getLogger("com.mongo.DECODING");
    final DBCollection _collection;
    final DB _db;
    private LinkedList<String> _nameStack;

    /* loaded from: classes.dex */
    static class DefaultFactory implements DBCallbackFactory {
        DefaultFactory() {
        }

        @Override // com.mongodb.DBCallbackFactory
        public DBCallback create(DBCollection collection) {
            return new DefaultDBCallback(collection);
        }
    }

    public DefaultDBCallback(DBCollection coll) {
        this._collection = coll;
        this._db = this._collection == null ? null : this._collection.getDB();
    }

    @Override // org.bson.BasicBSONCallback, org.bson.BSONCallback
    public void gotDBRef(String name, String ns, ObjectId id) {
        if (id.equals(Bytes.COLLECTION_REF_ID)) {
            cur().put(name, this._collection);
        } else {
            cur().put(name, new DBRef(this._db, ns, id));
        }
    }

    @Override // org.bson.BasicBSONCallback
    public void objectStart(boolean array, String name) {
        this._nameStack.addLast(name);
        super.objectStart(array, name);
    }

    @Override // org.bson.BasicBSONCallback, org.bson.BSONCallback
    public Object objectDone() {
        BSONObject o = (BSONObject) super.objectDone();
        String lastName = null;
        if (this._nameStack.size() > 0) {
            String lastName2 = this._nameStack.removeLast();
            lastName = lastName2;
        }
        if (!(o instanceof List) && lastName != null && o.containsField("$ref") && o.containsField("$id")) {
            return cur().put(lastName, new DBRef(this._db, o));
        }
        return o;
    }

    @Override // org.bson.BasicBSONCallback
    public BSONObject create() {
        return _create(null);
    }

    @Override // org.bson.BasicBSONCallback
    public BSONObject create(boolean array, List<String> path) {
        return array ? new BasicDBList() : _create(path);
    }

    private DBObject _create(List<String> path) {
        Class c = null;
        if (this._collection != null && this._collection._objectClass != null) {
            if (path == null || path.size() == 0) {
                c = this._collection._objectClass;
            } else {
                StringBuilder buf = new StringBuilder();
                for (int i = 0; i < path.size(); i++) {
                    if (i > 0) {
                        buf.append(".");
                    }
                    buf.append(path.get(i));
                }
                c = this._collection.getInternalClass(buf.toString());
            }
        }
        if (c != null) {
            try {
                return (DBObject) c.newInstance();
            } catch (IllegalAccessException iae) {
                LOGGER.log(Level.FINE, "can't create a: " + c, (Throwable) iae);
                throw new MongoInternalException("can't instantiate a : " + c, iae);
            } catch (InstantiationException ie) {
                LOGGER.log(Level.FINE, "can't create a: " + c, (Throwable) ie);
                throw new MongoInternalException("can't instantiate a : " + c, ie);
            }
        }
        return new BasicDBObject();
    }

    DBObject dbget() {
        return (DBObject) get();
    }

    @Override // org.bson.BasicBSONCallback, org.bson.BSONCallback
    public void reset() {
        this._nameStack = new LinkedList<>();
        super.reset();
    }
}
