package com.mongodb.util;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mongodb.DBRef;
import com.mongodb.QueryOperators;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.SimpleTimeZone;
import java.util.UUID;
import java.util.regex.Pattern;
import org.bson.BSON;
import org.bson.BSONObject;
import org.bson.BasicBSONCallback;
import org.bson.types.BSONTimestamp;
import org.bson.types.Binary;
import org.bson.types.Code;
import org.bson.types.CodeWScope;
import org.bson.types.MaxKey;
import org.bson.types.MinKey;
import org.bson.types.ObjectId;

/* loaded from: classes.dex */
public class JSONCallback extends BasicBSONCallback {
    public static final String _msDateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    public static final String _secDateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
    private boolean _lastArray = false;

    @Override // org.bson.BasicBSONCallback
    public BSONObject create() {
        return new BasicDBObject();
    }

    @Override // org.bson.BasicBSONCallback
    protected BSONObject createList() {
        return new BasicDBList();
    }

    @Override // org.bson.BasicBSONCallback
    public void objectStart(boolean array, String name) {
        this._lastArray = array;
        super.objectStart(array, name);
    }

    @Override // org.bson.BasicBSONCallback, org.bson.BSONCallback
    public Object objectDone() {
        String name = curName();
        Object o = super.objectDone();
        if (!this._lastArray) {
            BSONObject b = (BSONObject) o;
            if (b.containsField("$oid")) {
                o = new ObjectId((String) b.get("$oid"));
            } else if (b.containsField("$date")) {
                if (b.get("$date") instanceof Number) {
                    o = new Date(((Number) b.get("$date")).longValue());
                } else {
                    SimpleDateFormat format = new SimpleDateFormat(_msDateFormat);
                    format.setCalendar(new GregorianCalendar(new SimpleTimeZone(0, "GMT")));
                    o = format.parse(b.get("$date").toString(), new ParsePosition(0));
                    if (o == null) {
                        SimpleDateFormat format2 = new SimpleDateFormat(_secDateFormat);
                        format2.setCalendar(new GregorianCalendar(new SimpleTimeZone(0, "GMT")));
                        o = format2.parse(b.get("$date").toString(), new ParsePosition(0));
                    }
                }
            } else if (b.containsField("$regex")) {
                o = Pattern.compile((String) b.get("$regex"), BSON.regexFlags((String) b.get("$options")));
            } else if (b.containsField("$ts")) {
                Integer ts = Integer.valueOf(((Number) b.get("$ts")).intValue());
                Integer inc = Integer.valueOf(((Number) b.get("$inc")).intValue());
                o = new BSONTimestamp(ts.intValue(), inc.intValue());
            } else if (b.containsField("$timestamp")) {
                BSONObject tsObject = (BSONObject) b.get("$timestamp");
                Integer ts2 = Integer.valueOf(((Number) tsObject.get("t")).intValue());
                Integer inc2 = Integer.valueOf(((Number) tsObject.get("i")).intValue());
                o = new BSONTimestamp(ts2.intValue(), inc2.intValue());
            } else if (b.containsField("$code")) {
                if (b.containsField("$scope")) {
                    o = new CodeWScope((String) b.get("$code"), (DBObject) b.get("$scope"));
                } else {
                    o = new Code((String) b.get("$code"));
                }
            } else if (b.containsField("$ref")) {
                o = new DBRef(null, (String) b.get("$ref"), b.get("$id"));
            } else if (b.containsField("$minKey")) {
                o = new MinKey();
            } else if (b.containsField("$maxKey")) {
                o = new MaxKey();
            } else if (b.containsField("$uuid")) {
                o = UUID.fromString((String) b.get("$uuid"));
            } else if (b.containsField("$binary")) {
                int type = ((Integer) b.get(QueryOperators.TYPE)).intValue();
                byte[] bytes = new Base64Codec().decode((String) b.get("$binary"));
                o = new Binary((byte) type, bytes);
            } else if (b.containsField("$numberLong")) {
                o = Long.valueOf((String) b.get("$numberLong"));
            }
            if (!isStackEmpty()) {
                _put(name, o);
            } else {
                if (BSON.hasDecodeHooks()) {
                    o = BSON.applyDecodingHooks(o);
                }
                setRoot(o);
            }
        }
        return o;
    }
}
