.class public Lorg/apache/tools/ant/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field static final BUF_SIZE:I = 0x2000

.field private static final DELETE_RETRY_SLEEP_MILLIS:I = 0xa

.field private static final EXPAND_SPACE:I = 0x32

.field public static final FAT_FILE_TIMESTAMP_GRANULARITY:J = 0x7d0L

.field public static final NTFS_FILE_TIMESTAMP_GRANULARITY:J = 0x1L

.field private static final NULL_PLACEHOLDER:Ljava/lang/String; = "null"

.field private static final ON_DOS:Z

.field private static final ON_NETWARE:Z

.field private static final ON_WIN9X:Z

.field private static final ON_WINDOWS:Z

.field private static final PRIMARY_INSTANCE:Lorg/apache/tools/ant/util/FileUtils;

.field public static final UNIX_FILE_TIMESTAMP_GRANULARITY:J = 0x3e8L

.field private static rand:Ljava/util/Random;


# instance fields
.field private cacheFromUriLock:Ljava/lang/Object;

.field private cacheFromUriRequest:Ljava/lang/String;

.field private cacheFromUriResponse:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 63
    new-instance v0, Lorg/apache/tools/ant/util/FileUtils;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/FileUtils;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/util/FileUtils;->PRIMARY_INSTANCE:Lorg/apache/tools/ant/util/FileUtils;

    .line 66
    new-instance v0, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Random;-><init>(J)V

    sput-object v0, Lorg/apache/tools/ant/util/FileUtils;->rand:Ljava/util/Random;

    .line 69
    const-string/jumbo v0, "netware"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/FileUtils;->ON_NETWARE:Z

    .line 70
    const-string/jumbo v0, "dos"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    .line 71
    const-string/jumbo v0, "win9x"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/FileUtils;->ON_WIN9X:Z

    .line 72
    const-string/jumbo v0, "windows"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/util/FileUtils;->ON_WINDOWS:Z

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriLock:Ljava/lang/Object;

    .line 101
    iput-object v1, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriRequest:Ljava/lang/String;

    .line 102
    iput-object v1, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriResponse:Ljava/lang/String;

    .line 130
    return-void
.end method

.method public static close(Ljava/io/InputStream;)V
    .locals 1
    .param p0, "device"    # Ljava/io/InputStream;

    .prologue
    .line 1495
    if-eqz p0, :cond_0

    .line 1497
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1502
    :cond_0
    :goto_0
    return-void

    .line 1498
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static close(Ljava/io/OutputStream;)V
    .locals 1
    .param p0, "device"    # Ljava/io/OutputStream;

    .prologue
    .line 1479
    if-eqz p0, :cond_0

    .line 1481
    :try_start_0
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1486
    :cond_0
    :goto_0
    return-void

    .line 1482
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static close(Ljava/io/Reader;)V
    .locals 1
    .param p0, "device"    # Ljava/io/Reader;

    .prologue
    .line 1463
    if-eqz p0, :cond_0

    .line 1465
    :try_start_0
    invoke-virtual {p0}, Ljava/io/Reader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1470
    :cond_0
    :goto_0
    return-void

    .line 1466
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static close(Ljava/io/Writer;)V
    .locals 1
    .param p0, "device"    # Ljava/io/Writer;

    .prologue
    .line 1447
    if-eqz p0, :cond_0

    .line 1449
    :try_start_0
    invoke-virtual {p0}, Ljava/io/Writer;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1454
    :cond_0
    :goto_0
    return-void

    .line 1450
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static close(Ljava/net/URLConnection;)V
    .locals 4
    .param p0, "conn"    # Ljava/net/URLConnection;

    .prologue
    .line 1529
    if-eqz p0, :cond_0

    .line 1531
    :try_start_0
    instance-of v3, p0, Ljava/net/JarURLConnection;

    if-eqz v3, :cond_1

    .line 1532
    move-object v0, p0

    check-cast v0, Ljava/net/JarURLConnection;

    move-object v2, v0

    .line 1533
    .local v2, "juc":Ljava/net/JarURLConnection;
    invoke-virtual {v2}, Ljava/net/JarURLConnection;->getJarFile()Ljava/util/jar/JarFile;

    move-result-object v1

    .line 1534
    .local v1, "jf":Ljava/util/jar/JarFile;
    invoke-virtual {v1}, Ljava/util/jar/JarFile;->close()V

    .line 1543
    .end local v1    # "jf":Ljava/util/jar/JarFile;
    .end local v2    # "juc":Ljava/net/JarURLConnection;
    .end local p0    # "conn":Ljava/net/URLConnection;
    :cond_0
    :goto_0
    return-void

    .line 1536
    .restart local p0    # "conn":Ljava/net/URLConnection;
    :cond_1
    instance-of v3, p0, Ljava/net/HttpURLConnection;

    if-eqz v3, :cond_0

    .line 1537
    check-cast p0, Ljava/net/HttpURLConnection;

    .end local p0    # "conn":Ljava/net/URLConnection;
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1539
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static close(Ljava/nio/channels/Channel;)V
    .locals 1
    .param p0, "device"    # Ljava/nio/channels/Channel;

    .prologue
    .line 1512
    if-eqz p0, :cond_0

    .line 1514
    :try_start_0
    invoke-interface {p0}, Ljava/nio/channels/Channel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1519
    :cond_0
    :goto_0
    return-void

    .line 1515
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static delete(Ljava/io/File;)V
    .locals 0
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 1551
    if-eqz p0, :cond_0

    .line 1552
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 1554
    :cond_0
    return-void
