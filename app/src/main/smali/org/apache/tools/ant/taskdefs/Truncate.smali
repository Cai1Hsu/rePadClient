.class public Lorg/apache/tools/ant/taskdefs/Truncate;
.super Lorg/apache/tools/ant/Task;
.source "Truncate.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final FILL_BUFFER:[B

.field private static final INVALID_LENGTH:Ljava/lang/String; = "Cannot truncate to length "

.field private static final NO_CHILD:Ljava/lang/String; = "No files specified."

.field private static final READ_WRITE:Ljava/lang/String; = "rw"

.field private static final ZERO:Ljava/lang/Long;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private adjust:Ljava/lang/Long;

.field private create:Z

.field private length:Ljava/lang/Long;

.field private mkdirs:Z

.field private path:Lorg/apache/tools/ant/types/Path;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 44
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Truncate;->ZERO:Ljava/lang/Long;

    .line 52
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Truncate;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 54
    const/16 v0, 0x400

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Truncate;->FILL_BUFFER:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->create:Z

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->mkdirs:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 131
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

.method private declared-synchronized getPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 201
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 202
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Truncate;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->path:Lorg/apache/tools/ant/types/Path;

    .line 204
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->path:Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 201
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private process(Ljava/io/File;)V
    .locals 14
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 162
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 163
    .local v2, "len":J
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    if-nez v10, :cond_0

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->adjust:Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    add-long v4, v2, v10

    .line 166
    .local v4, "newLength":J
    :goto_0
    cmp-long v10, v2, v4

    if-nez v10, :cond_1

    .line 198
    :goto_1
    return-void

    .line 163
    .end local v4    # "newLength":J
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_0

    .line 170
    .restart local v4    # "newLength":J
    :cond_1
    const/4 v1, 0x0

    .line 172
    .local v1, "raf":Ljava/io/RandomAccessFile;
    :try_start_0
    new-instance v1, Ljava/io/RandomAccessFile;

    .end local v1    # "raf":Ljava/io/RandomAccessFile;
    const-string/jumbo v10, "rw"

    invoke-direct {v1, p1, v10}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    .restart local v1    # "raf":Ljava/io/RandomAccessFile;
    cmp-long v10, v4, v2

    if-lez v10, :cond_2

    .line 178
    move-wide v6, v2

    .line 179
    .local v6, "pos":J
    :try_start_1
    invoke-virtual {v1, v6, v7}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 180
    :goto_2
    cmp-long v10, v6, v4

    if-gez v10, :cond_3

    .line 181
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Truncate;->FILL_BUFFER:[B

    array-length v10, v10

    int-to-long v10, v10

    sub-long v12, v4, v6

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 183
    .local v8, "writeCount":J
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Truncate;->FILL_BUFFER:[B

    const/4 v11, 0x0

    long-to-int v12, v8

    invoke-virtual {v1, v10, v11, v12}, Ljava/io/RandomAccessFile;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 184
    add-long/2addr v6, v8

    goto :goto_2

    .line 173
    .end local v1    # "raf":Ljava/io/RandomAccessFile;
    .end local v6    # "pos":J
    .end local v8    # "writeCount":J
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/Exception;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Could not open "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " for writing"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 187
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "raf":Ljava/io/RandomAccessFile;
    :cond_2
    :try_start_2
    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 193
    :cond_3
    :try_start_3
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 194
    :catch_1
    move-exception v0

    .line 195
    .local v0, "e":Ljava/io/IOException;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Caught "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " closing "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Truncate;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 189
    .end local v0    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v0

    .line 190
    .restart local v0    # "e":Ljava/io/IOException;
    :try_start_4
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Exception working with "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 192
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v10

    .line 193
    :try_start_5
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 192
    :goto_3
    throw v10

    .line 194
    :catch_3
    move-exception v0

    .line 195
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Caught "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " closing "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/Truncate;->log(Ljava/lang/String;I)V

    goto :goto_3
.end method

.method private shouldProcess(Ljava/io/File;)Z
    .locals 7
    .param p1, "f"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 139
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 156
    :cond_0
    :goto_0
    return v3

    .line 142
    :cond_1
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->create:Z

    if-nez v5, :cond_2

    move v3, v4

    .line 143
    goto :goto_0

    .line 145
    :cond_2
    const/4 v1, 0x0

    .line 147
    .local v1, "exception":Ljava/lang/Exception;
    :try_start_0
    sget-object v5, Lorg/apache/tools/ant/taskdefs/Truncate;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->mkdirs:Z

    invoke-virtual {v5, p1, v6}, Lorg/apache/tools/ant/util/FileUtils;->createNewFile(Ljava/io/File;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-nez v5, :cond_0

    .line 153
    :goto_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to create "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "msg":Ljava/lang/String;
    if-nez v1, :cond_3

    .line 155
    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Truncate;->log(Ljava/lang/String;I)V

    move v3, v4

    .line 156
    goto :goto_0

    .line 150
    .end local v2    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/io/IOException;
    move-object v1, v0

    goto :goto_1

    .line 158
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "msg":Ljava/lang/String;
    :cond_3
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Truncate;->getPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 77
    return-void
.end method

.method public execute()V
    .locals 5

    .prologue
    .line 119
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->adjust:Ljava/lang/Long;

    if-eqz v3, :cond_0

    .line 120
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "length and adjust are mutually exclusive options"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 123
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    if-nez v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->adjust:Ljava/lang/Long;

    if-nez v3, :cond_1

    .line 124
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Truncate;->ZERO:Ljava/lang/Long;

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    .line 126
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v3, :cond_2

    .line 127
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No files specified."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 130
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 131
    .local v2, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Truncate;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_4

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Truncate;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Truncate;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface {v3}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v0

    .line 132
    .local v0, "f":Ljava/io/File;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Truncate;->shouldProcess(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 133
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Truncate;->process(Ljava/io/File;)V

    goto :goto_0

    .line 131
    .end local v0    # "f":Ljava/io/File;
    :cond_4
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Truncate;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 136
    .end local v2    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_5
    return-void
.end method

.method public setAdjust(Ljava/lang/Long;)V
    .locals 0
    .param p1, "adjust"    # Ljava/lang/Long;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->adjust:Ljava/lang/Long;

    .line 86
    return-void
.end method

.method public setCreate(Z)V
    .locals 0
    .param p1, "create"    # Z

    .prologue
    .line 105
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->create:Z

    .line 106
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 68
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Truncate;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 69
    return-void
.end method

.method public setLength(Ljava/lang/Long;)V
    .locals 4
    .param p1, "length"    # Ljava/lang/Long;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->length:Ljava/lang/Long;

    .line 95
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 96
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Cannot truncate to length "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    return-void
.end method

.method public setMkdirs(Z)V
    .locals 0
    .param p1, "mkdirs"    # Z

    .prologue
    .line 114
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Truncate;->mkdirs:Z

    .line 115
    return-void
.end method
