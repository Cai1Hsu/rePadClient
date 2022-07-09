.class public interface abstract Lcom/mongodb/DBDecoder;
.super Ljava/lang/Object;
.source "DBDecoder.java"

# interfaces
.implements Lorg/bson/BSONDecoder;


# virtual methods
.method public abstract decode(Ljava/io/InputStream;Lcom/mongodb/DBCollection;)Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract decode([BLcom/mongodb/DBCollection;)Lcom/mongodb/DBObject;
.end method

.method public abstract getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;
.end method
