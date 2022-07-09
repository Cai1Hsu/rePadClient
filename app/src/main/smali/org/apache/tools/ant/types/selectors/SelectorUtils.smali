.class public final Lorg/apache/tools/ant/types/selectors/SelectorUtils;
.super Ljava/lang/Object;
.source "SelectorUtils.java"


# static fields
.field public static final DEEP_TREE_MATCH:Ljava/lang/String; = "**"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final instance:Lorg/apache/tools/ant/types/selectors/SelectorUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    new-instance v0, Lorg/apache/tools/ant/types/selectors/SelectorUtils;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->instance:Lorg/apache/tools/ant/types/selectors/SelectorUtils;

    .line 47
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method private static allStars([CII)Z
    .locals 3
    .param p0, "chars"    # [C
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 489
    move v0, p1

    .local v0, "i":I
    :goto_0
    if-gt v0, p2, :cond_1

    .line 490
    aget-char v1, p0, v0

    const/16 v2, 0x2a

    if-eq v1, v2, :cond_0

    .line 491
    const/4 v1, 0x0

    .line 494
    :goto_1
    return v1

    .line 489
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 494
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private static different(ZCC)Z
    .locals 4
    .param p0, "caseSensitive"    # Z
    .param p1, "ch"    # C
    .param p2, "other"    # C

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 499
    if-eqz p0, :cond_2

    if-eq p1, p2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    invoke-static {p1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-static {p2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    if-ne v2, v3, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public static getInstance()Lorg/apache/tools/ant/types/selectors/SelectorUtils;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->instance:Lorg/apache/tools/ant/types/selectors/SelectorUtils;

    return-object v0
.end method

.method public static hasWildcards(Ljava/lang/String;)Z
    .locals 2
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 683
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isOutOfDate(Ljava/io/File;Ljava/io/File;I)Z
    .locals 6
    .param p0, "src"    # Ljava/io/File;
    .param p1, "target"    # Ljava/io/File;
    .param p2, "granularity"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 604
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 613
    :cond_0
    :goto_0
    return v0

    .line 607
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    move v0, v1

    .line 608
    goto :goto_0

    .line 610
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    int-to-long v4, p2

    sub-long/2addr v2, v4

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    move v0, v1

    .line 611
    goto :goto_0
.end method

.method public static isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;I)Z
    .locals 2
    .param p0, "src"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "target"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "granularity"    # I

    .prologue
    .line 632
    int-to-long v0, p2

    invoke-static {p0, p1, v0, v1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z

    move-result v0

    return v0
.end method

.method public static isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z
    .locals 8
    .param p0, "src"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "target"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "granularity"    # J

    .prologue
    const-wide/16 v6, 0x0

    .line 650
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    .line 651
    .local v0, "sourceLastModified":J
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    .line 652
    .local v2, "targetLastModified":J
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v4

    if-eqz v4, :cond_1

    cmp-long v4, v0, v6

    if-eqz v4, :cond_0

    cmp-long v4, v2, v6

    if-eqz v4, :cond_0

    sub-long v4, v0, p2

    cmp-long v4, v4, v2

    if-lez v4, :cond_1

    :cond_0
    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static match(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 341
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static match(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 17
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "caseSensitive"    # Z

    .prologue
    .line 363
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    .line 364
    .local v6, "patArr":[C
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v11

    .line 365
    .local v11, "strArr":[C
    const/4 v8, 0x0

    .line 366
    .local v8, "patIdxStart":I
    array-length v15, v6

    add-int/lit8 v7, v15, -0x1

    .line 367
    .local v7, "patIdxEnd":I
    const/4 v13, 0x0

    .line 368
    .local v13, "strIdxStart":I
    array-length v15, v11

    add-int/lit8 v12, v15, -0x1

    .line 371
    .local v12, "strIdxEnd":I
    const/4 v2, 0x0

    .line 372
    .local v2, "containsStar":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v15, v6

    if-ge v4, v15, :cond_0

    .line 373
    aget-char v15, v6, v4

    const/16 v16, 0x2a

    move/from16 v0, v16

    if-ne v15, v0, :cond_1

    .line 374
    const/4 v2, 0x1

    .line 379
    :cond_0
    if-nez v2, :cond_5

    .line 381
    if-eq v7, v12, :cond_2

    .line 382
    const/4 v15, 0x0

    .line 485
    :goto_1
    return v15

    .line 372
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 384
    :cond_2
    const/4 v4, 0x0

    :goto_2
    if-gt v4, v7, :cond_4

    .line 385
    aget-char v1, v6, v4

    .line 386
    .local v1, "ch":C
    const/16 v15, 0x3f

    if-eq v1, v15, :cond_3

    .line 387
    aget-char v15, v11, v4

    move/from16 v0, p2

    invoke-static {v0, v1, v15}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->different(ZCC)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 388
    const/4 v15, 0x0

    goto :goto_1

    .line 384
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 392
    .end local v1    # "ch":C
    :cond_4
    const/4 v15, 0x1

    goto :goto_1

    .line 395
    :cond_5
    if-nez v7, :cond_7

    .line 396
    const/4 v15, 0x1

    goto :goto_1

    .line 410
    .restart local v1    # "ch":C
    :cond_6
    add-int/lit8 v8, v8, 0x1

    .line 411
    add-int/lit8 v13, v13, 0x1

    .line 401
    .end local v1    # "ch":C
    :cond_7
    aget-char v1, v6, v8

    .line 402
    .restart local v1    # "ch":C
    const/16 v15, 0x2a

    if-eq v1, v15, :cond_8

    if-le v13, v12, :cond_9

    .line 413
    :cond_8
    if-le v13, v12, :cond_b

    .line 416
    invoke-static {v6, v8, v7}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->allStars([CII)Z

    move-result v15

    goto :goto_1

    .line 405
    :cond_9
    const/16 v15, 0x3f

    if-eq v1, v15, :cond_6

    .line 406
    aget-char v15, v11, v13

    move/from16 v0, p2

    invoke-static {v0, v1, v15}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->different(ZCC)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 407
    const/4 v15, 0x0

    goto :goto_1

    .line 430
    :cond_a
    add-int/lit8 v7, v7, -0x1

    .line 431
    add-int/lit8 v12, v12, -0x1

    .line 421
    :cond_b
    aget-char v1, v6, v7

    .line 422
    const/16 v15, 0x2a

    if-eq v1, v15, :cond_c

    if-le v13, v12, :cond_d

    .line 433
    :cond_c
    if-le v13, v12, :cond_e

    .line 436
    invoke-static {v6, v8, v7}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->allStars([CII)Z

    move-result v15

    goto :goto_1

    .line 425
    :cond_d
    const/16 v15, 0x3f

    if-eq v1, v15, :cond_a

    .line 426
    aget-char v15, v11, v12

    move/from16 v0, p2

    invoke-static {v0, v1, v15}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->different(ZCC)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 427
    const/4 v15, 0x0

    goto :goto_1

    .line 441
    :cond_e
    :goto_3
    if-eq v8, v7, :cond_16

    if-gt v13, v12, :cond_16

    .line 442
    const/4 v9, -0x1

    .line 443
    .local v9, "patIdxTmp":I
    add-int/lit8 v4, v8, 0x1

    :goto_4
    if-gt v4, v7, :cond_f

    .line 444
    aget-char v15, v6, v4

    const/16 v16, 0x2a

    move/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 445
    move v9, v4

    .line 449
    :cond_f
    add-int/lit8 v15, v8, 0x1

    if-ne v9, v15, :cond_11

    .line 451
    add-int/lit8 v8, v8, 0x1

    .line 452
    goto :goto_3

    .line 443
    :cond_10
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 456
    :cond_11
    sub-int v15, v9, v8

    add-int/lit8 v10, v15, -0x1

    .line 457
    .local v10, "patLength":I
    sub-int v15, v12, v13

    add-int/lit8 v14, v15, 0x1

    .line 458
    .local v14, "strLength":I
    const/4 v3, -0x1

    .line 460
    .local v3, "foundIdx":I
    const/4 v4, 0x0

    :goto_5
    sub-int v15, v14, v10

    if-gt v4, v15, :cond_14

    .line 461
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_6
    if-ge v5, v10, :cond_13

    .line 462
    add-int v15, v8, v5

    add-int/lit8 v15, v15, 0x1

    aget-char v1, v6, v15

    .line 463
    const/16 v15, 0x3f

    if-eq v1, v15, :cond_12

    .line 464
    add-int v15, v13, v4

    add-int/2addr v15, v5

    aget-char v15, v11, v15

    move/from16 v0, p2

    invoke-static {v0, v1, v15}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->different(ZCC)Z

    move-result v15

    if-eqz v15, :cond_12

    .line 460
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 461
    :cond_12
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 471
    :cond_13
    add-int v3, v13, v4

    .line 475
    .end local v5    # "j":I
    :cond_14
    const/4 v15, -0x1

    if-ne v3, v15, :cond_15

    .line 476
    const/4 v15, 0x0

    goto/16 :goto_1

    .line 479
    :cond_15
    move v8, v9

    .line 480
    add-int v13, v3, v10

    goto :goto_3

    .line 485
    .end local v3    # "foundIdx":I
    .end local v9    # "patIdxTmp":I
    .end local v10    # "patLength":I
    .end local v14    # "strLength":I
    :cond_16
    invoke-static {v6, v8, v7}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->allStars([CII)Z

    move-result v15

    goto/16 :goto_1
.end method

.method public static matchPath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-static {p0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "patDirs":[Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath([Ljava/lang/String;[Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static matchPath(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 2
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 213
    invoke-static {p0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "patDirs":[Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath([Ljava/lang/String;[Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method static matchPath([Ljava/lang/String;[Ljava/lang/String;Z)Z
    .locals 16
    .param p0, "tokenizedPattern"    # [Ljava/lang/String;
    .param p1, "strDirs"    # [Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 223
    const/4 v6, 0x0

    .line 224
    .local v6, "patIdxStart":I
    move-object/from16 v0, p0

    array-length v14, v0

    add-int/lit8 v5, v14, -0x1

    .line 225
    .local v5, "patIdxEnd":I
    const/4 v10, 0x0

    .line 226
    .local v10, "strIdxStart":I
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/lit8 v9, v14, -0x1

    .line 229
    .local v9, "strIdxEnd":I
    :goto_0
    if-gt v6, v5, :cond_0

    if-gt v10, v9, :cond_0

    .line 230
    aget-object v4, p0, v6

    .line 231
    .local v4, "patDir":Ljava/lang/String;
    const-string/jumbo v14, "**"

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 240
    .end local v4    # "patDir":Ljava/lang/String;
    :cond_0
    if-le v10, v9, :cond_5

    .line 242
    move v2, v6

    .local v2, "i":I
    :goto_1
    if-gt v2, v5, :cond_4

    .line 243
    aget-object v14, p0, v2

    const-string/jumbo v15, "**"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_3

    .line 244
    const/4 v14, 0x0

    .line 323
    .end local v2    # "i":I
    :goto_2
    return v14

    .line 234
    .restart local v4    # "patDir":Ljava/lang/String;
    :cond_1
    aget-object v14, p1, v10

    move/from16 v0, p2

    invoke-static {v4, v14, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_2

    .line 235
    const/4 v14, 0x0

    goto :goto_2

    .line 237
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 238
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 242
    .end local v4    # "patDir":Ljava/lang/String;
    .restart local v2    # "i":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 247
    :cond_4
    const/4 v14, 0x1

    goto :goto_2

    .line 249
    .end local v2    # "i":I
    :cond_5
    if-le v6, v5, :cond_7

    .line 251
    const/4 v14, 0x0

    goto :goto_2

    .line 264
    .restart local v4    # "patDir":Ljava/lang/String;
    :cond_6
    add-int/lit8 v5, v5, -0x1

    .line 265
    add-int/lit8 v9, v9, -0x1

    .line 256
    .end local v4    # "patDir":Ljava/lang/String;
    :cond_7
    if-gt v6, v5, :cond_8

    if-gt v10, v9, :cond_8

    .line 257
    aget-object v4, p0, v5

    .line 258
    .restart local v4    # "patDir":Ljava/lang/String;
    const-string/jumbo v14, "**"

    invoke-virtual {v4, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 267
    .end local v4    # "patDir":Ljava/lang/String;
    :cond_8
    if-le v10, v9, :cond_c

    .line 269
    move v2, v6

    .restart local v2    # "i":I
    :goto_3
    if-gt v2, v5, :cond_b

    .line 270
    aget-object v14, p0, v2

    const-string/jumbo v15, "**"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_a

    .line 271
    const/4 v14, 0x0

    goto :goto_2

    .line 261
    .end local v2    # "i":I
    .restart local v4    # "patDir":Ljava/lang/String;
    :cond_9
    aget-object v14, p1, v9

    move/from16 v0, p2

    invoke-static {v4, v14, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_6

    .line 262
    const/4 v14, 0x0

    goto :goto_2

    .line 269
    .end local v4    # "patDir":Ljava/lang/String;
    .restart local v2    # "i":I
    :cond_a
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 274
    :cond_b
    const/4 v14, 0x1

    goto :goto_2

    .line 277
    .end local v2    # "i":I
    :cond_c
    :goto_4
    if-eq v6, v5, :cond_14

    if-gt v10, v9, :cond_14

    .line 278
    const/4 v7, -0x1

    .line 279
    .local v7, "patIdxTmp":I
    add-int/lit8 v2, v6, 0x1

    .restart local v2    # "i":I
    :goto_5
    if-gt v2, v5, :cond_d

    .line 280
    aget-object v14, p0, v2

    const-string/jumbo v15, "**"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_e

    .line 281
    move v7, v2

    .line 285
    :cond_d
    add-int/lit8 v14, v6, 0x1

    if-ne v7, v14, :cond_f

    .line 287
    add-int/lit8 v6, v6, 0x1

    .line 288
    goto :goto_4

    .line 279
    :cond_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 292
    :cond_f
    sub-int v14, v7, v6

    add-int/lit8 v8, v14, -0x1

    .line 293
    .local v8, "patLength":I
    sub-int v14, v9, v10

    add-int/lit8 v11, v14, 0x1

    .line 294
    .local v11, "strLength":I
    const/4 v1, -0x1

    .line 296
    .local v1, "foundIdx":I
    const/4 v2, 0x0

    :goto_6
    sub-int v14, v11, v8

    if-gt v2, v14, :cond_12

    .line 297
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_7
    if-ge v3, v8, :cond_11

    .line 298
    add-int v14, v6, v3

    add-int/lit8 v14, v14, 0x1

    aget-object v12, p0, v14

    .line 299
    .local v12, "subPat":Ljava/lang/String;
    add-int v14, v10, v2

    add-int/2addr v14, v3

    aget-object v13, p1, v14

    .line 300
    .local v13, "subStr":Ljava/lang/String;
    move/from16 v0, p2

    invoke-static {v12, v13, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_10

    .line 296
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 297
    :cond_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 305
    .end local v12    # "subPat":Ljava/lang/String;
    .end local v13    # "subStr":Ljava/lang/String;
    :cond_11
    add-int v1, v10, v2

    .line 309
    .end local v3    # "j":I
    :cond_12
    const/4 v14, -0x1

    if-ne v1, v14, :cond_13

    .line 310
    const/4 v14, 0x0

    goto/16 :goto_2

    .line 313
    :cond_13
    move v6, v7

    .line 314
    add-int v10, v1, v8

    goto :goto_4

    .line 317
    .end local v1    # "foundIdx":I
    .end local v2    # "i":I
    .end local v7    # "patIdxTmp":I
    .end local v8    # "patLength":I
    .end local v11    # "strLength":I
    :cond_14
    move v2, v6

    .restart local v2    # "i":I
    :goto_8
    if-gt v2, v5, :cond_16

    .line 318
    aget-object v14, p0, v2

    const-string/jumbo v15, "**"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_15

    .line 319
    const/4 v14, 0x0

    goto/16 :goto_2

    .line 317
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 323
    :cond_16
    const/4 v14, 0x1

    goto/16 :goto_2
.end method

.method public static matchPatternStart(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static matchPatternStart(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 4
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 107
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eq v2, v3, :cond_0

    .line 109
    const/4 v2, 0x0

    .line 114
    :goto_0
    return v2

    .line 112
    :cond_0
    invoke-static {p0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "patDirs":[Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 114
    .local v1, "strDirs":[Ljava/lang/String;
    invoke-static {v0, v1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart([Ljava/lang/String;[Ljava/lang/String;Z)Z

    move-result v2

    goto :goto_0
.end method

.method static matchPatternStart([Ljava/lang/String;[Ljava/lang/String;Z)Z
    .locals 8
    .param p0, "patDirs"    # [Ljava/lang/String;
    .param p1, "strDirs"    # [Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 138
    const/4 v2, 0x0

    .line 139
    .local v2, "patIdxStart":I
    array-length v7, p0

    add-int/lit8 v1, v7, -0x1

    .line 140
    .local v1, "patIdxEnd":I
    const/4 v4, 0x0

    .line 141
    .local v4, "strIdxStart":I
    array-length v7, p1

    add-int/lit8 v3, v7, -0x1

    .line 144
    .local v3, "strIdxEnd":I
    :goto_0
    if-gt v2, v1, :cond_0

    if-gt v4, v3, :cond_0

    .line 145
    aget-object v0, p0, v2

    .line 146
    .local v0, "patDir":Ljava/lang/String;
    const-string/jumbo v7, "**"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 159
    .end local v0    # "patDir":Ljava/lang/String;
    :cond_0
    if-le v4, v3, :cond_3

    move v5, v6

    .line 168
    :cond_1
    :goto_1
    return v5

    .line 149
    .restart local v0    # "patDir":Ljava/lang/String;
    :cond_2
    aget-object v7, p1, v4

    invoke-static {v0, v7, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 152
    add-int/lit8 v2, v2, 0x1

    .line 153
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 162
    .end local v0    # "patDir":Ljava/lang/String;
    :cond_3
    if-gt v2, v1, :cond_1

    move v5, v6

    .line 168
    goto :goto_1
.end method

.method public static removeWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 667
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 668
    .local v0, "result":Ljava/lang/StringBuffer;
    if-eqz p0, :cond_0

    .line 669
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 670
    .local v1, "st":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 671
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 674
    .end local v1    # "st":Ljava/util/StringTokenizer;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static rtrimWildcardTokens(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 692
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->rtrimWildcardTokens()Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static tokenizePath(Ljava/lang/String;)Ljava/util/Vector;
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 513
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-static {p0, v0}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->tokenizePath(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v0

    return-object v0
.end method

.method public static tokenizePath(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Vector;
    .locals 4
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 526
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 527
    .local v0, "ret":Ljava/util/Vector;
    invoke-static {p0}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 528
    sget-object v3, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v3, p0}, Lorg/apache/tools/ant/util/FileUtils;->dissect(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 529
    .local v1, "s":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v1, v3

    invoke-virtual {v0, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 530
    const/4 v3, 0x1

    aget-object p0, v1, v3

    .line 532
    .end local v1    # "s":[Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-direct {v2, p0, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 533
    .local v2, "st":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 534
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 536
    :cond_1
    return-object v0
.end method

.method static tokenizePathAsArray(Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 543
    const/4 v5, 0x0

    .line 544
    .local v5, "root":Ljava/lang/String;
    invoke-static {p0}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 545
    sget-object v12, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v12, p0}, Lorg/apache/tools/ant/util/FileUtils;->dissect(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 546
    .local v6, "s":[Ljava/lang/String;
    aget-object v5, v6, v11

    .line 547
    aget-object p0, v6, v10

    .line 549
    .end local v6    # "s":[Ljava/lang/String;
    :cond_0
    sget-char v7, Ljava/io/File;->separatorChar:C

    .line 550
    .local v7, "sep":C
    const/4 v8, 0x0

    .line 551
    .local v8, "start":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 552
    .local v3, "len":I
    const/4 v0, 0x0

    .line 553
    .local v0, "count":I
    const/4 v4, 0x0

    .local v4, "pos":I
    :goto_0
    if-ge v4, v3, :cond_3

    .line 554
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v7, :cond_2

    .line 555
    if-eq v4, v8, :cond_1

    .line 556
    add-int/lit8 v0, v0, 0x1

    .line 558
    :cond_1
    add-int/lit8 v8, v4, 0x1

    .line 553
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 561
    :cond_3
    if-eq v3, v8, :cond_4

    .line 562
    add-int/lit8 v0, v0, 0x1

    .line 564
    :cond_4
    if-nez v5, :cond_5

    move v10, v11

    :cond_5
    add-int/2addr v10, v0

    new-array v2, v10, [Ljava/lang/String;

    .line 566
    .local v2, "l":[Ljava/lang/String;
    if-eqz v5, :cond_6

    .line 567
    aput-object v5, v2, v11

    .line 568
    const/4 v0, 0x1

    .line 572
    :goto_1
    const/4 v8, 0x0

    .line 573
    const/4 v4, 0x0

    move v1, v0

    .end local v0    # "count":I
    .local v1, "count":I
    :goto_2
    if-ge v4, v3, :cond_7

    .line 574
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v7, :cond_a

    .line 575
    if-eq v4, v8, :cond_9

    .line 576
    invoke-virtual {p0, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 577
    .local v9, "tok":Ljava/lang/String;
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    aput-object v9, v2, v1

    .line 579
    .end local v9    # "tok":Ljava/lang/String;
    :goto_3
    add-int/lit8 v8, v4, 0x1

    .line 573
    :goto_4
    add-int/lit8 v4, v4, 0x1

    move v1, v0

    .end local v0    # "count":I
    .restart local v1    # "count":I
    goto :goto_2

    .line 570
    .end local v1    # "count":I
    .restart local v0    # "count":I
    :cond_6
    const/4 v0, 0x0

    goto :goto_1

    .line 582
    .end local v0    # "count":I
    .restart local v1    # "count":I
    :cond_7
    if-eq v3, v8, :cond_8

    .line 583
    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 584
    .restart local v9    # "tok":Ljava/lang/String;
    aput-object v9, v2, v1

    .line 586
    .end local v9    # "tok":Ljava/lang/String;
    :cond_8
    return-object v2

    :cond_9
    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_3

    .end local v0    # "count":I
    .restart local v1    # "count":I
    :cond_a
    move v0, v1

    .end local v1    # "count":I
    .restart local v0    # "count":I
    goto :goto_4
.end method
