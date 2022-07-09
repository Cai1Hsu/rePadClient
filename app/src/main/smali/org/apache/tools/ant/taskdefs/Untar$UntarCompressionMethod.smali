.class public final Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Untar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Untar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UntarCompressionMethod"
.end annotation


# static fields
.field private static final BZIP2:Ljava/lang/String; = "bzip2"

.field private static final GZIP:Ljava/lang/String; = "gzip"

.field private static final NONE:Ljava/lang/String; = "none"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 206
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 207
    const-string/jumbo v0, "none"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;->setValue(Ljava/lang/String;)V

    .line 208
    return-void
.end method


# virtual methods
.method public decompress(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "istream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 233
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 234
    .local v2, "v":Ljava/lang/String;
    const-string/jumbo v3, "gzip"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 235
    new-instance v3, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v3, p2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p2, v3

    .line 248
    .end local p2    # "istream":Ljava/io/InputStream;
    :cond_0
    :goto_0
    return-object p2

    .line 237
    .restart local p2    # "istream":Ljava/io/InputStream;
    :cond_1
    const-string/jumbo v3, "bzip2"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 238
    const/4 v3, 0x2

    new-array v1, v3, [C

    fill-array-data v1, :array_0

    .line 239
    .local v1, "magic":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v1

    if-ge v0, v3, :cond_3

    .line 240
    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result v3

    aget-char v4, v1, v0

    if-eq v3, v4, :cond_2

    .line 241
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Invalid bz2 file."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 239
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 245
    :cond_3
    new-instance v3, Lorg/apache/tools/bzip2/CBZip2InputStream;

    invoke-direct {v3, p2}, Lorg/apache/tools/bzip2/CBZip2InputStream;-><init>(Ljava/io/InputStream;)V

    move-object p2, v3

    goto :goto_0

    .line 238
    nop

    :array_0
    .array-data 2
        0x42s
        0x5as
    .end array-data
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 216
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "none"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "gzip"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "bzip2"

    aput-object v2, v0, v1

    return-object v0
.end method
