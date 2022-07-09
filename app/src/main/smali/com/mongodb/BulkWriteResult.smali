.class public abstract Lcom/mongodb/BulkWriteResult;
.super Ljava/lang/Object;
.source "BulkWriteResult.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getInsertedCount()I
.end method

.method public abstract getMatchedCount()I
.end method

.method public abstract getModifiedCount()I
.end method

.method public abstract getRemovedCount()I
.end method

.method public abstract getUpserts()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/BulkWriteUpsert;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isAcknowledged()Z
.end method

.method public abstract isModifiedCountAvailable()Z
.end method
