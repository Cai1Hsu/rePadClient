.class public Lorg/apache/tools/ant/types/resources/BZip2Resource;
.super Lorg/apache/tools/ant/types/resources/CompressedResource;
.source "BZip2Resource.java"


# static fields
.field private static final MAGIC:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x2

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/types/resources/BZip2Resource;->MAGIC:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x42s
        0x5as
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/CompressedResource;-><init>()V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/CompressedResource;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 48
    return-void
.end method


# virtual methods
.method protected getCompressionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    const-string/jumbo v0, "Bzip2"

    return-object v0
.end method

.method protected wrapStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/BZip2Resource;->MAGIC:[C

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 58
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    sget-object v2, Lorg/apache/tools/ant/types/resources/BZip2Resource;->MAGIC:[C

    aget-char v2, v2, v0

    if-eq v1, v2, :cond_0

    .line 59
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Invalid bz2 stream."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    :cond_1
    new-instance v1, Lorg/apache/tools/bzip2/CBZip2InputStream;

    invoke-direct {v1, p1}, Lorg/apache/tools/bzip2/CBZip2InputStream;-><init>(Ljava/io/InputStream;)V

    return-object v1
.end method

.method protected wrapStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/BZip2Resource;->MAGIC:[C

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 73
    sget-object v1, Lorg/apache/tools/ant/types/resources/BZip2Resource;->MAGIC:[C

    aget-char v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 75
    :cond_0
    new-instance v1, Lorg/apache/tools/bzip2/CBZip2OutputStream;

    invoke-direct {v1, p1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v1
.end method
