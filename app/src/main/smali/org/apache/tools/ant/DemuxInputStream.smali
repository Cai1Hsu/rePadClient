.class public Lorg/apache/tools/ant/DemuxInputStream;
.super Ljava/io/InputStream;
.source "DemuxInputStream.java"


# static fields
.field private static final MASK_8BIT:I = 0xff


# instance fields
.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/apache/tools/ant/DemuxInputStream;->project:Lorg/apache/tools/ant/Project;

    .line 46
    return-void
.end method


# virtual methods
.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v1, -0x1

    .line 54
    new-array v0, v4, [B

    .line 55
    .local v0, "buffer":[B
    iget-object v2, p0, Lorg/apache/tools/ant/DemuxInputStream;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v0, v3, v4}, Lorg/apache/tools/ant/Project;->demuxInput([BII)I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 58
    :goto_0
    return v1

    :cond_0
    aget-byte v1, v0, v3

    and-int/lit16 v1, v1, 0xff

    goto :goto_0
.end method

.method public read([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/DemuxInputStream;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->demuxInput([BII)I

    move-result v0

    return v0
.end method
