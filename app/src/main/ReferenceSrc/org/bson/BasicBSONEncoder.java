package org.bson;

import com.mongodb.DBRefBase;
import com.mongodb.QueryOperators;
import java.lang.reflect.Array;
import java.nio.Buffer;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;
import org.bson.io.BasicOutputBuffer;
import org.bson.io.OutputBuffer;
import org.bson.types.BSONTimestamp;
import org.bson.types.Binary;
import org.bson.types.Code;
import org.bson.types.CodeWScope;
import org.bson.types.MaxKey;
import org.bson.types.MinKey;
import org.bson.types.ObjectId;
import org.bson.types.Symbol;

/* loaded from: classes.jar:org/bson/BasicBSONEncoder.class */
public class BasicBSONEncoder implements BSONEncoder {
    static final boolean DEBUG = false;
    @Deprecated
    protected OutputBuffer _buf;

    private void _putString(String str, String str2, byte b) {
        _put(b, str);
        _putValueString(str2);
    }

    private void putArray(String str, Object obj) {
        _put((byte) 4, str);
        int position = this._buf.getPosition();
        this._buf.writeInt(0);
        int length = Array.getLength(obj);
        for (int i = 0; i < length; i++) {
            _putObjectField(String.valueOf(i), Array.get(obj, i));
        }
        this._buf.write(0);
        this._buf.writeInt(position, this._buf.getPosition() - position);
    }

    private void putBinary(String str, int i, byte[] bArr) {
        _put((byte) 5, str);
        int length = bArr.length;
        int i2 = length;
        if (i == 2) {
            i2 = length + 4;
        }
        this._buf.writeInt(i2);
        this._buf.write(i);
        if (i == 2) {
            this._buf.writeInt(i2 - 4);
        }
        this._buf.getPosition();
        this._buf.write(bArr);
        this._buf.getPosition();
    }

    private void putIterable(String str, Iterable iterable) {
        _put((byte) 4, str);
        int position = this._buf.getPosition();
        this._buf.writeInt(0);
        int i = 0;
        for (Object obj : iterable) {
            _putObjectField(String.valueOf(i), obj);
            i++;
        }
        this._buf.write(0);
        this._buf.writeInt(position, this._buf.getPosition() - position);
    }

    private void putMap(String str, Map map) {
        _put((byte) 3, str);
        int position = this._buf.getPosition();
        this._buf.writeInt(0);
        for (Map.Entry entry : map.entrySet()) {
            _putObjectField(entry.getKey().toString(), entry.getValue());
        }
        this._buf.write(0);
        this._buf.writeInt(position, this._buf.getPosition() - position);
    }

    private void putMaxKey(String str) {
        _put(Byte.MAX_VALUE, str);
    }

    private void putMinKey(String str) {
        _put((byte) -1, str);
    }

    private void putPattern(String str, Pattern pattern) {
        _put((byte) 11, str);
        this._buf.writeCString(pattern.pattern());
        this._buf.writeCString(BSON.regexFlags(pattern.flags()));
    }

    @Deprecated
    protected int _put(String str) {
        return this._buf.writeCString(str);
    }

    @Deprecated
    protected void _put(byte b, String str) {
        this._buf.write(b);
        this._buf.writeCString(str);
    }

