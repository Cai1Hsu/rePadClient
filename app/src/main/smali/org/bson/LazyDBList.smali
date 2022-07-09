.class public Lorg/bson/LazyDBList;
.super Lorg/bson/LazyBSONList;
.source "LazyDBList.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field private _isPartialObject:Z


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONList;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONList;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONList;-><init>([BILorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONList;-><init>([BLorg/bson/LazyBSONCallback;)V

    return-void
.end method


# virtual methods
.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lorg/bson/LazyDBList;->_isPartialObject:Z

    return v0
.end method

.method public markAsPartialObject()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/bson/LazyDBList;->_isPartialObject:Z

    .line 54
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    invoke-static {p0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
