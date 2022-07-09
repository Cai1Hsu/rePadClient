.class public final Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Tar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Tar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TarCompressionMethod"
.end annotation


# static fields
.field private static final BZIP2:Ljava/lang/String; = "bzip2"

.field private static final GZIP:Ljava/lang/String; = "gzip"

.field private static final NONE:Ljava/lang/String; = "none"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 931
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 932
    const-string/jumbo v0, "none"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;->setValue(Ljava/lang/String;)V

    .line 933
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;
    .param p1, "x1"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 910
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;->compress(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method private compress(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 2
    .param p1, "ostream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 953
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 954
    .local v0, "v":Ljava/lang/String;
    const-string/jumbo v1, "gzip"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 955
    new-instance v1, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v1, p1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object p1, v1

    .line 963
    .end local p1    # "ostream":Ljava/io/OutputStream;
    :cond_0
    :goto_0
    return-object p1

    .line 957
    .restart local p1    # "ostream":Ljava/io/OutputStream;
    :cond_1
    const-string/jumbo v1, "bzip2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 958
    const/16 v1, 0x42

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 959
    const/16 v1, 0x5a

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    .line 960
    new-instance v1, Lorg/apache/tools/bzip2/CBZip2OutputStream;

    invoke-direct {v1, p1}, Lorg/apache/tools/bzip2/CBZip2OutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object p1, v1

    goto :goto_0
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 940
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
