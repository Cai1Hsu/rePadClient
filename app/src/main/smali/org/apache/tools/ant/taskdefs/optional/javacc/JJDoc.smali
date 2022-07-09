.class public Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;
.super Lorg/apache/tools/ant/Task;
.source "JJDoc.java"


# static fields
.field private static final DEFAULT_SUFFIX_HTML:Ljava/lang/String; = ".html"

.field private static final DEFAULT_SUFFIX_TEXT:Ljava/lang/String; = ".txt"

.field private static final ONE_TABLE:Ljava/lang/String; = "ONE_TABLE"

.field private static final OUTPUT_FILE:Ljava/lang/String; = "OUTPUT_FILE"

.field private static final TEXT:Ljava/lang/String; = "TEXT"


# instance fields
.field private cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

.field private javaccHome:Ljava/io/File;

.field private maxMemory:Ljava/lang/String;

.field private final optionalAttrs:Ljava/util/Hashtable;

.field private outputFile:Ljava/lang/String;

.field private plainText:Z

.field private targetFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 47
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->optionalAttrs:Ljava/util/Hashtable;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->outputFile:Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->plainText:Z

    .line 56
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    .line 57
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->javaccHome:Ljava/io/File;

    .line 59
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    .line 61
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->maxMemory:Ljava/lang/String;

    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const-string/jumbo v1, "java"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJreExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->setVm(Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method private createOutputFileName(Ljava/io/File;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9
    .param p1, "destFile"    # Ljava/io/File;
    .param p2, "optionalOutputFile"    # Ljava/lang/String;
    .param p3, "plain"    # Z

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x2f

    .line 191
    const-string/jumbo v3, ".html"

    .line 192
    .local v3, "suffix":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 194
    .local v2, "javaccFile":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 195
    const-string/jumbo v3, ".txt"

    .line 198
    :cond_0
    if-eqz p2, :cond_1

    const-string/jumbo v5, ""

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 199
    :cond_1
    const-string/jumbo v5, "/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 201
    .local v1, "filePos":I
    if-ltz v1, :cond_2

    .line 202
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 205
    :cond_2
    const/16 v5, 0x2e

    invoke-virtual {v2, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 207
    .local v4, "suffixPos":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 208
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 223
    .end local v1    # "filePos":I
    .end local v4    # "suffixPos":I
    :goto_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 210
    .restart local v1    # "filePos":I
    .restart local v4    # "suffixPos":I
    :cond_3
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "currentSuffix":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 213
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 215
    :cond_4
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    .line 220
    .end local v0    # "currentSuffix":Ljava/lang/String;
    .end local v1    # "filePos":I
    .end local v4    # "suffixPos":I
    :cond_5
    invoke-virtual {p2, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p2

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
    .line 130
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v9}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .line 131
    .local v3, "iter":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 132
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 133
    .local v6, "name":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->optionalAttrs:Ljava/util/Hashtable;

    invoke-virtual {v9, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 134
    .local v8, "value":Ljava/lang/Object;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

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

    .line 138
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    if-eqz v9, :cond_1

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v9

    if-nez v9, :cond_2

    .line 139
    :cond_1
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Invalid target: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 142
    :cond_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->outputFile:Ljava/lang/String;

    if-eqz v9, :cond_3

    .line 143
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "-OUTPUT_FILE:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->outputFile:Ljava/lang/String;

    const/16 v12, 0x5c

    const/16 v13, 0x2f

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 148
    :cond_3
    new-instance v4, Ljava/io/File;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->outputFile:Ljava/lang/String;

    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->plainText:Z

    invoke-direct {p0, v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->createOutputFileName(Ljava/io/File;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 151
    .local v4, "javaFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_5

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-gez v9, :cond_5

    .line 153
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Target is already built - skipping ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ")"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->log(Ljava/lang/String;I)V

    .line 187
    :cond_4
    return-void

    .line 158
    :cond_5
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 160
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 161
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->javaccHome:Ljava/io/File;

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getArchiveFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v5

    .line 162
    .local v5, "javaccJar":Ljava/io/File;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v9

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Path$PathElement;->setPath(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 165
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    const/4 v10, 0x3

    invoke-static {v1, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JavaCC;->getMainClass(Lorg/apache/tools/ant/types/Path;I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 168
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->maxMemory:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/CommandlineJava;->setMaxmemory(Ljava/lang/String;)V

    .line 169
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 170
    .local v0, "arg":Lorg/apache/tools/ant/types/Commandline$Argument;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "-Dinstall.root="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->javaccHome:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 172
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v9, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v10, 0x2

    const/4 v11, 0x2

    invoke-direct {v9, p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    const/4 v10, 0x0

    invoke-direct {v7, v9, v10}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 177
    .local v7, "process":Lorg/apache/tools/ant/taskdefs/Execute;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->describeCommand()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->log(Ljava/lang/String;I)V

    .line 178
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->cmdl:Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 181
    :try_start_0
    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v9

    if-eqz v9, :cond_4

    .line 182
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "JJDoc failed."

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Failed to launch JJDoc"

    invoke-direct {v9, v10, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
.end method

.method public setJavacchome(Ljava/io/File;)V
    .locals 0
    .param p1, "javaccHome"    # Ljava/io/File;

    .prologue
    .line 103
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->javaccHome:Ljava/io/File;

    .line 104
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 0
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->maxMemory:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setOnetable(Z)V
    .locals 3
    .param p1, "oneTable"    # Z

    .prologue
    .line 77
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "ONE_TABLE"

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

.method public setOutputfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputFile"    # Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->outputFile:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public setTarget(Ljava/io/File;)V
    .locals 0
    .param p1, "target"    # Ljava/io/File;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->targetFile:Ljava/io/File;

    .line 96
    return-void
.end method

.method public setText(Z)V
    .locals 3
    .param p1, "plainText"    # Z

    .prologue
    .line 68
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->optionalAttrs:Ljava/util/Hashtable;

    const-string/jumbo v2, "TEXT"

    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/javacc/JJDoc;->plainText:Z

    .line 70
    return-void

    .line 68
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method
