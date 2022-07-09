.class public Lorg/bson/LazyBSONCallback;
.super Lorg/bson/EmptyBSONCallback;
.source "LazyBSONCallback.java"


# static fields
.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field private _root:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 90
    const-string/jumbo v0, "org.bson.LazyBSONCallback"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/bson/LazyBSONCallback;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/bson/EmptyBSONCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public createArray([BI)Ljava/util/List;
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 72
    new-instance v0, Lorg/bson/LazyBSONList;

    invoke-direct {v0, p1, p2, p0}, Lorg/bson/LazyBSONList;-><init>([BILorg/bson/LazyBSONCallback;)V

    return-object v0
.end method

.method public createDBRef(Ljava/lang/String;Lorg/bson/types/ObjectId;)Ljava/lang/Object;
    .locals 2
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 76
    new-instance v0, Lorg/bson/BasicBSONObject;

    const-string/jumbo v1, "$ns"

    invoke-direct {v0, v1, p1}, Lorg/bson/BasicBSONObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "$id"

    invoke-virtual {v0, v1, p2}, Lorg/bson/BasicBSONObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lorg/bson/BasicBSONObject;

    move-result-object v0

    return-object v0
.end method

.method public createObject([BI)Ljava/lang/Object;
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 67
    new-instance v0, Lcom/mongodb/LazyDBObject;

    invoke-direct {v0, p1, p2, p0}, Lcom/mongodb/LazyDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/bson/LazyBSONCallback;->_root:Ljava/lang/Object;

    return-object v0
.end method

.method public gotBinary(Ljava/lang/String;B[B)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # B
    .param p3, "data"    # [B

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0}, Lorg/bson/LazyBSONCallback;->createObject([BI)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONCallback;->setRootObject(Ljava/lang/Object;)V

    .line 56
    return-void
.end method

.method public objectDone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public objectStart()V
    .locals 2

    .prologue
    .line 31
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public objectStart(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public objectStart(Z)V
    .locals 2
    .param p1, "array"    # Z

    .prologue
    .line 39
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/LazyBSONCallback;->_root:Ljava/lang/Object;

    .line 48
    return-void
.end method

.method public setRootObject(Ljava/lang/Object;)V
    .locals 0
    .param p1, "root"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 63
    iput-object p1, p0, Lorg/bson/LazyBSONCallback;->_root:Ljava/lang/Object;

    .line 64
    return-void
.end method
