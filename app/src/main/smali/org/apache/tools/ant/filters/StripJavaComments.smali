.class public final Lorg/apache/tools/ant/filters/StripJavaComments;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "StripJavaComments.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# instance fields
.field private inString:Z

.field private quoted:Z

.field private readAheadCh:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>()V

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    .line 46
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->inString:Z

    .line 51
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 2
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    .line 46
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->inString:Z

    .line 51
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    .line 70
    return-void
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 142
    new-instance v0, Lorg/apache/tools/ant/filters/StripJavaComments;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/StripJavaComments;-><init>(Ljava/io/Reader;)V

    .line 143
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/StripJavaComments;
    return-object v0
.end method

.method public read()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/16 v6, 0x2f

    const/16 v5, 0x2a

    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 83
    const/4 v0, -0x1

    .line 84
    .local v0, "ch":I
    iget v3, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    if-eq v3, v4, :cond_1

    .line 85
    iget v0, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    .line 86
    iput v4, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    .line 127
    :cond_0
    :goto_0
    return v0

    .line 88
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v3}, Ljava/io/Reader;->read()I

    move-result v0

    .line 89
    const/16 v3, 0x22

    if-ne v0, v3, :cond_3

    iget-boolean v3, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    if-nez v3, :cond_3

    .line 90
    iget-boolean v3, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->inString:Z

    if-nez v3, :cond_2

    :goto_1
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->inString:Z

    .line 91
    iput-boolean v2, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    goto :goto_0

    :cond_2
    move v1, v2

    .line 90
    goto :goto_1

    .line 92
    :cond_3
    const/16 v3, 0x5c

    if-ne v0, v3, :cond_5

    .line 93
    iget-boolean v3, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    if-nez v3, :cond_4

    :goto_2
    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_2

    .line 95
    :cond_5
    iput-boolean v2, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->quoted:Z

    .line 96
    iget-boolean v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->inString:Z

    if-nez v1, :cond_0

    .line 97
    if-ne v0, v6, :cond_0

    .line 98
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 99
    if-ne v0, v6, :cond_6

    .line 100
    :goto_3
    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    if-eq v0, v4, :cond_0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    .line 101
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_3

    .line 103
    :cond_6
    if-ne v0, v5, :cond_9

    .line 104
    :cond_7
    if-eq v0, v4, :cond_0

    .line 105
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 106
    if-ne v0, v5, :cond_7

    .line 107
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 108
    :goto_4
    if-ne v0, v5, :cond_8

    .line 109
    iget-object v1, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_4

    .line 112
    :cond_8
    if-ne v0, v6, :cond_7

    .line 113
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/StripJavaComments;->read()I

    move-result v0

    .line 114
    goto :goto_0

    .line 119
    :cond_9
    iput v0, p0, Lorg/apache/tools/ant/filters/StripJavaComments;->readAheadCh:I

    .line 120
    const/16 v0, 0x2f

    goto :goto_0
.end method
