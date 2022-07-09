.class public Lorg/bson/LazyBSONDecoder;
.super Ljava/lang/Object;
.source "LazyBSONDecoder.java"

# interfaces
.implements Lorg/bson/BSONDecoder;


# static fields
.field private static BYTES_IN_INTEGER:I

.field static final LOG:Ljava/util/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lorg/bson/LazyBSONDecoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/bson/LazyBSONDecoder;->LOG:Ljava/util/logging/Logger;

    .line 70
    const/4 v0, 0x4

    sput v0, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "callback"    # Lorg/bson/BSONCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 57
    sget v3, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    new-array v2, v3, [B

    .line 58
    .local v2, "objSizeBuffer":[B
    sget v3, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    invoke-static {p1, v2, v5, v3}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BII)V

    .line 59
    invoke-static {v2}, Lorg/bson/io/Bits;->readInt([B)I

    move-result v1

    .line 60
    .local v1, "objSize":I
    new-array v0, v1, [B

    .line 61
    .local v0, "data":[B
    sget v3, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    invoke-static {v2, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    sget v3, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    sget v4, Lorg/bson/LazyBSONDecoder;->BYTES_IN_INTEGER:I

    sub-int v4, v1, v4

    invoke-static {p1, v0, v3, v4}, Lorg/bson/io/Bits;->readFully(Ljava/io/InputStream;[BII)V

    .line 66
    const/4 v3, 0x0

    invoke-interface {p2, v3, v5, v0}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    .line 67
    return v1
.end method

.method public decode([BLorg/bson/BSONCallback;)I
    .locals 3
    .param p1, "b"    # [B
    .param p2, "callback"    # Lorg/bson/BSONCallback;

    .prologue
    .line 49
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v1, p2}, Lorg/bson/LazyBSONDecoder;->decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 51
    :catch_0
    move-exception v0

    .line 52
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/bson/BSONException;

    const-string/jumbo v2, "should be impossible"

    invoke-direct {v1, v2, v0}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public readObject(Ljava/io/InputStream;)Lorg/bson/BSONObject;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    new-instance v0, Lorg/bson/LazyBSONCallback;

    invoke-direct {v0}, Lorg/bson/LazyBSONCallback;-><init>()V

    .line 43
    .local v0, "c":Lorg/bson/BSONCallback;
    invoke-virtual {p0, p1, v0}, Lorg/bson/LazyBSONDecoder;->decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I

    .line 44
    invoke-interface {v0}, Lorg/bson/BSONCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    return-object v1
.end method

.method public readObject([B)Lorg/bson/BSONObject;
    .locals 3
    .param p1, "b"    # [B

    .prologue
    .line 34
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v1}, Lorg/bson/LazyBSONDecoder;->readObject(Ljava/io/InputStream;)Lorg/bson/BSONObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/bson/BSONException;

    const-string/jumbo v2, "should be impossible"

    invoke-direct {v1, v2, v0}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
