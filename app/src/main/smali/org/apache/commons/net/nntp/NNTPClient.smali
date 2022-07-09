.class public Lorg/apache/commons/net/nntp/NNTPClient;
.super Lorg/apache/commons/net/nntp/NNTP;
.source "NNTPClient.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/NNTP;-><init>()V

    return-void
.end method

.method private __ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V
    .locals 2
    .param p1, "ai"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;

    .prologue
    .line 1740
    if-eqz p2, :cond_0

    .line 1741
    iget-object v0, p1, Lorg/apache/commons/net/nntp/ArticleInfo;->articleId:Ljava/lang/String;

    iput-object v0, p2, Lorg/apache/commons/net/nntp/ArticlePointer;->articleId:Ljava/lang/String;

    .line 1742
    iget-wide v0, p1, Lorg/apache/commons/net/nntp/ArticleInfo;->articleNumber:J

    long-to-int v0, v0

    iput v0, p2, Lorg/apache/commons/net/nntp/ArticlePointer;->articleNumber:I

    .line 1744
    :cond_0
    return-void
.end method

.method private __ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;
    .locals 1
    .param p1, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;

    .prologue
    .line 1731
    if-nez p1, :cond_0

    .line 1732
    const/4 v0, 0x0

    .line 1735
    :goto_0
    return-object v0

    .line 1734
    :cond_0
    new-instance v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-direct {v0}, Lorg/apache/commons/net/nntp/ArticleInfo;-><init>()V

    .line 1735
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    goto :goto_0
.end method

