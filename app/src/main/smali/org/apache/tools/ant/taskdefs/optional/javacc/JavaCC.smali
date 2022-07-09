.class public Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;
.super Lorg/apache/tools/ant/Task;
.source "JavaCC.java"


# static fields
.field protected static final ARCHIVE_LOCATIONS:[Ljava/lang/String;

.field protected static final ARCHIVE_LOCATIONS_VS_MAJOR_VERSION:[I

.field private static final BUILD_PARSER:Ljava/lang/String; = "BUILD_PARSER"

.field private static final BUILD_TOKEN_MANAGER:Ljava/lang/String; = "BUILD_TOKEN_MANAGER"

.field private static final CACHE_TOKENS:Ljava/lang/String; = "CACHE_TOKENS"

.field private static final CHOICE_AMBIGUITY_CHECK:Ljava/lang/String; = "CHOICE_AMBIGUITY_CHECK"

.field private static final COMMON_TOKEN_ACTION:Ljava/lang/String; = "COMMON_TOKEN_ACTION"

.field protected static final COM_JAVACC_CLASS:Ljava/lang/String; = "javacc.Main"

.field protected static final COM_JJDOC_CLASS:Ljava/lang/String; = "jjdoc.JJDocMain"

.field protected static final COM_JJTREE_CLASS:Ljava/lang/String; = "jjtree.Main"

.field protected static final COM_PACKAGE:Ljava/lang/String; = "COM.sun.labs."

.field private static final DEBUG_LOOKAHEAD:Ljava/lang/String; = "DEBUG_LOOKAHEAD"

.field private static final DEBUG_PARSER:Ljava/lang/String; = "DEBUG_PARSER"

.field private static final DEBUG_TOKEN_MANAGER:Ljava/lang/String; = "DEBUG_TOKEN_MANAGER"

.field private static final ERROR_REPORTING:Ljava/lang/String; = "ERROR_REPORTING"

.field private static final FORCE_LA_CHECK:Ljava/lang/String; = "FORCE_LA_CHECK"

.field private static final IGNORE_CASE:Ljava/lang/String; = "IGNORE_CASE"

.field private static final JAVA_UNICODE_ESCAPE:Ljava/lang/String; = "JAVA_UNICODE_ESCAPE"

.field private static final JDK_VERSION:Ljava/lang/String; = "JDK_VERSION"

.field private static final KEEP_LINE_COLUMN:Ljava/lang/String; = "KEEP_LINE_COLUMN"

.field private static final LOOKAHEAD:Ljava/lang/String; = "LOOKAHEAD"

.field private static final OPTIMIZE_TOKEN_MANAGER:Ljava/lang/String; = "OPTIMIZE_TOKEN_MANAGER"

.field protected static final ORG_JAVACC_CLASS:Ljava/lang/String; = "parser.Main"

.field protected static final ORG_JJDOC_CLASS:Ljava/lang/String; = "jjdoc.JJDocMain"

.field protected static final ORG_JJTREE_CLASS:Ljava/lang/String; = "jjtree.Main"

.field protected static final ORG_PACKAGE_3_0:Ljava/lang/String; = "org.netbeans.javacc."

.field protected static final ORG_PACKAGE_3_1:Ljava/lang/String; = "org.javacc."

.field private static final OTHER_AMBIGUITY_CHECK:Ljava/lang/String; = "OTHER_AMBIGUITY_CHECK"

.field private static final SANITY_CHECK:Ljava/lang/String; = "SANITY_CHECK"

.field private static final STATIC:Ljava/lang/String; = "STATIC"

.field protected static final TASKDEF_TYPE_JAVACC:I = 0x1

.field protected static final TASKDEF_TYPE_JJDOC:I = 0x3

.field protected static final TASKDEF_TYPE_JJTREE:I = 0x2

.field private static final UNICODE_INPUT:Ljava/lang/String; = "UNICODE_INPUT"

.field private static final USER_CHAR_STREAM:Ljava/lang/String; = "USER_CHAR_STREAM"

.field private static final USER_TOKEN_MANAGER:Ljava/lang/String; = "USER_TOKEN_MANAGER"


# instance fields
.field private cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

.field private javaccHome:Ljava/io/File;

.field private maxMemory:Ljava/lang/String;

.field private final optionalAttrs:Ljava/util/Hashtable;

.field private outputDirectory:Ljava/io/File;

.field private targetFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 80
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "JavaCC.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "bin/lib/JavaCC.zip"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "bin/lib/javacc.jar"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "javacc.jar"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS:[Ljava/lang/String;

    .line 88
    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS_VS_MAJOR_VERSION:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x3
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 326
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 67
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    .line 70
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    .line 71
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    .line 72
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->javaccHome:Ljava/io/File;

    .line 74
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    .line 107
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->maxMemory:Ljava/lang/String;

    .line 327
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const-string/jumbo v1, "java"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJreExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->setVm(Ljava/lang/String;)V

    .line 328
    return-void
.end method

.method protected static getArchiveFile(Ljava/io/File;)Ljava/io/File;
    .locals 3
    .param p0, "home"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 393
    new-instance v0, Ljava/io/File;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS:[Ljava/lang/String;

    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveLocationIndex(Ljava/io/File;)I

    move-result v2

    aget-object v1, v1, v2

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getArchiveLocationIndex(Ljava/io/File;)I
    .locals 5
    .param p0, "home"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 519
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_1

    .line 520
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "JavaCC home must be a valid directory."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 523
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 524
    new-instance v0, Ljava/io/File;

    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-direct {v0, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 526
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 527
    return v1

    .line 523
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 531
    .end local v0    # "f":Ljava/io/File;
    :cond_3
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Could not find a path to JavaCC.zip or javacc.jar from \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected static getMainClass(Ljava/io/File;I)Ljava/lang/String;
    .locals 3
    .param p0, "home"    # Ljava/io/File;
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 408
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 409
    .local v0, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v1

    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path$PathElement;->setLocation(Ljava/io/File;)V

    .line 410
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 411
    invoke-static {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getMainClass(Lorg/apache/tools/ant/types/Path;I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected static getMainClass(Lorg/apache/tools/ant/types/Path;I)Ljava/lang/String;
    .locals 9
    .param p0, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 425
    const/4 v4, 0x0

    .line 426
    .local v4, "packagePrefix":Ljava/lang/String;
    const/4 v3, 0x0

    .line 428
    .local v3, "mainClass":Ljava/lang/String;
    const/4 v2, 0x0

    .line 430
    .local v2, "l":Lorg/apache/tools/ant/AntClassLoader;
    const/4 v5, 0x0

    const/4 v6, 0x0

    :try_start_0
    const-string/jumbo v7, "ignore"

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    const/4 v8, 0x1

    invoke-static {v5, v6, v7, v8}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v2

    .line 434
    const-string/jumbo v1, "COM.sun.labs.javacc.Main"

    .line 435
    .local v1, "javaccClass":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v6, 0x2e

    const/16 v7, 0x2f

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ".class"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/AntClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 437
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_2

    .line 438
    const-string/jumbo v4, "COM.sun.labs."

    .line 439
    packed-switch p1, :pswitch_data_0

    .line 494
    :cond_0
    :goto_0
    if-nez v4, :cond_5

    .line 495
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "failed to load JavaCC"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 502
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "javaccClass":Ljava/lang/String;
    :catchall_0
    move-exception v5

    if-eqz v2, :cond_1

    .line 503
    invoke-virtual {v2}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_1
    throw v5

    .line 441
    .restart local v0    # "is":Ljava/io/InputStream;
    .restart local v1    # "javaccClass":Ljava/lang/String;
    :pswitch_0
    :try_start_1
    const-string/jumbo v3, "javacc.Main"

    .line 443
    goto :goto_0

    .line 446
    :pswitch_1
    const-string/jumbo v3, "jjtree.Main"

    .line 448
    goto :goto_0

    .line 451
    :pswitch_2
    const-string/jumbo v3, "jjdoc.JJDocMain"

    .line 453
    goto :goto_0

    .line 458
    :cond_2
    const-string/jumbo v1, "org.javacc.parser.Main"

    .line 459
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v6, 0x2e

    const/16 v7, 0x2f

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ".class"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/AntClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 461
    if-eqz v0, :cond_4

    .line 462
    const-string/jumbo v4, "org.javacc."

    .line 472
    :cond_3
    :goto_1
    if-eqz v0, :cond_0

    .line 473
    packed-switch p1, :pswitch_data_1

    goto :goto_0

    .line 475
    :pswitch_3
    const-string/jumbo v3, "parser.Main"

    .line 477
    goto :goto_0

    .line 464
    :cond_4
    const-string/jumbo v1, "org.netbeans.javacc.parser.Main"

    .line 465
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v6, 0x2e

    const/16 v7, 0x2f

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ".class"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/AntClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 467
    if-eqz v0, :cond_3

    .line 468
    const-string/jumbo v4, "org.netbeans.javacc."

    goto :goto_1

    .line 480
    :pswitch_4
    const-string/jumbo v3, "jjtree.Main"

    .line 482
    goto :goto_0

    .line 485
    :pswitch_5
    const-string/jumbo v3, "jjdoc.JJDocMain"

    .line 487
    goto :goto_0

    .line 497
    :cond_5
    if-nez v3, :cond_6

    .line 498
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "unknown task type "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 500
    :cond_6
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v5

    .line 502
    if-eqz v2, :cond_7

    .line 503
    invoke-virtual {v2}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_7
    return-object v5

    .line 439
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 473
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method protected static getMajorVersionNumber(Ljava/io/File;)I
    .locals 2
    .param p0, "home"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 546
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->ARCHIVE_LOCATIONS_VS_MAJOR_VERSION:[I

    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveLocationIndex(Ljava/io/File;)I

    move-result v1

    aget v0, v0, v1

    return v0
.end method

.method private getOutputJavaFile(Ljava/io/File;Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p1, "outputdir"    # Ljava/io/File;
    .param p2, "srcfile"    # Ljava/io/File;

    .prologue
    const/4 v4, -0x1

    .line 556
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 559
    .local v0, "path":Ljava/lang/String;
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 560
    .local v1, "startBasename":I
    if-eq v1, v4, :cond_0

    .line 561
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 565
    :cond_0
    const/16 v3, 0x2e

    invoke-virtual {v0, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 566
    .local v2, "startExtn":I
    if-eq v2, v4, :cond_2

    .line 567
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ".java"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 573
    :goto_0
    if-eqz p1, :cond_1

    .line 574
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 577
    :cond_1
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v3

    .line 569
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ".java"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v7}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v2

    .line 338
    .local v2, "iter":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 339
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 340
    .local v5, "name":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v7, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 341
    .local v6, "value":Ljava/lang/Object;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 345
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v7

    if-nez v7, :cond_2

    .line 346
    :cond_1
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Invalid target: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 350
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    if-nez v7, :cond_4

    .line 351
    new-instance v7, Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    .line 355
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "-OUTPUT_DIRECTORY:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 359
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-direct {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getOutputJavaFile(Ljava/io/File;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 360
    .local v3, "javaFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    cmp-long v7, v8, v10

    if-gez v7, :cond_5

    .line 362
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Target is already built - skipping ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->log(Ljava/lang/String;I)V

    .line 381
    :goto_1
    return-void

    .line 352
    .end local v3    # "javaFile":Ljava/io/File;
    :cond_4
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_3

    .line 353
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Outputdir not a directory."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 366
    .restart local v3    # "javaFile":Ljava/io/File;
    :cond_5
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 368
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/CommandlineJava;->createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 369
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->javaccHome:Ljava/io/File;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v4

    .line 370
    .local v4, "javaccJar":Ljava/io/File;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v7

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Path$PathElement;->setPath(Ljava/lang/String;)V

    .line 371
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 373
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const/4 v8, 0x1

    invoke-static {v1, v8}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getMainClass(Lorg/apache/tools/ant/types/Path;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 376
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->maxMemory:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/CommandlineJava;->setMaxmemory(Ljava/lang/String;)V

    .line 377
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 378
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "-Dinstall.root="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->javaccHome:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 380
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v7}, Lorg/apache/tools/ant/taskdefs/Execute;->runCommand(Lorg/apache/tools/ant/Task;[Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setBuildparser(Z)V
    .locals 3
    .param p1, "buildParser"    # Z

    .prologue
    .line 235
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "BUILD_PARSER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    return-void

    .line 235
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setBuildtokenmanager(Z)V
    .locals 3
    .param p1, "buildTokenManager"    # Z

    .prologue
    .line 243
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "BUILD_TOKEN_MANAGER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    return-void

    .line 243
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setCachetokens(Z)V
    .locals 3
    .param p1, "cacheTokens"    # Z

    .prologue
    .line 267
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "CACHE_TOKENS"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    return-void

    .line 267
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setChoiceambiguitycheck(I)V
    .locals 3
    .param p1, "choiceAmbiguityCheck"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "CHOICE_AMBIGUITY_CHECK"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method

.method public setCommontokenaction(Z)V
    .locals 3
    .param p1, "commonTokenAction"    # Z

    .prologue
    .line 211
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "COMMON_TOKEN_ACTION"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    return-void

    .line 211
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setDebuglookahead(Z)V
    .locals 3
    .param p1, "debugLookahead"    # Z

    .prologue
    .line 154
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "DEBUG_LOOKAHEAD"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    return-void

    .line 154
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setDebugparser(Z)V
    .locals 3
    .param p1, "debugParser"    # Z

    .prologue
    .line 146
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "DEBUG_PARSER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    return-void

    .line 146
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setDebugtokenmanager(Z)V
    .locals 3
    .param p1, "debugTokenManager"    # Z

    .prologue
    .line 162
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "DEBUG_TOKEN_MANAGER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    return-void

    .line 162
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setErrorreporting(Z)V
    .locals 3
    .param p1, "errorReporting"    # Z

    .prologue
    .line 179
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "ERROR_REPORTING"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    return-void

    .line 179
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setForcelacheck(Z)V
    .locals 3
    .param p1, "forceLACheck"    # Z

    .prologue
    .line 259
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "FORCE_LA_CHECK"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    return-void

    .line 259
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setIgnorecase(Z)V
    .locals 3
    .param p1, "ignoreCase"    # Z

    .prologue
    .line 203
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "IGNORE_CASE"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    return-void

    .line 203
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setJDKversion(Ljava/lang/String;)V
    .locals 2
    .param p1, "jdkVersion"    # Ljava/lang/String;

    .prologue
    .line 284
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "JDK_VERSION"

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    return-void
.end method

.method public setJavacchome(Ljava/io/File;)V
    .locals 0
    .param p1, "javaccHome"    # Ljava/io/File;

    .prologue
    .line 310
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->javaccHome:Ljava/io/File;

    .line 311
    return-void
.end method

.method public setJavaunicodeescape(Z)V
    .locals 3
    .param p1, "javaUnicodeEscape"    # Z

    .prologue
    .line 187
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "JAVA_UNICODE_ESCAPE"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    return-void

    .line 187
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setKeeplinecolumn(Z)V
    .locals 3
    .param p1, "keepLineColumn"    # Z

    .prologue
    .line 275
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "KEEP_LINE_COLUMN"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    return-void

    .line 275
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setLookahead(I)V
    .locals 3
    .param p1, "lookahead"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "LOOKAHEAD"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 0
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 320
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->maxMemory:Ljava/lang/String;

    .line 321
    return-void
.end method

.method public setOptimizetokenmanager(Z)V
    .locals 3
    .param p1, "optimizeTokenManager"    # Z

    .prologue
    .line 170
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "OPTIMIZE_TOKEN_MANAGER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    return-void

    .line 170
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setOtherambiguityCheck(I)V
    .locals 3
    .param p1, "otherAmbiguityCheck"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "OTHER_AMBIGUITY_CHECK"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    return-void
.end method

.method public setOutputdirectory(Ljava/io/File;)V
    .locals 0
    .param p1, "outputDirectory"    # Ljava/io/File;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->outputDirectory:Ljava/io/File;

    .line 295
    return-void
.end method

.method public setSanitycheck(Z)V
    .locals 3
    .param p1, "sanityCheck"    # Z

    .prologue
    .line 251
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "SANITY_CHECK"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    return-void

    .line 251
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setStatic(Z)V
    .locals 3
    .param p1, "staticParser"    # Z

    .prologue
    .line 138
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "STATIC"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    return-void

    .line 138
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setTarget(Ljava/io/File;)V
    .locals 0
    .param p1, "targetFile"    # Ljava/io/File;

    .prologue
    .line 302
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->targetFile:Ljava/io/File;

    .line 303
    return-void
.end method

.method public setUnicodeinput(Z)V
    .locals 3
    .param p1, "unicodeInput"    # Z

    .prologue
    .line 195
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "UNICODE_INPUT"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    return-void

    .line 195
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setUsercharstream(Z)V
    .locals 3
    .param p1, "userCharStream"    # Z

    .prologue
    .line 227
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "USER_CHAR_STREAM"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    return-void

    .line 227
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setUsertokenmanager(Z)V
    .locals 3
    .param p1, "userTokenManager"    # Z

    .prologue
    .line 219
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "USER_TOKEN_MANAGER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    return-void

    .line 219
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method
