.class final Lorg/bson/io/PoolOutputBuffer$1;
.super Lorg/bson/util/SimplePool;
.source "PoolOutputBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/io/PoolOutputBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/util/SimplePool",
        "<[B>;"
    }
.end annotation


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "x0"    # I

    .prologue
    .line 265
    invoke-direct {p0, p1}, Lorg/bson/util/SimplePool;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createNew()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer$1;->createNew()[B

    move-result-object v0

    return-object v0
.end method

.method protected createNew()[B
    .locals 1

    .prologue
    .line 268
    const/16 v0, 0x4000

    new-array v0, v0, [B

    return-object v0
.end method
