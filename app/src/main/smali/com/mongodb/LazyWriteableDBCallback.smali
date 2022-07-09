.class public Lcom/mongodb/LazyWriteableDBCallback;
.super Lcom/mongodb/LazyDBCallback;
.source "LazyWriteableDBCallback.java"


# static fields
.field private static final log:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-class v0, Lcom/mongodb/LazyWriteableDBCallback;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/mongodb/LazyWriteableDBCallback;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/mongodb/DBCollection;)V
    .locals 0
    .param p1, "coll"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/mongodb/LazyDBCallback;-><init>(Lcom/mongodb/DBCollection;)V

    .line 29
    return-void
.end method


# virtual methods
.method public createObject([BI)Ljava/lang/Object;
    .locals 4
    .param p1, "data"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 33
    new-instance v1, Lcom/mongodb/LazyWriteableDBObject;

    invoke-direct {v1, p1, p2, p0}, Lcom/mongodb/LazyWriteableDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 37
    .local v1, "o":Lcom/mongodb/LazyWriteableDBObject;
    invoke-virtual {v1}, Lcom/mongodb/LazyWriteableDBObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 38
    .local v0, "it":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "$ref"

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "$id"

    invoke-virtual {v1, v2}, Lcom/mongodb/LazyWriteableDBObject;->containsField(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 40
    new-instance v2, Lcom/mongodb/DBRef;

    iget-object v3, p0, Lcom/mongodb/LazyWriteableDBCallback;->_db:Lcom/mongodb/DB;

    invoke-direct {v2, v3, v1}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Lorg/bson/BSONObject;)V

    move-object v1, v2

    .line 42
    .end local v1    # "o":Lcom/mongodb/LazyWriteableDBObject;
    :cond_0
    return-object v1
.end method
