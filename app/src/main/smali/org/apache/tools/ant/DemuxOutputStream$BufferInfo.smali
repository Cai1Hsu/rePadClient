.class Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
.super Ljava/lang/Object;
.source "DemuxOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/DemuxOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BufferInfo"
.end annotation


# instance fields
.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private crSeen:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->crSeen:Z

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/DemuxOutputStream$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/DemuxOutputStream$1;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;-><init>()V

    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->buffer:Ljava/io/ByteArrayOutputStream;

    return-object v0
.end method

.method static access$102(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Ljava/io/ByteArrayOutputStream;)Ljava/io/ByteArrayOutputStream;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    .param p1, "x1"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 39
    iput-object p1, p0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->buffer:Ljava/io/ByteArrayOutputStream;

    return-object p1
.end method

.method static access$200(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    .prologue
    .line 39
    iget-boolean v0, p0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->crSeen:Z

    return v0
.end method

.method static access$202(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    .param p1, "x1"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->crSeen:Z

    return p1
.end method
