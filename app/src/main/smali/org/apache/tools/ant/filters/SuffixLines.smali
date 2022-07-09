.class public final Lorg/apache/tools/ant/filters/SuffixLines;
.super Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.source "SuffixLines.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final SUFFIX_KEY:Ljava/lang/String; = "suffix"


# instance fields
.field private queuedData:Ljava/lang/String;

.field private suffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 56
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>()V

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;-><init>(Ljava/io/Reader;)V

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 67
    return-void
.end method

.method private getSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    return-object v0
.end method

.method private initialize()V
    .locals 4

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->getParameters()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v1

    .line 164
    .local v1, "params":[Lorg/apache/tools/ant/types/Parameter;
    if-eqz v1, :cond_0

    .line 165
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 166
    const-string/jumbo v2, "suffix"

    aget-object v3, v1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 167
    aget-object v2, v1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    .line 172
    .end local v0    # "i":I
    :cond_0
    return-void

    .line 165
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 153
    new-instance v0, Lorg/apache/tools/ant/filters/SuffixLines;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/SuffixLines;-><init>(Ljava/io/Reader;)V

    .line 154
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/SuffixLines;
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->getSuffix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/SuffixLines;->setSuffix(Ljava/lang/String;)V

    .line 155
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/SuffixLines;->setInitialized(Z)V

    .line 156
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
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 82
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->getInitialized()Z

    move-result v2

    if-nez v2, :cond_0

    .line 83
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->initialize()V

    .line 84
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/filters/SuffixLines;->setInitialized(Z)V

    .line 87
    :cond_0
    const/4 v0, -0x1

    .line 89
    .local v0, "ch":I
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 90
    iput-object v4, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 93
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 94
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 95
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 96
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_2

    .line 97
    iput-object v4, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    :cond_2
    :goto_0
    move v2, v0

    .line 119
    :goto_1
    return v2

    .line 100
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->readLine()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 101
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 102
    const/4 v0, -0x1

    goto :goto_0

    .line 104
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    if-eqz v2, :cond_6

    .line 105
    const-string/jumbo v1, ""

    .line 106
    .local v1, "lf":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    const-string/jumbo v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 107
    const-string/jumbo v1, "\r\n"

    .line 111
    :cond_5
    :goto_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    .line 116
    .end local v1    # "lf":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/SuffixLines;->read()I

    move-result v2

    goto :goto_1

    .line 108
    .restart local v1    # "lf":Ljava/lang/String;
    :cond_7
    iget-object v2, p0, Lorg/apache/tools/ant/filters/SuffixLines;->queuedData:Ljava/lang/String;

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 109
    const-string/jumbo v1, "\n"

    goto :goto_2
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 130
    iput-object p1, p0, Lorg/apache/tools/ant/filters/SuffixLines;->suffix:Ljava/lang/String;

    .line 131
    return-void
.end method
