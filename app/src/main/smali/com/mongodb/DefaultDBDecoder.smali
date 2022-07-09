.class public Lcom/mongodb/DefaultDBDecoder;
.super Lorg/bson/BasicBSONDecoder;
.source "DefaultDBDecoder.java"

# interfaces
.implements Lcom/mongodb/DBDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/DefaultDBDecoder$DefaultFactory;
    }
.end annotation


# static fields
.field public static FACTORY:Lcom/mongodb/DBDecoderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    new-instance v0, Lcom/mongodb/DefaultDBDecoder$DefaultFactory;

    invoke-direct {v0}, Lcom/mongodb/DefaultDBDecoder$DefaultFactory;-><init>()V

    sput-object v0, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/bson/BasicBSONDecoder;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;Lcom/mongodb/DBCollection;)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "collection"    # Lcom/mongodb/DBCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-virtual {p0, p2}, Lcom/mongodb/DefaultDBDecoder;->getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;

    move-result-object v0

    .line 61
    .local v0, "cbk":Lcom/mongodb/DBCallback;
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->reset()V

    .line 62
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DefaultDBDecoder;->decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I

    .line 63
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    return-object v1
.end method

.method public decode([BLcom/mongodb/DBCollection;)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "b"    # [B
    .param p2, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 53
    invoke-virtual {p0, p2}, Lcom/mongodb/DefaultDBDecoder;->getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;

    move-result-object v0

    .line 54
    .local v0, "cbk":Lcom/mongodb/DBCallback;
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->reset()V

    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DefaultDBDecoder;->decode([BLorg/bson/BSONCallback;)I

    .line 56
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    return-object v1
.end method

.method public getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 49
    new-instance v0, Lcom/mongodb/DefaultDBCallback;

    invoke-direct {v0, p1}, Lcom/mongodb/DefaultDBCallback;-><init>(Lcom/mongodb/DBCollection;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const-string/jumbo v0, "DefaultDBDecoder"

    return-object v0
.end method
