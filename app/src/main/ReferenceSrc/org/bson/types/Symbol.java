package org.bson.types;

import java.io.Serializable;

/* loaded from: classes.jar:org/bson/types/Symbol.class */
public class Symbol implements Serializable {
    private static final long serialVersionUID = 1326269319883146072L;
    private final String _symbol;

    public Symbol(String str) {
        this._symbol = str;
    }

    public boolean equals(Object obj) {
        String str;
        boolean z = true;
        if (this != obj) {
            if (obj == null) {
                z = false;
            } else {
                if (obj instanceof Symbol) {
                    str = ((Symbol) obj)._symbol;
                } else if (obj instanceof String) {
                    str = (String) obj;
                } else {
                    z = false;
                }
                if (this._symbol == null ? str != null : !this._symbol.equals(str)) {
                    z = false;
                }
            }
        }
        return z;
    }

    public String getSymbol() {
        return this._symbol;
    }

    public int hashCode() {
        return this._symbol != null ? this._symbol.hashCode() : 0;
    }

    public String toString() {
        return this._symbol;
    }
}
