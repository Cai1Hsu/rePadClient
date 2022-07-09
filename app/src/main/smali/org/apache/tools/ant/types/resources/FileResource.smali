.class public Lorg/apache/tools/ant/types/resources/FileResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "FileResource.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/Touchable;
.implements Lorg/apache/tools/ant/types/resources/FileProvider;
.implements Lorg/apache/tools/ant/types/ResourceFactory;
.implements Lorg/apache/tools/ant/types/resources/Appendable;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final NULL_FILE:I

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private baseDir:Ljava/io/File;

.field private file:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 42
    const-string/jumbo v0, "null file"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/resources/FileResource;->NULL_FILE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 69
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .param p1, "b"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 60
    sget-object v0, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 61
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->setBaseDir(Ljava/io/File;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "f"    # Ljava/io/File;

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 79
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 80
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    .line 91
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 274
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

.method private getOutputStream(Z)Ljava/io/OutputStream;
    .locals 5
    .param p1, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    .line 246
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 247
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    if-nez p1, :cond_0

    .line 248
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 256
    :cond_0
    :goto_0
    if-eqz p1, :cond_2

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    :goto_1
    return-object v2

    .line 251
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 252
    .local v1, "p":Ljava/io/File;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 253
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    goto :goto_0

    .line 256
    .end local v1    # "p":Ljava/io/File;
    :cond_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    goto :goto_1
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 5
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 266
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 267
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Comparable;

    invoke-interface {v4, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    .line 287
    :goto_0
    return v4

    .line 269
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 270
    const/4 v4, 0x0

    goto :goto_0

    .line 272
    :cond_1
    instance-of v4, p1, Lorg/apache/tools/ant/types/Resource;

    if-eqz v4, :cond_5

    move-object v3, p1

    .line 273
    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    .line 274
    .local v3, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v4, Lorg/apache/tools/ant/types/resources/FileResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v4, :cond_2

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/types/resources/FileResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/types/resources/FileResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 275
    .local v2, "otherFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v2, :cond_5

    .line 276
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v0

    .line 277
    .local v0, "f":Ljava/io/File;
    if-nez v0, :cond_3

    .line 278
    const/4 v4, -0x1

    goto :goto_0

    .line 274
    .end local v0    # "f":Ljava/io/File;
    .end local v2    # "otherFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    sget-object v4, Lorg/apache/tools/ant/types/resources/FileResource;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 280
    .restart local v0    # "f":Ljava/io/File;
    .restart local v2    # "otherFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_3
    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    .line 281
    .local v1, "of":Ljava/io/File;
    if-nez v1, :cond_4

    .line 282
    const/4 v4, 0x1

    goto :goto_0

    .line 284
    :cond_4
    invoke-virtual {v0, v1}, Ljava/io/File;->compareTo(Ljava/io/File;)I

    move-result v4

    goto :goto_0

    .line 287
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "of":Ljava/io/File;
    .end local v2    # "otherFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v3    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_5
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v4

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 296
    if-ne p0, p1, :cond_1

    .line 306
    :cond_0
    :goto_0
    return v1

    .line 299
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 302
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    move v1, v2

    .line 303
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 305
    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    .line 306
    .local v0, "otherfr":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_4

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_0

    move v1, v2

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getAppendOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getAppendOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 241
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public getBaseDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 142
    :goto_0
    return-object v0

    .line 141
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->dieOnCircularReference()V

    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FileResource;->baseDir:Ljava/io/File;

    goto :goto_0
.end method

.method public getFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v2

    .line 121
    :goto_0
    return-object v2

    .line 110
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->dieOnCircularReference()V

    .line 111
    monitor-enter p0

    .line 112
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    if-nez v2, :cond_1

    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 115
    .local v0, "d":Ljava/io/File;
    invoke-super {p0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "n":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 117
    sget-object v2, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 120
    .end local v0    # "d":Ljava/io/File;
    .end local v1    # "n":Ljava/lang/String;
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    goto :goto_0

    .line 120
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 214
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_0
.end method

.method public getLastModified()J
    .locals 2

    .prologue
    .line 185
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v1

    .line 167
    :goto_0
    return-object v1

    .line 166
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 167
    .local v0, "b":Ljava/io/File;
    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    sget-object v1, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected getNotNullFile()Ljava/io/File;
    .locals 2

    .prologue
    .line 369
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    .line 370
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "file attribute is null!"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 372
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->dieOnCircularReference()V

    .line 373
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 229
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 231
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/FileResource;->getOutputStream(Z)Ljava/io/OutputStream;

    move-result-object v0

    goto :goto_0
.end method

.method public getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 385
    sget-object v2, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 386
    .local v1, "newfile":Ljava/io/File;
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    .line 387
    .local v0, "fileResource":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/resources/FileResource;->setBaseDir(Ljava/io/File;)V

    .line 388
    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 204
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 316
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 317
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 319
    :goto_0
    return v0

    :cond_0
    sget v1, Lorg/apache/tools/ant/types/resources/FileResource;->MAGIC:I

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    sget v0, Lorg/apache/tools/ant/types/resources/FileResource;->NULL_FILE:I

    :goto_1
    mul-int/2addr v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->hashCode()I

    move-result v0

    goto :goto_1
.end method

.method public isDirectory()Z
    .locals 1

    .prologue
    .line 195
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    goto :goto_0
.end method

.method public isExists()Z
    .locals 1

    .prologue
    .line 176
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    goto :goto_0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 342
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 343
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/FileResource;->isFilesystemOnly()Z

    move-result v0

    .line 346
    :goto_0
    return v0

    .line 345
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->dieOnCircularReference()V

    .line 346
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setBaseDir(Ljava/io/File;)V
    .locals 0
    .param p1, "b"    # Ljava/io/File;

    .prologue
    .line 129
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->checkAttributesAllowed()V

    .line 130
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/FileResource;->baseDir:Ljava/io/File;

    .line 131
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->checkAttributesAllowed()V

    .line 99
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    .line 100
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/FileResource;->baseDir:Ljava/io/File;

    if-eqz v0, :cond_1

    .line 151
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 153
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 154
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 327
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 328
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 334
    :goto_0
    return-object v1

    .line 330
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    if-nez v1, :cond_1

    .line 331
    const-string/jumbo v1, "(unbound file resource)"

    goto :goto_0

    .line 333
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/FileResource;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 334
    .local v0, "absolutePath":Ljava/lang/String;
    sget-object v1, Lorg/apache/tools/ant/types/resources/FileResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public touch(J)V
    .locals 3
    .param p1, "modTime"    # J

    .prologue
    .line 354
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 355
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/FileResource;->touch(J)V

    .line 361
    :cond_0
    :goto_0
    return-void

    .line 358
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/FileResource;->getNotNullFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/io/File;->setLastModified(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 359
    const-string/jumbo v0, "Failed to change file modification time"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method
