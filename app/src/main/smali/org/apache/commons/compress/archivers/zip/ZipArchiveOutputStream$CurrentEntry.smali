.class final Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
.super Ljava/lang/Object;
.source "ZipArchiveOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CurrentEntry"
.end annotation


# instance fields
.field private bytesRead:J

.field private causedUseOfZip64:Z

.field private dataStart:J

.field private final entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

.field private hasWritten:Z

.field private localDataStart:J


# direct methods
.method private constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V
    .locals 2
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    const-wide/16 v0, 0x0

    .line 1459
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1470
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    .line 1474
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    .line 1479
    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    .line 1483
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    .line 1460
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .line 1461
    return-void
.end method

.method synthetic constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "x1"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$1;

    .prologue
    .line 1458
    invoke-direct {p0, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;-><init>(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)V

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z

    return v0
.end method

.method static synthetic access$002(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
    .param p1, "x1"    # Z

    .prologue
    .line 1458
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->hasWritten:Z

    return p1
.end method

.method static synthetic access$100(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->entry:Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    return-object v0
.end method

.method static synthetic access$200(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    return-wide v0
.end method

.method static synthetic access$202(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
    .param p1, "x1"    # J

    .prologue
    .line 1458
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->dataStart:J

    return-wide p1
.end method

.method static synthetic access$300(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    return-wide v0
.end method

.method static synthetic access$314(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J
    .locals 3
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
    .param p1, "x1"    # J

    .prologue
    .line 1458
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->bytesRead:J

    return-wide v0
.end method

.method static synthetic access$400(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    return-wide v0
.end method

.method static synthetic access$402(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;J)J
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
    .param p1, "x1"    # J

    .prologue
    .line 1458
    iput-wide p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->localDataStart:J

    return-wide p1
.end method

.method static synthetic access$500(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;

    .prologue
    .line 1458
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    return v0
.end method

.method static synthetic access$502(Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;
    .param p1, "x1"    # Z

    .prologue
    .line 1458
    iput-boolean p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream$CurrentEntry;->causedUseOfZip64:Z

    return p1
.end method
