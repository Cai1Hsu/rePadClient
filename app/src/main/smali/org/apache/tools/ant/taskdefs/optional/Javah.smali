.class public Lorg/apache/tools/ant/taskdefs/optional/Javah;
.super Lorg/apache/tools/ant/Task;
.source "Javah.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
    }
.end annotation


# instance fields
.field private bootclasspath:Lorg/apache/tools/ant/types/Path;

.field private classes:Ljava/util/Vector;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private cls:Ljava/lang/String;

.field private destDir:Ljava/io/File;

.field private facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

.field private files:Ljava/util/Vector;

.field private force:Z

.field private nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

.field private old:Z

.field private outputFile:Ljava/io/File;

.field private stubs:Z

.field private verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 91
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 73
    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classes:Ljava/util/Vector;

    .line 76
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 77
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->outputFile:Ljava/io/File;

    .line 78
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->verbose:Z

    .line 79
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->force:Z

    .line 80
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->old:Z

    .line 81
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->stubs:Z

    .line 84
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 85
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    .line 86
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    .line 92
    new-instance v0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->getDefault()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 93
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;)V
    .locals 2
    .param p1, "adapter"    # Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    .prologue
    .line 425
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    if-eqz v0, :cond_0

    .line 426
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can\'t have more than one javah adapter"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    .line 430
    return-void
.end method

.method public addFileSet(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 147
    return-void
.end method

.method public createArg()Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    .locals 2

    .prologue
    .line 394
    new-instance v0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;-><init>()V

    .line 396
    .local v0, "arg":Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->addImplementationArgument(Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;)V

    .line 397
    return-object v0
.end method

.method public createBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 261
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 263
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createClass()Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
    .locals 2

    .prologue
    .line 108
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;-><init>(Lorg/apache/tools/ant/taskdefs/optional/Javah;)V

    .line 109
    .local v0, "ga":Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 110
    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 222
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createImplementationClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 417
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementationClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 440
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->cls:Ljava/lang/String;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 441
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "class attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 445
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->cls:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classes:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 446
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "set class attribute OR class element OR fileset, not 2 or more of them."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 450
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->destDir:Ljava/io/File;

    if-eqz v1, :cond_3

    .line 451
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->destDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_2

    .line 452
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "destination directory \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->destDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" does not exist or is not a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 455
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->outputFile:Ljava/io/File;

    if-eqz v1, :cond_3

    .line 456
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "destdir and outputFile are mutually exclusive"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 461
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v1, :cond_4

    .line 462
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    const-string/jumbo v2, "last"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 467
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    if-eqz v1, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    .line 472
    .local v0, "ad":Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    :goto_1
    invoke-interface {v0, p0}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;->compile(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 473
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "compilation failed"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 464
    .end local v0    # "ad":Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    goto :goto_0

    .line 467
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->createImplementationClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-static {v1, p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->getAdapter(Ljava/lang/String;Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    move-result-object v0

    goto :goto_1

    .line 475
    .restart local v0    # "ad":Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    :cond_6
    return-void
.end method

.method public getBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 281
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getClasses()[Ljava/lang/String;
    .locals 12

    .prologue
    const/16 v11, 0x2e

    const/4 v10, 0x0

    .line 155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v0, "al":Ljava/util/ArrayList;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->cls:Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 157
    new-instance v7, Ljava/util/StringTokenizer;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->cls:Ljava/lang/String;

    const-string/jumbo v9, ","

    invoke-direct {v7, v8, v9, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 158
    .local v7, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 159
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 163
    .end local v7    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-lez v8, :cond_2

    .line 164
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->files:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "e":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 165
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/FileSet;

    .line 166
    .local v4, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, "includedClasses":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v8, v6

    if-ge v5, v8, :cond_1

    .line 169
    aget-object v8, v6, v5

    const/16 v9, 0x5c

    invoke-virtual {v8, v9, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x2f

    invoke-virtual {v8, v9, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    aget-object v9, v6, v5

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x6

    invoke-virtual {v8, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 172
    .local v2, "className":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 176
    .end local v2    # "className":Ljava/lang/String;
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v4    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v5    # "i":I
    .end local v6    # "includedClasses":[Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classes:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 177
    .restart local v3    # "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 178
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;

    .line 179
    .local v1, "arg":Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 181
    .end local v1    # "arg":Lorg/apache/tools/ant/taskdefs/optional/Javah$ClassArgument;
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    return-object v8
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getCurrentArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 407
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getArgs()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDestdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->destDir:Ljava/io/File;

    return-object v0
.end method

.method public getForce()Z
    .locals 1

    .prologue
    .line 316
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->force:Z

    return v0
.end method

.method public getOld()Z
    .locals 1

    .prologue
    .line 336
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->old:Z

    return v0
.end method

.method public getOutputfile()Ljava/io/File;
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->outputFile:Ljava/io/File;

    return-object v0
.end method

.method public getStubs()Z
    .locals 1

    .prologue
    .line 353
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->stubs:Z

    return v0
.end method

.method public getVerbose()Z
    .locals 1

    .prologue
    .line 371
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->verbose:Z

    return v0
.end method

.method public logAndAddFiles(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 0
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 483
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 484
    return-void
.end method

.method protected logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 7
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v6, 0x3

    .line 492
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Compilation "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->describeArguments()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->log(Ljava/lang/String;I)V

    .line 495
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 496
    .local v2, "niceClassList":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getClasses()[Ljava/lang/String;

    move-result-object v0

    .line 497
    .local v0, "c":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v0

    if-ge v1, v4, :cond_0

    .line 498
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 499
    const-string/jumbo v4, "    "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 500
    aget-object v4, v0, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 501
    sget-object v4, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 497
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 504
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    const-string/jumbo v4, "Class"

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 505
    .local v3, "prefix":Ljava/lang/StringBuffer;
    array-length v4, v0

    const/4 v5, 0x1

    if-le v4, v5, :cond_1

    .line 506
    const-string/jumbo v4, "es"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 508
    :cond_1
    const-string/jumbo v4, " to be compiled:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 509
    sget-object v4, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 511
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->log(Ljava/lang/String;I)V

    .line 512
    return-void
.end method

.method public setBootClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 272
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->createBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 273
    return-void
.end method

.method public setBootclasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "src"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 249
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 253
    :goto_0
    return-void

    .line 251
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "cls"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->cls:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "src"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 208
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 212
    :goto_0
    return-void

    .line 210
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 232
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->destDir:Ljava/io/File;

    .line 191
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "force"    # Z

    .prologue
    .line 307
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->force:Z

    .line 308
    return-void
.end method

.method public setImplementation(Ljava/lang/String;)V
    .locals 2
    .param p1, "impl"    # Ljava/lang/String;

    .prologue
    .line 380
    const-string/jumbo v0, "default"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->getDefault()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 385
    :goto_0
    return-void

    .line 383
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setOld(Z)V
    .locals 0
    .param p1, "old"    # Z

    .prologue
    .line 327
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->old:Z

    .line 328
    return-void
.end method

.method public setOutputFile(Ljava/io/File;)V
    .locals 0
    .param p1, "outputFile"    # Ljava/io/File;

    .prologue
    .line 290
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->outputFile:Ljava/io/File;

    .line 291
    return-void
.end method

.method public setStubs(Z)V
    .locals 0
    .param p1, "stubs"    # Z

    .prologue
    .line 344
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->stubs:Z

    .line 345
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 362
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Javah;->verbose:Z

    .line 363
    return-void
.end method
