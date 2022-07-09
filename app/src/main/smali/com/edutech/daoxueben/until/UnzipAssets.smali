.class public Lcom/edutech/daoxueben/until/UnzipAssets;
.super Ljava/lang/Object;
.source "UnzipAssets.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
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
    .line 23
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 26
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 29
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

    .line 30
    .local v4, "myOutput":Ljava/io/OutputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 31
    .local v3, "myInput":Ljava/io/InputStream;
    const/16 v5, 0x400

    new-array v0, v5, [B

    .line 32
    .local v0, "buffer":[B
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 33
    .local v2, "length":I
    :goto_0
    if-gtz v2, :cond_1

    .line 39
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V

    .line 40
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 41
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 42
    return-void

    .line 35
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 36
    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    goto :goto_0
.end method

.method public static upZipFile(Ljava/lang/String;Ljava/lang/String;)I
    .locals 19
    .param p0, "zipFile"    # Ljava/lang/String;
    .param p1, "folderPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/ZipException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    new-instance v14, Lorg/apache/tools/zip/ZipFile;

    const-string/jumbo v15, "GBK"

    move-object/from16 v0, p0

    invoke-direct {v14, v0, v15}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .local v14, "zfile":Lorg/apache/tools/zip/ZipFile;
    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v12

    .line 109
    .local v12, "zList":Ljava/util/Enumeration;
    const/4 v13, 0x0

    .line 110
    .local v13, "ze":Lorg/apache/tools/zip/ZipEntry;
    const/16 v15, 0x400

    new-array v1, v15, [B

    .line 111
    .local v1, "buf":[B
    :goto_0
    invoke-interface {v12}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v15

    if-nez v15, :cond_0

    .line 148
    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 150
    const/4 v15, 0x0

    return v15

    .line 113
    :cond_0
    invoke-interface {v12}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v13

    .end local v13    # "ze":Lorg/apache/tools/zip/ZipEntry;
    check-cast v13, Lorg/apache/tools/zip/ZipEntry;

    .line 115
    .restart local v13    # "ze":Lorg/apache/tools/zip/ZipEntry;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    .line 116
    .local v11, "xxx":Ljava/lang/StringBuffer;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v13}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    array-length v15, v15

    if-lt v6, v15, :cond_1

    .line 121
    invoke-virtual {v13}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 123
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v16

    const-string/jumbo v17, "\\"

    const-string/jumbo v18, "/"

    invoke-virtual/range {v16 .. v18}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 125
    .local v2, "dirstr":Ljava/lang/String;
    new-instance v3, Ljava/lang/String;

    const-string/jumbo v15, "GBK"

    invoke-virtual {v2, v15}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v15

    const-string/jumbo v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-direct {v3, v15, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 127
    .end local v2    # "dirstr":Ljava/lang/String;
    .local v3, "dirstr":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdir()Z

    goto :goto_0

    .line 117
    .end local v3    # "dirstr":Ljava/lang/String;
    .end local v4    # "f":Ljava/io/File;
    :cond_1
    invoke-virtual {v13}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->getBytes()[B

    move-result-object v15

    aget-byte v15, v15, v6

    and-int/lit16 v15, v15, 0xff

    invoke-static {v15}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    const-string/jumbo v15, " "

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 133
    :cond_2
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v16

    const-string/jumbo v17, "\\"

    const-string/jumbo v18, "/"

    invoke-virtual/range {v16 .. v18}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 136
    .local v5, "filestr":Ljava/lang/String;
    new-instance v10, Ljava/io/File;

    const/4 v15, 0x0

    const-string/jumbo v16, "/"

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v5, v15, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .local v10, "tmpname":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v15

    if-nez v15, :cond_3

    .line 138
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 139
    :cond_3
    new-instance v8, Ljava/io/BufferedOutputStream;

    new-instance v15, Ljava/io/FileOutputStream;

    invoke-direct {v15, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v15}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 140
    .local v8, "os":Ljava/io/OutputStream;
    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-virtual {v14, v13}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v15

    invoke-direct {v7, v15}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 141
    .local v7, "is":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 142
    .local v9, "readLen":I
    :goto_2
    const/4 v15, 0x0

    const/16 v16, 0x400

    move/from16 v0, v16

    invoke-virtual {v7, v1, v15, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v9

    const/4 v15, -0x1

    if-ne v9, v15, :cond_4

    .line 145
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 146
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    goto/16 :goto_0

    .line 143
    :cond_4
    const/4 v15, 0x0

    invoke-virtual {v8, v1, v15, v9}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2
.end method
