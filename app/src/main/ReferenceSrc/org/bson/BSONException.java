package org.bson;

/* loaded from: classes.jar:org/bson/BSONException.class */
public class BSONException extends RuntimeException {
    private static final long serialVersionUID = -4415279469780082174L;
    private Integer _errorCode;

    public BSONException(int i, String str) {
        super(str);
        this._errorCode = null;
        this._errorCode = Integer.valueOf(i);
    }

    public BSONException(int i, String str, Throwable th) {
        super(str, th);
        this._errorCode = null;
        this._errorCode = Integer.valueOf(i);
    }

    public BSONException(String str) {
        super(str);
        this._errorCode = null;
    }

    public BSONException(String str, Throwable th) {
        super(str, th);
        this._errorCode = null;
    }

    public Integer getErrorCode() {
        return this._errorCode;
    }

    public boolean hasErrorCode() {
        return this._errorCode != null;
    }
}
