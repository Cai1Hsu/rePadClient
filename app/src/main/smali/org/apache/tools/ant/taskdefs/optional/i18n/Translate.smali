.class public Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Translate.java"


# static fields
.field private static final BUNDLE_DEFAULT_LANGUAGE:I = 0x6

.field private static final BUNDLE_DEFAULT_LANGUAGE_COUNTRY:I = 0x5

.field private static final BUNDLE_DEFAULT_LANGUAGE_COUNTRY_VARIANT:I = 0x4

.field private static final BUNDLE_MAX_ALTERNATIVES:I = 0x7

.field private static final BUNDLE_NOMATCH:I = 0x3

.field private static final BUNDLE_SPECIFIED_LANGUAGE:I = 0x2

.field private static final BUNDLE_SPECIFIED_LANGUAGE_COUNTRY:I = 0x1

.field private static final BUNDLE_SPECIFIED_LANGUAGE_COUNTRY_VARIANT:I

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private bundle:Ljava/lang/String;

.field private bundleCountry:Ljava/lang/String;

.field private bundleEncoding:Ljava/lang/String;

.field private bundleLanguage:Ljava/lang/String;

.field private bundleLastModified:[J

.field private bundleVariant:Ljava/lang/String;

.field private destEncoding:Ljava/lang/String;

.field private destLastModified:J

.field private endToken:Ljava/lang/String;

.field private filesets:Ljava/util/Vector;

.field private forceOverwrite:Z

.field private loaded:Z

.field private resourceMap:Ljava/util/Hashtable;

.field private srcEncoding:Ljava/lang/String;

.field private srcLastModified:J

.field private startToken:Ljava/lang/String;

.field private toDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 149
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 139
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->filesets:Ljava/util/Vector;

    .line 144
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->resourceMap:Ljava/util/Hashtable;

    .line 154
    const/4 v0, 0x7

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLastModified:[J

    .line 169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->loaded:Z

    return-void
.end method

.method private loadResourceMap(Ljava/io/FileInputStream;)V
    .locals 12
    .param p1, "ins"    # Ljava/io/FileInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, -0x1

    .line 433
    const/4 v0, 0x0

    .line 434
    .local v0, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleEncoding:Ljava/lang/String;

    invoke-direct {v3, p1, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 435
    .local v3, "isr":Ljava/io/InputStreamReader;
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 436
    .end local v0    # "in":Ljava/io/BufferedReader;
    .local v1, "in":Ljava/io/BufferedReader;
    const/4 v6, 0x0

    .line 437
    .local v6, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 439
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_0

    const/16 v9, 0x23

    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v9, v10, :cond_0

    const/16 v9, 0x21

    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v9, v10, :cond_0

    .line 441
    const/16 v9, 0x3d

    invoke-virtual {v6, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 442
    .local v7, "sepIndex":I
    if-ne v11, v7, :cond_1

    .line 443
    const/16 v9, 0x3a

    invoke-virtual {v6, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    .line 445
    :cond_1
    if-ne v11, v7, :cond_2

    .line 446
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_1
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v4, v9, :cond_2

    .line 447
    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 448
    move v7, v4

    .line 454
    .end local v4    # "k":I
    :cond_2
    if-eq v11, v7, :cond_0

    .line 455
    const/4 v9, 0x0

    invoke-virtual {v6, v9, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 456
    .local v5, "key":Ljava/lang/String;
    add-int/lit8 v9, v7, 0x1

    invoke-virtual {v6, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 458
    .local v8, "value":Ljava/lang/String;
    :goto_2
    const-string/jumbo v9, "\\"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 459
    const/4 v9, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 460
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 461
    if-eqz v6, :cond_4

    .line 462
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 446
    .end local v5    # "key":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    .restart local v4    # "k":I
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 467
    .end local v4    # "k":I
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v8    # "value":Ljava/lang/String;
    :cond_4
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_0

    .line 469
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->resourceMap:Ljava/util/Hashtable;

    invoke-virtual {v9, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    if-nez v9, :cond_0

    .line 470
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->resourceMap:Ljava/util/Hashtable;

    invoke-virtual {v9, v5, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 479
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "sepIndex":I
    .end local v8    # "value":Ljava/lang/String;
    :catch_0
    move-exception v2

    move-object v0, v1

    .line 480
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .end local v6    # "line":Ljava/lang/String;
    .restart local v0    # "in":Ljava/io/BufferedReader;
    .local v2, "ioe":Ljava/io/IOException;
    :goto_3
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 476
    .end local v0    # "in":Ljava/io/BufferedReader;
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "isr":Ljava/io/InputStreamReader;
    .restart local v6    # "line":Ljava/lang/String;
    :cond_5
    if-eqz v1, :cond_6

    .line 477
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 482
    :cond_6
    return-void

    .line 479
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .end local v6    # "line":Ljava/lang/String;
    .restart local v0    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v2

    goto :goto_3
.end method

.method private loadResourceMaps()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 360
    new-instance v3, Ljava/util/Locale;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLanguage:Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleCountry:Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleVariant:Ljava/lang/String;

    invoke-direct {v3, v5, v6, v7}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    .local v3, "locale":Ljava/util/Locale;
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 365
    .local v2, "language":Ljava/lang/String;
    :goto_0
    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 367
    .local v1, "country":Ljava/lang/String;
    :goto_1
    invoke-virtual {v3}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_2

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 369
    .local v4, "variant":Ljava/lang/String;
    :goto_2
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 370
    .local v0, "bundleFile":Ljava/lang/String;
    invoke-direct {p0, v0, v8, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 372
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 373
    invoke-direct {p0, v0, v9, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 375
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 376
    const/4 v5, 0x2

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 378
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    .line 379
    const/4 v5, 0x3

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 383
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    .line 385
    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 387
    :goto_3
    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 389
    :goto_4
    invoke-virtual {v3}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_5

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 391
    :goto_5
    const-string/jumbo v5, "file.encoding"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleEncoding:Ljava/lang/String;

    .line 393
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 394
    const/4 v5, 0x4

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 396
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 397
    const/4 v5, 0x5

    invoke-direct {p0, v0, v5, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 399
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 400
    const/4 v5, 0x6

    invoke-direct {p0, v0, v5, v9}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->processBundle(Ljava/lang/String;IZ)V

    .line 401
    return-void

    .line 363
    .end local v0    # "bundleFile":Ljava/lang/String;
    .end local v1    # "country":Ljava/lang/String;
    .end local v2    # "language":Ljava/lang/String;
    .end local v4    # "variant":Ljava/lang/String;
    :cond_0
    const-string/jumbo v2, ""

    goto/16 :goto_0

    .line 365
    .restart local v2    # "language":Ljava/lang/String;
    :cond_1
    const-string/jumbo v1, ""

    goto/16 :goto_1

    .line 367
    .restart local v1    # "country":Ljava/lang/String;
    :cond_2
    const-string/jumbo v4, ""

    goto/16 :goto_2

    .line 385
    .restart local v0    # "bundleFile":Ljava/lang/String;
    .restart local v4    # "variant":Ljava/lang/String;
    :cond_3
    const-string/jumbo v2, ""

    goto/16 :goto_3

    .line 387
    :cond_4
    const-string/jumbo v1, ""

    goto/16 :goto_4

    .line 389
    :cond_5
    const-string/jumbo v4, ""

    goto :goto_5
.end method

.method private processBundle(Ljava/lang/String;IZ)V
    .locals 9
    .param p1, "bundleFile"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "checkLoaded"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    .line 408
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ".properties"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 409
    .local v3, "propsFile":Ljava/io/File;
    const/4 v0, 0x0

    .line 411
    .local v0, "ins":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 412
    .end local v0    # "ins":Ljava/io/FileInputStream;
    .local v1, "ins":Ljava/io/FileInputStream;
    const/4 v4, 0x1

    :try_start_1
    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->loaded:Z

    .line 413
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLastModified:[J

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    aput-wide v6, v4, p2

    .line 414
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Using "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V

    .line 415
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->loadResourceMap(Ljava/io/FileInputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v0, v1

    .line 425
    .end local v1    # "ins":Ljava/io/FileInputStream;
    .restart local v0    # "ins":Ljava/io/FileInputStream;
    :cond_0
    return-void

    .line 416
    :catch_0
    move-exception v2

    .line 417
    .local v2, "ioe":Ljava/io/IOException;
    :goto_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v8}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V

    .line 421
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->loaded:Z

    if-nez v4, :cond_0

    if-eqz p3, :cond_0

    .line 422
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 416
    .end local v0    # "ins":Ljava/io/FileInputStream;
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "ins":Ljava/io/FileInputStream;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "ins":Ljava/io/FileInputStream;
    .restart local v0    # "ins":Ljava/io/FileInputStream;
    goto :goto_0
.end method

.method private translate()V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 497
    const/4 v8, 0x0

    .line 498
    .local v8, "filesProcessed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->filesets:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->size()I

    move-result v15

    .line 499
    .local v15, "size":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v15, :cond_8

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->filesets:Ljava/util/Vector;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/FileSet;

    .line 501
    .local v9, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v6

    .line 502
    .local v6, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v17

    .line 503
    .local v17, "srcFiles":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_1
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v13, v0, :cond_7

    .line 505
    :try_start_0
    sget-object v18, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    move-object/from16 v19, v0

    aget-object v20, v17, v13

    invoke-virtual/range {v18 .. v20}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 508
    .local v4, "dest":Ljava/io/File;
    :try_start_1
    new-instance v5, Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 509
    .local v5, "destDir":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v18

    if-nez v18, :cond_0

    .line 510
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 517
    .end local v5    # "destDir":Ljava/io/File;
    :cond_0
    :goto_2
    :try_start_2
    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destLastModified:J

    .line 518
    sget-object v18, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getBasedir()Ljava/io/File;

    move-result-object v19

    aget-object v20, v17, v13

    invoke-virtual/range {v18 .. v20}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v16

    .line 519
    .local v16, "src":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->lastModified()J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcLastModified:J

    .line 521
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->forceOverwrite:Z

    move/from16 v18, v0

    if-nez v18, :cond_1

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destLastModified:J

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcLastModified:J

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-gez v18, :cond_3

    :cond_1
    const/4 v14, 0x1

    .line 523
    .local v14, "needsWork":Z
    :goto_3
    if-nez v14, :cond_2

    .line 524
    const/4 v11, 0x0

    .local v11, "icounter":I
    :goto_4
    const/16 v18, 0x7

    move/from16 v0, v18

    if-ge v11, v0, :cond_2

    .line 525
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destLastModified:J

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLastModified:[J

    move-object/from16 v20, v0

    aget-wide v20, v20, v11

    cmp-long v18, v18, v20

    if-gez v18, :cond_4

    const/4 v14, 0x1

    .line 526
    :goto_5
    if-eqz v14, :cond_5

    .line 531
    .end local v11    # "icounter":I
    :cond_2
    if-eqz v14, :cond_6

    .line 532
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Processing "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, v17, v13

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V

    .line 534
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->translateOneFile(Ljava/io/File;Ljava/io/File;)V

    .line 535
    add-int/lit8 v8, v8, 0x1

    .line 503
    :goto_6
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_1

    .line 512
    .end local v14    # "needsWork":Z
    .end local v16    # "src":Ljava/io/File;
    :catch_0
    move-exception v7

    .line 513
    .local v7, "e":Ljava/lang/Exception;
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Exception occurred while trying to check/create  parent directory.  "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_2

    .line 541
    .end local v4    # "dest":Ljava/io/File;
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v12

    .line 542
    .local v12, "ioe":Ljava/io/IOException;
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v12}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v20

    invoke-direct/range {v18 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v18

    .line 521
    .end local v12    # "ioe":Ljava/io/IOException;
    .restart local v4    # "dest":Ljava/io/File;
    .restart local v16    # "src":Ljava/io/File;
    :cond_3
    const/4 v14, 0x0

    goto/16 :goto_3

    .line 525
    .restart local v11    # "icounter":I
    .restart local v14    # "needsWork":Z
    :cond_4
    const/4 v14, 0x0

    goto :goto_5

    .line 524
    :cond_5
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_4

    .line 537
    .end local v11    # "icounter":I
    :cond_6
    :try_start_3
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Skipping "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    aget-object v19, v17, v13

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " as destination file is up to date"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_6

    .line 499
    .end local v4    # "dest":Ljava/io/File;
    .end local v14    # "needsWork":Z
    .end local v16    # "src":Ljava/io/File;
    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    .line 546
    .end local v6    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v9    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v13    # "j":I
    .end local v17    # "srcFiles":[Ljava/lang/String;
    :cond_8
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Translation performed on "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " file(s)."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V

    .line 547
    return-void
.end method

.method private translateOneFile(Ljava/io/File;Ljava/io/File;)V
    .locals 20
    .param p1, "src"    # Ljava/io/File;
    .param p2, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 550
    const/4 v12, 0x0

    .line 551
    .local v12, "out":Ljava/io/BufferedWriter;
    const/4 v7, 0x0

    .line 553
    .local v7, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    move-object/from16 v0, p2

    invoke-direct {v6, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 554
    .local v6, "fos":Ljava/io/FileOutputStream;
    new-instance v13, Ljava/io/BufferedWriter;

    new-instance v18, Ljava/io/OutputStreamWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destEncoding:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v6, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-direct {v13, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 555
    .end local v12    # "out":Ljava/io/BufferedWriter;
    .local v13, "out":Ljava/io/BufferedWriter;
    :try_start_1
    new-instance v5, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 556
    .local v5, "fis":Ljava/io/FileInputStream;
    new-instance v8, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v0, v5, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-direct {v8, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 558
    .end local v7    # "in":Ljava/io/BufferedReader;
    .local v8, "in":Ljava/io/BufferedReader;
    :try_start_2
    new-instance v11, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct {v11}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    .line 559
    .local v11, "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/util/LineTokenizer;->setIncludeDelims(Z)V

    .line 560
    invoke-virtual {v11, v8}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v10

    .line 561
    .local v10, "line":Ljava/lang/String;
    :goto_0
    if-eqz v10, :cond_7

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v15

    .line 569
    .local v15, "startIndex":I
    :goto_1
    if-ltz v15, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    add-int v18, v18, v15

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-gt v0, v1, :cond_6

    .line 573
    const/4 v14, 0x0

    .line 578
    .local v14, "replace":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->endToken:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    add-int v19, v19, v15

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 580
    .local v4, "endIndex":I
    if-gez v4, :cond_0

    .line 581
    add-int/lit8 v15, v15, 0x1

    .line 621
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v10, v0, v15}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v15

    goto :goto_1

    .line 584
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    add-int v18, v18, v15

    move/from16 v0, v18

    invoke-virtual {v10, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    .line 590
    .local v16, "token":Ljava/lang/String;
    const/16 v17, 0x1

    .line 591
    .local v17, "validToken":Z
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_3
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v18

    move/from16 v0, v18

    if-ge v9, v0, :cond_3

    if-eqz v17, :cond_3

    .line 592
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 593
    .local v3, "c":C
    const/16 v18, 0x3a

    move/from16 v0, v18

    if-eq v3, v0, :cond_1

    const/16 v18, 0x3d

    move/from16 v0, v18

    if-eq v3, v0, :cond_1

    invoke-static {v3}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 595
    :cond_1
    const/16 v17, 0x0

    .line 591
    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 598
    .end local v3    # "c":C
    :cond_3
    if-nez v17, :cond_4

    .line 599
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 602
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->resourceMap:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 603
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->resourceMap:Ljava/util/Hashtable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "replace":Ljava/lang/String;
    check-cast v14, Ljava/lang/String;

    .line 612
    .restart local v14    # "replace":Ljava/lang/String;
    :goto_4
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v10, v0, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->endToken:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    add-int v19, v19, v4

    move/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 616
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v18

    add-int v15, v15, v18

    goto/16 :goto_2

    .line 605
    :cond_5
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Replacement string missing for: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->log(Ljava/lang/String;I)V

    .line 607
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->endToken:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_4

    .line 623
    .end local v4    # "endIndex":I
    .end local v9    # "k":I
    .end local v14    # "replace":Ljava/lang/String;
    .end local v16    # "token":Ljava/lang/String;
    .end local v17    # "validToken":Z
    :cond_6
    invoke-virtual {v13, v10}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 624
    invoke-virtual {v11, v8}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result-object v10

    goto/16 :goto_0

    .line 627
    .end local v15    # "startIndex":I
    :cond_7
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 628
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 630
    return-void

    .line 627
    .end local v5    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "in":Ljava/io/BufferedReader;
    .end local v10    # "line":Ljava/lang/String;
    .end local v11    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .end local v13    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    .restart local v12    # "out":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v18

    :goto_5
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 628
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v18

    .line 627
    .end local v12    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v13    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v18

    move-object v12, v13

    .end local v13    # "out":Ljava/io/BufferedWriter;
    .restart local v12    # "out":Ljava/io/BufferedWriter;
    goto :goto_5

    .end local v7    # "in":Ljava/io/BufferedReader;
    .end local v12    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "fis":Ljava/io/FileInputStream;
    .restart local v8    # "in":Ljava/io/BufferedReader;
    .restart local v13    # "out":Ljava/io/BufferedWriter;
    :catchall_2
    move-exception v18

    move-object v7, v8

    .end local v8    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    move-object v12, v13

    .end local v13    # "out":Ljava/io/BufferedWriter;
    .restart local v12    # "out":Ljava/io/BufferedWriter;
    goto :goto_5
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 270
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 271
    return-void
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 283
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 284
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The bundle attribute must be set."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 288
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 289
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The starttoken attribute must be set."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 293
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->endToken:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 294
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The endtoken attribute must be set."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 298
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLanguage:Ljava/lang/String;

    if-nez v1, :cond_3

    .line 299
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 300
    .local v0, "l":Ljava/util/Locale;
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLanguage:Ljava/lang/String;

    .line 303
    .end local v0    # "l":Ljava/util/Locale;
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleCountry:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 304
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleCountry:Ljava/lang/String;

    .line 307
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleVariant:Ljava/lang/String;

    if-nez v1, :cond_5

    .line 308
    new-instance v0, Ljava/util/Locale;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLanguage:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleCountry:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .restart local v0    # "l":Ljava/util/Locale;
    invoke-virtual {v0}, Ljava/util/Locale;->getVariant()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleVariant:Ljava/lang/String;

    .line 312
    .end local v0    # "l":Ljava/util/Locale;
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    if-nez v1, :cond_6

    .line 313
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The todir attribute must be set."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 317
    :cond_6
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_b

    .line 318
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 323
    :cond_7
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    if-nez v1, :cond_8

    .line 324
    const-string/jumbo v1, "file.encoding"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    .line 327
    :cond_8
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destEncoding:Ljava/lang/String;

    if-nez v1, :cond_9

    .line 328
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destEncoding:Ljava/lang/String;

    .line 331
    :cond_9
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleEncoding:Ljava/lang/String;

    if-nez v1, :cond_a

    .line 332
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleEncoding:Ljava/lang/String;

    .line 335
    :cond_a
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->loadResourceMaps()V

    .line 337
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->translate()V

    .line 338
    return-void

    .line 319
    :cond_b
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 320
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setBundle(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundle"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundle:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setBundleCountry(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundleCountry"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleCountry:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setBundleEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundleEncoding"    # Ljava/lang/String;

    .prologue
    .line 251
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleEncoding:Ljava/lang/String;

    .line 252
    return-void
.end method

.method public setBundleLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundleLanguage"    # Ljava/lang/String;

    .prologue
    .line 184
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleLanguage:Ljava/lang/String;

    .line 185
    return-void
.end method

.method public setBundleVariant(Ljava/lang/String;)V
    .locals 0
    .param p1, "bundleVariant"    # Ljava/lang/String;

    .prologue
    .line 200
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->bundleVariant:Ljava/lang/String;

    .line 201
    return-void
.end method

.method public setDestEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "destEncoding"    # Ljava/lang/String;

    .prologue
    .line 242
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->destEncoding:Ljava/lang/String;

    .line 243
    return-void
.end method

.method public setEndToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "endToken"    # Ljava/lang/String;

    .prologue
    .line 224
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->endToken:Ljava/lang/String;

    .line 225
    return-void
.end method

.method public setForceOverwrite(Z)V
    .locals 0
    .param p1, "forceOverwrite"    # Z

    .prologue
    .line 262
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->forceOverwrite:Z

    .line 263
    return-void
.end method

.method public setSrcEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "srcEncoding"    # Ljava/lang/String;

    .prologue
    .line 233
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->srcEncoding:Ljava/lang/String;

    .line 234
    return-void
.end method

.method public setStartToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "startToken"    # Ljava/lang/String;

    .prologue
    .line 216
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->startToken:Ljava/lang/String;

    .line 217
    return-void
.end method

.method public setToDir(Ljava/io/File;)V
    .locals 0
    .param p1, "toDir"    # Ljava/io/File;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/i18n/Translate;->toDir:Ljava/io/File;

    .line 209
    return-void
.end method
