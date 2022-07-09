.class Lcom/mongodb/BulkWriteBatchCombiner$1;
.super Ljava/lang/Object;
.source "BulkWriteBatchCombiner.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BulkWriteBatchCombiner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/mongodb/BulkWriteUpsert;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/BulkWriteBatchCombiner;


# direct methods
.method constructor <init>(Lcom/mongodb/BulkWriteBatchCombiner;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/mongodb/BulkWriteBatchCombiner$1;->this$0:Lcom/mongodb/BulkWriteBatchCombiner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mongodb/BulkWriteUpsert;Lcom/mongodb/BulkWriteUpsert;)I
    .locals 2
    .param p1, "o1"    # Lcom/mongodb/BulkWriteUpsert;
    .param p2, "o2"    # Lcom/mongodb/BulkWriteUpsert;

    .prologue
    .line 40
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteUpsert;->getIndex()I

    move-result v0

    invoke-virtual {p2}, Lcom/mongodb/BulkWriteUpsert;->getIndex()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteUpsert;->getIndex()I

    move-result v0

    invoke-virtual {p2}, Lcom/mongodb/BulkWriteUpsert;->getIndex()I

    move-result v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 37
    check-cast p1, Lcom/mongodb/BulkWriteUpsert;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/mongodb/BulkWriteUpsert;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BulkWriteBatchCombiner$1;->compare(Lcom/mongodb/BulkWriteUpsert;Lcom/mongodb/BulkWriteUpsert;)I

    move-result v0

    return v0
.end method
