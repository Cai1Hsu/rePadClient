package com.mongodb;
@Deprecated
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface DBConnector {
    CommandResult authenticate(MongoCredential mongoCredential);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, int i);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, int i, ReadPreference readPreference, DBDecoder dBDecoder);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, DBDecoder dBDecoder);

    boolean isOpen();

    void requestDone();

    void requestEnsureConnection();

    void requestStart();

    WriteResult say(DB db, OutMessage outMessage, WriteConcern writeConcern);

    WriteResult say(DB db, OutMessage outMessage, WriteConcern writeConcern, ServerAddress serverAddress);
}
