package com.mongodb;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class CommandFailureException extends MongoException {
    private static final long serialVersionUID = -1180715413196161037L;
    private final CommandResult commandResult;

    public CommandFailureException(CommandResult commandResult) {
        super(ServerError.getCode(commandResult), commandResult.toString());
        this.commandResult = commandResult;
    }

    public CommandResult getCommandResult() {
        return this.commandResult;
    }
}
