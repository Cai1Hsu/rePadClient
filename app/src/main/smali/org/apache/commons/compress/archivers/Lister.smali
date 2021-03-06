.class public final Lorg/apache/commons/compress/archivers/Lister;
.super Ljava/lang/Object;
.source "Lister.java"


# static fields
.field private static final factory:Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;

    invoke-direct {v0}, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;-><init>()V

    sput-object v0, Lorg/apache/commons/compress/archivers/Lister;->factory:Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 38
    array-length v4, p0

    if-nez v4, :cond_0

    .line 39
    invoke-static {}, Lorg/apache/commons/compress/archivers/Lister;->usage()V

    .line 61
    :goto_0
    return-void

    .line 42
    :cond_0
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Analysing "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p0, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    new-instance v2, Ljava/io/File;

    aget-object v4, p0, v7

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_1

    .line 45
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " doesn\'t exist or is a directory"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    :cond_1
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 49
    .local v3, "fis":Ljava/io/InputStream;
    array-length v4, p0

    if-le v4, v8, :cond_2

    .line 50
    sget-object v4, Lorg/apache/commons/compress/archivers/Lister;->factory:Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;

    aget-object v5, p0, v8

    invoke-virtual {v4, v5, v3}, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->createArchiveInputStream(Ljava/lang/String;Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;

    move-result-object v1

    .line 54
    .local v1, "ais":Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    :goto_1
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Created "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 56
    :goto_2
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    move-result-object v0

    .local v0, "ae":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    if-eqz v0, :cond_3

    .line 57
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-interface {v0}, Lorg/apache/commons/compress/archivers/ArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    .line 52
    .end local v0    # "ae":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .end local v1    # "ais":Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    :cond_2
    sget-object v4, Lorg/apache/commons/compress/archivers/Lister;->factory:Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;

    invoke-virtual {v4, v3}, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->createArchiveInputStream(Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;

    move-result-object v1

    .restart local v1    # "ais":Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    goto :goto_1

    .line 59
    .restart local v0    # "ae":Lorg/apache/commons/compress/archivers/ArchiveEntry;
    :cond_3
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/ArchiveInputStream;->close()V

    .line 60
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    goto/16 :goto_0
.end method

.method private static usage()V
    .locals 2

    .prologue
    .line 64
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "Parameters: archive-name [archive-type]"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 65
    return-void
.end method
