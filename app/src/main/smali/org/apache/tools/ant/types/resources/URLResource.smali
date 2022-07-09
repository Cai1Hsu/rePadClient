.class public Lorg/apache/tools/ant/types/resources/URLResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "URLResource.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/URLProvider;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final NULL_URL:I


# instance fields
.field private baseURL:Ljava/net/URL;

.field private conn:Ljava/net/URLConnection;

.field private relPath:Ljava/lang/String;

.field private url:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/URLResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 41
    const-string/jumbo v0, "null URL"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Resource;->getMagicNumber([B)I

    move-result v0

    sput v0, Lorg/apache/tools/ant/types/resources/URLResource;->NULL_URL:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 76
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/URLResource;->setFile(Ljava/io/File;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "u"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-static {p1}, Lorg/apache/tools/ant/types/resources/URLResource;->newURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/URLResource;-><init>(Ljava/net/URL;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 0
    .param p1, "u"    # Ljava/net/URL;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 60
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/URLResource;->setURL(Ljava/net/URL;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/resources/URLProvider;)V
    .locals 1
    .param p1, "u"    # Lorg/apache/tools/ant/types/resources/URLProvider;

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 68
    invoke-interface {p1}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/URLResource;->setURL(Ljava/net/URL;)V

    .line 69
    return-void
.end method

.method private declared-synchronized close()V
    .locals 2

    .prologue
    .line 405
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/net/URLConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 409
    monitor-exit p0

    return-void

    .line 407
    :catchall_0
    move-exception v0

    const/4 v1, 0x0

    :try_start_2
    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 405
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized isExists(Z)Z
    .locals 3
    .param p1, "closeConnection"    # Z

    .prologue
    const/4 v1, 0x0

    .line 225
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-nez v2, :cond_1

    .line 235
    :cond_0
    :goto_0
    monitor-exit p0

    return v1

    .line 229
    :cond_1
    const/4 v2, 0x3

    :try_start_1
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/URLResource;->connect(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 230
    const/4 v1, 0x1

    .line 234
    if-eqz p1, :cond_0

    .line 235
    :try_start_2
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 225
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 231
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/io/IOException;
    if-eqz p1, :cond_0

    .line 235
    :try_start_3
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->close()V

    goto :goto_0

    .line 234
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v1

    if-eqz p1, :cond_2

    .line 235
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->close()V

    :cond_2
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method private static newURL(Ljava/lang/String;)Ljava/net/URL;
    .locals 2
    .param p0, "u"    # Ljava/lang/String;

    .prologue
    .line 413
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 414
    :catch_0
    move-exception v0

    .line 415
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method protected connect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/URLResource;->connect(I)V

    .line 368
    return-void
.end method

.method protected declared-synchronized connect(I)V
    .locals 4
    .param p1, "logLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 379
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v1

    .line 380
    .local v1, "u":Ljava/net/URL;
    if-nez v1, :cond_0

    .line 381
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "URL not set"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    .end local v1    # "u":Ljava/net/URL;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 383
    .restart local v1    # "u":Ljava/net/URL;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_1

    .line 385
    :try_start_2
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    .line 386
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v2}, Ljava/net/URLConnection;->connect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 393
    :cond_1
    monitor-exit p0

    return-void

    .line 387
    :catch_0
    move-exception v0

    .line 388
    .local v0, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p1}, Lorg/apache/tools/ant/types/resources/URLResource;->log(Ljava/lang/String;I)V

    .line 389
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    .line 390
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public declared-synchronized equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 295
    monitor-enter p0

    if-ne p0, p1, :cond_1

    .line 305
    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    .line 298
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 299
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 301
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    move v2, v3

    .line 302
    goto :goto_0

    .line 304
    :cond_3
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/types/resources/URLResource;

    move-object v1, v0

    .line 305
    .local v1, "otheru":Lorg/apache/tools/ant/types/resources/URLResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v4

    if-nez v4, :cond_4

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v4

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    goto :goto_0

    .line 295
    .end local v1    # "otheru":Lorg/apache/tools/ant/types/resources/URLResource;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 337
    :goto_0
    monitor-exit p0

    return-object v0

    .line 333
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->connect()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 335
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v0

    .line 337
    const/4 v1, 0x0

    :try_start_3
    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 330
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 337
    :catchall_1
    move-exception v0

    const/4 v1, 0x0

    :try_start_4
    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public declared-synchronized getLastModified()J
    .locals 2

    .prologue
    .line 248
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 249
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 254
    :goto_0
    monitor-exit p0

    return-wide v0

    .line 251
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/URLResource;->isExists(Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 252
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 254
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getLastModified()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    goto :goto_0

    .line 248
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 179
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 183
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v0

    .line 182
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "name":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 179
    .end local v0    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getOutputStream()Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 358
    :goto_0
    monitor-exit p0

    return-object v0

    .line 354
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->connect()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 356
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v0

    .line 358
    const/4 v1, 0x0

    :try_start_3
    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 351
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 358
    :catchall_1
    move-exception v0

    const/4 v1, 0x0

    :try_start_4
    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public declared-synchronized getSize()J
    .locals 4

    .prologue
    .line 273
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 274
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getSize()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 285
    :goto_0
    monitor-exit p0

    return-wide v0

    .line 276
    :cond_0
    const/4 v3, 0x0

    :try_start_1
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/types/resources/URLResource;->isExists(Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 277
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 280
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->connect()V

    .line 281
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/URLResource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v3}, Ljava/net/URLConnection;->getContentLength()I

    move-result v3

    int-to-long v0, v3

    .line 282
    .local v0, "contentlength":J
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 284
    .end local v0    # "contentlength":J
    :catch_0
    move-exception v2

    .line 285
    .local v2, "e":Ljava/io/IOException;
    const-wide/16 v0, -0x1

    goto :goto_0

    .line 273
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getURL()Ljava/net/URL;
    .locals 4

    .prologue
    .line 142
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/URLResource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 158
    :goto_0
    monitor-exit p0

    return-object v1

    .line 145
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;

    if-nez v1, :cond_2

    .line 146
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->baseURL:Ljava/net/URL;

    if-eqz v1, :cond_2

    .line 147
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->relPath:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 148
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "must provide relativePath attribute when using baseURL."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 152
    :cond_1
    :try_start_2
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/URLResource;->baseURL:Ljava/net/URL;

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/URLResource;->relPath:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    :cond_2
    :try_start_3
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;

    goto :goto_0

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public declared-synchronized hashCode()I
    .locals 2

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 318
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    sget v1, Lorg/apache/tools/ant/types/resources/URLResource;->MAGIC:I

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v0

    if-nez v0, :cond_1

    sget v0, Lorg/apache/tools/ant/types/resources/URLResource;->NULL_URL:I

    :goto_1
    mul-int/2addr v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_1

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isDirectory()Z
    .locals 2

    .prologue
    .line 262
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isExists()Z
    .locals 1

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 203
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/URLResource;->isExists(Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setBaseURL(Ljava/net/URL;)V
    .locals 2
    .param p1, "base"    # Ljava/net/URL;

    .prologue
    .line 115
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->checkAttributesAllowed()V

    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;

    if-eqz v0, :cond_0

    .line 117
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "can\'t define URL and baseURL attribute"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 119
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->baseURL:Ljava/net/URL;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 120
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setFile(Ljava/io/File;)V
    .locals 2
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 103
    monitor-enter p0

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/types/resources/URLResource;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/URLResource;->setURL(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    monitor-exit p0

    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/net/MalformedURLException;
    :try_start_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 167
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->baseURL:Ljava/net/URL;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->relPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 168
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 170
    :cond_1
    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 171
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setRelativePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/String;

    .prologue
    .line 128
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->checkAttributesAllowed()V

    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;

    if-eqz v0, :cond_0

    .line 130
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "can\'t define URL and relativePath attribute"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 133
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->relPath:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setURL(Ljava/net/URL;)V
    .locals 1
    .param p1, "u"    # Ljava/net/URL;

    .prologue
    .line 93
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->checkAttributesAllowed()V

    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/URLResource;->url:Ljava/net/URL;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    monitor-exit p0

    return-void

    .line 93
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 191
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/URLResource;->getURL()Ljava/net/URL;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
