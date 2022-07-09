.class public Lcom/mongodb/util/StringBuilderPool;
.super Lcom/mongodb/util/SimplePool;
.source "StringBuilderPool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mongodb/util/SimplePool",
        "<",
        "Ljava/lang/StringBuilder;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "maxToKeep"    # I

    .prologue
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StringBuilderPool-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/mongodb/util/SimplePool;-><init>(Ljava/lang/String;I)V

    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic createNew()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/mongodb/util/StringBuilderPool;->createNew()Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public createNew()Ljava/lang/StringBuilder;
    .locals 1

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    return-object v0
.end method

.method protected memSize(Ljava/lang/StringBuilder;)J
    .locals 2
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    int-to-long v0, v0

    return-wide v0
.end method

.method public ok(Ljava/lang/StringBuilder;)Z
    .locals 3
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-virtual {p0}, Lcom/mongodb/util/StringBuilderPool;->getMaxSize()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 49
    :goto_0
    return v0

    .line 48
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 49
    const/4 v0, 0x1

    goto :goto_0
.end method
