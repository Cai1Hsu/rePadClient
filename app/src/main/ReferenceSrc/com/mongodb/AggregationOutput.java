package com.mongodb;

import org.jivesoftware.smackx.Form;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AggregationOutput {
    @Deprecated
    protected final DBObject _cmd;
    @Deprecated
    protected final CommandResult _commandResult;
    @Deprecated
    protected final Iterable<DBObject> _resultSet;

    public Iterable<DBObject> results() {
        return this._resultSet;
    }

    @Deprecated
    public CommandResult getCommandResult() {
        return this._commandResult;
    }

    @Deprecated
    public DBObject getCommand() {
        return this._cmd;
    }

    @Deprecated
    public ServerAddress getServerUsed() {
        return this._commandResult.getServerUsed();
    }

    @Deprecated
    public AggregationOutput(DBObject command, CommandResult commandResult) {
        this._commandResult = commandResult;
        this._cmd = command;
        if (commandResult.containsField(Form.TYPE_RESULT)) {
            this._resultSet = (Iterable) commandResult.get(Form.TYPE_RESULT);
            return;
        }
        throw new IllegalArgumentException("result undefined");
    }
}
