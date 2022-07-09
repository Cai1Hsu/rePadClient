package com.google.gson;

import com.google.gson.internal.C$Gson$Preconditions;
import com.google.gson.internal.LazilyParsedNumber;
import java.math.BigDecimal;
import java.math.BigInteger;

/* loaded from: classes.jar:com/google/gson/JsonPrimitive.class */
public final class JsonPrimitive extends JsonElement {
    private static final Class<?>[] PRIMITIVE_TYPES = {Integer.TYPE, Long.TYPE, Short.TYPE, Float.TYPE, Double.TYPE, Byte.TYPE, Boolean.TYPE, Character.TYPE, Integer.class, Long.class, Short.class, Float.class, Double.class, Byte.class, Boolean.class, Character.class};
    private Object value;

    public JsonPrimitive(Boolean bool) {
        setValue(bool);
    }

    public JsonPrimitive(Character ch) {
        setValue(ch);
    }

    public JsonPrimitive(Number number) {
        setValue(number);
    }

    JsonPrimitive(Object obj) {
        setValue(obj);
    }

    public JsonPrimitive(String str) {
        setValue(str);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0038, code lost:
        if ((r0 instanceof java.lang.Byte) != false) goto L14;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static boolean isIntegral(JsonPrimitive jsonPrimitive) {
        boolean z = false;
        if (jsonPrimitive.value instanceof Number) {
            Number number = (Number) jsonPrimitive.value;
            if (!(number instanceof BigInteger) && !(number instanceof Long) && !(number instanceof Integer) && !(number instanceof Short)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    private static boolean isPrimitiveOrString(Object obj) {
        boolean z;
        if (!(obj instanceof String)) {
            Class<?> cls = obj.getClass();
            Class<?>[] clsArr = PRIMITIVE_TYPES;
            int length = clsArr.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    z = false;
                    break;
                }
                z = true;
                if (clsArr[i].isAssignableFrom(cls)) {
                    break;
                }
                i++;
            }
        } else {
            z = true;
        }
        return z;
    }

    @Override // com.google.gson.JsonElement
    public JsonPrimitive deepCopy() {
        return this;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x009b, code lost:
        if (java.lang.Double.isNaN(r0) != false) goto L33;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = true;
        if (this != obj) {
            if (obj == null || getClass() != obj.getClass()) {
                z = false;
            } else {
                JsonPrimitive jsonPrimitive = (JsonPrimitive) obj;
                if (this.value == null) {
                    if (jsonPrimitive.value != null) {
                        z = false;
                    }
                } else if (!isIntegral(this) || !isIntegral(jsonPrimitive)) {
                    if (!(this.value instanceof Number) || !(jsonPrimitive.value instanceof Number)) {
                        z = this.value.equals(jsonPrimitive.value);
                    } else {
                        double doubleValue = getAsNumber().doubleValue();
                        double doubleValue2 = jsonPrimitive.getAsNumber().doubleValue();
                        if (doubleValue != doubleValue2) {
                            z = false;
                            if (Double.isNaN(doubleValue)) {
                                z = false;
                            }
                        }
                        z = true;
                    }
                } else if (getAsNumber().longValue() != jsonPrimitive.getAsNumber().longValue()) {
                    z = false;
                }
            }
        }
        return z;
    }

    @Override // com.google.gson.JsonElement
    public BigDecimal getAsBigDecimal() {
        return this.value instanceof BigDecimal ? (BigDecimal) this.value : new BigDecimal(this.value.toString());
    }

    @Override // com.google.gson.JsonElement
    public BigInteger getAsBigInteger() {
        return this.value instanceof BigInteger ? (BigInteger) this.value : new BigInteger(this.value.toString());
    }

    @Override // com.google.gson.JsonElement
    public boolean getAsBoolean() {
        return isBoolean() ? getAsBooleanWrapper().booleanValue() : Boolean.parseBoolean(getAsString());
    }

    @Override // com.google.gson.JsonElement
    Boolean getAsBooleanWrapper() {
        return (Boolean) this.value;
    }

    @Override // com.google.gson.JsonElement
    public byte getAsByte() {
        return isNumber() ? getAsNumber().byteValue() : Byte.parseByte(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public char getAsCharacter() {
        return getAsString().charAt(0);
    }

    @Override // com.google.gson.JsonElement
    public double getAsDouble() {
        return isNumber() ? getAsNumber().doubleValue() : Double.parseDouble(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public float getAsFloat() {
        return isNumber() ? getAsNumber().floatValue() : Float.parseFloat(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public int getAsInt() {
        return isNumber() ? getAsNumber().intValue() : Integer.parseInt(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public long getAsLong() {
        return isNumber() ? getAsNumber().longValue() : Long.parseLong(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public Number getAsNumber() {
        return this.value instanceof String ? new LazilyParsedNumber((String) this.value) : (Number) this.value;
    }

    @Override // com.google.gson.JsonElement
    public short getAsShort() {
        return isNumber() ? getAsNumber().shortValue() : Short.parseShort(getAsString());
    }

    @Override // com.google.gson.JsonElement
    public String getAsString() {
        return isNumber() ? getAsNumber().toString() : isBoolean() ? getAsBooleanWrapper().toString() : (String) this.value;
    }

    public int hashCode() {
        int hashCode;
        if (this.value == null) {
            hashCode = 31;
        } else if (isIntegral(this)) {
            long longValue = getAsNumber().longValue();
            hashCode = (int) ((longValue >>> 32) ^ longValue);
        } else if (this.value instanceof Number) {
            long doubleToLongBits = Double.doubleToLongBits(getAsNumber().doubleValue());
            hashCode = (int) ((doubleToLongBits >>> 32) ^ doubleToLongBits);
        } else {
            hashCode = this.value.hashCode();
        }
        return hashCode;
    }

    public boolean isBoolean() {
        return this.value instanceof Boolean;
    }

    public boolean isNumber() {
        return this.value instanceof Number;
    }

    public boolean isString() {
        return this.value instanceof String;
    }

    void setValue(Object obj) {
        if (obj instanceof Character) {
            this.value = String.valueOf(((Character) obj).charValue());
            return;
        }
        C$Gson$Preconditions.checkArgument((obj instanceof Number) || isPrimitiveOrString(obj));
        this.value = obj;
    }
}
