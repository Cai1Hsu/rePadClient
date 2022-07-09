.class public abstract Lorg/apache/tools/ant/filters/BaseFilterReader;
.super Ljava/io/FilterReader;
.source "BaseFilterReader.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# instance fields
.field private initialized:Z

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 50
    new-instance v0, Ljava/io/StringReader;

    const-string/jumbo v1, ""

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Ljava/io/FilterReader;-><init>(Ljava/io/Reader;)V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->initialized:Z

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->project:Lorg/apache/tools/ant/Project;

    .line 51
    invoke-static {p0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Ljava/io/FilterReader;-><init>(Ljava/io/Reader;)V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->initialized:Z

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->project:Lorg/apache/tools/ant/Project;

    .line 63
    return-void
.end method


# virtual methods
.method protected final getInitialized()Z
    .locals 1

    .prologue
    .line 136
    iget-boolean v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->initialized:Z

    return v0
.end method

.method protected final getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public final read([CII)I
    .locals 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 82
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_2

    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;->read()I

    move-result v0

    .line 84
    .local v0, "ch":I
    if-ne v0, v2, :cond_1

    .line 85
    if-nez v1, :cond_0

    move v1, v2

    .line 93
    .end local v0    # "ch":I
    .end local v1    # "i":I
    :cond_0
    :goto_1
    return v1

    .line 91
    .restart local v0    # "ch":I
    .restart local v1    # "i":I
    :cond_1
    add-int v3, p2, v1

    int-to-char v4, v0

    aput-char v4, p1, v3

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0    # "ch":I
    :cond_2
    move v1, p3

    .line 93
    goto :goto_1
.end method

.method protected final readFully()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v0, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->in:Ljava/io/Reader;

    const/16 v1, 0x2000

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected final readLine()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 169
    iget-object v2, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v2}, Ljava/io/Reader;->read()I

    move-result v0

    .line 171
    .local v0, "ch":I
    if-ne v0, v3, :cond_0

    .line 172
    const/4 v2, 0x0

    .line 184
    :goto_0
    return-object v2

    .line 175
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 177
    .local v1, "line":Ljava/lang/StringBuffer;
    :goto_1
    if-eq v0, v3, :cond_1

    .line 178
    int-to-char v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 179
    const/16 v2, 0xa

    if-ne v0, v2, :cond_2

    .line 184
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 182
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->in:Ljava/io/Reader;

    invoke-virtual {v2}, Ljava/io/Reader;->read()I

    move-result v0

    goto :goto_1
.end method

.method protected final setInitialized(Z)V
    .locals 0
    .param p1, "initialized"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->initialized:Z

    .line 128
    return-void
.end method

.method public final setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/filters/BaseFilterReader;->project:Lorg/apache/tools/ant/Project;

    .line 147
    return-void
.end method

.method public final skip(J)J
    .locals 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 109
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_0

    .line 110
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "skip value is negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 113
    :cond_0
    const-wide/16 v0, 0x0

    .local v0, "i":J
    :goto_0
    cmp-long v2, v0, p1

    if-gez v2, :cond_2

    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 118
    .end local v0    # "i":J
    :goto_1
    return-wide v0

    .line 113
    .restart local v0    # "i":J
    :cond_1
    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    goto :goto_0

    :cond_2
    move-wide v0, p1

    .line 118
    goto :goto_1
.end method
