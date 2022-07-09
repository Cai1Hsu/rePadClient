.class public Lorg/apache/tools/ant/taskdefs/ExecuteOn;
.super Lorg/apache/tools/ant/taskdefs/ExecTask;
.source "ExecuteOn.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/ExecuteOn$FileDirBoth;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private addSourceFile:Z

.field protected destDir:Ljava/io/File;

.field protected filesets:Ljava/util/Vector;

.field private force:Z

.field private forwardSlash:Z

.field private ignoreMissing:Z

.field protected mapper:Lorg/apache/tools/ant/util/FileNameMapper;

.field protected mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private maxParallel:I

.field private parallel:Z

.field private relative:Z

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private skipEmpty:Z

.field protected srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

.field protected srcIsFirst:Z

.field protected targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

.field protected type:Ljava/lang/String;

.field private verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>()V

    .line 63
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    .line 65
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 66
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->relative:Z

    .line 67
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->parallel:Z

    .line 68
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->forwardSlash:Z

    .line 69
    const-string/jumbo v0, "file"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    .line 70
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    .line 71
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->skipEmpty:Z

    .line 72
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    .line 73
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 74
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 75
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->destDir:Ljava/io/File;

    .line 76
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->maxParallel:I

    .line 77
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->addSourceFile:Z

    .line 78
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->verbose:Z

    .line 79
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->ignoreMissing:Z

    .line 80
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->force:Z

    .line 85
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcIsFirst:Z

    .line 772
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 430
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

