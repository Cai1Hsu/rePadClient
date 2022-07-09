.class public Lorg/bson/KeyCachingLazyBSONObject;
.super Lorg/bson/LazyBSONObject;
.source "KeyCachingLazyBSONObject.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private fieldIndex:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/bson/LazyBSONObject$ElementRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    .line 34
    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    .line 33
    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONObject;-><init>([BLorg/bson/LazyBSONCallback;)V

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    .line 32
    return-void
.end method

.method private declared-synchronized ensureFieldList()V
    .locals 8

    .prologue
    .line 54
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v7, :cond_1

    .line 69
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 56
    :cond_1
    :try_start_1
    iget v7, p0, Lorg/bson/KeyCachingLazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v5, v7, 0x4

    .local v5, "offset":I
    move v6, v5

    .line 58
    .end local v5    # "offset":I
    .local v6, "offset":I
    :goto_1
    invoke-virtual {p0, v6}, Lorg/bson/KeyCachingLazyBSONObject;->isElementEmpty(I)Z

    move-result v7

    if-nez v7, :cond_0

    .line 59
    invoke-virtual {p0, v6}, Lorg/bson/KeyCachingLazyBSONObject;->sizeCString(I)I

    move-result v3

    .line 60
    .local v3, "fieldSize":I
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "offset":I
    .restart local v5    # "offset":I
    invoke-virtual {p0, v6}, Lorg/bson/KeyCachingLazyBSONObject;->getElementBSONSize(I)I

    move-result v2

    .line 61
    .local v2, "elementSize":I
    iget-object v7, p0, Lorg/bson/KeyCachingLazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "name":Ljava/lang/String;
    new-instance v0, Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-direct {v0, p0, v4, v5}, Lorg/bson/LazyBSONObject$ElementRecord;-><init>(Lorg/bson/LazyBSONObject;Ljava/lang/String;I)V

    .line 63
    .local v0, "_t_record":Lorg/bson/LazyBSONObject$ElementRecord;
    iget-object v7, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    invoke-virtual {v7, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    add-int v7, v3, v2

    add-int/2addr v5, v7

    move v6, v5

    .line 65
    .end local v5    # "offset":I
    .restart local v6    # "offset":I
    goto :goto_1

    .line 66
    .end local v0    # "_t_record":Lorg/bson/LazyBSONObject$ElementRecord;
    .end local v2    # "elementSize":I
    .end local v3    # "fieldSize":I
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "offset":I
    :catch_0
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 54
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7
.end method


# virtual methods
.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/bson/KeyCachingLazyBSONObject;->ensureFieldList()V

    .line 46
    iget-object v0, p0, Lorg/bson/KeyCachingLazyBSONObject;->fieldIndex:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    const/4 v0, 0x0

    .line 49
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lorg/bson/LazyBSONObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/bson/KeyCachingLazyBSONObject;->ensureFieldList()V

    .line 40
    invoke-super {p0, p1}, Lorg/bson/LazyBSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
