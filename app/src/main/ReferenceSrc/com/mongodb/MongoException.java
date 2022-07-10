package com.mongodb;

import java.io.IOException;
import org.bson.BSONObject;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoException extends RuntimeException {
    private static final long serialVersionUID = -4415279469780082174L;
    final int _code;

    public MongoException(String msg) {
        super(msg);
        this._code = -3;
    }

    public MongoException(int code, String msg) {
        super(msg);
        this._code = code;
    }

    public MongoException(String msg, Throwable t) {
        super(msg, t);
        this._code = -4;
    }

    public MongoException(int code, String msg, Throwable t) {
        super(msg, t);
        this._code = code;
    }

    public MongoException(BSONObject o) {
        this(ServerError.getCode(o), ServerError.getMsg(o, "UNKNOWN"));
    }

    static MongoException parse(BSONObject o) {
        String s = ServerError.getMsg(o, null);
        if (s == null) {
            return null;
        }
        return new MongoException(ServerError.getCode(o), s);
    }

    @Deprecated
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class Network extends MongoSocketException {
        private static final long serialVersionUID = 8364298902504372967L;

        public Network(String msg, IOException ioe) {
            super(msg, ioe);
        }

        public Network(IOException ioe) {
            super(ioe);
        }
    }

    @Deprecated
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class DuplicateKey extends DuplicateKeyException {
        private static final long serialVersionUID = 6557680785576001838L;

        public DuplicateKey(CommandResult commandResult) {
            super(commandResult);
        }

        DuplicateKey(int code, CommandResult commandResult) {
            super(code, commandResult);
        }
    }

    @Deprecated
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public static class CursorNotFound extends MongoCursorNotFoundException {
        private static final long serialVersionUID = -3759595395830412426L;

        public CursorNotFound(long cursorId, ServerAddress serverAddress) {
            super(cursorId, serverAddress);
        }
    }

    public int getCode() {
        return this._code;
    }
}
