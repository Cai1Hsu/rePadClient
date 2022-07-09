.class public Lorg/apache/tools/ant/taskdefs/optional/depend/JarFileIterator;
.super Ljava/lang/Object;
.source "JarFileIterator.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileIterator;


# instance fields
.field private jarStream:Ljava/util/zip/ZipInputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/zip/ZipInputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/JarFileIterator;->jarStream:Ljava/util/zip/ZipInputStream;

    .line 44
    return-void
.end method


# virtual methods
.method public getNextClassFile()Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    .locals 10

    .prologue
    .line 53
    const/4 v5, 0x0

    .line 56
    .local v5, "nextElement":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    :try_start_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/JarFileIterator;->jarStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v2

    .line 58
    .local v2, "jarEntry":Ljava/util/zip/ZipEntry;
    :goto_0
    if-nez v5, :cond_2

    if-eqz v2, :cond_2

    .line 59
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "entryName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_0

    const-string/jumbo v7, ".class"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 64
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;-><init>()V

    .line 66
    .local v3, "javaClass":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/JarFileIterator;->jarStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;->read(Ljava/io/InputStream;)V

    .line 68
    move-object v5, v3

    goto :goto_0

    .line 71
    .end local v3    # "javaClass":Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFile;
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/JarFileIterator;->jarStream:Ljava/util/zip/ZipInputStream;

    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 74
    .end local v1    # "entryName":Ljava/lang/String;
    .end local v2    # "jarEntry":Ljava/util/zip/ZipEntry;
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "message":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    .line 78
    .local v6, "text":Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 79
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 82
    :cond_1
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Problem reading JAR file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 85
    .end local v0    # "e":Ljava/io/IOException;
    .end local v4    # "message":Ljava/lang/String;
    .end local v6    # "text":Ljava/lang/String;
    .restart local v2    # "jarEntry":Ljava/util/zip/ZipEntry;
    :cond_2
    return-object v5
.end method
