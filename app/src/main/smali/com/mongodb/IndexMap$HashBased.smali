.class Lcom/mongodb/IndexMap$HashBased;
.super Lcom/mongodb/IndexMap;
.source "IndexMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/IndexMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HashBased"
.end annotation


# instance fields
.field private final indexMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(II)V
    .locals 4
    .param p1, "startIndex"    # I
    .param p2, "count"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/mongodb/IndexMap;-><init>()V

    .line 48
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/mongodb/IndexMap$HashBased;->indexMap:Ljava/util/Map;

    .line 51
    move v0, p1

    .local v0, "i":I
    :goto_0
    if-gt v0, p2, :cond_0

    .line 52
    iget-object v1, p0, Lcom/mongodb/IndexMap$HashBased;->indexMap:Ljava/util/Map;

    sub-int v2, v0, p1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 54
    :cond_0
    return-void
.end method


# virtual methods
.method public add(II)Lcom/mongodb/IndexMap;
    .locals 3
    .param p1, "index"    # I
    .param p2, "originalIndex"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mongodb/IndexMap$HashBased;->indexMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    return-object p0
.end method

.method public map(I)I
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 64
    iget-object v1, p0, Lcom/mongodb/IndexMap$HashBased;->indexMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 65
    .local v0, "originalIndex":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 66
    new-instance v1, Lcom/mongodb/MongoInternalException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "no mapping found for index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method
