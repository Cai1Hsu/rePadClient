.class public Lcom/mongodb/LazyDBDecoder;
.super Lorg/bson/LazyBSONDecoder;
.source "LazyDBDecoder.java"

# interfaces
.implements Lcom/mongodb/DBDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/LazyDBDecoder$LazyDBDecoderFactory;
    }
.end annotation


# static fields
.field public static FACTORY:Lcom/mongodb/DBDecoderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/mongodb/LazyDBDecoder$LazyDBDecoderFactory;

    invoke-direct {v0}, Lcom/mongodb/LazyDBDecoder$LazyDBDecoderFactory;-><init>()V

    sput-object v0, Lcom/mongodb/LazyDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/bson/LazyBSONDecoder;-><init>()V

    .line 38
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
    .line 54
    invoke-virtual {p0, p2}, Lcom/mongodb/LazyDBDecoder;->getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;

    move-result-object v0

    .line 55
    .local v0, "cbk":Lcom/mongodb/DBCallback;
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->reset()V

    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/LazyDBDecoder;->decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I

    .line 57
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
    .line 47
    invoke-virtual {p0, p2}, Lcom/mongodb/LazyDBDecoder;->getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;

    move-result-object v0

    .line 48
    .local v0, "cbk":Lcom/mongodb/DBCallback;
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->reset()V

    .line 49
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/LazyDBDecoder;->decode([BLorg/bson/BSONCallback;)I

    .line 50
    invoke-interface {v0}, Lcom/mongodb/DBCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    return-object v1
.end method

.method public getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 43
    new-instance v0, Lcom/mongodb/LazyDBCallback;

    invoke-direct {v0, p1}, Lcom/mongodb/LazyDBCallback;-><init>(Lcom/mongodb/DBCollection;)V

    return-object v0
.end method
