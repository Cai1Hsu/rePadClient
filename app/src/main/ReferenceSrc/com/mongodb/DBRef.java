package com.mongodb;

import org.bson.BSONObject;

/* loaded from: classes.dex */
public class DBRef extends DBRefBase {
    private static final long serialVersionUID = -849581217713362618L;

    public DBRef(DB db, BSONObject o) {
        super(db, o.get("$ref").toString(), o.get("$id"));
    }

    public DBRef(DB db, String ns, Object id) {
        super(db, ns, id);
    }

    private DBRef() {
    }

    public static DBObject fetch(DB db, DBObject ref) {
        Object id;
        String ns = (String) ref.get("$ref");
        if (ns == null || (id = ref.get("$id")) == null) {
            return null;
        }
        return db.getCollection(ns).findOne((DBObject) new BasicDBObject("_id", id));
    }
}
