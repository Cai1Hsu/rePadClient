.class public Lorg/apache/tools/ant/taskdefs/Untar;
.super Lorg/apache/tools/ant/taskdefs/Expand;
.source "Untar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;
    }
.end annotation


# instance fields
.field private compression:Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Expand;-><init>()V

    .line 59
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Untar;->compression:Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;

    .line 184
    return-void
.end method

.method private expandStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/io/File;)V
    .locals 12
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;
    .param p3, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    const/4 v11, 0x0

    .line 158
    .local v11, "tis":Lorg/apache/tools/tar/TarInputStream;
    :try_start_0
    new-instance v4, Lorg/apache/tools/tar/TarInputStream;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Untar;->compression:Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;

    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;->decompress(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 161
    .end local v11    # "tis":Lorg/apache/tools/tar/TarInputStream;
    .local v4, "tis":Lorg/apache/tools/tar/TarInputStream;
    :try_start_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Expanding: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " into "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Untar;->log(Ljava/lang/String;I)V

    .line 162
    const/4 v10, 0x0

    .line 163
    .local v10, "te":Lorg/apache/tools/tar/TarEntry;
    const/4 v9, 0x1

    .line 164
    .local v9, "empty":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v8

    .line 165
    .local v8, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_0
    invoke-virtual {v4}, Lorg/apache/tools/tar/TarInputStream;->getNextEntry()Lorg/apache/tools/tar/TarEntry;

    move-result-object v10

    if-eqz v10, :cond_0

    .line 166
    const/4 v9, 0x0

    .line 167
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->getModTime()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->isDirectory()Z

    move-result v7

    move-object v0, p0

    move-object v3, p3

    invoke-virtual/range {v0 .. v8}, Lorg/apache/tools/ant/taskdefs/Untar;->extractFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;Ljava/io/InputStream;Ljava/lang/String;Ljava/util/Date;ZLorg/apache/tools/ant/util/FileNameMapper;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 176
    .end local v8    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v9    # "empty":Z
    .end local v10    # "te":Lorg/apache/tools/tar/TarEntry;
    :catchall_0
    move-exception v0

    :goto_1
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v0

    .line 171
    .restart local v8    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .restart local v9    # "empty":Z
    .restart local v10    # "te":Lorg/apache/tools/tar/TarEntry;
    :cond_0
    if-eqz v9, :cond_1

    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getFailOnEmptyArchive()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 172
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "archive \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' is empty"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_1
    const-string/jumbo v0, "expand complete"

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Untar;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 176
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 178
    return-void

    .line 176
    .end local v4    # "tis":Lorg/apache/tools/tar/TarInputStream;
    .end local v8    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v9    # "empty":Z
    .end local v10    # "te":Lorg/apache/tools/tar/TarEntry;
    .restart local v11    # "tis":Lorg/apache/tools/tar/TarInputStream;
    :catchall_1
    move-exception v0

    move-object v4, v11

    .end local v11    # "tis":Lorg/apache/tools/tar/TarInputStream;
    .restart local v4    # "tis":Lorg/apache/tools/tar/TarInputStream;
    goto :goto_1
.end method


# virtual methods
.method protected expandFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .param p1, "fileUtils"    # Lorg/apache/tools/ant/util/FileUtils;
    .param p2, "srcF"    # Ljava/io/File;
    .param p3, "dir"    # Ljava/io/File;

    .prologue
    .line 105
    const/4 v0, 0x0

    .line 106
    .local v0, "fis":Ljava/io/FileInputStream;
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 107
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to untar "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " as the file does not exist"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 113
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    .end local v0    # "fis":Ljava/io/FileInputStream;
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v1, p3}, Lorg/apache/tools/ant/taskdefs/Untar;->expandStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 120
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 122
    return-void

    .line 115
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v2

    .line 116
    .local v2, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Error while expanding "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v2, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v3

    .end local v0    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v3

    move-object v0, v1

    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "fis":Ljava/io/FileInputStream;
    goto :goto_1

    .line 115
    .end local v0    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v0    # "fis":Ljava/io/FileInputStream;
    goto :goto_0
.end method

.method protected expandResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)V
    .locals 5
    .param p1, "srcR"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "dir"    # Ljava/io/File;

    .prologue
    .line 132
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 133
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to untar "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " as the it does not exist"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 139
    :cond_0
    const/4 v0, 0x0

    .line 141
    .local v0, "i":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 142
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v0, p2}, Lorg/apache/tools/ant/taskdefs/Untar;->expandStream(Ljava/lang/String;Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 149
    return-void

    .line 143
    :catch_0
    move-exception v1

    .line 144
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_1
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Error while expanding "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 147
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v2
.end method

.method public setCompression(Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;)V
    .locals 0
    .param p1, "method"    # Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Untar;->compression:Lorg/apache/tools/ant/taskdefs/Untar$UntarCompressionMethod;

    .line 75
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 3
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 84
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " task doesn\'t support the encoding"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setScanForUnicodeExtraFields(Z)V
    .locals 3
    .param p1, "b"    # Z

    .prologue
    .line 95
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " task doesn\'t support the encoding"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Untar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method