.method private static insertTargetFiles([Ljava/lang/String;[Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "targetFiles"    # [Ljava/lang/String;
    .param p1, "arguments"    # [Ljava/lang/String;
    .param p2, "insertPosition"    # I
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "suffix"    # Ljava/lang/String;

    .prologue
    .line 757
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 758
    const/4 v1, 0x0

    array-length v2, p0

    invoke-static {p0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 766
    :cond_0
    return-void

    .line 761
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 762
    add-int v1, p2, v0

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, p1, v1

    .line 761
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private logSkippingFileset(Ljava/lang/String;Lorg/apache/tools/ant/DirectoryScanner;Ljava/io/File;)V
    .locals 4
    .param p1, "currentType"    # Ljava/lang/String;
    .param p2, "ds"    # Lorg/apache/tools/ant/DirectoryScanner;
    .param p3, "base"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 509
    const-string/jumbo v1, "dir"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v1

    :goto_0
    const-string/jumbo v3, "file"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 515
    .local v0, "includedCount":I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Skipping fileset for directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ". It is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-lez v0, :cond_2

    const-string/jumbo v1, "up to date."

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->verbose:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x2

    :goto_2
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 518
    return-void

    .end local v0    # "includedCount":I
    :cond_1
    move v1, v2

    .line 509
    goto :goto_0

    .line 515
    .restart local v0    # "includedCount":I
    :cond_2
    const-string/jumbo v1, "empty."

    goto :goto_1

    :cond_3
    const/4 v1, 0x3

    goto :goto_2
.end method

.method private restrict([Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;
    .locals 3
    .param p1, "s"    # [Ljava/lang/String;
    .param p2, "baseDir"    # Ljava/io/File;

    .prologue
    .line 685
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->force:Z

    if-eqz v0, :cond_1

    .end local p1    # "s":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .restart local p1    # "s":[Ljava/lang/String;
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->destDir:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-virtual {v0, p1, p2, v1, v2}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 124
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 125
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 294
    return-void
.end method

.method public addDirset(Lorg/apache/tools/ant/types/DirSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/DirSet;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 105
    return-void
.end method

.method public addFilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 0
    .param p1, "list"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 113
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 94
    return-void
.end method

.method protected checkConfiguration()V
    .locals 3

    .prologue
    .line 302
    const-string/jumbo v0, "execon"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    const-string/jumbo v0, "!! execon is deprecated. Use apply instead. !!"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;)V

    .line 305
    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->checkConfiguration()V

    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    .line 307
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "no resources specified"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 310
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v0, :cond_2

    .line 311
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "targetfile specified without mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 314
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->destDir:Ljava/io/File;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v0, :cond_3

    .line 315
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "dest specified without mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 318
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_4

    .line 319
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 321
    :cond_4
    return-void
.end method

.method protected createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-nez v0, :cond_0

    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>()V

    goto :goto_0
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 279
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 280
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 283
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 284
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public createSrcfile()Lorg/apache/tools/ant/types/Commandline$Marker;
    .locals 3

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v0, :cond_0

    .line 250
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support multiple "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "srcfile elements."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 253
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createMarker()Lorg/apache/tools/ant/types/Commandline$Marker;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    .line 254
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    return-object v0
.end method

.method public createTargetfile()Lorg/apache/tools/ant/types/Commandline$Marker;
    .locals 3

    .prologue
    .line 263
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v0, :cond_0

    .line 264
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support multiple "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "targetfile elements."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 267
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createMarker()Lorg/apache/tools/ant/types/Commandline$Marker;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcIsFirst:Z

    .line 269
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    return-object v0

    .line 268
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getCommandline(Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;
    .locals 3
    .param p1, "srcFile"    # Ljava/lang/String;
    .param p2, "baseDir"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 647
    new-array v0, v1, [Ljava/lang/String;

    aput-object p1, v0, v2

    new-array v1, v1, [Ljava/io/File;

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getCommandline([Ljava/lang/String;[Ljava/io/File;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getCommandline([Ljava/lang/String;[Ljava/io/File;)[Ljava/lang/String;
    .locals 17
    .param p1, "srcFiles"    # [Ljava/lang/String;
    .param p2, "baseDirs"    # [Ljava/io/File;

    .prologue
    .line 528
    sget-char v2, Ljava/io/File;->separatorChar:C

    .line 529
    .local v2, "fileSeparator":C
    new-instance v13, Ljava/util/Vector;

    invoke-direct {v13}, Ljava/util/Vector;-><init>()V

    .line 530
    .local v13, "targets":Ljava/util/Vector;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v14, :cond_4

    .line 531
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 532
    .local v1, "addedFiles":Ljava/util/HashSet;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v14, v0

    if-ge v3, v14, :cond_4

    .line 533
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    aget-object v15, p1, v3

    invoke-interface {v14, v15}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 534
    .local v10, "subTargets":[Ljava/lang/String;
    if-eqz v10, :cond_3

    .line 535
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    array-length v14, v10

    if-ge v4, v14, :cond_3

    .line 536
    const/4 v5, 0x0

    .line 537
    .local v5, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->relative:Z

    if-nez v14, :cond_2

    .line 538
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->destDir:Ljava/io/File;

    aget-object v16, v10, v4

    invoke-direct/range {v14 .. v16}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    .line 542
    :goto_2
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->forwardSlash:Z

    if-eqz v14, :cond_0

    const/16 v14, 0x2f

    if-eq v2, v14, :cond_0

    .line 543
    const/16 v14, 0x2f

    invoke-virtual {v5, v2, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 545
    :cond_0
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_1

    .line 546
    invoke-virtual {v13, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 547
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 535
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 540
    :cond_2
    aget-object v5, v10, v4

    goto :goto_2

    .line 532
    .end local v4    # "j":I
    .end local v5    # "name":Ljava/lang/String;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 553
    .end local v1    # "addedFiles":Ljava/util/HashSet;
    .end local v3    # "i":I
    .end local v10    # "subTargets":[Ljava/lang/String;
    :cond_4
    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v14

    new-array v14, v14, [Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljava/lang/String;

    .line 555
    .local v11, "targetFiles":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->addSourceFile:Z

    if-nez v14, :cond_5

    .line 556
    const/4 v14, 0x0

    new-array v0, v14, [Ljava/lang/String;

    move-object/from16 p1, v0

    .line 558
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v6

    .line 559
    .local v6, "orig":[Ljava/lang/String;
    array-length v14, v6

    move-object/from16 v0, p1

    array-length v15, v0

    add-int/2addr v14, v15

    array-length v15, v11

    add-int/2addr v14, v15

    new-array v7, v14, [Ljava/lang/String;

    .line 562
    .local v7, "result":[Ljava/lang/String;
    array-length v9, v6

    .line 563
    .local v9, "srcIndex":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v14, :cond_6

    .line 564
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPosition()I

    move-result v9

    .line 566
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v14, :cond_c

    .line 567
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPosition()I

    move-result v12

    .line 569
    .local v12, "targetIndex":I
    if-lt v9, v12, :cond_7

    if-ne v9, v12, :cond_b

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcIsFirst:Z

    if-eqz v14, :cond_b

    .line 573
    :cond_7
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v6, v14, v7, v15, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 576
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/2addr v14, v9

    sub-int v15, v12, v9

    invoke-static {v6, v9, v7, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 580
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/2addr v14, v12

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPrefix()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/ant/types/Commandline$Marker;->getSuffix()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v11, v7, v14, v15, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->insertTargetFiles([Ljava/lang/String;[Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 586
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/2addr v14, v12

    array-length v15, v11

    add-int/2addr v14, v15

    array-length v15, v6

    sub-int/2addr v15, v12

    invoke-static {v6, v12, v7, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 619
    .end local v12    # "targetIndex":I
    :goto_3
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_4
    move-object/from16 v0, p1

    array-length v14, v0

    if-ge v3, v14, :cond_e

    .line 621
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->relative:Z

    if-eqz v14, :cond_d

    .line 622
    aget-object v8, p1, v3

    .line 626
    .local v8, "src":Ljava/lang/String;
    :goto_5
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->forwardSlash:Z

    if-eqz v14, :cond_8

    const/16 v14, 0x2f

    if-eq v2, v14, :cond_8

    .line 627
    const/16 v14, 0x2f

    invoke-virtual {v8, v2, v14}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    .line 629
    :cond_8
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    if-eqz v14, :cond_a

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPrefix()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-gtz v14, :cond_9

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline$Marker;->getSuffix()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_a

    .line 632
    :cond_9
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPrefix()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->srcFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Commandline$Marker;->getSuffix()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 634
    :cond_a
    add-int v14, v9, v3

    aput-object v8, v7, v14

    .line 619
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 591
    .end local v3    # "i":I
    .end local v8    # "src":Ljava/lang/String;
    .restart local v12    # "targetIndex":I
    :cond_b
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v6, v14, v7, v15, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 593
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Commandline$Marker;->getPrefix()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->targetFilePos:Lorg/apache/tools/ant/types/Commandline$Marker;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Commandline$Marker;->getSuffix()Ljava/lang/String;

    move-result-object v15

    invoke-static {v11, v7, v12, v14, v15}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->insertTargetFiles([Ljava/lang/String;[Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 598
    array-length v14, v11

    add-int/2addr v14, v12

    sub-int v15, v9, v12

    invoke-static {v6, v12, v7, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 603
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/2addr v14, v9

    array-length v15, v11

    add-int/2addr v14, v15

    array-length v15, v6

    sub-int/2addr v15, v9

    invoke-static {v6, v9, v7, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 606
    array-length v14, v11

    add-int/2addr v9, v14

    goto/16 :goto_3

    .line 612
    .end local v12    # "targetIndex":I
    :cond_c
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {v6, v14, v7, v15, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 614
    move-object/from16 v0, p1

    array-length v14, v0

    add-int/2addr v14, v9

    array-length v15, v6

    sub-int/2addr v15, v9

    invoke-static {v6, v9, v7, v14, v15}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_3

    .line 624
    .restart local v3    # "i":I
    :cond_d
    new-instance v14, Ljava/io/File;

    aget-object v15, p2, v3

    aget-object v16, p1, v3

    invoke-direct/range {v14 .. v16}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "src":Ljava/lang/String;
    goto/16 :goto_5

    .line 636
    .end local v8    # "src":Ljava/lang/String;
    :cond_e
    return-object v7
.end method

.method protected getDirs(Ljava/io/File;Lorg/apache/tools/ant/DirectoryScanner;)[Ljava/lang/String;
    .locals 1
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "ds"    # Lorg/apache/tools/ant/DirectoryScanner;

    .prologue
    .line 669
    invoke-virtual {p2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->restrict([Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFiles(Ljava/io/File;Lorg/apache/tools/ant/DirectoryScanner;)[Ljava/lang/String;
    .locals 1
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "ds"    # Lorg/apache/tools/ant/DirectoryScanner;

    .prologue
    .line 658
    invoke-virtual {p2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->restrict([Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFilesAndDirs(Lorg/apache/tools/ant/types/FileList;)[Ljava/lang/String;
    .locals 2
    .param p1, "list"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 681
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/FileList;->getFiles(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/FileList;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->restrict([Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected runExec(Lorg/apache/tools/ant/taskdefs/Execute;)V
    .locals 26
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 349
    const/16 v22, 0x0

    .line 350
    .local v22, "totalFiles":I
    const/16 v21, 0x0

    .line 351
    .local v21, "totalDirs":I
    const/4 v13, 0x0

    .line 353
    .local v13, "haveExecuted":Z
    :try_start_0
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 354
    .local v9, "fileNames":Ljava/util/Vector;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 355
    .local v4, "baseDirs":Ljava/util/Vector;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/Vector;->size()I

    move-result v20

    .line 356
    .local v20, "size":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    move/from16 v0, v20

    if-ge v14, v0, :cond_9

    .line 357
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    .line 358
    .local v6, "currentType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->filesets:Ljava/util/Vector;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/ant/types/AbstractFileSet;

    .line 359
    .local v12, "fs":Lorg/apache/tools/ant/types/AbstractFileSet;
    instance-of v0, v12, Lorg/apache/tools/ant/types/DirSet;

    move/from16 v23, v0

    if-eqz v23, :cond_0

    .line 360
    const-string/jumbo v23, "dir"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_0

    .line 361
    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v24, "Found a nested dirset but type is "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, ". "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, "Temporarily switching to type=\"dir\" on the"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " assumption that you really did mean"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " <dirset> not <fileset>."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 365
    const-string/jumbo v6, "dir"

    .line 368
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    .line 370
    .local v3, "base":Ljava/io/File;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v7

    .line 372
    .local v7, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    const-string/jumbo v23, "dir"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_1

    .line 373
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v7}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getFiles(Ljava/io/File;Lorg/apache/tools/ant/DirectoryScanner;)[Ljava/lang/String;

    move-result-object v19

    .line 374
    .local v19, "s":[Ljava/lang/String;
    const/16 v16, 0x0

    .local v16, "j":I
    :goto_1
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v16

    move/from16 v1, v23

    if-ge v0, v1, :cond_1

    .line 375
    add-int/lit8 v22, v22, 0x1

    .line 376
    aget-object v23, v19, v16

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 377
    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 374
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 380
    .end local v16    # "j":I
    .end local v19    # "s":[Ljava/lang/String;
    :cond_1
    const-string/jumbo v23, "file"

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_2

    .line 381
    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v7}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getDirs(Ljava/io/File;Lorg/apache/tools/ant/DirectoryScanner;)[Ljava/lang/String;

    move-result-object v19

    .line 382
    .restart local v19    # "s":[Ljava/lang/String;
    const/16 v16, 0x0

    .restart local v16    # "j":I
    :goto_2
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v16

    move/from16 v1, v23

    if-ge v0, v1, :cond_2

    .line 383
    add-int/lit8 v21, v21, 0x1

    .line 384
    aget-object v23, v19, v16

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 385
    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 382
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 388
    .end local v16    # "j":I
    .end local v19    # "s":[Ljava/lang/String;
    :cond_2
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v23

    if-nez v23, :cond_4

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->skipEmpty:Z

    move/from16 v23, v0

    if-eqz v23, :cond_4

    .line 389
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v7, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->logSkippingFileset(Ljava/lang/String;Lorg/apache/tools/ant/DirectoryScanner;Ljava/io/File;)V

    .line 356
    :cond_3
    :goto_3
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_0

    .line 392
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->parallel:Z

    move/from16 v23, v0

    if-nez v23, :cond_3

    .line 393
    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v23

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    .line 394
    .restart local v19    # "s":[Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 395
    const/16 v16, 0x0

    .restart local v16    # "j":I
    :goto_4
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v16

    move/from16 v1, v23

    if-ge v0, v1, :cond_8

    .line 396
    aget-object v23, v19, v16

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getCommandline(Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v5

    .line 397
    .local v5, "command":[Ljava/lang/String;
    invoke-static {v5}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 399
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 401
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    if-eqz v23, :cond_5

    .line 402
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setupRedirector()V

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v24, v0

    aget-object v25, v19, v16

    invoke-virtual/range {v23 .. v25}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 405
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    if-nez v23, :cond_6

    if-eqz v13, :cond_7

    .line 409
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 411
    :cond_7
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 412
    const/4 v13, 0x1

    .line 395
    add-int/lit8 v16, v16, 0x1

    goto :goto_4

    .line 414
    .end local v5    # "command":[Ljava/lang/String;
    :cond_8
    invoke-virtual {v9}, Ljava/util/Vector;->removeAllElements()V

    .line 415
    invoke-virtual {v4}, Ljava/util/Vector;->removeAllElements()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_3

    .line 491
    .end local v3    # "base":Ljava/io/File;
    .end local v4    # "baseDirs":Ljava/util/Vector;
    .end local v6    # "currentType":Ljava/lang/String;
    .end local v7    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v9    # "fileNames":Ljava/util/Vector;
    .end local v12    # "fs":Lorg/apache/tools/ant/types/AbstractFileSet;
    .end local v14    # "i":I
    .end local v16    # "j":I
    .end local v19    # "s":[Ljava/lang/String;
    .end local v20    # "size":I
    :catch_0
    move-exception v8

    .line 492
    .local v8, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v23, Lorg/apache/tools/ant/BuildException;

    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Execute failed: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v25

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v8, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v23
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 495
    .end local v8    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v23

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->logFlush()V

    .line 496
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppendProperties(Z)V

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/apache/tools/ant/taskdefs/Redirector;->setProperties()V

    .line 495
    throw v23

    .line 419
    .restart local v4    # "baseDirs":Ljava/util/Vector;
    .restart local v9    # "fileNames":Ljava/util/Vector;
    .restart local v14    # "i":I
    .restart local v20    # "size":I
    :cond_9
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    move-object/from16 v23, v0

    if-eqz v23, :cond_13

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->resources:Lorg/apache/tools/ant/types/resources/Union;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 421
    .local v15, "iter":Ljava/util/Iterator;
    :cond_a
    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_13

    .line 422
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/apache/tools/ant/types/Resource;

    .line 424
    .local v18, "res":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v23

    if-nez v23, :cond_b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->ignoreMissing:Z

    move/from16 v23, v0

    if-nez v23, :cond_a

    .line 428
    :cond_b
    const/4 v3, 0x0

    .line 429
    .restart local v3    # "base":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v17

    .line 430
    .local v17, "name":Ljava/lang/String;
    sget-object v23, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v23, :cond_11

    const-string/jumbo v23, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v23 .. v23}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v23

    sput-object v23, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_6
    move-object/from16 v0, v18

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 431
    .local v10, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v10, :cond_c

    .line 432
    invoke-static {v10}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v11

    .line 433
    .local v11, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v3

    .line 434
    if-nez v3, :cond_c

    .line 435
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    .line 439
    .end local v11    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_c
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v17, v23, v24

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->restrict([Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    if-eqz v23, :cond_a

    .line 443
    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v23

    if-eqz v23, :cond_d

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v23

    if-nez v23, :cond_12

    :cond_d
    const-string/jumbo v23, "dir"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_12

    .line 445
    add-int/lit8 v22, v22, 0x1

    .line 453
    :goto_7
    invoke-virtual {v4, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 454
    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 456
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->parallel:Z

    move/from16 v23, v0

    if-nez v23, :cond_a

    .line 457
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getCommandline(Ljava/lang/String;Ljava/io/File;)[Ljava/lang/String;

    move-result-object v5

    .line 458
    .restart local v5    # "command":[Ljava/lang/String;
    invoke-static {v5}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 460
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    if-eqz v23, :cond_e

    .line 463
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setupRedirector()V

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 466
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    move-object/from16 v23, v0

    if-nez v23, :cond_f

    if-eqz v13, :cond_10

    .line 470
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v23

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 472
    :cond_10
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 473
    const/4 v13, 0x1

    .line 474
    invoke-virtual {v9}, Ljava/util/Vector;->removeAllElements()V

    .line 475
    invoke-virtual {v4}, Ljava/util/Vector;->removeAllElements()V

    goto/16 :goto_5

    .line 430
    .end local v5    # "command":[Ljava/lang/String;
    .end local v10    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_11
    sget-object v23, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto/16 :goto_6

    .line 446
    .restart local v10    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_12
    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v23

    if-eqz v23, :cond_a

    const-string/jumbo v23, "file"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_a

    .line 448
    add-int/lit8 v21, v21, 0x1

    goto/16 :goto_7

    .line 479
    .end local v3    # "base":Ljava/io/File;
    .end local v10    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v15    # "iter":Ljava/util/Iterator;
    .end local v17    # "name":Ljava/lang/String;
    .end local v18    # "res":Lorg/apache/tools/ant/types/Resource;
    :cond_13
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->parallel:Z

    move/from16 v23, v0

    if-eqz v23, :cond_15

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v23

    if-gtz v23, :cond_14

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->skipEmpty:Z

    move/from16 v23, v0

    if-nez v23, :cond_15

    .line 480
    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v9, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->runParallel(Lorg/apache/tools/ant/taskdefs/Execute;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 481
    const/4 v13, 0x1

    .line 483
    :cond_15
    if-eqz v13, :cond_16

    .line 484
    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v24, "Applied "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " to "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " file"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_17

    const-string/jumbo v23, "s"

    :goto_8
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " and "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, " director"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const/16 v23, 0x1

    move/from16 v0, v21

    move/from16 v1, v23

    if-eq v0, v1, :cond_18

    const-string/jumbo v23, "ies"

    :goto_9
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string/jumbo v24, "."

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->verbose:Z

    move/from16 v23, v0

    if-eqz v23, :cond_19

    const/16 v23, 0x2

    :goto_a
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 495
    :cond_16
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->logFlush()V

    .line 496
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v23 .. v24}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppendProperties(Z)V

    .line 497
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/apache/tools/ant/taskdefs/Redirector;->setProperties()V

    .line 499
    return-void

    .line 484
    :cond_17
    :try_start_3
    const-string/jumbo v23, ""

    goto :goto_8

    :cond_18
    const-string/jumbo v23, "y"
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_9

    :cond_19
    const/16 v23, 0x3

    goto :goto_a
.end method

.method protected runParallel(Lorg/apache/tools/ant/taskdefs/Execute;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 11
    .param p1, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .param p2, "fileNames"    # Ljava/util/Vector;
    .param p3, "baseDirs"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 702
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v8

    new-array v6, v8, [Ljava/lang/String;

    .line 703
    .local v6, "s":[Ljava/lang/String;
    invoke-virtual {p2, v6}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 704
    invoke-virtual {p3}, Ljava/util/Vector;->size()I

    move-result v8

    new-array v0, v8, [Ljava/io/File;

    .line 705
    .local v0, "b":[Ljava/io/File;
    invoke-virtual {p3, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 707
    iget v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->maxParallel:I

    if-lez v8, :cond_0

    array-length v8, v6

    if-nez v8, :cond_3

    .line 709
    :cond_0
    invoke-virtual {p0, v6, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getCommandline([Ljava/lang/String;[Ljava/io/File;)[Ljava/lang/String;

    move-result-object v2

    .line 710
    .local v2, "command":[Ljava/lang/String;
    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 711
    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 712
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v8, :cond_1

    .line 713
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setupRedirector()V

    .line 714
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 715
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v8

    invoke-virtual {p1, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 717
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 746
    .end local v2    # "command":[Ljava/lang/String;
    :cond_2
    return-void

    .line 719
    :cond_3
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v7

    .line 720
    .local v7, "stillToDo":I
    const/4 v5, 0x0

    .line 721
    .local v5, "currentOffset":I
    :goto_0
    if-lez v7, :cond_2

    .line 722
    iget v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->maxParallel:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 723
    .local v4, "currentAmount":I
    new-array v3, v4, [Ljava/lang/String;

    .line 724
    .local v3, "cs":[Ljava/lang/String;
    const/4 v8, 0x0

    invoke-static {v6, v5, v3, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 725
    new-array v1, v4, [Ljava/io/File;

    .line 726
    .local v1, "cb":[Ljava/io/File;
    const/4 v8, 0x0

    invoke-static {v0, v5, v1, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 727
    invoke-virtual {p0, v3, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->getCommandline([Ljava/lang/String;[Ljava/io/File;)[Ljava/lang/String;

    move-result-object v2

    .line 728
    .restart local v2    # "command":[Ljava/lang/String;
    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->log(Ljava/lang/String;I)V

    .line 729
    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 730
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-eqz v8, :cond_4

    .line 731
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setupRedirector()V

    .line 732
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 734
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirectorElement:Lorg/apache/tools/ant/types/RedirectorElement;

    if-nez v8, :cond_5

    if-lez v5, :cond_6

    .line 738
    :cond_5
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v8

    invoke-virtual {p1, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 740
    :cond_6
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 742
    sub-int/2addr v7, v4

    .line 743
    add-int/2addr v5, v4

    goto :goto_0
.end method

.method public setAddsourcefile(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 209
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->addSourceFile:Z

    .line 210
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 172
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->destDir:Ljava/io/File;

    .line 173
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 240
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->force:Z

    .line 241
    return-void
.end method

.method public setForwardslash(Z)V
    .locals 0
    .param p1, "forwardSlash"    # Z

    .prologue
    .line 181
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->forwardSlash:Z

    .line 182
    return-void
.end method

.method public setIgnoremissing(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 230
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->ignoreMissing:Z

    .line 231
    return-void
.end method

.method public setMaxParallel(I)V
    .locals 0
    .param p1, "max"    # I

    .prologue
    .line 196
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->maxParallel:I

    .line 197
    return-void
.end method

.method public setParallel(Z)V
    .locals 0
    .param p1, "parallel"    # Z

    .prologue
    .line 146
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->parallel:Z

    .line 147
    return-void
.end method

.method public setRelative(Z)V
    .locals 0
    .param p1, "relative"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->relative:Z

    .line 136
    return-void
.end method

.method public setSkipEmptyFilesets(Z)V
    .locals 0
    .param p1, "skip"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->skipEmpty:Z

    .line 165
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/taskdefs/ExecuteOn$FileDirBoth;)V
    .locals 1
    .param p1, "type"    # Lorg/apache/tools/ant/taskdefs/ExecuteOn$FileDirBoth;

    .prologue
    .line 154
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn$FileDirBoth;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->type:Ljava/lang/String;

    .line 155
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 220
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->verbose:Z

    .line 221
    return-void
.end method

.method protected setupRedirector()V
    .locals 2

    .prologue
    .line 339
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setupRedirector()V

    .line 340
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->redirector:Lorg/apache/tools/ant/taskdefs/Redirector;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppendProperties(Z)V

    .line 341
    return-void
.end method
