.class public Lorg/apache/tools/ant/util/ResourceUtils;
.super Ljava/lang/Object;
.source "ResourceUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final ISO_8859_1:Ljava/lang/String; = "ISO-8859-1"

.field private static final MAX_IO_CHUNK_SIZE:J = 0x1000000L

.field static class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/ResourceUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 781
    return-void
.end method

.method public static asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;
    .locals 2
    .param p0, "fileProvider"    # Lorg/apache/tools/ant/types/resources/FileProvider;

    .prologue
    .line 668
    instance-of v1, p0, Lorg/apache/tools/ant/types/resources/FileResource;

    if-nez v1, :cond_0

    if-nez p0, :cond_1

    .line 669
    :cond_0
    check-cast p0, Lorg/apache/tools/ant/types/resources/FileResource;

    .end local p0    # "fileProvider":Lorg/apache/tools/ant/types/resources/FileProvider;
    move-object v0, p0

    .line 673
    .local v0, "result":Lorg/apache/tools/ant/types/resources/FileResource;
    .restart local p0    # "fileProvider":Lorg/apache/tools/ant/types/resources/FileProvider;
    :goto_0
    return-object v0

    .line 671
    .end local v0    # "result":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-interface {p0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    .line 672
    .restart local v0    # "result":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-static {p0}, Lorg/apache/tools/ant/Project;->getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_0
.end method

.method private static binaryCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 8
    .param p0, "r1"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "r2"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, -0x1

    .line 692
    const/4 v2, 0x0

    .line 693
    .local v2, "in1":Ljava/io/InputStream;
    const/4 v4, 0x0

    .line 695
    .local v4, "in2":Ljava/io/InputStream;
    :try_start_0
    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 696
    .end local v2    # "in1":Ljava/io/InputStream;
    .local v3, "in1":Ljava/io/InputStream;
    :try_start_1
    new-instance v5, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 698
    .end local v4    # "in2":Ljava/io/InputStream;
    .local v5, "in2":Ljava/io/InputStream;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v0

    .local v0, "b1":I
    :goto_0
    if-eq v0, v6, :cond_2

    .line 699
    invoke-virtual {v5}, Ljava/io/InputStream;->read()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v1

    .line 700
    .local v1, "b2":I
    if-eq v0, v1, :cond_1

    .line 701
    if-le v0, v1, :cond_0

    const/4 v6, 0x1

    .line 706
    :cond_0
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 707
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .end local v1    # "b2":I
    :goto_1
    return v6

    .line 698
    .restart local v1    # "b2":I
    :cond_1
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0

    .line 704
    .end local v1    # "b2":I
    :cond_2
    invoke-virtual {v5}, Ljava/io/InputStream;->read()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result v7

    if-ne v7, v6, :cond_3

    const/4 v6, 0x0

    .line 706
    :cond_3
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 707
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_1

    .line 706
    .end local v0    # "b1":I
    .end local v3    # "in1":Ljava/io/InputStream;
    .end local v5    # "in2":Ljava/io/InputStream;
    .restart local v2    # "in1":Ljava/io/InputStream;
    .restart local v4    # "in2":Ljava/io/InputStream;
    :catchall_0
    move-exception v6

    :goto_2
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 707
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v6

    .line 706
    .end local v2    # "in1":Ljava/io/InputStream;
    .restart local v3    # "in1":Ljava/io/InputStream;
    :catchall_1
    move-exception v6

    move-object v2, v3

    .end local v3    # "in1":Ljava/io/InputStream;
    .restart local v2    # "in1":Ljava/io/InputStream;
    goto :goto_2

    .end local v2    # "in1":Ljava/io/InputStream;
    .end local v4    # "in2":Ljava/io/InputStream;
    .restart local v3    # "in1":Ljava/io/InputStream;
    .restart local v5    # "in2":Ljava/io/InputStream;
    :catchall_2
    move-exception v6

    move-object v4, v5

    .end local v5    # "in2":Ljava/io/InputStream;
    .restart local v4    # "in2":Ljava/io/InputStream;
    move-object v2, v3

    .end local v3    # "in1":Ljava/io/InputStream;
    .restart local v2    # "in1":Ljava/io/InputStream;
    goto :goto_2
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 399
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static compareContent(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Z)I
    .locals 8
    .param p0, "r1"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "r2"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "text"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, -0x1

    const/4 v6, 0x0

    .line 636
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    move v4, v6

    .line 655
    :cond_0
    :goto_0
    return v4

    .line 639
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    .line 640
    .local v2, "e1":Z
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v3

    .line 641
    .local v3, "e2":Z
    if-nez v2, :cond_2

    if-nez v3, :cond_2

    move v4, v6

    .line 642
    goto :goto_0

    .line 644
    :cond_2
    if-eq v2, v3, :cond_3

    .line 645
    if-nez v2, :cond_0

    move v4, v5

    goto :goto_0

    .line 647
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    .line 648
    .local v0, "d1":Z
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v1

    .line 649
    .local v1, "d2":Z
    if-eqz v0, :cond_4

    if-eqz v1, :cond_4

    move v4, v6

    .line 650
    goto :goto_0

    .line 652
    :cond_4
    if-nez v0, :cond_5

    if-eqz v1, :cond_7

    .line 653
    :cond_5
    if-eqz v0, :cond_6

    :goto_1
    move v4, v5

    goto :goto_0

    :cond_6
    move v5, v4

    goto :goto_1

    .line 655
    :cond_7
    if-eqz p2, :cond_8

    invoke-static {p0, p1}, Lorg/apache/tools/ant/util/ResourceUtils;->textCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I

    move-result v4

    goto :goto_0

    :cond_8
    invoke-static {p0, p1}, Lorg/apache/tools/ant/util/ResourceUtils;->binaryCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I

    move-result v4

    goto :goto_0
