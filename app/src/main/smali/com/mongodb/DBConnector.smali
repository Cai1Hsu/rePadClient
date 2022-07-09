.class public interface abstract Lcom/mongodb/DBConnector;
.super Ljava/lang/Object;
.source "DBConnector.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract authenticate(Lcom/mongodb/MongoCredential;)Lcom/mongodb/CommandResult;
.end method

.method public abstract call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;I)Lcom/mongodb/Response;
.end method

.method public abstract call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;ILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
.end method

.method public abstract call(Lcom/mongodb/DB;Lcom/mongodb/DBCollection;Lcom/mongodb/OutMessage;Lcom/mongodb/ServerAddress;Lcom/mongodb/DBDecoder;)Lcom/mongodb/Response;
.end method

.method public abstract isOpen()Z
.end method

.method public abstract requestDone()V
.end method

.method public abstract requestEnsureConnection()V
.end method

.method public abstract requestStart()V
.end method

.method public abstract say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
.end method

.method public abstract say(Lcom/mongodb/DB;Lcom/mongodb/OutMessage;Lcom/mongodb/WriteConcern;Lcom/mongodb/ServerAddress;)Lcom/mongodb/WriteResult;
.end method
