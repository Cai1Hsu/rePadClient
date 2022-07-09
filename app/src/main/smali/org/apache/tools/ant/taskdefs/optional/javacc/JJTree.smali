.class public Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;
.super Lorg/apache/tools/ant/Task;
.source "JJTree.java"


# static fields
.field private static final BUILD_NODE_FILES:Ljava/lang/String; = "BUILD_NODE_FILES"

.field private static final DEFAULT_SUFFIX:Ljava/lang/String; = ".jj"

.field private static final MULTI:Ljava/lang/String; = "MULTI"

.field private static final NODE_DEFAULT_VOID:Ljava/lang/String; = "NODE_DEFAULT_VOID"

.field private static final NODE_FACTORY:Ljava/lang/String; = "NODE_FACTORY"

.field private static final NODE_PACKAGE:Ljava/lang/String; = "NODE_PACKAGE"

.field private static final NODE_PREFIX:Ljava/lang/String; = "NODE_PREFIX"

.field private static final NODE_SCOPE_HOOK:Ljava/lang/String; = "NODE_SCOPE_HOOK"

.field private static final NODE_USES_PARSER:Ljava/lang/String; = "NODE_USES_PARSER"

.field private static final OUTPUT_FILE:Ljava/lang/String; = "OUTPUT_FILE"

.field private static final STATIC:Ljava/lang/String; = "STATIC"

.field private static final VISITOR:Ljava/lang/String; = "VISITOR"

.field private static final VISITOR_EXCEPTION:Ljava/lang/String; = "VISITOR_EXCEPTION"


# instance fields
.field private cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

.field private javaccHome:Ljava/io/File;

.field private maxMemory:Ljava/lang/String;

.field private final optionalAttrs:Ljava/util/Hashtable;

.field private outputDirectory:Ljava/io/File;

.field private outputFile:Ljava/lang/String;

.field private targetFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 209
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 57
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    .line 59
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    .line 66
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->javaccHome:Ljava/io/File;

    .line 68
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    .line 70
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->maxMemory:Ljava/lang/String;

    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const-string/jumbo v1, "java"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJreExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->setVm(Ljava/lang/String;)V

    .line 211
    return-void
.end method