.end method

.method public static contentEquals(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Z)Z
    .locals 10
    .param p0, "r1"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "r2"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "text"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 595
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v7

    if-eq v6, v7, :cond_1

    .line 619
    :cond_0
    :goto_0
    return v5

    .line 598
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v6

    if-nez v6, :cond_2

    move v5, v4

    .line 600
    goto :goto_0

    .line 604
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_0

    .line 608
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move v5, v4

    .line 609
    goto :goto_0

    .line 611
    :cond_3
    if-nez p2, :cond_4

    .line 612
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    .line 613
    .local v0, "s1":J
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v2

    .line 614
    .local v2, "s2":J
    cmp-long v6, v0, v8

    if-eqz v6, :cond_4

    cmp-long v6, v2, v8

    if-eqz v6, :cond_4

    cmp-long v6, v0, v2

    if-nez v6, :cond_0

    .line 619
    .end local v0    # "s1":J
    .end local v2    # "s2":J
    :cond_4
    invoke-static {p0, p1, p2}, Lorg/apache/tools/ant/util/ResourceUtils;->compareContent(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Z)I

    move-result v6

    if-nez v6, :cond_5

    :goto_1
    move v5, v4

    goto :goto_0

    :cond_5
    move v4, v5

    goto :goto_1
.end method

.method public static copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)V
    .locals 1
    .param p0, "source"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/Project;)V

    .line 256
    return-void
.end method

.method public static copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/Project;)V
    .locals 9
    .param p0, "source"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 274
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move v5, v4

    move-object v6, v2

    move-object v7, v2

    move-object v8, p2

    invoke-static/range {v0 .. v8}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 276
    return-void
.end method

.method public static copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 10
    .param p0, "source"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p3, "filterChains"    # Ljava/util/Vector;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .param p6, "inputEncoding"    # Ljava/lang/String;
    .param p7, "outputEncoding"    # Ljava/lang/String;
    .param p8, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 311
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-static/range {v0 .. v9}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 312
    return-void
.end method

.method public static copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 11
    .param p0, "source"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p3, "filterChains"    # Ljava/util/Vector;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .param p6, "append"    # Z
    .param p7, "inputEncoding"    # Ljava/lang/String;
    .param p8, "outputEncoding"    # Ljava/lang/String;
    .param p9, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-static/range {v0 .. v10}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V

    .line 352
    return-void
.end method

