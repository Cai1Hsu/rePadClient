package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class MongoCursorNotFoundException extends MongoException {
    private static final long serialVersionUID = -4415279469780082174L;
    private final long cursorId;
    private final ServerAddress serverAddress;

    public MongoCursorNotFoundException(long cursorId, ServerAddress serverAddress) {
        super(-5, "Cursor " + cursorId + " not found on server " + serverAddress);
        this.cursorId = cursorId;
        this.serverAddress = serverAddress;
    }

    public long getCursorId() {
        return this.cursorId;
    }

    public ServerAddress getServerAddress() {
        return this.serverAddress;
    }
}
