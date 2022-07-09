package org.bson.types;

import java.io.Serializable;
import java.util.Date;

/* loaded from: classes.jar:org/bson/types/BSONTimestamp.class */
public class BSONTimestamp implements Comparable<BSONTimestamp>, Serializable {
    static final boolean D = Boolean.getBoolean("DEBUG.DBTIMESTAMP");
    private static final long serialVersionUID = -3268482672267936464L;
    final int _inc;
    final Date _time;

    public BSONTimestamp() {
        this._inc = 0;
        this._time = null;
    }

    public BSONTimestamp(int i, int i2) {
        this._time = new Date(i * 1000);
        this._inc = i2;
    }

    public int compareTo(BSONTimestamp bSONTimestamp) {
        return getTime() != bSONTimestamp.getTime() ? getTime() - bSONTimestamp.getTime() : getInc() - bSONTimestamp.getInc();
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj != this) {
            if (obj instanceof BSONTimestamp) {
                BSONTimestamp bSONTimestamp = (BSONTimestamp) obj;
                if (getTime() != bSONTimestamp.getTime() || getInc() != bSONTimestamp.getInc()) {
                    z = false;
                }
            } else {
                z = false;
            }
        }
        return z;
    }

    public int getInc() {
        return this._inc;
    }

    public int getTime() {
        return this._time == null ? 0 : (int) (this._time.getTime() / 1000);
    }

    public int hashCode() {
        return ((this._inc + 31) * 31) + getTime();
    }

    public String toString() {
        return "TS time:" + this._time + " inc:" + this._inc;
    }
}
