package com.google.gson.internal;

import java.io.ObjectStreamException;
import java.math.BigDecimal;

/* loaded from: classes.jar:com/google/gson/internal/LazilyParsedNumber.class */
public final class LazilyParsedNumber extends Number {
    private final String value;

    public LazilyParsedNumber(String str) {
        this.value = str;
    }

    private Object writeReplace() throws ObjectStreamException {
        return new BigDecimal(this.value);
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return Double.parseDouble(this.value);
    }

    @Override // java.lang.Number
    public float floatValue() {
        return Float.parseFloat(this.value);
    }

    @Override // java.lang.Number
    public int intValue() {
        int intValue;
        try {
            intValue = Integer.parseInt(this.value);
        } catch (NumberFormatException e) {
            try {
                intValue = (int) Long.parseLong(this.value);
            } catch (NumberFormatException e2) {
                intValue = new BigDecimal(this.value).intValue();
            }
        }
        return intValue;
    }

    @Override // java.lang.Number
    public long longValue() {
        long longValue;
        try {
            longValue = Long.parseLong(this.value);
        } catch (NumberFormatException e) {
            longValue = new BigDecimal(this.value).longValue();
        }
        return longValue;
    }

    public String toString() {
        return this.value;
    }
}
