.class final Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;
.super Ljava/lang/Object;
.source "ZipArchiveInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Buffer"
.end annotation


# instance fields
.field private final buf:[B

.field private lengthOfLastRead:I

.field private offsetInBuffer:I


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 803
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 807
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->buf:[B

    .line 812
    iput v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    .line 817
    iput v1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->lengthOfLastRead:I

    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$1;

    .prologue
    .line 803
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)[B
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    .prologue
    .line 803
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->buf:[B

    return-object v0
.end method

.method static synthetic access$1000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    .prologue
    .line 803
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->reset()V

    return-void
.end method

.method static synthetic access$700(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    .prologue
    .line 803
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    return v0
.end method

.method static synthetic access$702(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I
    .locals 0
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;
    .param p1, "x1"    # I

    .prologue
    .line 803
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    return p1
.end method

.method static synthetic access$712(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;
    .param p1, "x1"    # I

    .prologue
    .line 803
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    return v0
.end method

.method static synthetic access$800(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;

    .prologue
    .line 803
    iget v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->lengthOfLastRead:I

    return v0
.end method

.method static synthetic access$802(Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;I)I
    .locals 0
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;
    .param p1, "x1"    # I

    .prologue
    .line 803
    iput p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->lengthOfLastRead:I

    return p1
.end method

.method private reset()V
    .locals 1

    .prologue
    .line 822
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->lengthOfLastRead:I

    iput v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream$Buffer;->offsetInBuffer:I

    .line 823
    return-void
.end method
