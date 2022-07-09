.class public final Lorg/apache/tools/ant/filters/TailFilter;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "TailFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final DEFAULT_NUM_LINES:I = 0xa

.field private static final LINES_KEY:Ljava/lang/String; = "lines"

.field private static final SKIP_KEY:Ljava/lang/String; = "skip"


# instance fields
.field private completedReadAhead:Z

.field private line:Ljava/lang/String;

.field private lineList:Ljava/util/LinkedList;

.field private linePos:I

.field private lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

.field private lines:J

.field private skip:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 76
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 52
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    .line 55
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    .line 58
    iput-boolean v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->completedReadAhead:Z

    .line 61
    iput-object v3, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 64
    iput-object v3, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    .line 66
    iput v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    .line 68
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 4
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 86
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 52
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    .line 55
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    .line 58
    iput-boolean v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->completedReadAhead:Z

    .line 61
    iput-object v3, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 64
    iput-object v3, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    .line 66
    iput v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    .line 68
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    .line 87
    new-instance v0, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/LineTokenizer;->setIncludeDelims(Z)V

    .line 89
    return-void
.end method

.method private getLines()J
    .locals 2

    .prologue
    .line 142
    iget-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    return-wide v0
.end method

.method private getSkip()J
    .locals 2

    .prologue
    .line 160
    iget-wide v0, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    return-wide v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TailFilter;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

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

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/filters/TailFilter;->setLines(J)V

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

    iput-wide v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    goto :goto_1

    .line 200
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private tailFilter(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const-wide/16 v8, -0x1

    const-wide/16 v4, 0x0

    .line 210
    iget-boolean v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->completedReadAhead:Z

    if-nez v1, :cond_5

    .line 211
    if-eqz p1, :cond_3

    .line 212
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 213
    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    cmp-long v1, v6, v8

    if-nez v1, :cond_0

    .line 214
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    int-to-long v4, v1

    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    cmp-long v1, v4, v6

    if-lez v1, :cond_2

    .line 215
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 240
    :goto_0
    return-object v1

    .line 218
    :cond_0
    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    iget-wide v8, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    cmp-long v1, v8, v4

    if-lez v1, :cond_1

    iget-wide v4, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    :cond_1
    add-long v2, v6, v4

    .line 219
    .local v2, "linesToKeep":J
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-gez v1, :cond_2

    .line 220
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 223
    .end local v2    # "linesToKeep":J
    :cond_2
    const-string/jumbo v1, ""

    goto :goto_0

    .line 225
    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->completedReadAhead:Z

    .line 226
    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    cmp-long v1, v6, v4

    if-lez v1, :cond_4

    .line 227
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    int-to-long v4, v0

    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    cmp-long v1, v4, v6

    if-gez v1, :cond_4

    .line 228
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 231
    .end local v0    # "i":I
    :cond_4
    iget-wide v4, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    cmp-long v1, v4, v8

    if-lez v1, :cond_5

    .line 232
    :goto_2
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    int-to-long v4, v1

    iget-wide v6, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    cmp-long v1, v4, v6

    if-lez v1, :cond_5

    .line 233
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_2

    .line 237
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_6

    .line 238
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0

    .line 240
    :cond_6
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 4
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 174
    new-instance v0, Lorg/apache/tools/ant/filters/TailFilter;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/TailFilter;-><init>(Ljava/io/Reader;)V

    .line 175
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/TailFilter;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TailFilter;->getLines()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/filters/TailFilter;->setLines(J)V

    .line 176
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TailFilter;->getSkip()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/filters/TailFilter;->setSkip(J)V

    .line 177
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/TailFilter;->setInitialized(Z)V

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
    .line 105
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/TailFilter;->getInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 106
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TailFilter;->initialize()V

    .line 107
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/filters/TailFilter;->setInitialized(Z)V

    .line 110
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_4

    .line 111
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lineTokenizer:Lorg/apache/tools/ant/util/LineTokenizer;

    iget-object v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->in:Ljava/io/Reader;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    .line 112
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/filters/TailFilter;->tailFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    .line 113
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 114
    const/4 v0, -0x1

    .line 124
    :cond_2
    :goto_1
    return v0

    .line 116
    :cond_3
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    goto :goto_0

    .line 119
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    iget v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 120
    .local v0, "ch":I
    iget v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    .line 121
    iget v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->linePos:I

    iget-object v2, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 122
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/filters/TailFilter;->line:Ljava/lang/String;

    goto :goto_1
.end method

.method public setLines(J)V
    .locals 1
    .param p1, "lines"    # J

    .prologue
    .line 133
    iput-wide p1, p0, Lorg/apache/tools/ant/filters/TailFilter;->lines:J

    .line 134
    return-void
.end method

.method public setSkip(J)V
    .locals 1
    .param p1, "skip"    # J

    .prologue
    .line 151
    iput-wide p1, p0, Lorg/apache/tools/ant/filters/TailFilter;->skip:J

    .line 152
    return-void
.end method