.method public static copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    .locals 38
    .param p0, "source"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "dest"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p3, "filterChains"    # Ljava/util/Vector;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .param p6, "append"    # Z
    .param p7, "inputEncoding"    # Ljava/lang/String;
    .param p8, "outputEncoding"    # Ljava/lang/String;
    .param p9, "project"    # Lorg/apache/tools/ant/Project;
    .param p10, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 389
    if-nez p4, :cond_1

    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v34

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, v34

    invoke-static {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z

    move-result v33

    if-nez v33, :cond_1

    .line 565
    :cond_0
    :goto_0
    return-void

    .line 393
    :cond_1
    if-eqz p2, :cond_3

    invoke-virtual/range {p2 .. p2}, Lorg/apache/tools/ant/types/FilterSetCollection;->hasFilters()Z

    move-result v33

    if-eqz v33, :cond_3

    const/16 v16, 0x1

    .line 395
    .local v16, "filterSetsAvailable":Z
    :goto_1
    if-eqz p3, :cond_4

    invoke-virtual/range {p3 .. p3}, Ljava/util/Vector;->size()I

    move-result v33

    if-lez v33, :cond_4

    const/4 v15, 0x1

    .line 398
    .local v15, "filterChainsAvailable":Z
    :goto_2
    const/4 v14, 0x0

    .line 399
    .local v14, "destFile":Ljava/io/File;
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v33, :cond_5

    const-string/jumbo v33, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v33 .. v33}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v33

    sput-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_3
    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v33

    if-eqz v33, :cond_2

    .line 400
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v33, :cond_6

    const-string/jumbo v33, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v33 .. v33}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v33

    sput-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface/range {v33 .. v33}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v14

    .line 402
    :cond_2
    if-eqz v14, :cond_8

    invoke-virtual {v14}, Ljava/io/File;->isFile()Z

    move-result v33

    if-eqz v33, :cond_8

    invoke-virtual {v14}, Ljava/io/File;->canWrite()Z

    move-result v33

    if-nez v33, :cond_8

    .line 403
    if-nez p10, :cond_7

    .line 404
    new-instance v33, Ljava/io/IOException;

    new-instance v34, Ljava/lang/StringBuffer;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v35, "can\'t write to read-only destination file "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 393
    .end local v14    # "destFile":Ljava/io/File;
    .end local v15    # "filterChainsAvailable":Z
    .end local v16    # "filterSetsAvailable":Z
    :cond_3
    const/16 v16, 0x0

    goto :goto_1

    .line 395
    .restart local v16    # "filterSetsAvailable":Z
    :cond_4
    const/4 v15, 0x0

    goto :goto_2

    .line 399
    .restart local v14    # "destFile":Ljava/io/File;
    .restart local v15    # "filterChainsAvailable":Z
    :cond_5
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_3

    .line 400
    :cond_6
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_4

    .line 406
    :cond_7
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v33

    invoke-virtual {v0, v14}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    move-result v33

    if-nez v33, :cond_8

    .line 407
    new-instance v33, Ljava/io/IOException;

    new-instance v34, Ljava/lang/StringBuffer;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v35, "failed to delete read-only destination file "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 412
    :cond_8
    if-eqz v16, :cond_d

    .line 413
    const/16 v17, 0x0

    .line 414
    .local v17, "in":Ljava/io/BufferedReader;
    const/16 v27, 0x0

    .line 416
    .local v27, "out":Ljava/io/BufferedWriter;
    const/16 v19, 0x0

    .line 417
    .local v19, "isr":Ljava/io/InputStreamReader;
    if-nez p7, :cond_9

    .line 418
    :try_start_0
    new-instance v20, Ljava/io/InputStreamReader;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .local v20, "isr":Ljava/io/InputStreamReader;
    move-object/from16 v19, v20

    .line 423
    .end local v20    # "isr":Ljava/io/InputStreamReader;
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    :goto_5
    new-instance v18, Ljava/io/BufferedReader;

    invoke-direct/range {v18 .. v19}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    .line 424
    .end local v17    # "in":Ljava/io/BufferedReader;
    .local v18, "in":Ljava/io/BufferedReader;
    :try_start_1
    move-object/from16 v0, p1

    move/from16 v1, p6

    move-object/from16 v2, p9

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/util/ResourceUtils;->getOutputStream(Lorg/apache/tools/ant/types/Resource;ZLorg/apache/tools/ant/Project;)Ljava/io/OutputStream;

    move-result-object v25

    .line 426
    .local v25, "os":Ljava/io/OutputStream;
    if-nez p8, :cond_a

    .line 427
    new-instance v26, Ljava/io/OutputStreamWriter;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 431
    .local v26, "osw":Ljava/io/OutputStreamWriter;
    :goto_6
    new-instance v28, Ljava/io/BufferedWriter;

    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_a

    .line 432
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .local v28, "out":Ljava/io/BufferedWriter;
    if-eqz v15, :cond_1c

    .line 433
    :try_start_2
    new-instance v11, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 434
    .local v11, "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    const/16 v33, 0x2000

    move/from16 v0, v33

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setBufferSize(I)V

    .line 435
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 436
    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 437
    move-object/from16 v0, p9

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 438
    invoke-virtual {v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v30

    .line 439
    .local v30, "rdr":Ljava/io/Reader;
    new-instance v17, Ljava/io/BufferedReader;

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_b

    .line 441
    .end local v11    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v18    # "in":Ljava/io/BufferedReader;
    .end local v30    # "rdr":Ljava/io/Reader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    :goto_7
    :try_start_3
    new-instance v22, Lorg/apache/tools/ant/util/LineTokenizer;

    invoke-direct/range {v22 .. v22}, Lorg/apache/tools/ant/util/LineTokenizer;-><init>()V

    .line 442
    .local v22, "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    const/16 v33, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/LineTokenizer;->setIncludeDelims(Z)V

    .line 443
    const/16 v24, 0x0

    .line 444
    .local v24, "newline":Ljava/lang/String;
    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v21

    .line 445
    .local v21, "line":Ljava/lang/String;
    :goto_8
    if-eqz v21, :cond_c

    .line 446
    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v33

    if-nez v33, :cond_b

    .line 449
    invoke-virtual/range {v28 .. v28}, Ljava/io/BufferedWriter;->newLine()V

    .line 454
    :goto_9
    move-object/from16 v0, v22

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/LineTokenizer;->getToken(Ljava/io/Reader;)Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v21

    goto :goto_8

    .line 420
    .end local v21    # "line":Ljava/lang/String;
    .end local v22    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .end local v24    # "newline":Ljava/lang/String;
    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    :cond_9
    :try_start_4
    new-instance v20, Ljava/io/InputStreamReader;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    move-object/from16 v2, p7

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_9

    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .restart local v20    # "isr":Ljava/io/InputStreamReader;
    move-object/from16 v19, v20

    .end local v20    # "isr":Ljava/io/InputStreamReader;
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    goto/16 :goto_5

    .line 429
    .end local v17    # "in":Ljava/io/BufferedReader;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    .restart local v25    # "os":Ljava/io/OutputStream;
    :cond_a
    :try_start_5
    new-instance v26, Ljava/io/OutputStreamWriter;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, p8

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_a

    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    goto :goto_6

    .line 451
    .end local v18    # "in":Ljava/io/BufferedReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    .restart local v21    # "line":Ljava/lang/String;
    .restart local v22    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .restart local v24    # "newline":Ljava/lang/String;
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    :cond_b
    :try_start_6
    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterSetCollection;->replaceTokens(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 452
    move-object/from16 v0, v28

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_9

    .line 457
    .end local v21    # "line":Ljava/lang/String;
    .end local v22    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .end local v24    # "newline":Ljava/lang/String;
    :catchall_0
    move-exception v33

    move-object/from16 v27, v28

    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    :goto_a
    invoke-static/range {v27 .. v27}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 458
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v33

    .line 457
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v21    # "line":Ljava/lang/String;
    .restart local v22    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .restart local v24    # "newline":Ljava/lang/String;
    .restart local v25    # "os":Ljava/io/OutputStream;
    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    :cond_c
    invoke-static/range {v28 .. v28}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 458
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 559
    .end local v17    # "in":Ljava/io/BufferedReader;
    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .end local v21    # "line":Ljava/lang/String;
    .end local v22    # "lineTokenizer":Lorg/apache/tools/ant/util/LineTokenizer;
    .end local v24    # "newline":Ljava/lang/String;
    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    .end local v28    # "out":Ljava/io/BufferedWriter;
    :goto_b
    if-eqz p5, :cond_0

    .line 560
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    if-nez v33, :cond_19

    const-string/jumbo v33, "org.apache.tools.ant.types.resources.Touchable"

    invoke-static/range {v33 .. v33}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v33

    sput-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    :goto_c
    move-object/from16 v0, p1

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/apache/tools/ant/types/resources/Touchable;

    .line 561
    .local v32, "t":Lorg/apache/tools/ant/types/resources/Touchable;
    if-eqz v32, :cond_0

    .line 562
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v34

    move-object/from16 v0, v32

    move-wide/from16 v1, v34

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/util/ResourceUtils;->setLastModified(Lorg/apache/tools/ant/types/resources/Touchable;J)V

    goto/16 :goto_0

    .line 460
    .end local v32    # "t":Lorg/apache/tools/ant/types/resources/Touchable;
    :cond_d
    if-nez v15, :cond_f

    if-eqz p7, :cond_e

    invoke-virtual/range {p7 .. p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_f

    :cond_e
    if-nez p7, :cond_13

    if-eqz p8, :cond_13

    .line 464
    :cond_f
    const/16 v17, 0x0

    .line 465
    .restart local v17    # "in":Ljava/io/BufferedReader;
    const/16 v27, 0x0

    .line 467
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    const/16 v19, 0x0

    .line 468
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    if-nez p7, :cond_10

    .line 469
    :try_start_7
    new-instance v20, Ljava/io/InputStreamReader;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .restart local v20    # "isr":Ljava/io/InputStreamReader;
    move-object/from16 v19, v20

    .line 474
    .end local v20    # "isr":Ljava/io/InputStreamReader;
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    :goto_d
    new-instance v18, Ljava/io/BufferedReader;

    invoke-direct/range {v18 .. v19}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    .line 475
    .end local v17    # "in":Ljava/io/BufferedReader;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    :try_start_8
    move-object/from16 v0, p1

    move/from16 v1, p6

    move-object/from16 v2, p9

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/util/ResourceUtils;->getOutputStream(Lorg/apache/tools/ant/types/Resource;ZLorg/apache/tools/ant/Project;)Ljava/io/OutputStream;

    move-result-object v25

    .line 477
    .restart local v25    # "os":Ljava/io/OutputStream;
    if-nez p8, :cond_11

    .line 478
    new-instance v26, Ljava/io/OutputStreamWriter;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 482
    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    :goto_e
    new-instance v28, Ljava/io/BufferedWriter;

    move-object/from16 v0, v28

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_7

    .line 483
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    if-eqz v15, :cond_1b

    .line 484
    :try_start_9
    new-instance v11, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 485
    .restart local v11    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    const/16 v33, 0x2000

    move/from16 v0, v33

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setBufferSize(I)V

    .line 486
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 487
    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 488
    move-object/from16 v0, p9

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 489
    invoke-virtual {v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v30

    .line 490
    .restart local v30    # "rdr":Ljava/io/Reader;
    new-instance v17, Ljava/io/BufferedReader;

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_8

    .line 492
    .end local v11    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v18    # "in":Ljava/io/BufferedReader;
    .end local v30    # "rdr":Ljava/io/Reader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    :goto_f
    const/16 v33, 0x2000

    :try_start_a
    move/from16 v0, v33

    new-array v10, v0, [C

    .line 494
    .local v10, "buffer":[C
    :goto_10
    const/16 v33, 0x0

    array-length v0, v10

    move/from16 v34, v0

    move-object/from16 v0, v17

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v10, v1, v2}, Ljava/io/BufferedReader;->read([CII)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move-result v23

    .line 495
    .local v23, "nRead":I
    const/16 v33, -0x1

    move/from16 v0, v23

    move/from16 v1, v33

    if-ne v0, v1, :cond_12

    .line 501
    invoke-static/range {v28 .. v28}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 502
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto/16 :goto_b

    .line 471
    .end local v10    # "buffer":[C
    .end local v23    # "nRead":I
    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    :cond_10
    :try_start_b
    new-instance v20, Ljava/io/InputStreamReader;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v33

    move-object/from16 v0, v20

    move-object/from16 v1, v33

    move-object/from16 v2, p7

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .restart local v20    # "isr":Ljava/io/InputStreamReader;
    move-object/from16 v19, v20

    .end local v20    # "isr":Ljava/io/InputStreamReader;
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    goto/16 :goto_d

    .line 480
    .end local v17    # "in":Ljava/io/BufferedReader;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    .restart local v25    # "os":Ljava/io/OutputStream;
    :cond_11
    :try_start_c
    new-instance v26, Ljava/io/OutputStreamWriter;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    move-object/from16 v2, p8

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    goto :goto_e

    .line 498
    .end local v18    # "in":Ljava/io/BufferedReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v10    # "buffer":[C
    .restart local v17    # "in":Ljava/io/BufferedReader;
    .restart local v23    # "nRead":I
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    :cond_12
    const/16 v33, 0x0

    :try_start_d
    move-object/from16 v0, v28

    move/from16 v1, v33

    move/from16 v2, v23

    invoke-virtual {v0, v10, v1, v2}, Ljava/io/BufferedWriter;->write([CII)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    goto :goto_10

    .line 501
    .end local v10    # "buffer":[C
    .end local v23    # "nRead":I
    :catchall_1
    move-exception v33

    move-object/from16 v27, v28

    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    :goto_11
    invoke-static/range {v27 .. v27}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 502
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v33

    .line 504
    .end local v17    # "in":Ljava/io/BufferedReader;
    .end local v19    # "isr":Ljava/io/InputStreamReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    :cond_13
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v33, :cond_14

    const-string/jumbo v33, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v33 .. v33}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v33

    sput-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_12
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v33

    if-eqz v33, :cond_17

    if-eqz v14, :cond_17

    .line 506
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v33, :cond_15

    const-string/jumbo v33, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v33 .. v33}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v33

    sput-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_13
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface/range {v33 .. v33}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v31

    .line 509
    .local v31, "sourceFile":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v29

    .line 510
    .local v29, "parent":Ljava/io/File;
    if-eqz v29, :cond_16

    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->isDirectory()Z

    move-result v33

    if-nez v33, :cond_16

    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/io/File;->mkdirs()Z

    move-result v33

    if-nez v33, :cond_16

    .line 512
    new-instance v33, Ljava/io/IOException;

    new-instance v34, Ljava/lang/StringBuffer;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v35, "failed to create the parent directory for "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-direct/range {v33 .. v34}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 504
    .end local v29    # "parent":Ljava/io/File;
    .end local v31    # "sourceFile":Ljava/io/File;
    :cond_14
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_12

    .line 506
    :cond_15
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_13

    .line 516
    .restart local v29    # "parent":Ljava/io/File;
    .restart local v31    # "sourceFile":Ljava/io/File;
    :cond_16
    const/16 v17, 0x0

    .line 517
    .local v17, "in":Ljava/io/FileInputStream;
    const/16 v27, 0x0

    .line 518
    .local v27, "out":Ljava/io/FileOutputStream;
    const/4 v5, 0x0

    .line 519
    .local v5, "srcChannel":Ljava/nio/channels/FileChannel;
    const/4 v4, 0x0

    .line 522
    .local v4, "destChannel":Ljava/nio/channels/FileChannel;
    :try_start_e
    new-instance v18, Ljava/io/FileInputStream;

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    .line 523
    .end local v17    # "in":Ljava/io/FileInputStream;
    .local v18, "in":Ljava/io/FileInputStream;
    :try_start_f
    new-instance v28, Ljava/io/FileOutputStream;

    move-object/from16 v0, v28

    invoke-direct {v0, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 525
    .end local v27    # "out":Ljava/io/FileOutputStream;
    .local v28, "out":Ljava/io/FileOutputStream;
    :try_start_10
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5

    .line 526
    invoke-virtual/range {v28 .. v28}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    .line 528
    const-wide/16 v6, 0x0

    .line 529
    .local v6, "position":J
    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v12

    .line 530
    .local v12, "count":J
    :goto_14
    cmp-long v33, v6, v12

    if-gez v33, :cond_1a

    .line 531
    const-wide/32 v34, 0x1000000

    sub-long v36, v12, v6

    invoke-static/range {v34 .. v37}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 532
    .local v8, "chunk":J
    invoke-virtual/range {v4 .. v9}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    move-result-wide v34

    add-long v6, v6, v34

    goto :goto_14

    .line 536
    .end local v6    # "position":J
    .end local v8    # "chunk":J
    .end local v12    # "count":J
    .end local v18    # "in":Ljava/io/FileInputStream;
    .end local v28    # "out":Ljava/io/FileOutputStream;
    .restart local v17    # "in":Ljava/io/FileInputStream;
    .restart local v27    # "out":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v33

    :goto_15
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/nio/channels/Channel;)V

    .line 537
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/nio/channels/Channel;)V

    .line 538
    invoke-static/range {v27 .. v27}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 539
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 536
    throw v33

    .line 542
    .end local v4    # "destChannel":Ljava/nio/channels/FileChannel;
    .end local v5    # "srcChannel":Ljava/nio/channels/FileChannel;
    .end local v17    # "in":Ljava/io/FileInputStream;
    .end local v27    # "out":Ljava/io/FileOutputStream;
    .end local v29    # "parent":Ljava/io/File;
    .end local v31    # "sourceFile":Ljava/io/File;
    :cond_17
    const/16 v17, 0x0

    .line 543
    .local v17, "in":Ljava/io/InputStream;
    const/16 v27, 0x0

    .line 545
    .local v27, "out":Ljava/io/OutputStream;
    :try_start_11
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v17

    .line 546
    move-object/from16 v0, p1

    move/from16 v1, p6

    move-object/from16 v2, p9

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/util/ResourceUtils;->getOutputStream(Lorg/apache/tools/ant/types/Resource;ZLorg/apache/tools/ant/Project;)Ljava/io/OutputStream;

    move-result-object v27

    .line 548
    const/16 v33, 0x2000

    move/from16 v0, v33

    new-array v10, v0, [B

    .line 549
    .local v10, "buffer":[B
    const/4 v12, 0x0

    .line 551
    .local v12, "count":I
    :cond_18
    const/16 v33, 0x0

    move-object/from16 v0, v27

    move/from16 v1, v33

    invoke-virtual {v0, v10, v1, v12}, Ljava/io/OutputStream;->write([BII)V

    .line 552
    const/16 v33, 0x0

    array-length v0, v10

    move/from16 v34, v0

    move-object/from16 v0, v17

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v10, v1, v2}, Ljava/io/InputStream;->read([BII)I
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    move-result v12

    .line 553
    const/16 v33, -0x1

    move/from16 v0, v33

    if-ne v12, v0, :cond_18

    .line 555
    invoke-static/range {v27 .. v27}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 556
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_b

    .line 555
    .end local v10    # "buffer":[B
    .end local v12    # "count":I
    :catchall_3
    move-exception v33

    invoke-static/range {v27 .. v27}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 556
    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v33

    .line 560
    .end local v17    # "in":Ljava/io/InputStream;
    .end local v27    # "out":Ljava/io/OutputStream;
    :cond_19
    sget-object v33, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Touchable:Ljava/lang/Class;

    goto/16 :goto_c

    .line 536
    .restart local v4    # "destChannel":Ljava/nio/channels/FileChannel;
    .restart local v5    # "srcChannel":Ljava/nio/channels/FileChannel;
    .restart local v6    # "position":J
    .local v12, "count":J
    .restart local v18    # "in":Ljava/io/FileInputStream;
    .restart local v28    # "out":Ljava/io/FileOutputStream;
    .restart local v29    # "parent":Ljava/io/File;
    .restart local v31    # "sourceFile":Ljava/io/File;
    :cond_1a
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/nio/channels/Channel;)V

    .line 537
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/nio/channels/Channel;)V

    .line 538
    invoke-static/range {v28 .. v28}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 539
    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_b

    .line 536
    .end local v6    # "position":J
    .end local v12    # "count":J
    .end local v28    # "out":Ljava/io/FileOutputStream;
    .local v27, "out":Ljava/io/FileOutputStream;
    :catchall_4
    move-exception v33

    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/FileInputStream;
    .local v17, "in":Ljava/io/FileInputStream;
    goto :goto_15

    .end local v17    # "in":Ljava/io/FileInputStream;
    .end local v27    # "out":Ljava/io/FileOutputStream;
    .restart local v18    # "in":Ljava/io/FileInputStream;
    .restart local v28    # "out":Ljava/io/FileOutputStream;
    :catchall_5
    move-exception v33

    move-object/from16 v27, v28

    .end local v28    # "out":Ljava/io/FileOutputStream;
    .restart local v27    # "out":Ljava/io/FileOutputStream;
    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/FileInputStream;
    .restart local v17    # "in":Ljava/io/FileInputStream;
    goto :goto_15

    .line 501
    .end local v4    # "destChannel":Ljava/nio/channels/FileChannel;
    .end local v5    # "srcChannel":Ljava/nio/channels/FileChannel;
    .end local v29    # "parent":Ljava/io/File;
    .end local v31    # "sourceFile":Ljava/io/File;
    .local v17, "in":Ljava/io/BufferedReader;
    .restart local v19    # "isr":Ljava/io/InputStreamReader;
    .local v27, "out":Ljava/io/BufferedWriter;
    :catchall_6
    move-exception v33

    goto/16 :goto_11

    .end local v17    # "in":Ljava/io/BufferedReader;
    .local v18, "in":Ljava/io/BufferedReader;
    :catchall_7
    move-exception v33

    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_11

    .end local v17    # "in":Ljava/io/BufferedReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    .restart local v25    # "os":Ljava/io/OutputStream;
    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    .local v28, "out":Ljava/io/BufferedWriter;
    :catchall_8
    move-exception v33

    move-object/from16 v27, v28

    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_11

    .line 457
    .end local v25    # "os":Ljava/io/OutputStream;
    .end local v26    # "osw":Ljava/io/OutputStreamWriter;
    :catchall_9
    move-exception v33

    goto/16 :goto_a

    .end local v17    # "in":Ljava/io/BufferedReader;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    :catchall_a
    move-exception v33

    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_a

    .end local v17    # "in":Ljava/io/BufferedReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    .restart local v25    # "os":Ljava/io/OutputStream;
    .restart local v26    # "osw":Ljava/io/OutputStreamWriter;
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    :catchall_b
    move-exception v33

    move-object/from16 v27, v28

    .end local v28    # "out":Ljava/io/BufferedWriter;
    .restart local v27    # "out":Ljava/io/BufferedWriter;
    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_a

    .end local v17    # "in":Ljava/io/BufferedReader;
    .end local v27    # "out":Ljava/io/BufferedWriter;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    .restart local v28    # "out":Ljava/io/BufferedWriter;
    :cond_1b
    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_f

    .end local v17    # "in":Ljava/io/BufferedReader;
    .restart local v18    # "in":Ljava/io/BufferedReader;
    :cond_1c
    move-object/from16 v17, v18

    .end local v18    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_7
.end method

.method private static getOutputStream(Lorg/apache/tools/ant/types/Resource;ZLorg/apache/tools/ant/Project;)Ljava/io/OutputStream;
    .locals 3
    .param p0, "resource"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "append"    # Z
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 770
    if-eqz p1, :cond_2

    .line 771
    sget-object v1, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.Appendable"

    invoke-static {v1}, Lorg/apache/tools/ant/util/ResourceUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Appendable;

    .line 772
    .local v0, "a":Lorg/apache/tools/ant/types/resources/Appendable;
    if-eqz v0, :cond_1

    .line 773
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/Appendable;->getAppendOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 778
    .end local v0    # "a":Lorg/apache/tools/ant/types/resources/Appendable;
    :goto_1
    return-object v1

    .line 771
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/util/ResourceUtils;->class$org$apache$tools$ant$types$resources$Appendable:Ljava/lang/Class;

    goto :goto_0

    .line 775
    .restart local v0    # "a":Lorg/apache/tools/ant/types/resources/Appendable;
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Appendable OutputStream not available for non-appendable resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "; using plain OutputStream"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p2, v1, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 778
    .end local v0    # "a":Lorg/apache/tools/ant/types/resources/Appendable;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    goto :goto_1
.end method

.method private static logFuture(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;J)V
    .locals 8
    .param p0, "logTo"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "granularity"    # J

    .prologue
    .line 755
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    add-long v2, v6, p2

    .line 756
    .local v2, "now":J
    new-instance v4, Lorg/apache/tools/ant/types/resources/selectors/Date;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/resources/selectors/Date;-><init>()V

    .line 757
    .local v4, "sel":Lorg/apache/tools/ant/types/resources/selectors/Date;
    invoke-virtual {v4, v2, v3}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setMillis(J)V

    .line 758
    sget-object v5, Lorg/apache/tools/ant/types/TimeComparison;->AFTER:Lorg/apache/tools/ant/types/TimeComparison;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/resources/selectors/Date;->setWhen(Lorg/apache/tools/ant/types/TimeComparison;)V

    .line 759
    new-instance v0, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 760
    .local v0, "future":Lorg/apache/tools/ant/types/resources/Restrict;
    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 761
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 762
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Restrict;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 763
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Warning: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " modified in the future."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 766
    :cond_0
    return-void
.end method

.method public static selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 2
    .param p0, "logTo"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p1, "source"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p3, "targets"    # Lorg/apache/tools/ant/types/ResourceFactory;
    .param p4, "granularity"    # J

    .prologue
    .line 145
    invoke-static {p0, p1, p4, p5}, Lorg/apache/tools/ant/util/ResourceUtils;->logFuture(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;J)V

    .line 146
    new-instance v0, Lorg/apache/tools/ant/util/ResourceUtils$1;

    invoke-direct {v0, p4, p5}, Lorg/apache/tools/ant/util/ResourceUtils$1;-><init>(J)V

    .line 163
    .local v0, "p":Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/tools/ant/util/ResourceUtils;->selectSources(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    return-object v1
.end method

.method public static selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;)[Lorg/apache/tools/ant/types/Resource;
    .locals 6
    .param p0, "logTo"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p1, "source"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p3, "targets"    # Lorg/apache/tools/ant/types/ResourceFactory;

    .prologue
    .line 95
    sget-object v0, Lorg/apache/tools/ant/util/ResourceUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    return-object v0
.end method

.method public static selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)[Lorg/apache/tools/ant/types/Resource;
    .locals 8
    .param p0, "logTo"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p1, "source"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p3, "targets"    # Lorg/apache/tools/ant/types/ResourceFactory;
    .param p4, "granularity"    # J

    .prologue
    .line 121
    new-instance v1, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    .line 122
    .local v1, "u":Lorg/apache/tools/ant/types/resources/Union;
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/resources/Union;->addAll(Ljava/util/Collection;)V

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    .line 123
    invoke-static/range {v0 .. v5}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v6

    .line 125
    .local v6, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v6}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Lorg/apache/tools/ant/types/Resource;

    .end local v6    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :goto_0
    return-object v0

    .restart local v6    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_0
    check-cast v6, Lorg/apache/tools/ant/types/resources/Union;

    .end local v6    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/resources/Union;->listResources()[Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    goto :goto_0
.end method

.method public static selectSources(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 14
    .param p0, "logTo"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p1, "source"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p3, "targets"    # Lorg/apache/tools/ant/types/ResourceFactory;
    .param p4, "selector"    # Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;

    .prologue
    .line 185
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v11

    if-nez v11, :cond_1

    .line 186
    const-string/jumbo v11, "No sources found."

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 187
    sget-object v5, Lorg/apache/tools/ant/types/resources/Resources;->NONE:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 238
    :cond_0
    return-object v5

    .line 189
    :cond_1
    invoke-static {p1}, Lorg/apache/tools/ant/types/resources/Union;->getInstance(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/resources/Union;

    move-result-object p1

    .line 191
    new-instance v5, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v5}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    .line 192
    .local v5, "result":Lorg/apache/tools/ant/types/resources/Union;
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 193
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/Resource;

    .line 194
    .local v6, "sr":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v7

    .line 195
    .local v7, "srName":Ljava/lang/String;
    if-nez v7, :cond_3

    .line 198
    :goto_1
    const/4 v10, 0x0

    .line 200
    .local v10, "targetnames":[Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p2

    invoke-interface {v0, v7}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 205
    :goto_2
    if-eqz v10, :cond_2

    array-length v11, v10

    if-nez v11, :cond_4

    .line 206
    :cond_2
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " skipped - don\'t know how to handle it"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 195
    .end local v10    # "targetnames":[Ljava/lang/String;
    :cond_3
    const/16 v11, 0x2f

    sget-char v12, Ljava/io/File;->separatorChar:C

    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 201
    .restart local v10    # "targetnames":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 202
    .local v1, "e":Ljava/lang/Exception;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Caught "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " mapping resource "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 210
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    array-length v11, v10

    if-ge v2, v11, :cond_6

    .line 211
    aget-object v11, v10, v2

    if-nez v11, :cond_5

    .line 212
    const-string/jumbo v11, "(no name)"

    aput-object v11, v10, v2

    .line 210
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 215
    :cond_6
    new-instance v9, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    .line 216
    .local v9, "targetColl":Lorg/apache/tools/ant/types/resources/Union;
    const/4 v2, 0x0

    :goto_4
    array-length v11, v10

    if-ge v2, v11, :cond_7

    .line 217
    aget-object v11, v10, v2

    sget-char v12, Ljava/io/File;->separatorChar:C

    const/16 v13, 0x2f

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Lorg/apache/tools/ant/types/ResourceFactory;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 216
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 221
    :cond_7
    new-instance v4, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 222
    .local v4, "r":Lorg/apache/tools/ant/types/resources/Restrict;
    move-object/from16 v0, p4

    invoke-interface {v0, v6}, Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;->getTargetSelectorForSource(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    move-result-object v11

    invoke-virtual {v4, v11}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 223
    invoke-virtual {v4, v9}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 224
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/resources/Restrict;->size()I

    move-result v11

    if-lez v11, :cond_9

    .line 225
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 226
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/resources/Restrict;->iterator()Ljava/util/Iterator;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Resource;

    .line 227
    .local v8, "t":Lorg/apache/tools/ant/types/Resource;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " added as "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v11

    if-eqz v11, :cond_8

    const-string/jumbo v11, " is outdated."

    :goto_5
    invoke-virtual {v12, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_8
    const-string/jumbo v11, " doesn\'t exist."

    goto :goto_5

    .line 233
    .end local v8    # "t":Lorg/apache/tools/ant/types/Resource;
    :cond_9
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " omitted as "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/resources/Union;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v11

    const/4 v13, 0x1

    if-ne v11, v13, :cond_a

    const-string/jumbo v11, " is"

    :goto_6
    invoke-virtual {v12, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " up to date."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_a
    const-string/jumbo v11, " are "

    goto :goto_6
.end method

.method public static setLastModified(Lorg/apache/tools/ant/types/resources/Touchable;J)V
    .locals 3
    .param p0, "t"    # Lorg/apache/tools/ant/types/resources/Touchable;
    .param p1, "time"    # J

    .prologue
    .line 578
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    .end local p1    # "time":J
    :cond_0
    invoke-interface {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/Touchable;->touch(J)V

    .line 579
    return-void
.end method

.method private static textCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 8
    .param p0, "r1"    # Lorg/apache/tools/ant/types/Resource;
    .param p1, "r2"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 722
    const/4 v2, 0x0

    .line 723
    .local v2, "in1":Ljava/io/BufferedReader;
    const/4 v4, 0x0

    .line 725
    .local v4, "in2":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 726
    .end local v2    # "in1":Ljava/io/BufferedReader;
    .local v3, "in1":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 728
    .end local v4    # "in2":Ljava/io/BufferedReader;
    .local v5, "in2":Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 729
    .local v1, "expected":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_2

    .line 730
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 731
    .local v0, "actual":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v6

    if-nez v6, :cond_1

    .line 732
    if-nez v0, :cond_0

    .line 733
    const/4 v6, 0x1

    .line 741
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 742
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .end local v0    # "actual":Ljava/lang/String;
    :goto_1
    return v6

    .line 735
    .restart local v0    # "actual":Ljava/lang/String;
    :cond_0
    :try_start_3
    invoke-virtual {v1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-result v6

    .line 741
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 742
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_1

    .line 737
    :cond_1
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 739
    .end local v0    # "actual":Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result-object v6

    if-nez v6, :cond_3

    const/4 v6, 0x0

    .line 741
    :goto_2
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 742
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_1

    .line 739
    :cond_3
    const/4 v6, -0x1

    goto :goto_2

    .line 741
    .end local v1    # "expected":Ljava/lang/String;
    .end local v3    # "in1":Ljava/io/BufferedReader;
    .end local v5    # "in2":Ljava/io/BufferedReader;
    .restart local v2    # "in1":Ljava/io/BufferedReader;
    .restart local v4    # "in2":Ljava/io/BufferedReader;
    :catchall_0
    move-exception v6

    :goto_3
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 742
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v6

    .line 741
    .end local v2    # "in1":Ljava/io/BufferedReader;
    .restart local v3    # "in1":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v6

    move-object v2, v3

    .end local v3    # "in1":Ljava/io/BufferedReader;
    .restart local v2    # "in1":Ljava/io/BufferedReader;
    goto :goto_3

    .end local v2    # "in1":Ljava/io/BufferedReader;
    .end local v4    # "in2":Ljava/io/BufferedReader;
    .restart local v3    # "in1":Ljava/io/BufferedReader;
    .restart local v5    # "in2":Ljava/io/BufferedReader;
    :catchall_2
    move-exception v6

    move-object v4, v5

    .end local v5    # "in2":Ljava/io/BufferedReader;
    .restart local v4    # "in2":Ljava/io/BufferedReader;
    move-object v2, v3

    .end local v3    # "in1":Ljava/io/BufferedReader;
    .restart local v2    # "in1":Ljava/io/BufferedReader;
    goto :goto_3
.end method
