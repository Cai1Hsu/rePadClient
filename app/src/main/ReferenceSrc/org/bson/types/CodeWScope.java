package org.bson.types;

import org.bson.BSONObject;

/* loaded from: classes.jar:org/bson/types/CodeWScope.class */
public class CodeWScope extends Code {
    private static final long serialVersionUID = -6284832275113680002L;
    final BSONObject _scope;

    public CodeWScope(String str, BSONObject bSONObject) {
        super(str);
        this._scope = bSONObject;
    }

    @Override // org.bson.types.Code
    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof CodeWScope)) {
            z = false;
        } else {
            CodeWScope codeWScope = (CodeWScope) obj;
            z = false;
            if (this._code.equals(codeWScope._code)) {
                z = false;
                if (this._scope.equals(codeWScope._scope)) {
                    z = true;
                }
            }
        }
        return z;
    }

    public BSONObject getScope() {
        return this._scope;
    }

    @Override // org.bson.types.Code
    public int hashCode() {
        return this._code.hashCode() ^ this._scope.hashCode();
    }
}
