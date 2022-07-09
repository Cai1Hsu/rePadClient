.class public Lorg/apache/tools/ant/taskdefs/SignJar;
.super Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;
.source "SignJar.java"


# static fields
.field public static final ERROR_BAD_MAP:Ljava/lang/String; = "Cannot map source file to anything sensible: "

.field public static final ERROR_MAPPER_WITHOUT_DEST:Ljava/lang/String; = "The destDir attribute is required if a mapper is set"

.field public static final ERROR_NO_ALIAS:Ljava/lang/String; = "alias attribute must be set"

.field public static final ERROR_NO_STOREPASS:Ljava/lang/String; = "storepass attribute must be set"

.field public static final ERROR_SIGNEDJAR_AND_PATHS:Ljava/lang/String; = "You cannot specify the signed JAR when using paths or filesets"

.field public static final ERROR_TODIR_AND_SIGNEDJAR:Ljava/lang/String; = "\'destdir\' and \'signedjar\' cannot both be set"

.field public static final ERROR_TOO_MANY_MAPPERS:Ljava/lang/String; = "Too many mappers"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field protected destDir:Ljava/io/File;

.field private digestAlg:Ljava/lang/String;

.field private force:Z

.field protected internalsf:Z

.field protected lazy:Z

.field private mapper:Lorg/apache/tools/ant/util/FileNameMapper;

.field private preserveLastModified:Z

.field protected sectionsonly:Z

.field private sigAlg:Ljava/lang/String;

.field protected sigfile:Ljava/lang/String;

.field protected signedjar:Ljava/io/File;

.field protected tsacert:Ljava/lang/String;

.field protected tsaurl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/SignJar;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;-><init>()V

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->force:Z

    return-void
.end method

.method private addTimestampAuthorityCommands(Lorg/apache/tools/ant/taskdefs/ExecTask;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/taskdefs/ExecTask;

    .prologue
    .line 505
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsaurl:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 506
    const-string/jumbo v0, "-tsa"

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 507
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsaurl:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 509
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsacert:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 510
    const-string/jumbo v0, "-tsacert"

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 511
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsacert:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 513
    :cond_1
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 392
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

.method private signOneJar(Ljava/io/File;Ljava/io/File;)V
    .locals 8
    .param p1, "jarSource"    # Ljava/io/File;
    .param p2, "jarTarget"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 426
    move-object v4, p2

    .line 427
    .local v4, "targetFile":Ljava/io/File;
    if-nez v4, :cond_0

    .line 428
    move-object v4, p1

    .line 430
    :cond_0
    invoke-virtual {p0, p1, v4}, Lorg/apache/tools/ant/taskdefs/SignJar;->isUpToDate(Ljava/io/File;Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 496
    :cond_1
    :goto_0
    return-void

    .line 434
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 435
    .local v2, "lastModified":J
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->createJarSigner()Lorg/apache/tools/ant/taskdefs/ExecTask;

    move-result-object v0

    .line 437
    .local v0, "cmd":Lorg/apache/tools/ant/taskdefs/ExecTask;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->setCommonOptions(Lorg/apache/tools/ant/taskdefs/ExecTask;)V

    .line 439
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->bindToKeystore(Lorg/apache/tools/ant/taskdefs/ExecTask;)V

    .line 440
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigfile:Ljava/lang/String;

    if-eqz v6, :cond_3

    .line 441
    const-string/jumbo v6, "-sigfile"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 442
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigfile:Ljava/lang/String;

    .line 443
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {p0, v0, v5}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 449
    .end local v5    # "value":Ljava/lang/String;
    :cond_3
    :try_start_0
    sget-object v6, Lorg/apache/tools/ant/taskdefs/SignJar;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v6, p1, v4}, Lorg/apache/tools/ant/util/FileUtils;->areSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 450
    const-string/jumbo v6, "-signedjar"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 451
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 457
    :cond_4
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->internalsf:Z

    if-eqz v6, :cond_5

    .line 458
    const-string/jumbo v6, "-internalsf"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 461
    :cond_5
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sectionsonly:Z

    if-eqz v6, :cond_6

    .line 462
    const-string/jumbo v6, "-sectionsonly"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 465
    :cond_6
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigAlg:Ljava/lang/String;

    if-eqz v6, :cond_7

    .line 466
    const-string/jumbo v6, "-sigalg"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 467
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigAlg:Ljava/lang/String;

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 470
    :cond_7
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->digestAlg:Ljava/lang/String;

    if-eqz v6, :cond_8

    .line 471
    const-string/jumbo v6, "-digestalg"

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 472
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->digestAlg:Ljava/lang/String;

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 476
    :cond_8
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->addTimestampAuthorityCommands(Lorg/apache/tools/ant/taskdefs/ExecTask;)V

    .line 479
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 482
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->alias:Ljava/lang/String;

    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 484
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Signing JAR: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " as "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->alias:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/SignJar;->log(Ljava/lang/String;)V

    .line 490
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V

    .line 493
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->preserveLastModified:Z

    if-eqz v6, :cond_1

    .line 494
    sget-object v6, Lorg/apache/tools/ant/taskdefs/SignJar;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v6, v4, v2, v3}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V

    goto/16 :goto_0

    .line 453
    :catch_0
    move-exception v1

    .line 454
    .local v1, "ioex":Ljava/io/IOException;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v6
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "newMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 221
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v0, :cond_0

    .line 222
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Too many mappers"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 225
    return-void
