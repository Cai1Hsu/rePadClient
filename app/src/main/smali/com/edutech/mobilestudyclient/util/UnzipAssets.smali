.class public Lcom/edutech/mobilestudyclient/util/UnzipAssets;
.super Ljava/lang/Object;
.source "UnzipAssets.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyBigDataToSD(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "zipName"    # Ljava/lang/String;
    .param p2, "outputDirectory"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 27
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 28
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 31
    :cond_0
    new-instance v4, Ljava/io/FileOutputStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 32
    .local v4, "myOutput":Ljava/io/OutputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 33
    .local v3, "myInput":Ljava/io/InputStream;
    const/16 v5, 0x400

    new-array v0, v5, [B

    .line 34
    .local v0, "buffer":[B
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 35
    .local v2, "length":I
    :goto_0
    if-gtz v2, :cond_1

    .line 40
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 41
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 42
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 43
    return-void

    .line 37
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 38
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    goto :goto_0
.end method

.method public static upZipFile(Ljava/lang/String;Ljava/lang/String;)I
    .locals 20
    .param p0, "zipFile"    # Ljava/lang/String;
    .param p1, "folderPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    const-string/jumbo v16, "wpdemo"

    new-instance v17, Ljava/lang/StringBuilder;

    const-string/jumbo v18, "UnzipAssets unZipFile() zipFlie: "

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    const-string/jumbo v16, "wpdemo"

    new-instance v17, Ljava/lang/StringBuilder;

    const-string/jumbo v18, "UnzipAssets unZipFile() folderPath: "

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    new-instance v15, Lorg/apache/tools/zip/ZipFile;

    const-string/jumbo v16, "GBK"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v15, v0, v1}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .local v15, "zfile":Lorg/apache/tools/zip/ZipFile;
    invoke-virtual {v15}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v13

    .line 56
    .local v13, "zList":Ljava/util/Enumeration;
    const/4 v14, 0x0

    .line 57
    .local v14, "ze":Lorg/apache/tools/zip/ZipEntry;
    const/16 v16, 0x400

    move/from16 v0, v16

    new-array v2, v0, [B

    .line 58
    .local v2, "buf":[B
    :goto_0
    invoke-interface {v13}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v16

    if-nez v16, :cond_0

    .line 85
    invoke-virtual {v15}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 86
    const/16 v16, 0x0

    return v16

    .line 59
    :cond_0
    invoke-interface {v13}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "ze":Lorg/apache/tools/zip/ZipEntry;
    check-cast v14, Lorg/apache/tools/zip/ZipEntry;

    .line 60
    .restart local v14    # "ze":Lorg/apache/tools/zip/ZipEntry;
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    .line 61
    .local v12, "xxx":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    if-lt v7, v0, :cond_1

    .line 65
    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v16

    if-eqz v16, :cond_2

    .line 66
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "\\"

    const-string/jumbo v19, "/"

    invoke-virtual/range {v17 .. v19}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "dirstr":Ljava/lang/String;
    new-instance v4, Ljava/lang/String;

    const-string/jumbo v16, "GBK"

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v16

    const-string/jumbo v17, "UTF-8"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v4, v0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 68
    .end local v3    # "dirstr":Ljava/lang/String;
    .local v4, "dirstr":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 69
    .local v5, "f":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    goto :goto_0

    .line 62
    .end local v4    # "dirstr":Ljava/lang/String;
    .end local v5    # "f":Ljava/io/File;
    :cond_1
    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    aget-byte v16, v16, v7

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 63
    const-string/jumbo v16, " "

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 72
    :cond_2
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "\\"

    const-string/jumbo v19, "/"

    invoke-virtual/range {v17 .. v19}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 73
    .local v6, "filestr":Ljava/lang/String;
    new-instance v11, Ljava/io/File;

    const/16 v16, 0x0

    const-string/jumbo v17, "/"

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v6, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v11, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 74
    .local v11, "tmpname":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v16

    if-nez v16, :cond_3

    .line 75
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 76
    :cond_3
    new-instance v9, Ljava/io/BufferedOutputStream;

    new-instance v16, Ljava/io/FileOutputStream;

    move-object/from16 v0, v16

    invoke-direct {v0, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 77
    .local v9, "os":Ljava/io/OutputStream;
    new-instance v8, Ljava/io/BufferedInputStream;

    invoke-virtual {v15, v14}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v8, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 78
    .local v8, "is":Ljava/io/InputStream;
    const/4 v10, 0x0

    .line 79
    .local v10, "readLen":I
    :goto_2
    const/16 v16, 0x0

    const/16 v17, 0x400

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v8, v2, v0, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v10

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v10, v0, :cond_4

    .line 82
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 83
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    goto/16 :goto_0

    .line 80
    :cond_4
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v9, v2, v0, v10}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2
.end method
