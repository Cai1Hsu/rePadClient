.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "WLJspc.java"


# instance fields
.field private compileClasspath:Lorg/apache/tools/ant/types/Path;

.field private destinationDirectory:Ljava/io/File;

.field private destinationPackage:Ljava/lang/String;

.field private filesToDo:Ljava/util/Vector;

.field private pathToPackage:Ljava/lang/String;

.field private sourceDirectory:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 99
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->pathToPackage:Ljava/lang/String;

    .line 100
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->filesToDo:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 224
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 226
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public execute()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 107
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationDirectory:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_0

    .line 108
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "destination directory "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationDirectory:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " is not valid"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 112
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_1

    .line 113
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "src directory "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " is not valid"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 117
    :cond_1
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationPackage:Ljava/lang/String;

    if-nez v12, :cond_2

    .line 118
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "package attribute must be present."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v12

    .line 123
    :cond_2
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationPackage:Ljava/lang/String;

    const/16 v13, 0x2e

    sget-char v14, Ljava/io/File;->separatorChar:C

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->pathToPackage:Ljava/lang/String;

    .line 126
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    invoke-super {p0, v12}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    .line 129
    .local v1, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v12, :cond_3

    .line 130
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 133
    :cond_3
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 134
    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 140
    .local v3, "files":[Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Java;

    invoke-direct {v4, p0}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 141
    .local v4, "helperTask":Lorg/apache/tools/ant/taskdefs/Java;
    const/4 v12, 0x1

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 142
    const-string/jumbo v12, "weblogic.jspc"

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->getTaskName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 145
    const/16 v12, 0xc

    new-array v0, v12, [Ljava/lang/String;

    .line 148
    .local v0, "args":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 149
    .local v8, "jspFile":Ljava/io/File;
    const-string/jumbo v9, ""

    .line 150
    .local v9, "parents":Ljava/lang/String;
    const/4 v6, 0x0

    .line 152
    .local v6, "j":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .local v7, "j":I
    const-string/jumbo v12, "-d"

    aput-object v12, v0, v6

    .line 153
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationDirectory:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v0, v7

    .line 154
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .restart local v7    # "j":I
    const-string/jumbo v12, "-docroot"

    aput-object v12, v0, v6

    .line 155
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v0, v7

    .line 156
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .restart local v7    # "j":I
    const-string/jumbo v12, "-keepgenerated"

    aput-object v12, v0, v6

    .line 159
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    const-string/jumbo v12, "-compilerclass"

    aput-object v12, v0, v7

    .line 160
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .restart local v7    # "j":I
    const-string/jumbo v12, "sun.tools.javac.Main"

    aput-object v12, v0, v6

    .line 164
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    const-string/jumbo v12, "-classpath"

    aput-object v12, v0, v7

    .line 165
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .restart local v7    # "j":I
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v0, v6

    .line 167
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->scanDir([Ljava/lang/String;)V

    .line 168
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Compiling "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->filesToDo:Ljava/util/Vector;

    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " JSP files"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->log(Ljava/lang/String;)V

    .line 170
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->filesToDo:Ljava/util/Vector;

    invoke-virtual {v12}, Ljava/util/Vector;->size()I

    move-result v10

    .line 171
    .local v10, "size":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v10, :cond_7

    .line 176
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->filesToDo:Ljava/util/Vector;

    invoke-virtual {v12, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 177
    .local v2, "filename":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    .end local v8    # "jspFile":Ljava/io/File;
    invoke-direct {v8, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 178
    .restart local v8    # "jspFile":Ljava/io/File;
    const-string/jumbo v12, "-package"

    aput-object v12, v0, v7

    .line 179
    invoke-virtual {v8}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v9

    .line 180
    if-eqz v9, :cond_4

    const-string/jumbo v12, ""

    invoke-virtual {v12, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    .line 181
    sget-object v12, Ljava/io/File;->separator:Ljava/lang/String;

    const-string/jumbo v13, "_."

    invoke-virtual {p0, v9, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->replaceString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 182
    const/16 v12, 0xa

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationPackage:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v0, v12

    .line 188
    :goto_1
    const/16 v12, 0xb

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v0, v12

    .line 189
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Java;->clearArgs()V

    .line 192
    const/4 v11, 0x0

    .local v11, "x":I
    :goto_2
    const/16 v12, 0xc

    if-ge v11, v12, :cond_5

    .line 193
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v12

    aget-object v13, v0, v11

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 192
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 184
    .end local v11    # "x":I
    :cond_4
    const/16 v12, 0xa

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationPackage:Ljava/lang/String;

    aput-object v13, v0, v12

    goto :goto_1

    .line 197
    .restart local v11    # "x":I
    :cond_5
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4, v12}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 198
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Java;->executeJava()I

    move-result v12

    if-eqz v12, :cond_6

    .line 199
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " failed to compile"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->log(Ljava/lang/String;I)V

    .line 171
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 202
    .end local v2    # "filename":Ljava/lang/String;
    .end local v11    # "x":I
    :cond_7
    return-void
.end method

.method protected replaceString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "inpString"    # Ljava/lang/String;
    .param p2, "escapeChars"    # Ljava/lang/String;
    .param p3, "replaceChars"    # Ljava/lang/String;

    .prologue
    .line 322
    const-string/jumbo v1, ""

    .line 323
    .local v1, "localString":Ljava/lang/String;
    const/4 v2, 0x0

    .line 324
    .local v2, "numTokens":I
    new-instance v3, Ljava/util/StringTokenizer;

    const/4 v5, 0x1

    invoke-direct {v3, p1, p2, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 325
    .local v3, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v2

    .line 326
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 327
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 328
    .local v4, "test":Ljava/lang/String;
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v4, p3

    .line 329
    :cond_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 326
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 331
    .end local v4    # "test":Ljava/lang/String;
    :cond_1
    return-object v1
.end method

.method protected scanDir([Ljava/lang/String;)V
    .locals 18
    .param p1, "files"    # [Ljava/lang/String;

    .prologue
    .line 268
    new-instance v13, Ljava/util/Date;

    invoke-direct {v13}, Ljava/util/Date;-><init>()V

    invoke-virtual {v13}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 269
    .local v8, "now":J
    const/4 v6, 0x0

    .line 270
    .local v6, "jspFile":Ljava/io/File;
    const/4 v10, 0x0

    .line 271
    .local v10, "parents":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 272
    .local v7, "pack":Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v13, v0

    if-ge v5, v13, :cond_5

    .line 273
    new-instance v11, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    aget-object v14, p1, v5

    invoke-direct {v11, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 277
    .local v11, "srcFile":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    .end local v6    # "jspFile":Ljava/io/File;
    aget-object v13, p1, v5

    invoke-direct {v6, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 278
    .restart local v6    # "jspFile":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v10

    .line 280
    if-eqz v10, :cond_1

    const-string/jumbo v13, ""

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 281
    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    const-string/jumbo v14, "_/"

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v13, v14}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->replaceString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 282
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->pathToPackage:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 287
    :goto_1
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v13, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 288
    .local v4, "filePath":Ljava/lang/String;
    aget-object v13, p1, v5

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_2

    aget-object v13, p1, v5

    sget-object v14, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v13

    add-int/lit8 v12, v13, 0x1

    .line 290
    .local v12, "startingIndex":I
    :goto_2
    aget-object v13, p1, v5

    const-string/jumbo v14, ".jsp"

    invoke-virtual {v13, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 291
    .local v3, "endingIndex":I
    const/4 v13, -0x1

    if-ne v3, v13, :cond_3

    .line 292
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Skipping "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    aget-object v14, p1, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ". Not a JSP"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->log(Ljava/lang/String;I)V

    .line 272
    :cond_0
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 284
    .end local v3    # "endingIndex":I
    .end local v4    # "filePath":Ljava/lang/String;
    .end local v12    # "startingIndex":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->pathToPackage:Ljava/lang/String;

    goto :goto_1

    .line 288
    .restart local v4    # "filePath":Ljava/lang/String;
    :cond_2
    const/4 v12, 0x0

    goto :goto_2

    .line 297
    .restart local v3    # "endingIndex":I
    .restart local v12    # "startingIndex":I
    :cond_3
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    aget-object v14, p1, v5

    invoke-virtual {v14, v12, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 298
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ".class"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 299
    new-instance v2, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationDirectory:Ljava/io/File;

    invoke-direct {v2, v13, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 301
    .local v2, "classFile":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    cmp-long v13, v14, v8

    if-lez v13, :cond_4

    .line 302
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Warning: file modified in the future: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    aget-object v14, p1, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->log(Ljava/lang/String;I)V

    .line 305
    :cond_4
    invoke-virtual {v11}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v16

    cmp-long v13, v14, v16

    if-lez v13, :cond_0

    .line 306
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->filesToDo:Ljava/util/Vector;

    aget-object v14, p1, v5

    invoke-virtual {v13, v14}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 307
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Recompiling File "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    aget-object v14, p1, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14}, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->log(Ljava/lang/String;I)V

    goto/16 :goto_3

    .line 310
    .end local v2    # "classFile":Ljava/io/File;
    .end local v3    # "endingIndex":I
    .end local v4    # "filePath":Ljava/lang/String;
    .end local v11    # "srcFile":Ljava/io/File;
    .end local v12    # "startingIndex":I
    :cond_5
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 212
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 216
    :goto_0
    return-void

    .line 214
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dirName"    # Ljava/io/File;

    .prologue
    .line 248
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationDirectory:Ljava/io/File;

    .line 249
    return-void
.end method

.method public setPackage(Ljava/lang/String;)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 258
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->destinationPackage:Ljava/lang/String;

    .line 259
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "dirName"    # Ljava/io/File;

    .prologue
    .line 237
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/WLJspc;->sourceDirectory:Ljava/io/File;

    .line 238
    return-void
.end method
