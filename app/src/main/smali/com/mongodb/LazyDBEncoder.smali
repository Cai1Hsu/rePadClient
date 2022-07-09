.class public Lcom/mongodb/LazyDBEncoder;
.super Ljava/lang/Object;
.source "LazyDBEncoder.java"

# interfaces
.implements Lcom/mongodb/DBEncoder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public writeObject(Lorg/bson/io/OutputBuffer;Lorg/bson/BSONObject;)I
    .locals 4
    .param p1, "buf"    # Lorg/bson/io/OutputBuffer;
    .param p2, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 37
    instance-of v2, p2, Lcom/mongodb/LazyDBObject;

    if-nez v2, :cond_0

    .line 38
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "LazyDBEncoder can only encode BSONObject instances of type LazyDBObject"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    move-object v1, p2

    .line 41
    check-cast v1, Lcom/mongodb/LazyDBObject;

    .line 44
    .local v1, "lazyDBObject":Lcom/mongodb/LazyDBObject;
    :try_start_0
    invoke-virtual {v1, p1}, Lcom/mongodb/LazyDBObject;->pipe(Ljava/io/OutputStream;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    invoke-virtual {v1}, Lcom/mongodb/LazyDBObject;->getBSONSize()I

    move-result v2

    return v2

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/mongodb/MongoException;

    const-string/jumbo v3, "Exception serializing a LazyDBObject"

    invoke-direct {v2, v3, v0}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
