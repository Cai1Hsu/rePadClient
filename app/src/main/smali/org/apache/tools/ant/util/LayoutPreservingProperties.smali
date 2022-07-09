.class public Lorg/apache/tools/ant/util/LayoutPreservingProperties;
.super Ljava/util/Properties;
.source "LayoutPreservingProperties.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;,
        Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;,
        Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;,
        Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    }
.end annotation


# instance fields
.field private LS:Ljava/lang/String;

.field private keyedPairLines:Ljava/util/HashMap;

.field private logicalLines:Ljava/util/ArrayList;

.field private removeComments:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/util/Properties;-><init>()V

    .line 81
    sget-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/util/Properties;)V
    .locals 1
    .param p1, "defaults"    # Ljava/util/Properties;

    .prologue
    .line 113
    invoke-direct {p0, p1}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    .line 81
    sget-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    .line 114
    return-void
.end method

.method private escape(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 11
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "escapeAllSpaces"    # Z

    .prologue
    const/16 v10, 0x20

    const/4 v9, 0x0

    .line 533
    if-nez p1, :cond_0

    .line 534
    const/4 v8, 0x0

    .line 561
    :goto_0
    return-object v8

    .line 537
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    new-array v2, v8, [C

    .line 538
    .local v2, "ch":[C
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p1, v9, v8, v2, v9}, Ljava/lang/String;->getChars(II[CI)V

    .line 539
    const-string/jumbo v4, "\t\u000c\r\n\\:=#!"

    .line 540
    .local v4, "forEscaping":Ljava/lang/String;
    const-string/jumbo v3, "tfrn\\:=#!"

    .line 541
    .local v3, "escaped":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-direct {v0, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 542
    .local v0, "buffy":Ljava/lang/StringBuffer;
    const/4 v6, 0x1

    .line 543
    .local v6, "leadingSpace":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v8, v2

    if-ge v5, v8, :cond_7

    .line 544
    aget-char v1, v2, v5

    .line 545
    .local v1, "c":C
    if-ne v1, v10, :cond_3

    .line 546
    if-nez p2, :cond_1

    if-eqz v6, :cond_2

    .line 547
    :cond_1
    const-string/jumbo v8, "\\"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 552
    :cond_2
    :goto_2
    invoke-virtual {v4, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 553
    .local v7, "p":I
    const/4 v8, -0x1

    if-eq v7, v8, :cond_4

    .line 554
    const-string/jumbo v8, "\\"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    add-int/lit8 v9, v7, 0x1

    invoke-virtual {v3, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 543
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 550
    .end local v7    # "p":I
    :cond_3
    const/4 v6, 0x0

    goto :goto_2

    .line 555
    .restart local v7    # "p":I
    :cond_4
    if-lt v1, v10, :cond_5

    const/16 v8, 0x7e

    if-le v1, v8, :cond_6

    .line 556
    :cond_5
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->escapeUnicode(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 558
    :cond_6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_3

    .line 561
    .end local v1    # "c":C
    .end local v7    # "p":I
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method private escapeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 519
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->escape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private escapeUnicode(C)Ljava/lang/String;
    .locals 2
    .param p1, "ch"    # C

    .prologue
    .line 571
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "\\"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p1}, Lorg/apache/tools/ant/util/UnicodeUtil;->EscapeUnicode(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private escapeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 506
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->escape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private innerSetProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->escapeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 174
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 175
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 176
    .local v0, "i":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    .line 177
    .local v1, "p":Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->setValue(Ljava/lang/String;)V

    .line 185
    .end local v0    # "i":Ljava/lang/Integer;
    :goto_0
    return-void

    .line 179
    .end local v1    # "p":Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->escapeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 180
    new-instance v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    invoke-direct {v1, p1, p2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .restart local v1    # "p":Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->setNew(Z)V

    .line 182
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private readFirstLine(Ljava/io/PushbackReader;)Ljava/lang/String;
    .locals 5
    .param p1, "r"    # Ljava/io/PushbackReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xa

    .line 383
    new-instance v2, Ljava/lang/StringBuffer;

    const/16 v3, 0x50

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 384
    .local v2, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljava/io/PushbackReader;->read()I

    move-result v0

    .line 385
    .local v0, "ch":I
    const/4 v1, 0x0

    .line 388
    .local v1, "hasCR":Z
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    iput-object v3, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    .line 390
    :goto_0
    if-ltz v0, :cond_0

    .line 391
    if-eqz v1, :cond_1

    if-eq v0, v4, :cond_1

    .line 393
    invoke-virtual {p1, v0}, Ljava/io/PushbackReader;->unread(I)V

    .line 408
    :cond_0
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 397
    :cond_1
    const/16 v3, 0xd

    if-ne v0, v3, :cond_2

    .line 398
    const-string/jumbo v3, "\r"

    iput-object v3, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    .line 399
    const/4 v1, 0x1

    .line 406
    :goto_2
    invoke-virtual {p1}, Ljava/io/PushbackReader;->read()I

    move-result v0

    goto :goto_0

    .line 400
    :cond_2
    if-ne v0, v4, :cond_4

    .line 401
    if-eqz v1, :cond_3

    const-string/jumbo v3, "\r\n"

    :goto_3
    iput-object v3, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    goto :goto_1

    :cond_3
    const-string/jumbo v3, "\n"

    goto :goto_3

    .line 404
    :cond_4
    int-to-char v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method private readLines(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 13
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    new-instance v4, Ljava/io/InputStreamReader;

    const-string/jumbo v10, "ISO-8859-1"

    invoke-direct {v4, p1, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 314
    .local v4, "isr":Ljava/io/InputStreamReader;
    new-instance v8, Ljava/io/PushbackReader;

    const/4 v10, 0x1

    invoke-direct {v8, v4, v10}, Ljava/io/PushbackReader;-><init>(Ljava/io/Reader;I)V

    .line 316
    .local v8, "pbr":Ljava/io/PushbackReader;
    iget-object v10, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lez v10, :cond_0

    .line 318
    iget-object v10, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    new-instance v11, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;

    invoke-direct {v11}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;-><init>()V

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    :cond_0
    invoke-direct {p0, v8}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->readFirstLine(Ljava/io/PushbackReader;)Ljava/lang/String;

    move-result-object v9

    .line 322
    .local v9, "s":Ljava/lang/String;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 324
    .local v0, "br":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 325
    .local v2, "continuation":Z
    const/4 v1, 0x0

    .line 326
    .local v1, "comment":Z
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 327
    .local v3, "fileBuffer":Ljava/lang/StringBuffer;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 328
    .local v7, "logicalLineBuffer":Ljava/lang/StringBuffer;
    :goto_0
    if-eqz v9, :cond_7

    .line 329
    invoke-virtual {v3, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 331
    if-eqz v2, :cond_3

    .line 333
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 341
    :goto_1
    if-nez v1, :cond_1

    .line 342
    invoke-direct {p0, v9}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->requiresContinuation(Ljava/lang/String;)Z

    move-result v2

    .line 345
    :cond_1
    invoke-virtual {v7, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    if-nez v2, :cond_2

    .line 348
    const/4 v6, 0x0

    .line 349
    .local v6, "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    if-eqz v1, :cond_4

    .line 350
    new-instance v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    .end local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, p0, v10}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;-><init>(Lorg/apache/tools/ant/util/LayoutPreservingProperties;Ljava/lang/String;)V

    .line 363
    .restart local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :goto_2
    iget-object v10, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 366
    .end local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    .line 336
    :cond_3
    const-string/jumbo v10, "^( |\t|\u000c)*(#|!).*"

    invoke-virtual {v9, v10}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    goto :goto_1

    .line 351
    .restart local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_4
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_5

    .line 352
    new-instance v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;

    .end local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    invoke-direct {v6}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;-><init>()V

    .restart local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    goto :goto_2

    .line 354
    :cond_5
    new-instance v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    .end local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;-><init>(Ljava/lang/String;)V

    .restart local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    move-object v10, v6

    .line 355
    check-cast v10, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    invoke-virtual {v10}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 356
    .local v5, "key":Ljava/lang/String;
    iget-object v10, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v10, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 359
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    :cond_6
    iget-object v10, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    new-instance v11, Ljava/lang/Integer;

    iget-object v12, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    invoke-direct {v11, v12}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v10, v5, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 368
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_7
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method private removeCommentsEndingAt(I)V
    .locals 3
    .param p1, "pos"    # I

    .prologue
    .line 588
    add-int/lit8 v0, p1, -0x1

    .line 591
    .local v0, "end":I
    move p1, v0

    :goto_0
    if-lez p1, :cond_0

    .line 592
    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;

    if-nez v1, :cond_2

    .line 599
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    if-nez v1, :cond_4

    .line 614
    :cond_1
    return-void

    .line 591
    :cond_2
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 604
    :cond_3
    add-int/lit8 p1, p1, -0x1

    :cond_4
    if-ltz p1, :cond_5

    .line 605
    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    if-nez v1, :cond_3

    .line 611
    :cond_5
    add-int/lit8 p1, p1, 0x1

    :goto_1
    if-gt p1, v0, :cond_1

    .line 612
    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 611
    add-int/lit8 p1, p1, 0x1

    goto :goto_1
.end method

.method private requiresContinuation(Ljava/lang/String;)Z
    .locals 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 420
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 421
    .local v0, "ca":[C
    array-length v4, v0

    add-int/lit8 v1, v4, -0x1

    .line 422
    .local v1, "i":I
    :goto_0
    if-lez v1, :cond_0

    aget-char v4, v0, v1

    const/16 v5, 0x5c

    if-ne v4, v5, :cond_0

    .line 423
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 426
    :cond_0
    array-length v4, v0

    sub-int/2addr v4, v1

    add-int/lit8 v2, v4, -0x1

    .line 427
    .local v2, "tb":I
    rem-int/lit8 v4, v2, 0x2

    if-ne v4, v3, :cond_1

    :goto_1
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method

.method private unescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    const/16 v5, 0xa

    .line 450
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    new-array v2, v4, [C

    .line 451
    .local v2, "ch":[C
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p1, v6, v4, v2, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 452
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    aput-char v5, v2, v4

    .line 453
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 454
    .local v0, "buffy":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 455
    aget-char v1, v2, v3

    .line 456
    .local v1, "c":C
    if-ne v1, v5, :cond_1

    .line 484
    .end local v1    # "c":C
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 460
    .restart local v1    # "c":C
    :cond_1
    const/16 v4, 0x5c

    if-ne v1, v4, :cond_7

    .line 462
    add-int/lit8 v3, v3, 0x1

    aget-char v1, v2, v3

    .line 463
    const/16 v4, 0x6e

    if-ne v1, v4, :cond_2

    .line 464
    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 454
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 465
    :cond_2
    const/16 v4, 0x72

    if-ne v1, v4, :cond_3

    .line 466
    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 467
    :cond_3
    const/16 v4, 0x66

    if-ne v1, v4, :cond_4

    .line 468
    const/16 v4, 0xc

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 469
    :cond_4
    const/16 v4, 0x74

    if-ne v1, v4, :cond_5

    .line 470
    const/16 v4, 0x9

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 471
    :cond_5
    const/16 v4, 0x75

    if-ne v1, v4, :cond_6

    .line 473
    add-int/lit8 v4, v3, 0x1

    invoke-direct {p0, v2, v4}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->unescapeUnicode([CI)C

    move-result v1

    .line 474
    add-int/lit8 v3, v3, 0x4

    .line 475
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 478
    :cond_6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 481
    :cond_7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method private unescapeUnicode([CI)C
    .locals 2
    .param p1, "ch"    # [C
    .param p2, "i"    # I

    .prologue
    .line 494
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x4

    invoke-direct {v0, p1, p2, v1}, Ljava/lang/String;-><init>([CII)V

    .line 495
    .local v0, "s":Ljava/lang/String;
    const/16 v1, 0x10

    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    int-to-char v1, v1

    return v1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 188
    invoke-super {p0}, Ljava/util/Properties;->clear()V

    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 191
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 7

    .prologue
    .line 206
    invoke-super {p0}, Ljava/util/Properties;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;

    .line 208
    .local v0, "dolly":Lorg/apache/tools/ant/util/LayoutPreservingProperties;
    iget-object v5, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    iput-object v5, v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    .line 209
    iget-object v5, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    iput-object v5, v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    .line 210
    iget-object v5, v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 211
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, v4, :cond_1

    .line 212
    iget-object v5, v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;

    .line 213
    .local v2, "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    instance-of v5, v2, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    if-eqz v5, :cond_0

    move-object v3, v2

    .line 214
    check-cast v3, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    .line 215
    .local v3, "p":Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
    iget-object v5, v0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v3}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->clone()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 211
    .end local v3    # "p":Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 219
    .end local v2    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_1
    return-object v0
.end method

.method public isRemoveComments()Z
    .locals 1

    .prologue
    .line 125
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->removeComments:Z

    return v0
.end method

.method public listLines(Ljava/io/PrintStream;)V
    .locals 4
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 228
    const-string/jumbo v2, "-- logical lines --"

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 229
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 230
    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 231
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;

    .line 232
    .local v1, "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    instance-of v2, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;

    if-eqz v2, :cond_1

    .line 233
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "blank:   \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 235
    :cond_1
    instance-of v2, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    if-eqz v2, :cond_2

    .line 236
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "comment: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 238
    :cond_2
    instance-of v2, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    if-eqz v2, :cond_0

    .line 239
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "pair:    \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 242
    .end local v1    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_3
    return-void
.end method

.method public load(Ljava/io/InputStream;)V
    .locals 4
    .param p1, "inStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->readLines(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v2

    .line 143
    .local v2, "s":Ljava/lang/String;
    const-string/jumbo v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 144
    .local v0, "ba":[B
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 145
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    invoke-super {p0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 146
    return-void
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-super {p0, p1, p2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 151
    .local v0, "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->innerSetProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 194
    invoke-super {p0, p1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 195
    .local v1, "obj":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->keyedPairLines:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 196
    .local v0, "i":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    .line 197
    iget-boolean v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->removeComments:Z

    if-eqz v2, :cond_0

    .line 198
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->removeCommentsEndingAt(I)V

    .line 200
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 202
    :cond_1
    return-object v1
.end method

.method public saveAs(Ljava/io/File;)V
    .locals 2
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 250
    .local v0, "fos":Ljava/io/FileOutputStream;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 251
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 252
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-super {p0, p1, p2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 159
    .local v0, "obj":Ljava/lang/Object;
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->innerSetProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-object v0
.end method

.method public setRemoveComments(Z)V
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 138
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->removeComments:Z

    .line 139
    return-void
.end method

.method public store(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 10
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "header"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 255
    new-instance v2, Ljava/io/OutputStreamWriter;

    const-string/jumbo v6, "ISO-8859-1"

    invoke-direct {v2, p1, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 257
    .local v2, "osw":Ljava/io/OutputStreamWriter;
    const/4 v3, 0x0

    .line 258
    .local v3, "skipLines":I
    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 260
    .local v4, "totalLines":I
    if-eqz p2, :cond_0

    .line 261
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 262
    if-lez v4, :cond_0

    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 265
    const/4 v3, 0x1

    .line 272
    :cond_0
    if-le v4, v3, :cond_1

    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v6, v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;

    if-eqz v6, :cond_1

    .line 275
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/tools/ant/util/DateUtils;->parseDateFromHeader(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    add-int/lit8 v3, v3, 0x1

    .line 283
    :cond_1
    :goto_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {}, Lorg/apache/tools/ant/util/DateUtils;->getDateForHeader()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 285
    const/4 v5, 0x0

    .line 286
    .local v5, "writtenSep":Z
    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->logicalLines:Ljava/util/ArrayList;

    invoke-virtual {v6, v3, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 287
    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 288
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;

    .line 289
    .local v1, "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    instance-of v6, v1, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    if-eqz v6, :cond_4

    move-object v6, v1

    .line 290
    check-cast v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;

    invoke-virtual {v6}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->isNew()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 291
    if-nez v5, :cond_3

    .line 292
    iget-object v6, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 293
    const/4 v5, 0x1

    .line 296
    :cond_3
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 298
    :cond_4
    if-eqz v1, :cond_2

    .line 299
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties;->LS:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 302
    .end local v1    # "line":Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
    :cond_5
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V

    .line 303
    return-void

    .line 279
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v5    # "writtenSep":Z
    :catch_0
    move-exception v6

    goto/16 :goto_0
.end method