.end method

.method public execute()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 327
    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->jar:Ljava/io/File;

    if-eqz v14, :cond_0

    move v5, v13

    .line 328
    .local v5, "hasJar":Z
    :goto_0
    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->signedjar:Ljava/io/File;

    if-eqz v14, :cond_1

    move v7, v13

    .line 329
    .local v7, "hasSignedJar":Z
    :goto_1
    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->destDir:Ljava/io/File;

    if-eqz v14, :cond_2

    move v4, v13

    .line 330
    .local v4, "hasDestDir":Z
    :goto_2
    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v14, :cond_3

    move v6, v13

    .line 332
    .local v6, "hasMapper":Z
    :goto_3
    if-nez v5, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->hasResources()Z

    move-result v12

    if-nez v12, :cond_4

    .line 333
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "jar must be set through jar attribute or nested filesets"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .end local v4    # "hasDestDir":Z
    .end local v5    # "hasJar":Z
    .end local v6    # "hasMapper":Z
    .end local v7    # "hasSignedJar":Z
    :cond_0
    move v5, v12

    .line 327
    goto :goto_0

    .restart local v5    # "hasJar":Z
    :cond_1
    move v7, v12

    .line 328
    goto :goto_1

    .restart local v7    # "hasSignedJar":Z
    :cond_2
    move v4, v12

    .line 329
    goto :goto_2

    .restart local v4    # "hasDestDir":Z
    :cond_3
    move v6, v12

    .line 330
    goto :goto_3

    .line 335
    .restart local v6    # "hasMapper":Z
    :cond_4
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->alias:Ljava/lang/String;

    if-nez v12, :cond_5

    .line 336
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "alias attribute must be set"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 339
    :cond_5
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->storepass:Ljava/lang/String;

    if-nez v12, :cond_6

    .line 340
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "storepass attribute must be set"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 343
    :cond_6
    if-eqz v4, :cond_7

    if-eqz v7, :cond_7

    .line 344
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "\'destdir\' and \'signedjar\' cannot both be set"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 348
    :cond_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->hasResources()Z

    move-result v12

    if-eqz v12, :cond_8

    if-eqz v7, :cond_8

    .line 349
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "You cannot specify the signed JAR when using paths or filesets"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 354
    :cond_8
    if-nez v4, :cond_9

    if-eqz v6, :cond_9

    .line 355
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "The destDir attribute is required if a mapper is set"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 358
    :cond_9
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->beginExecution()V

    .line 363
    if-eqz v5, :cond_a

    if-eqz v7, :cond_a

    .line 365
    :try_start_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->jar:Ljava/io/File;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->signedjar:Ljava/io/File;

    invoke-direct {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/SignJar;->signOneJar(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->endExecution()V

    .line 410
    :goto_4
    return-void

    .line 373
    :cond_a
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->createUnifiedSourcePath()Lorg/apache/tools/ant/types/Path;

    move-result-object v10

    .line 376
    .local v10, "sources":Lorg/apache/tools/ant/types/Path;
    if-eqz v6, :cond_c

    .line 377
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 388
    .local v2, "destMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_5
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 389
    .local v8, "iter":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_10

    .line 390
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/Resource;

    .line 391
    .local v9, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v12, Lorg/apache/tools/ant/taskdefs/SignJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v12, :cond_d

    const-string/jumbo v12, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v12}, Lorg/apache/tools/ant/taskdefs/SignJar;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    sput-object v12, Lorg/apache/tools/ant/taskdefs/SignJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_7
    invoke-virtual {v9, v12}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-static {v12}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v3

    .line 396
    .local v3, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    if-eqz v4, :cond_e

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->destDir:Ljava/io/File;

    .line 399
    .local v11, "toDir":Ljava/io/File;
    :goto_8
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/FileResource;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v2, v12}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 400
    .local v1, "destFilenames":[Ljava/lang/String;
    if-eqz v1, :cond_b

    array-length v12, v1

    if-eq v12, v13, :cond_f

    .line 402
    :cond_b
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Cannot map source file to anything sensible: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 408
    .end local v1    # "destFilenames":[Ljava/lang/String;
    .end local v2    # "destMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v3    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    .end local v8    # "iter":Ljava/util/Iterator;
    .end local v9    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v10    # "sources":Lorg/apache/tools/ant/types/Path;
    .end local v11    # "toDir":Ljava/io/File;
    :catchall_0
    move-exception v12

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->endExecution()V

    throw v12

    .line 380
    .restart local v10    # "sources":Lorg/apache/tools/ant/types/Path;
    :cond_c
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v2}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .restart local v2    # "destMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_5

    .line 391
    .restart local v8    # "iter":Ljava/util/Iterator;
    .restart local v9    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_d
    sget-object v12, Lorg/apache/tools/ant/taskdefs/SignJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_7

    .line 396
    .restart local v3    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_e
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v11

    goto :goto_8

    .line 404
    .restart local v1    # "destFilenames":[Ljava/lang/String;
    .restart local v11    # "toDir":Ljava/io/File;
    :cond_f
    new-instance v0, Ljava/io/File;

    const/4 v12, 0x0

    aget-object v12, v1, v12

    invoke-direct {v0, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 405
    .local v0, "destFile":Ljava/io/File;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v12

    invoke-direct {p0, v12, v0}, Lorg/apache/tools/ant/taskdefs/SignJar;->signOneJar(Ljava/io/File;Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_6

    .line 408
    .end local v0    # "destFile":Ljava/io/File;
    .end local v1    # "destFilenames":[Ljava/lang/String;
    .end local v3    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    .end local v9    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v11    # "toDir":Ljava/io/File;
    :cond_10
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->endExecution()V

    goto/16 :goto_4
.end method

.method public getDigestAlg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 317
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->digestAlg:Ljava/lang/String;

    return-object v0
.end method

.method public getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    return-object v0
.end method

.method public getSigAlg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigAlg:Ljava/lang/String;

    return-object v0
.end method

.method public getTsacert()Ljava/lang/String;
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsacert:Ljava/lang/String;

    return-object v0
.end method

.method public getTsaurl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsaurl:Ljava/lang/String;

    return-object v0
.end method

.method public isForce()Z
    .locals 1

    .prologue
    .line 285
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->force:Z

    return v0
.end method

.method protected isSigned(Ljava/io/File;)Z
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 566
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigfile:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->alias:Ljava/lang/String;

    :goto_0
    invoke-static {p1, v1}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->isSigned(Ljava/io/File;Ljava/lang/String;)Z

    move-result v1

    .line 570
    :goto_1
    return v1

    .line 566
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigfile:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 567
    :catch_0
    move-exception v0

    .line 569
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/SignJar;->log(Ljava/lang/String;I)V

    .line 570
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected isUpToDate(Ljava/io/File;Ljava/io/File;)Z
    .locals 3
    .param p1, "jarFile"    # Ljava/io/File;
    .param p2, "signedjarFile"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 529
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SignJar;->isForce()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 553
    :cond_0
    :goto_0
    return v1

    .line 536
    :cond_1
    move-object v0, p2

    .line 537
    .local v0, "destFile":Ljava/io/File;
    if-nez v0, :cond_2

    .line 539
    move-object v0, p1

    .line 543
    :cond_2
    invoke-virtual {p1, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 544
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->lazy:Z

    if-eqz v2, :cond_0

    .line 546
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/SignJar;->isSigned(Ljava/io/File;)Z

    move-result v1

    goto :goto_0

    .line 553
    :cond_3
    sget-object v1, Lorg/apache/tools/ant/taskdefs/SignJar;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v1, p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->isUpToDate(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    goto :goto_0
.end method

.method public setDestDir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 209
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->destDir:Ljava/io/File;

    .line 210
    return-void
.end method

.method public setDigestAlg(Ljava/lang/String;)V
    .locals 0
    .param p1, "digestAlg"    # Ljava/lang/String;

    .prologue
    .line 310
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->digestAlg:Ljava/lang/String;

    .line 311
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 276
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->force:Z

    .line 277
    return-void
.end method

.method public setInternalsf(Z)V
    .locals 0
    .param p1, "internalsf"    # Z

    .prologue
    .line 180
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->internalsf:Z

    .line 181
    return-void
.end method

.method public setLazy(Z)V
    .locals 0
    .param p1, "lazy"    # Z

    .prologue
    .line 199
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->lazy:Z

    .line 200
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "preserveLastModified"    # Z

    .prologue
    .line 581
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->preserveLastModified:Z

    .line 582
    return-void
.end method

.method public setSectionsonly(Z)V
    .locals 0
    .param p1, "sectionsonly"    # Z

    .prologue
    .line 189
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sectionsonly:Z

    .line 190
    return-void
.end method

.method public setSigAlg(Ljava/lang/String;)V
    .locals 0
    .param p1, "sigAlg"    # Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigAlg:Ljava/lang/String;

    .line 295
    return-void
.end method

.method public setSigfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "sigfile"    # Ljava/lang/String;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->sigfile:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public setSignedjar(Ljava/io/File;)V
    .locals 0
    .param p1, "signedjar"    # Ljava/io/File;

    .prologue
    .line 170
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->signedjar:Ljava/io/File;

    .line 171
    return-void
.end method

.method public setTsacert(Ljava/lang/String;)V
    .locals 0
    .param p1, "tsacert"    # Ljava/lang/String;

    .prologue
    .line 268
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsacert:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public setTsaurl(Ljava/lang/String;)V
    .locals 0
    .param p1, "tsaurl"    # Ljava/lang/String;

    .prologue
    .line 251
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SignJar;->tsaurl:Ljava/lang/String;

    .line 252
    return-void
.end method
