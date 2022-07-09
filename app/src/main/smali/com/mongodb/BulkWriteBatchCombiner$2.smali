.class Lcom/mongodb/BulkWriteBatchCombiner$2;
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
        "Lcom/mongodb/BulkWriteError;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/BulkWriteBatchCombiner;


# direct methods
.method constructor <init>(Lcom/mongodb/BulkWriteBatchCombiner;)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lcom/mongodb/BulkWriteBatchCombiner$2;->this$0:Lcom/mongodb/BulkWriteBatchCombiner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mongodb/BulkWriteError;Lcom/mongodb/BulkWriteError;)I
    .locals 2
    .param p1, "o1"    # Lcom/mongodb/BulkWriteError;
    .param p2, "o2"    # Lcom/mongodb/BulkWriteError;

    .prologue
    .line 46
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteError;->getIndex()I

    move-result v0

    invoke-virtual {p2}, Lcom/mongodb/BulkWriteError;->getIndex()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/BulkWriteError;->getIndex()I

    move-result v0

    invoke-virtual {p2}, Lcom/mongodb/BulkWriteError;->getIndex()I

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
    .line 43
    check-cast p1, Lcom/mongodb/BulkWriteError;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/mongodb/BulkWriteError;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BulkWriteBatchCombiner$2;->compare(Lcom/mongodb/BulkWriteError;Lcom/mongodb/BulkWriteError;)I

    move-result v0

    return v0
.end method
