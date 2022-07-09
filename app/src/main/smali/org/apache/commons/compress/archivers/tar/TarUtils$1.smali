.class final Lorg/apache/commons/compress/archivers/tar/TarUtils$1;
.super Ljava/lang/Object;
.source "TarUtils.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/zip/ZipEncoding;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/tar/TarUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canEncode(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v0, 0x1

    return v0
.end method

.method public decode([B)Ljava/lang/String;
    .locals 5
    .param p1, "buffer"    # [B

    .prologue
    .line 59
    array-length v2, p1

    .line 60
    .local v2, "length":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 62
    .local v3, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 63
    aget-byte v0, p1, v1

    .line 64
    .local v0, "b":B
    if-nez v0, :cond_1

    .line 70
    .end local v0    # "b":B
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 67
    .restart local v0    # "b":B
    :cond_1
    and-int/lit16 v4, v0, 0xff

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 62
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public encode(Ljava/lang/String;)Ljava/nio/ByteBuffer;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 49
    .local v2, "length":I
    new-array v0, v2, [B

    .line 52
    .local v0, "buf":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 53
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v0, v1

    .line 52
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 55
    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    return-object v3
.end method
