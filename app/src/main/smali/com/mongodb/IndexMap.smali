.class abstract Lcom/mongodb/IndexMap;
.super Ljava/lang/Object;
.source "IndexMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/IndexMap$RangeBased;,
        Lcom/mongodb/IndexMap$HashBased;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method static create()Lcom/mongodb/IndexMap;
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/mongodb/IndexMap$RangeBased;

    invoke-direct {v0}, Lcom/mongodb/IndexMap$RangeBased;-><init>()V

    return-object v0
.end method

.method static create(II)Lcom/mongodb/IndexMap;
    .locals 1
    .param p0, "startIndex"    # I
    .param p1, "count"    # I

    .prologue
    .line 40
    new-instance v0, Lcom/mongodb/IndexMap$RangeBased;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/IndexMap$RangeBased;-><init>(II)V

    return-object v0
.end method


# virtual methods
.method abstract add(II)Lcom/mongodb/IndexMap;
.end method

.method abstract map(I)I
.end method
