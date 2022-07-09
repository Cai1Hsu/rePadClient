.class public Lcom/mongodb/LazyDBList;
.super Lorg/bson/LazyDBList;
.source "LazyDBList.java"


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyDBList;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyDBList;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    .line 34
    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyDBList;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 30
    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyDBList;-><init>([BLorg/bson/LazyBSONCallback;)V

    .line 26
    return-void
.end method
