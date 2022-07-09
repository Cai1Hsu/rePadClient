.class public abstract Lorg/apache/tools/zip/ZipUtil;
.super Ljava/lang/Object;
.source "ZipUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static copy([B)[B
    .locals 3
    .param p0, "from"    # [B

    .prologue
    const/4 v2, 0x0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    array-length v1, p0

    new-array v0, v1, [B

    .line 32
    .local v0, "to":[B
    array-length v1, v0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .end local v0    # "to":[B
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