.end method

.method public static getFileUtils()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 123
    sget-object v0, Lorg/apache/tools/ant/util/FileUtils;->PRIMARY_INSTANCE:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method public static getPath(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .param p0, "pathStack"    # Ljava/util/List;

    .prologue
    .line 1674
    const/16 v0, 0x2f

    invoke-static {p0, v0}, Lorg/apache/tools/ant/util/FileUtils;->getPath(Ljava/util/List;C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPath(Ljava/util/List;C)Ljava/lang/String;
    .locals 3
    .param p0, "pathStack"    # Ljava/util/List;
    .param p1, "separatorChar"    # C

    .prologue
    .line 1687
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 1689
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1690
    .local v1, "iter":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1691
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 1693
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1694
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1695
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1697
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getPathStack(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 1659
    sget-char v1, Ljava/io/File;->separatorChar:C

    const/16 v2, 0x2f

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 1661
    .local v0, "normalizedPath":Ljava/lang/String;
    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 10
    .param p0, "fromFile"    # Ljava/io/File;
    .param p1, "toFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1606
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    .line 1607
    .local v0, "fromPath":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    .line 1610
    .local v6, "toPath":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->getPathStack(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1611
    .local v1, "fromPathStack":[Ljava/lang/String;
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->getPathStack(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 1613
    .local v7, "toPathStack":[Ljava/lang/String;
    array-length v8, v7

    if-lez v8, :cond_0

    array-length v8, v1

    if-lez v8, :cond_0

    .line 1614
    aget-object v8, v1, v9

    aget-object v9, v7, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1617
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->getPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object v8

    .line 1647
    :goto_0
    return-object v8

    .line 1621
    :cond_0
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->getPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0

    .line 1624
    :cond_1
    array-length v8, v1

    array-length v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1625
    .local v3, "minLength":I
    const/4 v5, 0x1

    .line 1629
    .local v5, "same":I
    :goto_1
    if-ge v5, v3, :cond_2

    aget-object v8, v1, v5

    aget-object v9, v7, v5

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1630
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1634
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1638
    .local v4, "relativePathStack":Ljava/util/List;
    move v2, v5

    .local v2, "i":I
    :goto_2
    array-length v8, v1

    if-ge v2, v8, :cond_3

    .line 1639
    const-string/jumbo v8, ".."

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1638
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1643
    :cond_3
    move v2, v5

    :goto_3
    array-length v8, v7

    if-ge v2, v8, :cond_4

    .line 1644
    aget-object v8, v7, v2

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1643
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1647
    :cond_4
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->getPath(Ljava/util/List;)Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method public static isAbsolutePath(Ljava/lang/String;)Z
    .locals 10
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 655
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 656
    .local v2, "len":I
    if-nez v2, :cond_1

    .line 675
    :cond_0
    :goto_0
    return v6

    .line 659
    :cond_1
    sget-char v4, Ljava/io/File;->separatorChar:C

    .line 660
    .local v4, "sep":C
    const/16 v7, 0x2f

    invoke-virtual {p0, v7, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x5c

    invoke-virtual {v7, v8, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 661
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 662
    .local v0, "c":C
    sget-boolean v7, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    if-nez v7, :cond_3

    sget-boolean v7, Lorg/apache/tools/ant/util/FileUtils;->ON_NETWARE:Z

    if-nez v7, :cond_3

    .line 663
    if-ne v0, v4, :cond_2

    :goto_1
    move v6, v5

    goto :goto_0

    :cond_2
    move v5, v6

    goto :goto_1

    .line 665
    :cond_3
    if-ne v0, v4, :cond_5

    .line 667
    sget-boolean v7, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    if-eqz v7, :cond_0

    const/4 v7, 0x4

    if-le v2, v7, :cond_0

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v4, :cond_0

    .line 671
    invoke-virtual {p0, v4, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 672
    .local v3, "nextsep":I
    if-le v3, v9, :cond_4

    add-int/lit8 v7, v3, 0x1

    if-ge v7, v2, :cond_4

    :goto_2
    move v6, v5

    goto :goto_0

    :cond_4
    move v5, v6

    goto :goto_2

    .line 674
    .end local v3    # "nextsep":I
    :cond_5
    const/16 v7, 0x3a

    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 675
    .local v1, "colon":I
    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v7

    if-eqz v7, :cond_6

    if-ne v1, v5, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v9, :cond_6

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v4, :cond_7

    :cond_6
    sget-boolean v7, Lorg/apache/tools/ant/util/FileUtils;->ON_NETWARE:Z

    if-eqz v7, :cond_0

    if-lez v1, :cond_0

    :cond_7
    move v6, v5

    goto :goto_0
.end method

.method public static isContextRelativePath(Ljava/lang/String;)Z
    .locals 8
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 631
    sget-boolean v5, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    if-nez v5, :cond_0

    sget-boolean v5, Lorg/apache/tools/ant/util/FileUtils;->ON_NETWARE:Z

    if-eqz v5, :cond_1

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_2

    .line 638
    :cond_1
    :goto_0
    return v3

    .line 634
    :cond_2
    sget-char v2, Ljava/io/File;->separatorChar:C

    .line 635
    .local v2, "sep":C
    const/16 v5, 0x2f

    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x5c

    invoke-virtual {v5, v6, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 636
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 637
    .local v0, "c":C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 638
    .local v1, "len":I
    if-ne v0, v2, :cond_3

    if-eq v1, v4, :cond_4

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v2, :cond_4

    :cond_3
    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v5

    if-eqz v5, :cond_1

    if-le v1, v4, :cond_1

    const/16 v5, 0x3a

    invoke-virtual {p0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-ne v5, v4, :cond_1

    if-eq v1, v7, :cond_4

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v2, :cond_1

    :cond_4
    move v3, v4

    goto :goto_0
.end method

.method public static newFileUtils()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 113
    new-instance v0, Lorg/apache/tools/ant/util/FileUtils;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/FileUtils;-><init>()V

    return-object v0
.end method

.method public static readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p0, "rdr"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1045
    const/16 v0, 0x2000

    invoke-static {p0, v0}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readFully(Ljava/io/Reader;I)Ljava/lang/String;
    .locals 5
    .param p0, "rdr"    # Ljava/io/Reader;
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1061
    if-gtz p1, :cond_0

    .line 1062
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Buffer size must be greater than 0"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1065
    :cond_0
    new-array v0, p1, [C

    .line 1066
    .local v0, "buffer":[C
    const/4 v1, 0x0

    .line 1067
    .local v1, "bufferLength":I
    const/4 v2, 0x0

    .line 1068
    .local v2, "textBuffer":Ljava/lang/StringBuffer;
    :cond_1
    :goto_0
    const/4 v3, -0x1

    if-eq v1, v3, :cond_3

    .line 1069
    invoke-virtual {p0, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .line 1070
    if-lez v1, :cond_1

    .line 1071
    if-nez v2, :cond_2

    new-instance v2, Ljava/lang/StringBuffer;

    .end local v2    # "textBuffer":Ljava/lang/StringBuffer;
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1072
    .restart local v2    # "textBuffer":Ljava/lang/StringBuffer;
    :cond_2
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4, v1}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1075
    :cond_3
    if-nez v2, :cond_4

    const/4 v3, 0x0

    :goto_1
    return-object v3

    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method public static safeReadFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p0, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1086
    invoke-static {p0}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    .line 1087
    .local v0, "ret":Ljava/lang/String;
    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    .end local v0    # "ret":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static translatePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "toProcess"    # Ljava/lang/String;

    .prologue
    .line 698
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 699
    :cond_0
    const-string/jumbo v3, ""

    .line 712
    :goto_0
    return-object v3

    .line 701
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x32

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 702
    .local v0, "path":Ljava/lang/StringBuffer;
    new-instance v2, Lorg/apache/tools/ant/PathTokenizer;

    invoke-direct {v2, p0}, Lorg/apache/tools/ant/PathTokenizer;-><init>(Ljava/lang/String;)V

    .line 703
    .local v2, "tokenizer":Lorg/apache/tools/ant/PathTokenizer;
    :goto_1
    invoke-virtual {v2}, Lorg/apache/tools/ant/PathTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 704
    invoke-virtual {v2}, Lorg/apache/tools/ant/PathTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 705
    .local v1, "pathComponent":Ljava/lang/String;
    const/16 v3, 0x2f

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 706
    const/16 v3, 0x5c

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 707
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 708
    sget-char v3, Ljava/io/File;->pathSeparatorChar:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 710
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 712
    .end local v1    # "pathComponent":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method public areSame(Ljava/io/File;Ljava/io/File;)Z
    .locals 6
    .param p1, "f1"    # Ljava/io/File;
    .param p2, "f2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1265
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    move v2, v3

    .line 1273
    :cond_0
    :goto_0
    return v2

    .line 1268
    :cond_1
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 1271
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1272
    .local v0, "f1Normalized":Ljava/io/File;
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 1273
    .local v1, "f2Normalized":Ljava/io/File;
    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :cond_2
    move v2, v3

    goto :goto_0
.end method

.method public contentEquals(Ljava/io/File;Ljava/io/File;)Z
    .locals 1
    .param p1, "f1"    # Ljava/io/File;
    .param p2, "f2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1003
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/util/FileUtils;->contentEquals(Ljava/io/File;Ljava/io/File;Z)Z

    move-result v0

    return v0
.end method

.method public contentEquals(Ljava/io/File;Ljava/io/File;Z)Z
    .locals 2
    .param p1, "f1"    # Ljava/io/File;
    .param p2, "f2"    # Ljava/io/File;
    .param p3, "textfile"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1020
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v1, p2}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-static {v0, v1, p3}, Lorg/apache/tools/ant/util/ResourceUtils;->contentEquals(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Z)Z

    move-result v0

    return v0
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 322
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 323
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 339
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 340
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 11
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "inputEncoding"    # Ljava/lang/String;
    .param p8, "outputEncoding"    # Ljava/lang/String;
    .param p9, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 480
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-virtual/range {v0 .. v10}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 482
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 10
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "encoding"    # Ljava/lang/String;
    .param p8, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-virtual/range {v0 .. v9}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 445
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 12
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "append"    # Z
    .param p8, "inputEncoding"    # Ljava/lang/String;
    .param p9, "outputEncoding"    # Ljava/lang/String;
    .param p10, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 519
    const/4 v11, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-virtual/range {v0 .. v11}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V

    .line 522
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    .locals 11
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "append"    # Z
    .param p8, "inputEncoding"    # Ljava/lang/String;
    .param p9, "outputEncoding"    # Ljava/lang/String;
    .param p10, "project"    # Lorg/apache/tools/ant/Project;
    .param p11, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 559
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v1, p2}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    move-object v2, p3

    move-object v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move/from16 v10, p11

    invoke-static/range {v0 .. v10}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V

    .line 564
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Z)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 360
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V
    .locals 7
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 384
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZLjava/lang/String;)V

    .line 385
    return-void
.end method

.method public copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZLjava/lang/String;)V
    .locals 9
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .param p6, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 409
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    move-object v8, v4

    invoke-virtual/range {v0 .. v8}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 411
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 156
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    move-object v0, p0

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 157
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 173
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 174
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 10
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "inputEncoding"    # Ljava/lang/String;
    .param p8, "outputEncoding"    # Ljava/lang/String;
    .param p9, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 309
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-virtual/range {v0 .. v9}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 311
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 9
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "filterChains"    # Ljava/util/Vector;
    .param p5, "overwrite"    # Z
    .param p6, "preserveLastModified"    # Z
    .param p7, "encoding"    # Ljava/lang/String;
    .param p8, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 280
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;Z)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 191
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V
    .locals 6
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZ)V

    .line 219
    return-void
.end method

.method public copyFile(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/types/FilterSetCollection;ZZLjava/lang/String;)V
    .locals 7
    .param p1, "sourceFile"    # Ljava/lang/String;
    .param p2, "destFile"    # Ljava/lang/String;
    .param p3, "filters"    # Lorg/apache/tools/ant/types/FilterSetCollection;
    .param p4, "overwrite"    # Z
    .param p5, "preserveLastModified"    # Z
    .param p6, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object v0, p0

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;ZZLjava/lang/String;)V

    .line 245
    return-void
.end method

.method public createNewFile(Ljava/io/File;)Z
    .locals 1
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1103
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    move-result v0

    return v0
.end method

.method public createNewFile(Ljava/io/File;Z)Z
    .locals 2
    .param p1, "f"    # Ljava/io/File;
    .param p2, "mkdirs"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1116
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 1117
    .local v0, "parent":Ljava/io/File;
    if-eqz p2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1118
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 1120
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    move-result v1

    return v1
.end method

.method public createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;
    .param p3, "parentDir"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 898
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)Ljava/io/File;
    .locals 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;
    .param p3, "parentDir"    # Ljava/io/File;
    .param p4, "deleteOnExit"    # Z

    .prologue
    .line 989
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;
    .locals 10
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;
    .param p3, "parentDir"    # Ljava/io/File;
    .param p4, "deleteOnExit"    # Z
    .param p5, "createFile"    # Z

    .prologue
    .line 926
    const/4 v3, 0x0

    .line 927
    .local v3, "result":Ljava/io/File;
    if-nez p3, :cond_3

    const-string/jumbo v5, "java.io.tmpdir"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 930
    .local v2, "parent":Ljava/lang/String;
    :goto_0
    if-nez p1, :cond_0

    .line 931
    const-string/jumbo p1, "null"

    .line 933
    :cond_0
    if-nez p2, :cond_1

    .line 934
    const-string/jumbo p2, "null"

    .line 937
    :cond_1
    if-eqz p5, :cond_4

    .line 939
    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1, p2, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 954
    :goto_1
    if-eqz p4, :cond_2

    .line 955
    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 957
    :cond_2
    return-object v3

    .line 927
    .end local v2    # "parent":Ljava/lang/String;
    :cond_3
    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 940
    .restart local v2    # "parent":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 941
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Could not create tempfile in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 945
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    new-instance v1, Ljava/text/DecimalFormat;

    const-string/jumbo v5, "#####"

    invoke-direct {v1, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 946
    .local v1, "fmt":Ljava/text/DecimalFormat;
    sget-object v6, Lorg/apache/tools/ant/util/FileUtils;->rand:Ljava/util/Random;

    monitor-enter v6

    :cond_5
    move-object v4, v3

    .line 948
    .end local v3    # "result":Ljava/io/File;
    .local v4, "result":Ljava/io/File;
    :try_start_1
    new-instance v3, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v7, Lorg/apache/tools/ant/util/FileUtils;->rand:Ljava/util/Random;

    const v8, 0x7fffffff

    invoke-virtual {v7, v8}, Ljava/util/Random;->nextInt(I)I

    move-result v7

    int-to-long v8, v7

    invoke-virtual {v1, v8, v9}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 950
    .end local v4    # "result":Ljava/io/File;
    .restart local v3    # "result":Ljava/io/File;
    :try_start_2
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5

    .line 951
    monitor-exit v6

    goto :goto_1

    :catchall_0
    move-exception v5

    :goto_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .end local v3    # "result":Ljava/io/File;
    .restart local v4    # "result":Ljava/io/File;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "result":Ljava/io/File;
    .restart local v3    # "result":Ljava/io/File;
    goto :goto_2
.end method

.method public dissect(Ljava/lang/String;)[Ljava/lang/String;
    .locals 13
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 776
    sget-char v7, Ljava/io/File;->separatorChar:C

    .line 777
    .local v7, "sep":C
    const/16 v8, 0x2f

    invoke-virtual {p1, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x5c

    invoke-virtual {v8, v9, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 780
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 781
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " is not an absolute path"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 783
    :cond_0
    const/4 v5, 0x0

    .line 784
    .local v5, "root":Ljava/lang/String;
    const/16 v8, 0x3a

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 785
    .local v1, "colon":I
    if-lez v1, :cond_6

    sget-boolean v8, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    if-nez v8, :cond_1

    sget-boolean v8, Lorg/apache/tools/ant/util/FileUtils;->ON_NETWARE:Z

    if-eqz v8, :cond_6

    .line 787
    :cond_1
    add-int/lit8 v3, v1, 0x1

    .line 788
    .local v3, "next":I
    invoke-virtual {p1, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 789
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 790
    .local v0, "ca":[C
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 792
    aget-char v8, v0, v3

    if-ne v8, v7, :cond_2

    add-int/lit8 v3, v3, 0x1

    .line 794
    :cond_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 796
    .local v6, "sbPath":Ljava/lang/StringBuffer;
    move v2, v3

    .local v2, "i":I
    :goto_0
    array-length v8, v0

    if-ge v2, v8, :cond_5

    .line 797
    aget-char v8, v0, v2

    if-ne v8, v7, :cond_3

    add-int/lit8 v8, v2, -0x1

    aget-char v8, v0, v8

    if-eq v8, v7, :cond_4

    .line 798
    :cond_3
    aget-char v8, v0, v2

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 796
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 801
    :cond_5
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 812
    .end local v0    # "ca":[C
    .end local v2    # "i":I
    .end local v3    # "next":I
    .end local v6    # "sbPath":Ljava/lang/StringBuffer;
    :goto_1
    new-array v8, v12, [Ljava/lang/String;

    aput-object v5, v8, v11

    aput-object p1, v8, v10

    return-object v8

    .line 802
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v10, :cond_8

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, v7, :cond_8

    .line 804
    invoke-virtual {p1, v7, v12}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 805
    .local v4, "nextsep":I
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    .line 806
    if-le v4, v12, :cond_7

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 807
    :goto_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_7
    move-object v5, p1

    .line 806
    goto :goto_2

    .line 809
    .end local v4    # "nextsep":I
    :cond_8
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    .line 810
    invoke-virtual {p1, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1
.end method

.method public fileNameEquals(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .param p1, "f1"    # Ljava/io/File;
    .param p2, "f2"    # Ljava/io/File;

    .prologue
    .line 1255
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public fromURI(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 1228
    iget-object v3, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1229
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriRequest:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1230
    iget-object v1, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriResponse:Ljava/lang/String;

    monitor-exit v3

    .line 1236
    :goto_0
    return-object v1

    .line 1232
    :cond_0
    invoke-static {p1}, Lorg/apache/tools/ant/launch/Locator;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1233
    .local v0, "path":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 1234
    .local v1, "ret":Ljava/lang/String;
    :goto_1
    iput-object p1, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriRequest:Ljava/lang/String;

    .line 1235
    iput-object v1, p0, Lorg/apache/tools/ant/util/FileUtils;->cacheFromUriResponse:Ljava/lang/String;

    .line 1236
    monitor-exit v3

    goto :goto_0

    .line 1237
    .end local v0    # "path":Ljava/lang/String;
    .end local v1    # "ret":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "path":Ljava/lang/String;
    :cond_1
    move-object v1, v0

    .line 1233
    goto :goto_1
.end method

.method public getDefaultEncoding()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1709
    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v1, Lorg/apache/tools/ant/util/FileUtils$2;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/util/FileUtils$2;-><init>(Lorg/apache/tools/ant/util/FileUtils;)V

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 1716
    .local v0, "is":Ljava/io/InputStreamReader;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStreamReader;->getEncoding()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 1718
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v1
.end method

.method public getFileTimestampGranularity()J
    .locals 3

    .prologue
    const-wide/16 v0, 0x7d0

    .line 1332
    sget-boolean v2, Lorg/apache/tools/ant/util/FileUtils;->ON_WIN9X:Z

    if-eqz v2, :cond_1

    .line 1341
    :cond_0
    :goto_0
    return-wide v0

    .line 1335
    :cond_1
    sget-boolean v2, Lorg/apache/tools/ant/util/FileUtils;->ON_WINDOWS:Z

    if-eqz v2, :cond_2

    .line 1336
    const-wide/16 v0, 0x1

    goto :goto_0

    .line 1338
    :cond_2
    sget-boolean v2, Lorg/apache/tools/ant/util/FileUtils;->ON_DOS:Z

    if-nez v2, :cond_0

    .line 1341
    const-wide/16 v0, 0x3e8

    goto :goto_0
.end method

.method public getFileURL(Ljava/io/File;)Ljava/net/URL;
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getParentFile(Ljava/io/File;)Ljava/io/File;
    .locals 1
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 1033
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public hasErrorInCase(Ljava/io/File;)Z
    .locals 6
    .param p1, "localFile"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1369
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 1370
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 1380
    :goto_0
    return v4

    .line 1373
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1374
    .local v1, "localFileName":Ljava/lang/String;
    new-instance v0, Lorg/apache/tools/ant/util/FileUtils$1;

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/util/FileUtils$1;-><init>(Lorg/apache/tools/ant/util/FileUtils;Ljava/lang/String;)V

    .line 1379
    .local v0, "ff":Ljava/io/FilenameFilter;
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v2

    .line 1380
    .local v2, "names":[Ljava/lang/String;
    if-eqz v2, :cond_1

    array-length v5, v2

    if-ne v5, v3, :cond_1

    :goto_1
    move v4, v3

    goto :goto_0

    :cond_1
    move v3, v4

    goto :goto_1
.end method

.method public isLeadingPath(Ljava/io/File;Ljava/io/File;)Z
    .locals 4
    .param p1, "leading"    # Ljava/io/File;
    .param p2, "path"    # Ljava/io/File;

    .prologue
    .line 1180
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 1181
    .local v0, "l":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 1182
    .local v1, "p":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1183
    const/4 v2, 0x1

    .line 1190
    :goto_0
    return v2

    .line 1187
    :cond_0
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1188
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1190
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0
.end method

.method public isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z
    .locals 2
    .param p1, "parent"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1140
    invoke-static {}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->getSymbolicLinkUtils()Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    move-result-object v0

    .line 1141
    .local v0, "u":Lorg/apache/tools/ant/util/SymbolicLinkUtils;
    if-nez p1, :cond_0

    .line 1142
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/lang/String;)Z

    move-result v1

    .line 1144
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method public isUpToDate(JJ)Z
    .locals 9
    .param p1, "sourceTime"    # J
    .param p3, "destTime"    # J

    .prologue
    .line 1438
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->isUpToDate(JJJ)Z

    move-result v0

    return v0
.end method

.method public isUpToDate(JJJ)Z
    .locals 3
    .param p1, "sourceTime"    # J
    .param p3, "destTime"    # J
    .param p5, "granularity"    # J

    .prologue
    .line 1426
    const-wide/16 v0, -0x1

    cmp-long v0, p3, v0

    if-eqz v0, :cond_0

    add-long v0, p1, p5

    cmp-long v0, p3, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUpToDate(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .param p1, "source"    # Ljava/io/File;
    .param p2, "dest"    # Ljava/io/File;

    .prologue
    .line 1413
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->isUpToDate(Ljava/io/File;Ljava/io/File;J)Z

    move-result v0

    return v0
.end method

.method public isUpToDate(Ljava/io/File;Ljava/io/File;J)Z
    .locals 9
    .param p1, "source"    # Ljava/io/File;
    .param p2, "dest"    # Ljava/io/File;
    .param p3, "granularity"    # J

    .prologue
    .line 1396
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1398
    const/4 v0, 0x0

    .line 1402
    :goto_0
    return v0

    .line 1400
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 1401
    .local v2, "sourceTime":J
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    .local v4, "destTime":J
    move-object v1, p0

    move-wide v6, p3

    .line 1402
    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->isUpToDate(JJJ)Z

    move-result v0

    goto :goto_0
.end method

.method public normalize(Ljava/lang/String;)Ljava/io/File;
    .locals 10
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    .line 735
    new-instance v2, Ljava/util/Stack;

    invoke-direct {v2}, Ljava/util/Stack;-><init>()V

    .line 736
    .local v2, "s":Ljava/util/Stack;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/FileUtils;->dissect(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 737
    .local v0, "dissect":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v0, v7

    invoke-virtual {v2, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 739
    new-instance v6, Ljava/util/StringTokenizer;

    aget-object v7, v0, v9

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 740
    .local v6, "tok":Ljava/util/StringTokenizer;
    :cond_0
    :goto_0
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 741
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 742
    .local v5, "thisToken":Ljava/lang/String;
    const-string/jumbo v7, "."

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 745
    const-string/jumbo v7, ".."

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 746
    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v7

    const/4 v8, 0x2

    if-ge v7, v8, :cond_1

    .line 748
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 765
    .end local v5    # "thisToken":Ljava/lang/String;
    :goto_1
    return-object v7

    .line 750
    .restart local v5    # "thisToken":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_0

    .line 752
    :cond_2
    invoke-virtual {v2, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 755
    .end local v5    # "thisToken":Ljava/lang/String;
    :cond_3
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 756
    .local v3, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v2}, Ljava/util/Stack;->size()I

    move-result v4

    .line 757
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-ge v1, v4, :cond_5

    .line 758
    if-le v1, v9, :cond_4

    .line 761
    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 763
    :cond_4
    invoke-virtual {v2, v1}, Ljava/util/Stack;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 757
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 765
    :cond_5
    new-instance v7, Ljava/io/File;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 4
    .param p1, "leading"    # Ljava/io/File;
    .param p2, "path"    # Ljava/io/File;

    .prologue
    .line 1159
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 1160
    .local v0, "l":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 1161
    .local v1, "p":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1162
    const-string/jumbo v1, ""

    .line 1169
    .end local v1    # "p":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v1

    .line 1166
    .restart local v1    # "p":Ljava/lang/String;
    :cond_1
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1167
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1169
    :cond_2
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public rename(Ljava/io/File;Ljava/io/File;)V
    .locals 4
    .param p1, "from"    # Ljava/io/File;
    .param p2, "to"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1297
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p1

    .line 1298
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    .line 1299
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1300
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Cannot rename nonexistent file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1321
    :cond_0
    :goto_0
    return-void

    .line 1303
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1304
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Rename of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is a no-op."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 1307
    :cond_2
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->areSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1308
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " while trying to rename "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1310
    :cond_3
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 1311
    .local v0, "parent":Ljava/io/File;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1312
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to create directory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " while trying to rename "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1315
    :cond_4
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1316
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 1317
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1318
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " while trying to rename it."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 602
    invoke-static {p2}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 603
    sget-char v0, Ljava/io/File;->separatorChar:C

    .line 604
    .local v0, "sep":C
    const/16 v2, 0x2f

    invoke-virtual {p2, v2, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x5c

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p2

    .line 605
    invoke-static {p2}, Lorg/apache/tools/ant/util/FileUtils;->isContextRelativePath(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 606
    const/4 p1, 0x0

    .line 609
    const-string/jumbo v2, "user.dir"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 610
    .local v1, "udir":Ljava/lang/String;
    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v0, :cond_0

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v0, :cond_0

    .line 611
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/FileUtils;->dissect(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 614
    .end local v1    # "udir":Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    .line 616
    .end local v0    # "sep":C
    :cond_1
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    return-object v2
.end method

.method public setFileLastModified(Ljava/io/File;J)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "time"    # J

    .prologue
    .line 577
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-static {v0, p2, p3}, Lorg/apache/tools/ant/util/ResourceUtils;->setLastModified(Lorg/apache/tools/ant/types/resources/Touchable;J)V

    .line 578
    return-void
.end method

.method public toURI(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1212
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toVMSPath(Ljava/io/File;)Ljava/lang/String;
    .locals 17
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 827
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v16

    .line 828
    .local v16, "path":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 829
    .local v1, "name":Ljava/lang/String;
    const/4 v2, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    if-ne v2, v3, :cond_0

    const/4 v13, 0x1

    .line 832
    .local v13, "isAbsolute":Z
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    const-string/jumbo v4, ".DIR"

    const/4 v5, 0x0

    const/4 v6, 0x4

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v14, 0x1

    .line 835
    .local v14, "isDirectory":Z
    :goto_1
    const/4 v7, 0x0

    .line 836
    .local v7, "device":Ljava/lang/String;
    const/4 v9, 0x0

    .line 837
    .local v9, "directory":Ljava/lang/StringBuffer;
    const/4 v10, 0x0

    .line 839
    .local v10, "file":Ljava/lang/String;
    const/4 v11, 0x0

    .line 841
    .local v11, "index":I
    if-eqz v13, :cond_3

    .line 842
    sget-char v2, Ljava/io/File;->separatorChar:C

    const/4 v3, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v11

    .line 843
    const/4 v2, -0x1

    if-ne v11, v2, :cond_2

    .line 844
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v3, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ":[000000]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 869
    :goto_2
    return-object v15

    .line 829
    .end local v7    # "device":Ljava/lang/String;
    .end local v9    # "directory":Ljava/lang/StringBuffer;
    .end local v10    # "file":Ljava/lang/String;
    .end local v11    # "index":I
    .end local v13    # "isAbsolute":Z
    .end local v14    # "isDirectory":Z
    :cond_0
    const/4 v13, 0x0

    goto :goto_0

    .line 832
    .restart local v13    # "isAbsolute":Z
    :cond_1
    const/4 v14, 0x0

    goto :goto_1

    .line 846
    .restart local v7    # "device":Ljava/lang/String;
    .restart local v9    # "directory":Ljava/lang/StringBuffer;
    .restart local v10    # "file":Ljava/lang/String;
    .restart local v11    # "index":I
    .restart local v14    # "isDirectory":Z
    :cond_2
    const/4 v2, 0x1

    add-int/lit8 v12, v11, 0x1

    .end local v11    # "index":I
    .local v12, "index":I
    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    move v11, v12

    .line 848
    .end local v12    # "index":I
    .restart local v11    # "index":I
    :cond_3
    if-eqz v14, :cond_6

    .line 849
    new-instance v9, Ljava/lang/StringBuffer;

    .end local v9    # "directory":Ljava/lang/StringBuffer;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    const/16 v4, 0x2e

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v9, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 863
    .restart local v9    # "directory":Ljava/lang/StringBuffer;
    :cond_4
    :goto_3
    if-nez v13, :cond_5

    if-eqz v9, :cond_5

    .line 864
    const/4 v2, 0x0

    const/16 v3, 0x2e

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuffer;->insert(IC)Ljava/lang/StringBuffer;

    .line 866
    :cond_5
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    if-eqz v7, :cond_9

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_4
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz v9, :cond_a

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "["

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v4, "]"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_5
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz v10, :cond_b

    move-object v2, v10

    :goto_6
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 869
    .local v15, "osPath":Ljava/lang/String;
    goto :goto_2

    .line 851
    .end local v15    # "osPath":Ljava/lang/String;
    :cond_6
    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v8

    .line 852
    .local v8, "dirEnd":I
    const/4 v2, -0x1

    if-eq v8, v2, :cond_7

    if-ge v8, v11, :cond_8

    .line 853
    :cond_7
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_3

    .line 855
    :cond_8
    new-instance v9, Ljava/lang/StringBuffer;

    .end local v9    # "directory":Ljava/lang/StringBuffer;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    const/16 v4, 0x2e

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v9, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 857
    .restart local v9    # "directory":Ljava/lang/StringBuffer;
    add-int/lit8 v11, v8, 0x1

    .line 858
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v11, :cond_4

    .line 859
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_3

    .line 866
    .end local v8    # "dirEnd":I
    :cond_9
    const-string/jumbo v2, ""

    goto :goto_4

    :cond_a
    const-string/jumbo v2, ""

    goto :goto_5

    :cond_b
    const-string/jumbo v2, ""

    goto :goto_6
.end method

.method public tryHardToDelete(Ljava/io/File;)Z
    .locals 1
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 1565
    sget-boolean v0, Lorg/apache/tools/ant/util/FileUtils;->ON_WINDOWS:Z

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v0

    return v0
.end method

.method public tryHardToDelete(Ljava/io/File;Z)Z
    .locals 2
    .param p1, "f"    # Ljava/io/File;
    .param p2, "runGC"    # Z

    .prologue
    .line 1576
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1577
    if-eqz p2, :cond_0

    .line 1578
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 1581
    :cond_0
    const-wide/16 v0, 0xa

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1585
    :goto_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    .line 1587
    :goto_1
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_1

    .line 1582
    :catch_0
    move-exception v0

    goto :goto_0
.end method
