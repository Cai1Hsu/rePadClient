.class Lcom/mongodb/IndexMap$RangeBased;
.super Lcom/mongodb/IndexMap;
.source "IndexMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/IndexMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RangeBased"
.end annotation


# instance fields
.field private count:I

.field private startIndex:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/mongodb/IndexMap;-><init>()V

    .line 77
    return-void
.end method

.method public constructor <init>(II)V
    .locals 0
    .param p1, "startIndex"    # I
    .param p2, "count"    # I

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/mongodb/IndexMap;-><init>()V

    .line 80
    iput p1, p0, Lcom/mongodb/IndexMap$RangeBased;->startIndex:I

    .line 81
    iput p2, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    .line 82
    return-void
.end method


# virtual methods
.method public add(II)Lcom/mongodb/IndexMap;
    .locals 3
    .param p1, "index"    # I
    .param p2, "originalIndex"    # I

    .prologue
    .line 86
    iget v1, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    if-nez v1, :cond_0

    .line 87
    iput p2, p0, Lcom/mongodb/IndexMap$RangeBased;->startIndex:I

    .line 88
    const/4 v1, 0x1

    iput v1, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    .line 96
    .end local p0    # "this":Lcom/mongodb/IndexMap$RangeBased;
    :goto_0
    return-object p0

    .line 90
    .restart local p0    # "this":Lcom/mongodb/IndexMap$RangeBased;
    :cond_0
    iget v1, p0, Lcom/mongodb/IndexMap$RangeBased;->startIndex:I

    iget v2, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    add-int/2addr v1, v2

    if-ne p2, v1, :cond_1

    .line 91
    iget v1, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    goto :goto_0

    .line 94
    :cond_1
    new-instance v0, Lcom/mongodb/IndexMap$HashBased;

    iget v1, p0, Lcom/mongodb/IndexMap$RangeBased;->startIndex:I

    iget v2, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    invoke-direct {v0, v1, v2}, Lcom/mongodb/IndexMap$HashBased;-><init>(II)V

    .line 95
    .local v0, "hashBasedMap":Lcom/mongodb/IndexMap;
    invoke-virtual {v0, p1, p2}, Lcom/mongodb/IndexMap;->add(II)Lcom/mongodb/IndexMap;

    move-object p0, v0

    .line 96
    goto :goto_0
.end method

.method public map(I)I
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 102
    iget v0, p0, Lcom/mongodb/IndexMap$RangeBased;->count:I

    if-lt p1, v0, :cond_0

    .line 103
    new-instance v0, Lcom/mongodb/MongoInternalException;

    const-string/jumbo v1, "index should not be greater than count"

    invoke-direct {v0, v1}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_0
    iget v0, p0, Lcom/mongodb/IndexMap$RangeBased;->startIndex:I

    add-int/2addr v0, p1

    return v0
.end method