    protected void _putObjectField(String str, Object obj) {
        if (str.equals("_transientFields")) {
            return;
        }
        if (str.contains("��")) {
            throw new IllegalArgumentException("Document field names can't have a NULL character. (Bad Key: '" + str + "')");
        }
        if (str.equals(QueryOperators.WHERE) && (obj instanceof String)) {
            _put((byte) 13, str);
            _putValueString(obj.toString());
            return;
        }
        Object applyEncodingHooks = BSON.applyEncodingHooks(obj);
        if (applyEncodingHooks == null) {
            putNull(str);
        } else if (applyEncodingHooks instanceof Date) {
            putDate(str, (Date) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Number) {
            putNumber(str, (Number) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Character) {
            putString(str, applyEncodingHooks.toString());
        } else if (applyEncodingHooks instanceof String) {
            putString(str, applyEncodingHooks.toString());
        } else if (applyEncodingHooks instanceof ObjectId) {
            putObjectId(str, (ObjectId) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof BSONObject) {
            putObject(str, (BSONObject) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Boolean) {
            putBoolean(str, (Boolean) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Pattern) {
            putPattern(str, (Pattern) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Map) {
            putMap(str, (Map) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Iterable) {
            putIterable(str, (Iterable) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof byte[]) {
            putBinary(str, (byte[]) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Binary) {
            putBinary(str, (Binary) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof UUID) {
            putUUID(str, (UUID) applyEncodingHooks);
        } else if (applyEncodingHooks.getClass().isArray()) {
            putArray(str, applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Symbol) {
            putSymbol(str, (Symbol) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof BSONTimestamp) {
            putTimestamp(str, (BSONTimestamp) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof CodeWScope) {
            putCodeWScope(str, (CodeWScope) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof Code) {
            putCode(str, (Code) applyEncodingHooks);
        } else if (applyEncodingHooks instanceof DBRefBase) {
            BasicBSONObject basicBSONObject = new BasicBSONObject();
            basicBSONObject.put("$ref", (Object) ((DBRefBase) applyEncodingHooks).getRef());
            basicBSONObject.put("$id", ((DBRefBase) applyEncodingHooks).getId());
            putObject(str, basicBSONObject);
        } else if (applyEncodingHooks instanceof MinKey) {
            putMinKey(str);
        } else if (applyEncodingHooks instanceof MaxKey) {
            putMaxKey(str);
        } else if (putSpecial(str, applyEncodingHooks)) {
        } else {
            throw new IllegalArgumentException("can't serialize " + applyEncodingHooks.getClass());
        }
    }

    @Deprecated
    protected void _putValueString(String str) {
        this._buf.writeString(str);
    }

    void _reset(Buffer buffer) {
        buffer.position(0);
        buffer.limit(buffer.capacity());
    }

    @Override // org.bson.BSONEncoder
    public void done() {
        this._buf = null;
    }

    @Override // org.bson.BSONEncoder
    public byte[] encode(BSONObject bSONObject) {
        BasicOutputBuffer basicOutputBuffer = new BasicOutputBuffer();
        set(basicOutputBuffer);
        putObject(bSONObject);
        done();
        return basicOutputBuffer.toByteArray();
    }

    protected OutputBuffer getOutputBuffer() {
        return this._buf;
    }

    @Deprecated
    protected boolean handleSpecialObjects(String str, BSONObject bSONObject) {
        return false;
    }

    protected void putBinary(String str, Binary binary) {
        putBinary(str, binary.getType(), binary.getData());
    }

    protected void putBinary(String str, byte[] bArr) {
        putBinary(str, 0, bArr);
    }

    protected void putBoolean(String str, Boolean bool) {
        _put((byte) 8, str);
        this._buf.write(bool.booleanValue() ? 1 : 0);
    }

    protected void putCode(String str, Code code) {
        _put((byte) 13, str);
        this._buf.getPosition();
        _putValueString(code.getCode());
    }

    protected void putCodeWScope(String str, CodeWScope codeWScope) {
        _put((byte) 15, str);
        int position = this._buf.getPosition();
        this._buf.writeInt(0);
        _putValueString(codeWScope.getCode());
        putObject(codeWScope.getScope());
        this._buf.writeInt(position, this._buf.getPosition() - position);
    }

    protected void putDate(String str, Date date) {
        _put((byte) 9, str);
        this._buf.writeLong(date.getTime());
    }

    protected void putNull(String str) {
        _put((byte) 10, str);
    }

    protected void putNumber(String str, Number number) {
        if ((number instanceof Integer) || (number instanceof Short) || (number instanceof Byte) || (number instanceof AtomicInteger)) {
            _put((byte) 16, str);
            this._buf.writeInt(number.intValue());
        } else if ((number instanceof Long) || (number instanceof AtomicLong)) {
            _put((byte) 18, str);
            this._buf.writeLong(number.longValue());
        } else if (!(number instanceof Float) && !(number instanceof Double)) {
            throw new IllegalArgumentException("can't serialize " + number.getClass());
        } else {
            _put((byte) 1, str);
            this._buf.writeDouble(number.doubleValue());
        }
    }

    protected int putObject(String str, BSONObject bSONObject) {
        int position;
        if (bSONObject == null) {
            throw new NullPointerException("can't save a null object");
        }
        int position2 = this._buf.getPosition();
        byte b = 3;
        if (bSONObject instanceof List) {
            b = 4;
        }
        if (handleSpecialObjects(str, bSONObject)) {
            position = this._buf.getPosition() - position2;
        } else {
            if (str != null) {
                _put(b, str);
            }
            int position3 = this._buf.getPosition();
            this._buf.writeInt(0);
            boolean z = b == 3 && str == null;
            List list = null;
            if (b == 3) {
                if (z && bSONObject.containsField("_id")) {
                    _putObjectField("_id", bSONObject.get("_id"));
                }
                Object obj = bSONObject.get("_transientFields");
                list = null;
                if (obj instanceof List) {
                    list = (List) obj;
                }
            }
            if (bSONObject instanceof Map) {
                for (Map.Entry entry : ((Map) bSONObject).entrySet()) {
                    if (!z || !((String) entry.getKey()).equals("_id")) {
                        if (list == null || !list.contains(entry.getKey())) {
                            _putObjectField((String) entry.getKey(), entry.getValue());
                        }
                    }
                }
            } else {
                for (String str2 : bSONObject.keySet()) {
                    if (!z || !str2.equals("_id")) {
                        if (list == null || !list.contains(str2)) {
                            _putObjectField(str2, bSONObject.get(str2));
                        }
                    }
                }
            }
            this._buf.write(0);
            this._buf.writeInt(position3, this._buf.getPosition() - position3);
            position = this._buf.getPosition() - position2;
        }
        return position;
    }

    @Override // org.bson.BSONEncoder
    public int putObject(BSONObject bSONObject) {
        return putObject(null, bSONObject);
    }

    protected void putObjectId(String str, ObjectId objectId) {
        _put((byte) 7, str);
        this._buf.writeIntBE(objectId._time());
        this._buf.writeIntBE(objectId._machine());
        this._buf.writeIntBE(objectId._inc());
    }

    protected boolean putSpecial(String str, Object obj) {
        return false;
    }

    protected void putString(String str, String str2) {
        _putString(str, str2, (byte) 2);
    }

    protected void putSymbol(String str, Symbol symbol) {
        _putString(str, symbol.getSymbol(), (byte) 14);
    }

    protected void putTimestamp(String str, BSONTimestamp bSONTimestamp) {
        _put((byte) 17, str);
        this._buf.writeInt(bSONTimestamp.getInc());
        this._buf.writeInt(bSONTimestamp.getTime());
    }

    protected void putUUID(String str, UUID uuid) {
        _put((byte) 5, str);
        this._buf.writeInt(16);
        this._buf.write(3);
        this._buf.writeLong(uuid.getMostSignificantBits());
        this._buf.writeLong(uuid.getLeastSignificantBits());
    }

    protected void putUndefined(String str) {
        _put((byte) 6, str);
    }

    @Override // org.bson.BSONEncoder
    public void set(OutputBuffer outputBuffer) {
        if (this._buf != null) {
            throw new IllegalStateException("in the middle of something");
        }
        this._buf = outputBuffer;
    }

    @Deprecated
    public void writeCString(String str) {
        this._buf.writeCString(str);
    }

    @Deprecated
    public void writeInt(int i) {
        this._buf.writeInt(i);
    }

    @Deprecated
    public void writeLong(long j) {
        this._buf.writeLong(j);
    }
}
