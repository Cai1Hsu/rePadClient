.class public final Lorg/apache/tools/ant/filters/HeadFilter;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "HeadFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final DEFAULT_NUM_LINES:I = 0xa

.field private static final LINES_KEY:Ljava/lang/String; = "lines"

.field private static final SKIP_KEY:Ljava/lang/String; = "skip"


# instance fields
.field private eof:Z

.field private line:Ljava/lang/String;

.field private linePos:I

.field private lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

.field private lines:J

.field private linesRead:J

.field private skip:J


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 74
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 46
    iput-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    .line 52
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    .line 55
    iput-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    .line 58
    iput-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 61
    iput-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 6
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 84
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 46
    iput-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    .line 52
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    .line 55
    iput-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    .line 58
    iput-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 61
    iput-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    .line 85
    new-instance v0, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/LineTokenizer;->setIncludeDelims(Z)V

    .line 87
    return-void
.end method

.method private getLines()J
    .locals 2

    .prologue
    .line 142
    iget-wide v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    return-wide v0
.end method

.method private getSkip()J
    .locals 2

    .prologue
    .line 160
    iget-wide v0, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    return-wide v0
.end method

.method private headFilter(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const-wide/16 v4, 0x1

    const-wide/16 v6, 0x0

    const/4 v0, 0x0

    .line 206
    iget-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    .line 207
    iget-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_1

    .line 208
    iget-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    move-object p1, v0

    .line 219
    .end local p1    # "line":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 213
    .restart local p1    # "line":Ljava/lang/String;
    :cond_1
    iget-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    cmp-long v1, v2, v6

    if-lez v1, :cond_0

    .line 214
    iget-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linesRead:J

    iget-wide v4, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    iget-wide v6, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    add-long/2addr v4, v6

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 215
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->eof:Z

    move-object p1, v0

    .line 216
    goto :goto_0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/HeadFilter;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 188
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_2

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 190
    const-string/jumbo v2, "lines"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 191
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    .line 189
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    :cond_1
    const-string/jumbo v2, "skip"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 195
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    goto :goto_1

    .line 200
    .end local v0    # "i":I
    :cond_2
    return-void
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 4
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 174
    new-instance v0, Lorg/apache/tools/ant/filters/HeadFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/HeadFilter;-><init>(Ljava/io/Reader;)V

    .line 175
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/HeadFilter;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/HeadFilter;->getLines()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/filters/HeadFilter;->setLines(J)V

    .line 176
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/HeadFilter;->getSkip()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/filters/HeadFilter;->setSkip(J)V

    .line 177
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/HeadFilter;->setInitialized(Z)V

    .line 178
    return-object v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 102
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/HeadFilter;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 103
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/HeadFilter;->initialize()V

    .line 104
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/HeadFilter;->setInitialized(Z)V

    .line 107
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_4

    .line 108
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    iget-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->in:Ljava/io/Reader;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    .line 109
    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 124
    :cond_2
    :goto_1
    return v0

    .line 112
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/filters/HeadFilter;->headFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    .line 113
    iget-boolean v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->eof:Z

    if-nez v1, :cond_2

    .line 116
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    goto :goto_0

    .line 119
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    iget v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 120
    .local v0, "ch":I
    iget v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    .line 121
    iget v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->linePos:I

    iget-object v2, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 122
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->line:Ljava/lang/String;

    goto :goto_1
.end method

.method public setLines(J)V
    .locals 1
    .param p1, "lines"    # J

    .prologue
    .line 133
    iput-wide p1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->lines:J

    .line 134
    return-void
.end method

.method public setSkip(J)V
    .locals 1
    .param p1, "skip"    # J

    .prologue
    .line 151
    iput-wide p1, p0, Lorg/apache/tools/ant/filters/HeadFilter;->skip:J

    .line 152
    return-void
.end method