.method static __parseArticleEntry(Ljava/lang/String;)Lorg/apache/commons/net/nntp/Article;
    .locals 6
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    .line 228
    new-instance v0, Lorg/apache/commons/net/nntp/Article;

    invoke-direct {v0}, Lorg/apache/commons/net/nntp/Article;-><init>()V

    .line 229
    .local v0, "article":Lorg/apache/commons/net/nntp/Article;
    invoke-virtual {v0, p0}, Lorg/apache/commons/net/nntp/Article;->setSubject(Ljava/lang/String;)V

    .line 230
    const-string/jumbo v4, "\t"

    invoke-virtual {p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 231
    .local v3, "parts":[Ljava/lang/String;
    array-length v4, v3

    const/4 v5, 0x6

    if-le v4, v5, :cond_0

    .line 232
    const/4 v1, 0x0

    .line 234
    .local v1, "i":I
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    :try_start_0
    aget-object v4, v3, v1

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lorg/apache/commons/net/nntp/Article;->setArticleNumber(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :try_start_1
    aget-object v4, v3, v2

    invoke-virtual {v0, v4}, Lorg/apache/commons/net/nntp/Article;->setSubject(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 236
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :try_start_2
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Lorg/apache/commons/net/nntp/Article;->setFrom(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 237
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :try_start_3
    aget-object v4, v3, v2

    invoke-virtual {v0, v4}, Lorg/apache/commons/net/nntp/Article;->setDate(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1

    .line 238
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :try_start_4
    aget-object v4, v3, v1

    invoke-virtual {v0, v4}, Lorg/apache/commons/net/nntp/Article;->setArticleId(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_0

    .line 239
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "i":I
    .restart local v1    # "i":I
    :try_start_5
    aget-object v4, v3, v2

    invoke-virtual {v0, v4}, Lorg/apache/commons/net/nntp/Article;->addReference(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_1

    .line 244
    .end local v1    # "i":I
    :cond_0
    :goto_0
    return-object v0

    .line 240
    .restart local v2    # "i":I
    :catch_0
    move-exception v4

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    :catch_1
    move-exception v4

    goto :goto_0
.end method

.method private __parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V
    .locals 6
    .param p1, "reply"    # Ljava/lang/String;
    .param p2, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/MalformedServerReplyException;
        }
    .end annotation

    .prologue
    .line 103
    const-string/jumbo v3, " "

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "tokens":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x3

    if-lt v3, v4, :cond_0

    .line 105
    const/4 v0, 0x1

    .line 109
    .local v0, "i":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    :try_start_0
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, p2, Lorg/apache/commons/net/nntp/ArticleInfo;->articleNumber:J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    :try_start_1
    aget-object v3, v2, v1

    iput-object v3, p2, Lorg/apache/commons/net/nntp/ArticleInfo;->articleId:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 112
    return-void

    .line 114
    .end local v0    # "i":I
    .restart local v1    # "i":I
    :catch_0
    move-exception v3

    move v0, v1

    .line 119
    .end local v1    # "i":I
    :cond_0
    :goto_0
    new-instance v3, Lorg/apache/commons/net/MalformedServerReplyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Could not parse article pointer.\nServer reply: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/net/MalformedServerReplyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 114
    .restart local v0    # "i":I
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method private static __parseGroupReply(Ljava/lang/String;Lorg/apache/commons/net/nntp/NewsgroupInfo;)V
    .locals 6
    .param p0, "reply"    # Ljava/lang/String;
    .param p1, "info"    # Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/MalformedServerReplyException;
        }
    .end annotation

    .prologue
    .line 134
    const-string/jumbo v3, " "

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, "tokens":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x5

    if-lt v3, v4, :cond_0

    .line 136
    const/4 v0, 0x1

    .line 140
    .local v0, "i":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    :try_start_0
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setArticleCount(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 142
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    :try_start_1
    aget-object v3, v2, v1

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setFirstArticle(J)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 144
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .restart local v1    # "i":I
    :try_start_2
    aget-object v3, v2, v0

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setLastArticle(J)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 146
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    :try_start_3
    aget-object v3, v2, v1

    invoke-virtual {p1, v3}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setNewsgroup(Ljava/lang/String;)V

    .line 148
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setPostingPermission(I)V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_1

    .line 149
    return-void

    .line 150
    .end local v0    # "i":I
    .restart local v1    # "i":I
    :catch_0
    move-exception v3

    move v0, v1

    .line 156
    .end local v1    # "i":I
    :cond_0
    :goto_0
    new-instance v3, Lorg/apache/commons/net/MalformedServerReplyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Could not parse newsgroup info.\nServer reply: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/net/MalformedServerReplyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 150
    .restart local v0    # "i":I
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method static __parseNewsgroupListEntry(Ljava/lang/String;)Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .locals 15
    .param p0, "entry"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    const/4 v14, 0x0

    const-wide/16 v12, 0x0

    .line 164
    const-string/jumbo v10, " "

    invoke-virtual {p0, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 165
    .local v8, "tokens":[Ljava/lang/String;
    array-length v10, v8

    const/4 v11, 0x4

    if-ge v10, v11, :cond_0

    move-object v5, v9

    .line 212
    :goto_0
    return-object v5

    .line 168
    :cond_0
    new-instance v5, Lorg/apache/commons/net/nntp/NewsgroupInfo;

    invoke-direct {v5}, Lorg/apache/commons/net/nntp/NewsgroupInfo;-><init>()V

    .line 170
    .local v5, "result":Lorg/apache/commons/net/nntp/NewsgroupInfo;
    const/4 v1, 0x0

    .line 172
    .local v1, "i":I
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "i":I
    .local v4, "i":I
    aget-object v10, v8, v1

    invoke-virtual {v5, v10}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setNewsgroup(Ljava/lang/String;)V

    .line 176
    add-int/lit8 v1, v4, 0x1

    .end local v4    # "i":I
    .restart local v1    # "i":I
    :try_start_0
    aget-object v10, v8, v4

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-wide v6

    .line 177
    .local v6, "lastNum":J
    add-int/lit8 v4, v1, 0x1

    .end local v1    # "i":I
    .restart local v4    # "i":I
    :try_start_1
    aget-object v10, v8, v1

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 178
    .local v2, "firstNum":J
    invoke-virtual {v5, v2, v3}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setFirstArticle(J)V

    .line 179
    invoke-virtual {v5, v6, v7}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setLastArticle(J)V

    .line 180
    cmp-long v10, v2, v12

    if-nez v10, :cond_1

    cmp-long v10, v6, v12

    if-nez v10, :cond_1

    .line 181
    const-wide/16 v10, 0x0

    invoke-virtual {v5, v10, v11}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setArticleCount(J)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 189
    :goto_1
    add-int/lit8 v1, v4, 0x1

    .end local v4    # "i":I
    .restart local v1    # "i":I
    aget-object v9, v8, v4

    invoke-virtual {v9, v14}, Ljava/lang/String;->charAt(I)C

    move-result v9

    sparse-switch v9, :sswitch_data_0

    .line 207
    invoke-virtual {v5, v14}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setPostingPermission(I)V

    goto :goto_0

    .line 183
    .end local v1    # "i":I
    .restart local v4    # "i":I
    :cond_1
    sub-long v10, v6, v2

    const-wide/16 v12, 0x1

    add-long/2addr v10, v12

    :try_start_2
    invoke-virtual {v5, v10, v11}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setArticleCount(J)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 185
    .end local v2    # "firstNum":J
    :catch_0
    move-exception v0

    move v1, v4

    .end local v4    # "i":I
    .end local v6    # "lastNum":J
    .local v0, "e":Ljava/lang/NumberFormatException;
    .restart local v1    # "i":I
    :goto_2
    move-object v5, v9

    .line 186
    goto :goto_0

    .line 193
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .restart local v2    # "firstNum":J
    .restart local v6    # "lastNum":J
    :sswitch_0
    const/4 v9, 0x2

    invoke-virtual {v5, v9}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setPostingPermission(I)V

    goto :goto_0

    .line 198
    :sswitch_1
    const/4 v9, 0x3

    invoke-virtual {v5, v9}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setPostingPermission(I)V

    goto :goto_0

    .line 203
    :sswitch_2
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Lorg/apache/commons/net/nntp/NewsgroupInfo;->_setPostingPermission(I)V

    goto :goto_0

    .line 185
    .end local v2    # "firstNum":J
    .end local v6    # "lastNum":J
    :catch_1
    move-exception v0

    goto :goto_2

    .line 189
    :sswitch_data_0
    .sparse-switch
        0x4d -> :sswitch_2
        0x4e -> :sswitch_1
        0x59 -> :sswitch_0
        0x6d -> :sswitch_2
        0x6e -> :sswitch_1
        0x79 -> :sswitch_0
    .end sparse-switch
.end method

.method private __readNewsgroupListing()[Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 250
    new-instance v3, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v6, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v3, v6}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    .line 253
    .local v3, "reader":Ljava/io/BufferedReader;
    new-instance v2, Ljava/util/Vector;

    const/16 v6, 0x800

    invoke-direct {v2, v6}, Ljava/util/Vector;-><init>(I)V

    .line 256
    .local v2, "list":Ljava/util/Vector;, "Ljava/util/Vector<Lorg/apache/commons/net/nntp/NewsgroupInfo;>;"
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 258
    invoke-static {v1}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseNewsgroupListEntry(Ljava/lang/String;)Lorg/apache/commons/net/nntp/NewsgroupInfo;

    move-result-object v5

    .line 259
    .local v5, "tmp":Lorg/apache/commons/net/nntp/NewsgroupInfo;
    if-eqz v5, :cond_0

    .line 260
    invoke-virtual {v2, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 262
    :cond_0
    new-instance v6, Lorg/apache/commons/net/MalformedServerReplyException;

    invoke-direct {v6, v1}, Lorg/apache/commons/net/MalformedServerReplyException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 267
    .end local v5    # "tmp":Lorg/apache/commons/net/nntp/NewsgroupInfo;
    :cond_1
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v4

    .local v4, "size":I
    const/4 v6, 0x1

    if-ge v4, v6, :cond_2

    .line 268
    const/4 v6, 0x0

    new-array v0, v6, [Lorg/apache/commons/net/nntp/NewsgroupInfo;

    .line 274
    :goto_1
    return-object v0

    .line 271
    :cond_2
    new-array v0, v4, [Lorg/apache/commons/net/nntp/NewsgroupInfo;

    .line 272
    .local v0, "info":[Lorg/apache/commons/net/nntp/NewsgroupInfo;
    invoke-virtual {v2, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private __retrieve(IJLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "command"    # I
    .param p2, "articleNumber"    # J
    .param p4, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->sendCommand(ILjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 310
    const/4 v0, 0x0

    .line 317
    :goto_0
    return-object v0

    .line 313
    :cond_0
    if-eqz p4, :cond_1

    .line 314
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p4}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 317
    :cond_1
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method

.method private __retrieve(ILjava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "command"    # I
    .param p2, "articleId"    # Ljava/lang/String;
    .param p3, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 282
    if-eqz p2, :cond_1

    .line 284
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->sendCommand(ILjava/lang/String;)I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 300
    :cond_0
    :goto_0
    return-object v0

    .line 290
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->sendCommand(I)I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 296
    :cond_2
    if-eqz p3, :cond_3

    .line 297
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 300
    :cond_3
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method

.method private __retrieveArticleInfo(Ljava/lang/String;)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "articleRange"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1417
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->xover(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1418
    const/4 v0, 0x0

    .line 1421
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method

.method private __retrieveHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "articleRange"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1490
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->xhdr(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1491
    const/4 v0, 0x0

    .line 1494
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1388
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->authinfoUser(Ljava/lang/String;)I

    move-result v0

    .line 1390
    .local v0, "replyCode":I
    const/16 v2, 0x17d

    if-ne v0, v2, :cond_0

    .line 1392
    invoke-virtual {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->authinfoPass(Ljava/lang/String;)I

    move-result v0

    .line 1394
    const/16 v2, 0x119

    if-ne v0, v2, :cond_0

    .line 1396
    iput-boolean v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_isAllowedToPost:Z

    .line 1400
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public completePendingCommand()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1299
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReply()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    return v0
.end method

.method public forwardArticle(Ljava/lang/String;)Ljava/io/Writer;
    .locals 2
    .param p1, "articleId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1352
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->ihave(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveIntermediate(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1353
    const/4 v0, 0x0

    .line 1356
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_writer_:Ljava/io/BufferedWriter;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_0
.end method

.method public iterateArticleInfo(JJ)Ljava/lang/Iterable;
    .locals 5
    .param p1, "lowArticleNumber"    # J
    .param p3, "highArticleNumber"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/net/nntp/Article;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1467
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleInfo(JJ)Ljava/io/BufferedReader;

    move-result-object v0

    .line 1468
    .local v0, "info":Ljava/io/BufferedReader;
    if-nez v0, :cond_0

    .line 1469
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "XOVER command failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1472
    :cond_0
    new-instance v1, Lorg/apache/commons/net/nntp/ArticleIterator;

    new-instance v2, Lorg/apache/commons/net/nntp/ReplyIterator;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;Z)V

    invoke-direct {v1, v2}, Lorg/apache/commons/net/nntp/ArticleIterator;-><init>(Ljava/lang/Iterable;)V

    return-object v1
.end method

.method public iterateNewNews(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)Ljava/lang/Iterable;
    .locals 6
    .param p1, "query"    # Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1257
    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getNewsgroups()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDate()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getTime()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->isGMT()Z

    move-result v4

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDistributions()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/net/nntp/NNTPClient;->newnews(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1260
    new-instance v0, Lorg/apache/commons/net/nntp/ReplyIterator;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;)V

    return-object v0

    .line 1262
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "NEWNEWS command failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterateNewNewsgroupListing(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)Ljava/lang/Iterable;
    .locals 4
    .param p1, "query"    # Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1148
    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getTime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->isGMT()Z

    move-result v2

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDistributions()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/commons/net/nntp/NNTPClient;->newgroups(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1151
    new-instance v0, Lorg/apache/commons/net/nntp/ReplyIterator;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;)V

    return-object v0

    .line 1153
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "NEWGROUPS command failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterateNewNewsgroups(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)Ljava/lang/Iterable;
    .locals 2
    .param p1, "query"    # Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/net/nntp/NewsgroupInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1176
    new-instance v0, Lorg/apache/commons/net/nntp/NewsgroupIterator;

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->iterateNewNewsgroupListing(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/NewsgroupIterator;-><init>(Ljava/lang/Iterable;)V

    return-object v0
.end method

.method public iterateNewsgroupListing()Ljava/lang/Iterable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1009
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->list()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1010
    new-instance v0, Lorg/apache/commons/net/nntp/ReplyIterator;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;)V

    return-object v0

    .line 1012
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "LIST command failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterateNewsgroupListing(Ljava/lang/String;)Ljava/lang/Iterable;
    .locals 3
    .param p1, "wildmat"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1071
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->listActive(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1072
    new-instance v0, Lorg/apache/commons/net/nntp/ReplyIterator;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;)V

    return-object v0

    .line 1074
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "LIST ACTIVE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " command failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterateNewsgroups()Ljava/lang/Iterable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/net/nntp/NewsgroupInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1033
    new-instance v0, Lorg/apache/commons/net/nntp/NewsgroupIterator;

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->iterateNewsgroupListing()Ljava/lang/Iterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/NewsgroupIterator;-><init>(Ljava/lang/Iterable;)V

    return-object v0
.end method

.method public iterateNewsgroups(Ljava/lang/String;)Ljava/lang/Iterable;
    .locals 2
    .param p1, "wildmat"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/apache/commons/net/nntp/NewsgroupInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1090
    new-instance v0, Lorg/apache/commons/net/nntp/NewsgroupIterator;

    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->iterateNewsgroupListing(Ljava/lang/String;)Ljava/lang/Iterable;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/net/nntp/NewsgroupIterator;-><init>(Ljava/lang/Iterable;)V

    return-object v0
.end method

.method public listHelp()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 730
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->help()I

    move-result v2

    invoke-static {v2}, Lorg/apache/commons/net/nntp/NNTPReply;->isInformational(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 731
    const/4 v2, 0x0

    .line 739
    :goto_0
    return-object v2

    .line 734
    :cond_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 735
    .local v0, "help":Ljava/io/StringWriter;
    new-instance v1, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v2, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v1, v2}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    .line 736
    .local v1, "reader":Ljava/io/BufferedReader;
    invoke-static {v1, v0}, Lorg/apache/commons/net/io/Util;->copyReader(Ljava/io/Reader;Ljava/io/Writer;)J

    .line 737
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 738
    invoke-virtual {v0}, Ljava/io/StringWriter;->close()V

    .line 739
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public listNewNews(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)[Ljava/lang/String;
    .locals 11
    .param p1, "query"    # Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1208
    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getNewsgroups()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDate()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getTime()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->isGMT()Z

    move-result v4

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDistributions()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/net/nntp/NNTPClient;->newnews(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1211
    const/4 v9, 0x0

    .line 1230
    :goto_0
    return-object v9

    .line 1214
    :cond_0
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    .line 1215
    .local v7, "list":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    new-instance v8, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v0, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v8, v0}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    .line 1218
    .local v8, "reader":Ljava/io/BufferedReader;
    :goto_1
    invoke-virtual {v8}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, "line":Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 1219
    invoke-virtual {v7, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 1222
    :cond_1
    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v10

    .line 1223
    .local v10, "size":I
    const/4 v0, 0x1

    if-ge v10, v0, :cond_2

    .line 1224
    const/4 v0, 0x0

    new-array v9, v0, [Ljava/lang/String;

    goto :goto_0

    .line 1227
    :cond_2
    new-array v9, v10, [Ljava/lang/String;

    .line 1228
    .local v9, "result":[Ljava/lang/String;
    invoke-virtual {v7, v9}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public listNewNewsgroups(Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;)[Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .locals 4
    .param p1, "query"    # Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1118
    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getTime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->isGMT()Z

    move-result v2

    invoke-virtual {p1}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->getDistributions()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/commons/net/nntp/NNTPClient;->newgroups(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1122
    const/4 v0, 0x0

    .line 1125
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->__readNewsgroupListing()[Lorg/apache/commons/net/nntp/NewsgroupInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public listNewsgroups()[Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 984
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->list()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 985
    const/4 v0, 0x0

    .line 988
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->__readNewsgroupListing()[Lorg/apache/commons/net/nntp/NewsgroupInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public listNewsgroups(Ljava/lang/String;)[Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .locals 1
    .param p1, "wildmat"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1051
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->listActive(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1052
    const/4 v0, 0x0

    .line 1054
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->__readNewsgroupListing()[Lorg/apache/commons/net/nntp/NewsgroupInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public listOverviewFmt()[Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 750
    const-string/jumbo v3, "LIST"

    const-string/jumbo v4, "OVERVIEW.FMT"

    invoke-virtual {p0, v3, v4}, Lorg/apache/commons/net/nntp/NNTPClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 751
    const/4 v3, 0x0

    .line 761
    :goto_0
    return-object v3

    .line 754
    :cond_0
    new-instance v2, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v3, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_reader_:Ljava/io/BufferedReader;

    invoke-direct {v2, v3}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    .line 756
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 757
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 758
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 760
    :cond_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 761
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    goto :goto_0
.end method

.method public logout()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1371
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->quit()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    return v0
.end method

.method public postArticle()Ljava/io/Writer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1342
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->post()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveIntermediate(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1343
    const/4 v0, 0x0

    .line 1346
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/NNTPClient;->_writer_:Ljava/io/BufferedWriter;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageWriter;-><init>(Ljava/io/Writer;)V

    goto :goto_0
.end method

.method public retrieveArticle(J)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .param p3, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 428
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(IJLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .param p2, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(ILjava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle()Ljava/io/Reader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 383
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle(I)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1634
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(J)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle(ILorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 4
    .param p1, "a"    # I
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1623
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1624
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1625
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1626
    return-object v1
.end method

.method public retrieveArticle(Ljava/lang/String;)Ljava/io/Reader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1653
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1654
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1655
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1656
    return-object v1
.end method

.method public retrieveArticleBody(J)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 674
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .param p3, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 667
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(IJLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .param p2, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 602
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(ILjava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody()Ljava/io/Reader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 621
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody(I)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1615
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(J)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody(ILorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 4
    .param p1, "a"    # I
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1642
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1643
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1644
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1645
    return-object v1
.end method

.method public retrieveArticleBody(Ljava/lang/String;)Ljava/io/Reader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 612
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleBody(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1664
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1665
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleBody(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1666
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1667
    return-object v1
.end method

.method public retrieveArticleHeader(J)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 554
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .param p3, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 547
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(IJLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .param p2, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 482
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieve(ILjava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader()Ljava/io/Reader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader(I)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1596
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(J)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader(ILorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 4
    .param p1, "a"    # I
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1604
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1605
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(JLorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1606
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1607
    return-object v1
.end method

.method public retrieveArticleHeader(Ljava/lang/String;)Ljava/io/Reader;
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 492
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleHeader(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticlePointer;)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1675
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1676
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleHeader(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Ljava/io/BufferedReader;

    move-result-object v1

    .line 1677
    .local v1, "rdr":Ljava/io/Reader;
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1678
    return-object v1
.end method

.method public retrieveArticleInfo(J)Ljava/io/BufferedReader;
    .locals 1
    .param p1, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1433
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieveArticleInfo(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleInfo(JJ)Ljava/io/BufferedReader;
    .locals 3
    .param p1, "lowArticleNumber"    # J
    .param p3, "highArticleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1449
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieveArticleInfo(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleInfo(I)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1580
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleInfo(J)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveArticleInfo(II)Ljava/io/Reader;
    .locals 4
    .param p1, "a"    # I
    .param p2, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1553
    int-to-long v0, p1

    int-to-long v2, p2

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveArticleInfo(JJ)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveHeader(Ljava/lang/String;J)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1508
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieveHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveHeader(Ljava/lang/String;JJ)Ljava/io/BufferedReader;
    .locals 2
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "lowArticleNumber"    # J
    .param p4, "highArticleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1525
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->__retrieveHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveHeader(Ljava/lang/String;I)Ljava/io/Reader;
    .locals 2
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1561
    int-to-long v0, p2

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveHeader(Ljava/lang/String;J)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public retrieveHeader(Ljava/lang/String;II)Ljava/io/Reader;
    .locals 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "l"    # I
    .param p3, "h"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1545
    int-to-long v2, p2

    int-to-long v4, p3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/net/nntp/NNTPClient;->retrieveHeader(Ljava/lang/String;JJ)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public selectArticle(I)Z
    .locals 2
    .param p1, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1588
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(J)Z

    move-result v0

    return v0
.end method

.method public selectArticle(ILorg/apache/commons/net/nntp/ArticlePointer;)Z
    .locals 4
    .param p1, "a"    # I
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1569
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1570
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v1

    .line 1571
    .local v1, "b":Z
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1572
    return v1
.end method

.method public selectArticle(J)Z
    .locals 1
    .param p1, "articleNumber"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 868
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v0

    return v0
.end method

.method public selectArticle(JLorg/apache/commons/net/nntp/ArticleInfo;)Z
    .locals 1
    .param p1, "articleNumber"    # J
    .param p3, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 853
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->stat(J)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 854
    const/4 v0, 0x0

    .line 861
    :goto_0
    return v0

    .line 857
    :cond_0
    if-eqz p3, :cond_1

    .line 858
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 861
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public selectArticle(Ljava/lang/String;)Z
    .locals 1
    .param p1, "articleId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 812
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v0

    return v0
.end method

.method public selectArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Z
    .locals 2
    .param p1, "articleId"    # Ljava/lang/String;
    .param p2, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 792
    if-eqz p1, :cond_1

    .line 793
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->stat(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 806
    :cond_0
    :goto_0
    return v0

    .line 797
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->stat()I

    move-result v1

    invoke-static {v1}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 802
    :cond_2
    if-eqz p2, :cond_3

    .line 803
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 806
    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public selectArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticlePointer;)Z
    .locals 2
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1686
    invoke-direct {p0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1687
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v1

    .line 1688
    .local v1, "b":Z
    invoke-direct {p0, v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1689
    return v1
.end method

.method public selectArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z
    .locals 1
    .param p1, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 821
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v0

    return v0
.end method

.method public selectArticle(Lorg/apache/commons/net/nntp/ArticlePointer;)Z
    .locals 2
    .param p1, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1698
    invoke-direct {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1699
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v1

    .line 1700
    .local v1, "b":Z
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1701
    return v1
.end method

.method public selectNewsgroup(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newsgroup"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 713
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectNewsgroup(Ljava/lang/String;Lorg/apache/commons/net/nntp/NewsgroupInfo;)Z

    move-result v0

    return v0
.end method

.method public selectNewsgroup(Ljava/lang/String;Lorg/apache/commons/net/nntp/NewsgroupInfo;)Z
    .locals 1
    .param p1, "newsgroup"    # Ljava/lang/String;
    .param p2, "info"    # Lorg/apache/commons/net/nntp/NewsgroupInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 699
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->group(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 700
    const/4 v0, 0x0

    .line 707
    :goto_0
    return v0

    .line 703
    :cond_0
    if-eqz p2, :cond_1

    .line 704
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseGroupReply(Ljava/lang/String;Lorg/apache/commons/net/nntp/NewsgroupInfo;)V

    .line 707
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public selectNextArticle()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 958
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectNextArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v0

    return v0
.end method

.method public selectNextArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z
    .locals 1
    .param p1, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 943
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->next()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 944
    const/4 v0, 0x0

    .line 951
    :goto_0
    return v0

    .line 947
    :cond_0
    if-eqz p1, :cond_1

    .line 948
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 951
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public selectNextArticle(Lorg/apache/commons/net/nntp/ArticlePointer;)Z
    .locals 2
    .param p1, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1710
    invoke-direct {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1711
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectNextArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v1

    .line 1712
    .local v1, "b":Z
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1713
    return v1
.end method

.method public selectPreviousArticle()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 913
    const/4 v0, 0x0

    check-cast v0, Lorg/apache/commons/net/nntp/ArticleInfo;

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectPreviousArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v0

    return v0
.end method

.method public selectPreviousArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z
    .locals 1
    .param p1, "pointer"    # Lorg/apache/commons/net/nntp/ArticleInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 899
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->last()I

    move-result v0

    invoke-static {v0}, Lorg/apache/commons/net/nntp/NNTPReply;->isPositiveCompletion(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 900
    const/4 v0, 0x0

    .line 907
    :goto_0
    return v0

    .line 903
    :cond_0
    if-eqz p1, :cond_1

    .line 904
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/NNTPClient;->getReplyString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__parseArticlePointer(Ljava/lang/String;Lorg/apache/commons/net/nntp/ArticleInfo;)V

    .line 907
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public selectPreviousArticle(Lorg/apache/commons/net/nntp/ArticlePointer;)Z
    .locals 2
    .param p1, "ap"    # Lorg/apache/commons/net/nntp/ArticlePointer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1722
    invoke-direct {p0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ap2ai(Lorg/apache/commons/net/nntp/ArticlePointer;)Lorg/apache/commons/net/nntp/ArticleInfo;

    move-result-object v0

    .line 1723
    .local v0, "ai":Lorg/apache/commons/net/nntp/ArticleInfo;
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NNTPClient;->selectPreviousArticle(Lorg/apache/commons/net/nntp/ArticleInfo;)Z

    move-result v1

    .line 1724
    .local v1, "b":Z
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/nntp/NNTPClient;->__ai2ap(Lorg/apache/commons/net/nntp/ArticleInfo;Lorg/apache/commons/net/nntp/ArticlePointer;)V

    .line 1725
    return v1
.end method
