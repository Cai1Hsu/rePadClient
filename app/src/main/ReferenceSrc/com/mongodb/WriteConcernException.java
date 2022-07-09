package com.mongodb;

/* loaded from: classes.dex */
public class WriteConcernException extends MongoException {
    private static final long serialVersionUID = 841056799207039974L;
    private final CommandResult commandResult;

    public WriteConcernException(CommandResult commandResult) {
        this(commandResult.getCode(), commandResult);
    }

    WriteConcernException(int code, CommandResult commandResult) {
        super(code, commandResult.toString());
        this.commandResult = commandResult;
    }

    public CommandResult getCommandResult() {
        return this.commandResult;
    }
}
