package org.bson.types;

import java.io.Serializable;

/* loaded from: classes.jar:org/bson/types/Code.class */
public class Code implements Serializable {
    private static final long serialVersionUID = 475535263314046697L;
    final String _code;

    public Code(String str) {
        this._code = str;
    }

    public boolean equals(Object obj) {
        return !(obj instanceof Code) ? false : this._code.equals(((Code) obj)._code);
    }

    public String getCode() {
        return this._code;
    }

    public int hashCode() {
        return this._code.hashCode();
    }

    public String toString() {
        return getCode();
    }
}
