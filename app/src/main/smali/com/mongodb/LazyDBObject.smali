.class public Lcom/mongodb/LazyDBObject;
.super Lorg/bson/LazyBSONObject;
.source "LazyDBObject.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# instance fields
.field private _partial:Z


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buff"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/LazyDBObject;->_partial:Z

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buff"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/LazyDBObject;->_partial:Z

    .line 35
    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/LazyDBObject;->_partial:Z

    .line 48
    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/LazyDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 44
    return-void
.end method


# virtual methods
.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 30
    iget-boolean v0, p0, Lcom/mongodb/LazyDBObject;->_partial:Z

    return v0
.end method

.method public markAsPartialObject()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/LazyDBObject;->_partial:Z

    .line 27
    return-void
.end method
