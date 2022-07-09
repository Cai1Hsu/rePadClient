.class public Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;
.super Ljava/lang/Object;
.source "jlink.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final VECTOR_INIT_SIZE:I = 0xa


# instance fields
.field private addfiles:Ljava/util/Vector;

.field buffer:[B

.field private compression:Z

.field private mergefiles:Ljava/util/Vector;

.field private outfile:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0xa

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->outfile:Ljava/lang/String;

    .line 52
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->mergefiles:Ljava/util/Vector;

    .line 54
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addfiles:Ljava/util/Vector;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    .line 60
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    return-void
.end method

.method private addDirContents(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 6
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "dir"    # Ljava/io/File;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "compress"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-virtual {p2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "contents":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 282
    aget-object v3, v0, v2

    .line 283
    .local v3, "name":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 285
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 286
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, p1, v1, v4, p4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addDirContents(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V

    .line 281
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 288
    :cond_0
    invoke-direct {p0, p1, v1, p3, p4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V

    goto :goto_1

    .line 291
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "name":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "compress"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 349
    :goto_0
    return-void

    .line 339
    :cond_0
    new-instance v0, Ljava/util/zip/ZipEntry;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->getEntryName(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 341
    .local v0, "entry":Ljava/util/zip/ZipEntry;
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 342
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/zip/ZipEntry;->setSize(J)V

    .line 343
    if-nez p4, :cond_1

    .line 344
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->calcChecksum(Ljava/io/File;)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 346
    :cond_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 348
    .local v1, "input":Ljava/io/FileInputStream;
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addToOutputStream(Ljava/util/zip/ZipOutputStream;Ljava/io/InputStream;Ljava/util/zip/ZipEntry;)V

    goto :goto_0
.end method

.method private addToOutputStream(Ljava/util/zip/ZipOutputStream;Ljava/io/InputStream;Ljava/util/zip/ZipEntry;)V
    .locals 4
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "input"    # Ljava/io/InputStream;
    .param p3, "ze"    # Ljava/util/zip/ZipEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    :try_start_0
    invoke-virtual {p1, p3}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 365
    const/4 v0, -0x1

    .line 367
    .local v0, "numBytes":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    invoke-virtual {p2, v2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    if-lez v0, :cond_0

    .line 368
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v0}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_0

    .line 359
    .end local v0    # "numBytes":I
    :catch_0
    move-exception v1

    .line 361
    .local v1, "zipEx":Ljava/util/zip/ZipException;
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    .line 372
    .end local v1    # "zipEx":Ljava/util/zip/ZipException;
    :goto_1
    return-void

    .line 370
    .restart local v0    # "numBytes":I
    :cond_0
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 371
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    goto :goto_1
.end method

.method private calcChecksum(Ljava/io/File;)J
    .locals 4
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 433
    .local v0, "in":Ljava/io/BufferedInputStream;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->calcChecksum(Ljava/io/InputStream;)J

    move-result-wide v2

    return-wide v2
.end method

.method private calcChecksum(Ljava/io/InputStream;)J
    .locals 6
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 442
    new-instance v1, Ljava/util/zip/CRC32;

    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    .line 443
    .local v1, "crc":Ljava/util/zip/CRC32;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    array-length v3, v4

    .line 444
    .local v3, "len":I
    const/4 v0, -0x1

    .line 445
    .local v0, "count":I
    const/4 v2, 0x0

    .line 447
    .local v2, "haveRead":I
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    invoke-virtual {p1, v4, v5, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-lez v0, :cond_0

    .line 448
    add-int/2addr v2, v0

    .line 449
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    invoke-virtual {v1, v4, v5, v0}, Ljava/util/zip/CRC32;->update([BII)V

    goto :goto_0

    .line 451
    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 452
    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v4

    return-wide v4
.end method

.method private getEntryName(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 302
    .local v3, "name":Ljava/lang/String;
    const-string/jumbo v4, ".class"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 304
    const/4 v1, 0x0

    .line 306
    .local v1, "input":Ljava/io/InputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    .end local v1    # "input":Ljava/io/InputStream;
    .local v2, "input":Ljava/io/InputStream;
    :try_start_1
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/ClassNameReader;->getClassName(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 309
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 310
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v5, 0x2e

    const/16 v6, 0x2f

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v4

    .line 315
    if-eqz v2, :cond_0

    .line 317
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 326
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "input":Ljava/io/InputStream;
    :cond_0
    :goto_0
    return-object v4

    .line 315
    .restart local v1    # "input":Ljava/io/InputStream;
    :catchall_0
    move-exception v4

    :goto_1
    if-eqz v1, :cond_1

    .line 317
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 315
    :cond_1
    :goto_2
    throw v4

    .line 312
    :catch_0
    move-exception v4

    .line 315
    :goto_3
    if-eqz v1, :cond_2

    .line 317
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 324
    .end local v1    # "input":Ljava/io/InputStream;
    :cond_2
    :goto_4
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "From "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " and prefix "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ", creating entry "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 326
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 318
    :catch_1
    move-exception v4

    goto :goto_4

    .restart local v1    # "input":Ljava/io/InputStream;
    :catch_2
    move-exception v5

    goto :goto_2

    .end local v1    # "input":Ljava/io/InputStream;
    .restart local v0    # "className":Ljava/lang/String;
    .restart local v2    # "input":Ljava/io/InputStream;
    :catch_3
    move-exception v5

    goto :goto_0

    .line 315
    :cond_3
    if-eqz v2, :cond_2

    .line 317
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_4

    .line 315
    .end local v0    # "className":Ljava/lang/String;
    :catchall_1
    move-exception v4

    move-object v1, v2

    .end local v2    # "input":Ljava/io/InputStream;
    .restart local v1    # "input":Ljava/io/InputStream;
    goto :goto_1

    .line 312
    .end local v1    # "input":Ljava/io/InputStream;
    .restart local v2    # "input":Ljava/io/InputStream;
    :catch_4
    move-exception v4

    move-object v1, v2

    .end local v2    # "input":Ljava/io/InputStream;
    .restart local v1    # "input":Ljava/io/InputStream;
    goto :goto_3
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 196
    array-length v3, p0

    const/4 v4, 0x2

    if-ge v3, v4, :cond_0

    .line 197
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v4, "usage: jlink output input1 ... inputN"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    .line 200
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;

    invoke-direct {v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;-><init>()V

    .line 202
    .local v2, "linker":Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;
    const/4 v3, 0x0

    aget-object v3, p0, v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->setOutfile(Ljava/lang/String;)V

    .line 205
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_1

    .line 206
    aget-object v3, p0, v1

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addMergeFile(Ljava/lang/String;)V

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 209
    :cond_1
    :try_start_0
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->link()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    :goto_1
    return-void

    .line 210
    :catch_0
    move-exception v0

    .line 211
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private mergeZipJarContents(Ljava/util/zip/ZipOutputStream;Ljava/io/File;)V
    .locals 12
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 222
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_0

    .line 271
    :goto_0
    return-void

    .line 225
    :cond_0
    new-instance v9, Ljava/util/zip/ZipFile;

    invoke-direct {v9, p2}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 226
    .local v9, "zipf":Ljava/util/zip/ZipFile;
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 228
    .local v1, "entries":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 229
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/zip/ZipEntry;

    .line 233
    .local v5, "inputEntry":Ljava/util/zip/ZipEntry;
    invoke-virtual {v5}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    .line 234
    .local v6, "inputEntryName":Ljava/lang/String;
    const-string/jumbo v10, "META-INF"

    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 236
    .local v4, "index":I
    if-gez v4, :cond_1

    .line 239
    :try_start_0
    invoke-direct {p0, v9, v5}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->processEntry(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;)Ljava/util/zip/ZipEntry;

    move-result-object v10

    invoke-virtual {p1, v10}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    invoke-virtual {v9, v5}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    .line 260
    .local v3, "in":Ljava/io/InputStream;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    array-length v7, v10

    .line 261
    .local v7, "len":I
    const/4 v0, -0x1

    .line 263
    .local v0, "count":I
    :goto_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    invoke-virtual {v3, v10, v11, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-lez v0, :cond_2

    .line 264
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->buffer:[B

    invoke-virtual {p1, v10, v11, v0}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_2

    .line 240
    .end local v0    # "count":I
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v7    # "len":I
    :catch_0
    move-exception v2

    .line 247
    .local v2, "ex":Ljava/util/zip/ZipException;
    invoke-virtual {v2}, Ljava/util/zip/ZipException;->getMessage()Ljava/lang/String;

    move-result-object v8

    .line 249
    .local v8, "mess":Ljava/lang/String;
    const-string/jumbo v10, "duplicate"

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    if-gez v10, :cond_1

    .line 255
    throw v2

    .line 266
    .end local v2    # "ex":Ljava/util/zip/ZipException;
    .end local v8    # "mess":Ljava/lang/String;
    .restart local v0    # "count":I
    .restart local v3    # "in":Ljava/io/InputStream;
    .restart local v7    # "len":I
    :cond_2
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 267
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    goto :goto_1

    .line 270
    .end local v0    # "count":I
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "index":I
    .end local v5    # "inputEntry":Ljava/util/zip/ZipEntry;
    .end local v6    # "inputEntryName":Ljava/lang/String;
    .end local v7    # "len":I
    :cond_3
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V

    goto :goto_0
.end method

.method private processEntry(Ljava/util/zip/ZipFile;Ljava/util/zip/ZipEntry;)Ljava/util/zip/ZipEntry;
    .locals 7
    .param p1, "zip"    # Ljava/util/zip/ZipFile;
    .param p2, "inputEntry"    # Ljava/util/zip/ZipEntry;

    .prologue
    .line 393
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 395
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, ".class"

    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 397
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v1

    .line 398
    .local v1, "input":Ljava/io/InputStream;
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/ClassNameReader;->getClassName(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 400
    .local v0, "className":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 401
    if-eqz v0, :cond_0

    .line 402
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v5, 0x2e

    const/16 v6, 0x2f

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 408
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "input":Ljava/io/InputStream;
    :cond_0
    :goto_0
    new-instance v3, Ljava/util/zip/ZipEntry;

    invoke-direct {v3, v2}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 410
    .local v3, "outputEntry":Ljava/util/zip/ZipEntry;
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 411
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getExtra()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/zip/ZipEntry;->setExtra([B)V

    .line 412
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getComment()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 413
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/zip/ZipEntry;->setTime(J)V

    .line 414
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    if-eqz v4, :cond_1

    .line 415
    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 422
    :goto_1
    return-object v3

    .line 418
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/zip/ZipEntry;->setMethod(I)V

    .line 419
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getCrc()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 420
    invoke-virtual {p2}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/util/zip/ZipEntry;->setSize(J)V

    goto :goto_1

    .line 404
    .end local v3    # "outputEntry":Ljava/util/zip/ZipEntry;
    :catch_0
    move-exception v4

    goto :goto_0
.end method


# virtual methods
.method public addAddFile(Ljava/lang/String;)V
    .locals 1
    .param p1, "fileToAdd"    # Ljava/lang/String;

    .prologue
    .line 91
    if-nez p1, :cond_0

    .line 95
    :goto_0
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addfiles:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public addAddFiles([Ljava/lang/String;)V
    .locals 2
    .param p1, "filesToAdd"    # [Ljava/lang/String;

    .prologue
    .line 117
    if-nez p1, :cond_1

    .line 123
    :cond_0
    return-void

    .line 120
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 121
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addAddFile(Ljava/lang/String;)V

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public addMergeFile(Ljava/lang/String;)V
    .locals 1
    .param p1, "fileToMerge"    # Ljava/lang/String;

    .prologue
    .line 80
    if-nez p1, :cond_0

    .line 84
    :goto_0
    return-void

    .line 83
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->mergefiles:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public addMergeFiles([Ljava/lang/String;)V
    .locals 2
    .param p1, "filesToMerge"    # [Ljava/lang/String;

    .prologue
    .line 103
    if-nez p1, :cond_1

    .line 109
    :cond_0
    return-void

    .line 106
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 107
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addMergeFile(Ljava/lang/String;)V

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public link()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v4, Ljava/util/zip/ZipOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->outfile:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v6}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 150
    .local v4, "output":Ljava/util/zip/ZipOutputStream;
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    if-eqz v6, :cond_1

    .line 151
    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Ljava/util/zip/ZipOutputStream;->setMethod(I)V

    .line 152
    const/4 v6, -0x1

    invoke-virtual {v4, v6}, Ljava/util/zip/ZipOutputStream;->setLevel(I)V

    .line 157
    :goto_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->mergefiles:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .line 159
    .local v2, "merges":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 160
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 161
    .local v5, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 163
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".jar"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".zip"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 165
    :cond_0
    invoke-direct {p0, v4, v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->mergeZipJarContents(Ljava/util/zip/ZipOutputStream;Ljava/io/File;)V

    goto :goto_1

    .line 154
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "merges":Ljava/util/Enumeration;
    .end local v5    # "path":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Ljava/util/zip/ZipOutputStream;->setMethod(I)V

    goto :goto_0

    .line 169
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "merges":Ljava/util/Enumeration;
    .restart local v5    # "path":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addAddFile(Ljava/lang/String;)V

    goto :goto_1

    .line 173
    .end local v1    # "f":Ljava/io/File;
    .end local v5    # "path":Ljava/lang/String;
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addfiles:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 175
    .local v0, "adds":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 176
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 177
    .local v3, "name":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 179
    .restart local v1    # "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 181
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const/16 v7, 0x2f

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    invoke-direct {p0, v4, v1, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addDirContents(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V

    goto :goto_2

    .line 183
    :cond_4
    const-string/jumbo v6, ""

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    invoke-direct {p0, v4, v1, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addFile(Ljava/util/zip/ZipOutputStream;Ljava/io/File;Ljava/lang/String;Z)V

    goto :goto_2

    .line 186
    .end local v1    # "f":Ljava/io/File;
    .end local v3    # "name":Ljava/lang/String;
    :cond_5
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 187
    return-void
.end method

.method public setCompression(Z)V
    .locals 0
    .param p1, "compress"    # Z

    .prologue
    .line 131
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->compression:Z

    .line 132
    return-void
.end method

.method public setOutfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "outfile"    # Ljava/lang/String;

    .prologue
    .line 68
    if-nez p1, :cond_0

    .line 72
    :goto_0
    return-void

    .line 71
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->outfile:Ljava/lang/String;

    goto :goto_0
.end method
