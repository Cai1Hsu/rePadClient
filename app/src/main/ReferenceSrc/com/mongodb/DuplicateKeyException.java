package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DuplicateKeyException extends WriteConcernException {
    private static final long serialVersionUID = -4415279469780082174L;

    public DuplicateKeyException(CommandResult commandResult) {
        super(commandResult);
    }

    public DuplicateKeyException(int code, CommandResult commandResult) {
        super(code, commandResult);
    }
}