.method private createOutputFileName(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "destFile"    # Ljava/io/File;
    .param p2, "optionalOutputFile"    # Ljava/lang/String;
    .param p3, "outputDir"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x5c

    const/16 v6, 0x2f

    .line 304
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->validateOutputFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 306
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 308
    .local v2, "jjtreeFile":Ljava/lang/String;
    if-eqz p2, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 309
    :cond_0
    const-string/jumbo v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 311
    .local v1, "filePos":I
    if-ltz v1, :cond_1

    .line 312
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 315
    :cond_1
    const/16 v4, 0x2e

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 317
    .local v3, "suffixPos":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_5

    .line 318
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".jj"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 331
    .end local v1    # "filePos":I
    .end local v3    # "suffixPos":I
    :cond_2
    :goto_0
    if-eqz p3, :cond_3

    const-string/jumbo v4, ""

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 332
    :cond_3
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getDefaultOutputDirectory()Ljava/lang/String;

    move-result-object p3

    .line 335
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 320
    .restart local v1    # "filePos":I
    .restart local v3    # "suffixPos":I
    :cond_5
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "currentSuffix":Ljava/lang/String;
    const-string/jumbo v4, ".jj"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 323
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".jj"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 325
    :cond_6
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".jj"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method private getDefaultOutputDirectory()Ljava/lang/String;
    .locals 3

    .prologue
    .line 398
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5c

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getRoot(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 408
    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    .line 410
    .local v0, "root":Ljava/io/File;
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 411
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    goto :goto_0

    .line 414
    :cond_0
    return-object v0
.end method

.method private makeOutputFileRelative(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "destFile"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x2f

    const/4 v5, -0x1

    .line 376
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 377
    .local v2, "relativePath":Ljava/lang/StringBuffer;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getDefaultOutputDirectory()Ljava/lang/String;

    move-result-object v0

    .line 378
    .local v0, "defaultOutputDirectory":Ljava/lang/String;
    invoke-virtual {v0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 379
    .local v1, "nextPos":I
    add-int/lit8 v3, v1, 0x1

    .line 381
    .local v3, "startPos":I
    :goto_0
    if-le v3, v5, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 382
    const-string/jumbo v4, "/.."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 383
    invoke-virtual {v0, v6, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 385
    if-ne v1, v5, :cond_0

    .line 386
    move v3, v1

    goto :goto_0

    .line 388
    :cond_0
    add-int/lit8 v3, v1, 0x1

    goto :goto_0

    .line 392
    :cond_1
    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 394
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private validateOutputFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "destFile"    # Ljava/lang/String;
    .param p2, "outputDir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 352
    if-nez p1, :cond_0

    .line 353
    const/4 v0, 0x0

    .line 372
    :goto_0
    return-object v0

    .line 356
    :cond_0
    if-nez p2, :cond_2

    const-string/jumbo v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "\\"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 358
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->makeOutputFileRelative(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 359
    .local v0, "relativeOutputFile":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->setOutputfile(Ljava/lang/String;)V

    goto :goto_0

    .line 364
    .end local v0    # "relativeOutputFile":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getRoot(Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 366
    .local v1, "root":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_3

    const/4 v2, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 368
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Drive letter in \'outputfile\' not supported: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_3
    move-object v0, p1

    .line 372
    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 220
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v9}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .line 221
    .local v3, "iter":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 222
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 223
    .local v6, "name":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v9, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 224
    .local v8, "value":Ljava/lang/Object;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "-"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, ":"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 227
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    if-eqz v9, :cond_1

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v9

    if-nez v9, :cond_2

    .line 228
    :cond_1
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Invalid target: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 231
    :cond_2
    const/4 v4, 0x0

    .line 234
    .local v4, "javaFile":Ljava/io/File;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    if-nez v9, :cond_4

    .line 237
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "-OUTPUT_DIRECTORY:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getDefaultOutputDirectory()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 240
    new-instance v4, Ljava/io/File;

    .end local v4    # "javaFile":Ljava/io/File;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-direct {p0, v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->createOutputFileName(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 259
    .restart local v4    # "javaFile":Ljava/io/File;
    :goto_1
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_6

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-gez v9, :cond_6

    .line 261
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Target is already built - skipping ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->log(Ljava/lang/String;I)V

    .line 300
    :cond_3
    return-void

    .line 243
    :cond_4
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_5

    .line 244
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "\'outputdirectory\' "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " is not a directory."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 250
    :cond_5
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "-OUTPUT_DIRECTORY:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x5c

    const/16 v13, 0x2f

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 254
    new-instance v4, Ljava/io/File;

    .end local v4    # "javaFile":Ljava/io/File;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->createOutputFileName(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v4    # "javaFile":Ljava/io/File;
    goto/16 :goto_1

    .line 266
    :cond_6
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    if-eqz v9, :cond_7

    .line 267
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "-OUTPUT_FILE:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    const/16 v12, 0x5c

    const/16 v13, 0x2f

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 271
    :cond_7
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 273
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 274
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->javaccHome:Ljava/io/File;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v5

    .line 275
    .local v5, "javaccJar":Ljava/io/File;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v9

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Path$PathElement;->setPath(Ljava/lang/String;)V

    .line 276
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 278
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const/4 v10, 0x2

    invoke-static {v1, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getMainClass(Lorg/apache/tools/ant/types/Path;I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 281
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->maxMemory:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->setMaxmemory(Ljava/lang/String;)V

    .line 282
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 283
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "-Dinstall.root="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->javaccHome:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 285
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v9, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v10, 0x2

    const/4 v11, 0x2

    invoke-direct {v9, p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    const/4 v10, 0x0

    invoke-direct {v7, v9, v10}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 290
    .local v7, "process":Lorg/apache/tools/ant/taskdefs/Execute;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->describeCommand()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->log(Ljava/lang/String;I)V

    .line 291
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 294
    :try_start_0
    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v9

    if-eqz v9, :cond_3

    .line 295
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "JJTree failed."

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    :catch_0
    move-exception v2

    .line 298
    .local v2, "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Failed to launch JJTree"

    invoke-direct {v9, v10, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
.end method

.method public setBuildnodefiles(Z)V
    .locals 3
    .param p1, "buildNodeFiles"    # Z

    .prologue
    .line 77
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "BUILD_NODE_FILES"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void

    .line 77
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setJavacchome(Ljava/io/File;)V
    .locals 0
    .param p1, "javaccHome"    # Ljava/io/File;

    .prologue
    .line 193
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->javaccHome:Ljava/io/File;

    .line 194
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 0
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->maxMemory:Ljava/lang/String;

    .line 204
    return-void
.end method

.method public setMulti(Z)V
    .locals 3
    .param p1, "multi"    # Z

    .prologue
    .line 85
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "MULTI"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    return-void

    .line 85
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setNodedefaultvoid(Z)V
    .locals 3
    .param p1, "nodeDefaultVoid"    # Z

    .prologue
    .line 93
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "NODE_DEFAULT_VOID"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    return-void

    .line 93
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setNodefactory(Z)V
    .locals 3
    .param p1, "nodeFactory"    # Z

    .prologue
    .line 101
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "NODE_FACTORY"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    return-void

    .line 101
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setNodepackage(Ljava/lang/String;)V
    .locals 2
    .param p1, "nodePackage"    # Ljava/lang/String;

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "NODE_PACKAGE"

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    return-void
.end method

.method public setNodeprefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "nodePrefix"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "NODE_PREFIX"

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    return-void
.end method

.method public setNodescopehook(Z)V
    .locals 3
    .param p1, "nodeScopeHook"    # Z

    .prologue
    .line 109
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "NODE_SCOPE_HOOK"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void

    .line 109
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setNodeusesparser(Z)V
    .locals 3
    .param p1, "nodeUsesParser"    # Z

    .prologue
    .line 117
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "NODE_USES_PARSER"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    return-void

    .line 117
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setOutputdirectory(Ljava/io/File;)V
    .locals 0
    .param p1, "outputDirectory"    # Ljava/io/File;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputDirectory:Ljava/io/File;

    .line 168
    return-void
.end method

.method public setOutputfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputFile"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->outputFile:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setStatic(Z)V
    .locals 3
    .param p1, "staticParser"    # Z

    .prologue
    .line 125
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "STATIC"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void

    .line 125
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setTarget(Ljava/io/File;)V
    .locals 0
    .param p1, "targetFile"    # Ljava/io/File;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->targetFile:Ljava/io/File;

    .line 186
    return-void
.end method

.method public setVisitor(Z)V
    .locals 3
    .param p1, "visitor"    # Z

    .prologue
    .line 133
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "VISITOR"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    return-void

    .line 133
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setVisitorException(Ljava/lang/String;)V
    .locals 2
    .param p1, "visitorException"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJTree;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v1, "VISITOR_EXCEPTION"

    invoke-virtual {v0, v1, p1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    return-void
.end method
