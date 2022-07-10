package com.mongodb;

import org.bson.util.Assertions;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
class ChangeEvent<T> {
    private final T newValue;
    private final T oldValue;

    public ChangeEvent(T oldValue, T newValue) {
        this.oldValue = (T) Assertions.notNull("oldValue", oldValue);
        this.newValue = (T) Assertions.notNull("newValue", newValue);
    }

    public T getOldValue() {
        return this.oldValue;
    }

    public T getNewValue() {
        return this.newValue;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ChangeEvent<?> that = (ChangeEvent) o;
        if (!this.newValue.equals(that.newValue)) {
            return false;
        }
        if (this.oldValue != null) {
            if (this.oldValue.equals(that.oldValue)) {
                return true;
            }
        } else if (that.oldValue == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = this.oldValue != null ? this.oldValue.hashCode() : 0;
        return (result * 31) + this.newValue.hashCode();
    }

    public String toString() {
        return "ChangeEvent{oldValue=" + this.oldValue + ", newValue=" + this.newValue + '}';
    }
}
