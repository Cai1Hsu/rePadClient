.class public Lorg/apache/tools/ant/taskdefs/PathConvert;
.super Lorg/apache/tools/ant/Task;
.source "PathConvert.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;,
        Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    }
.end annotation


# static fields
.field private static onWindows:Z


# instance fields
.field private dirSep:Ljava/lang/String;

.field private mapper:Lorg/apache/tools/ant/types/Mapper;

.field private path:Lorg/apache/tools/ant/types/resources/Resources;

.field private pathSep:Ljava/lang/String;

.field private prefixMap:Ljava/util/Vector;

.field private preserveDuplicates:Z

.field private property:Ljava/lang/String;

.field private refid:Lorg/apache/tools/ant/types/Reference;

.field private setonempty:Z

.field private targetOS:Ljava/lang/String;

.field private targetWindows:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-string/jumbo v0, "dos"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->onWindows:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 58
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    .line 62
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->refid:Lorg/apache/tools/ant/types/Reference;

    .line 66
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetOS:Ljava/lang/String;

    .line 70
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetWindows:Z

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->setonempty:Z

    .line 78
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->property:Ljava/lang/String;

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->prefixMap:Ljava/util/Vector;

    .line 86
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 93
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 101
    return-void
.end method

.method static access$000()Z
    .locals 1

    .prologue
    .line 47
    sget-boolean v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->onWindows:Z

    return v0
.end method

.method private declared-synchronized getPath()Lorg/apache/tools/ant/types/resources/Resources;
    .locals 2

    .prologue
    .line 200
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v0, :cond_0

    .line 201
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setCache(Z)V

    .line 204
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 200
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private mapElement(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "elem"    # Ljava/lang/String;

    .prologue
    .line 417
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->prefixMap:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v3

    .line 419
    .local v3, "size":I
    if-eqz v3, :cond_0

    .line 424
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 425
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->prefixMap:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;

    .line 426
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->apply(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 431
    .local v2, "newElem":Ljava/lang/String;
    if-eq v2, p1, :cond_1

    .line 432
    move-object p1, v2

    .line 437
    .end local v0    # "entry":Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    .end local v1    # "i":I
    .end local v2    # "newElem":Ljava/lang/String;
    :cond_0
    return-object p1

    .line 424
    .restart local v0    # "entry":Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    .restart local v1    # "i":I
    .restart local v2    # "newElem":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private noChildrenAllowed()Lorg/apache/tools/ant/BuildException;
    .locals 2

    .prologue
    .line 501
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must not specify nested elements when using the refid attribute."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private validateSetup()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 471
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v2, :cond_0

    .line 472
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "You must specify a path to convert"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 476
    :cond_0
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 477
    .local v0, "dsep":Ljava/lang/String;
    sget-object v1, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    .line 479
    .local v1, "psep":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetOS:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 480
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetWindows:Z

    if-eqz v2, :cond_4

    const-string/jumbo v1, ";"

    .line 481
    :goto_0
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetWindows:Z

    if-eqz v2, :cond_5

    const-string/jumbo v0, "\\"

    .line 483
    :cond_1
    :goto_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 485
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 487
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 489
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 491
    :cond_3
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 492
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 493
    return-void

    .line 480
    :cond_4
    const-string/jumbo v1, ":"

    goto :goto_0

    .line 481
    :cond_5
    const-string/jumbo v0, "/"

    goto :goto_1
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 193
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 196
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getPath()Lorg/apache/tools/ant/types/resources/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 197
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 459
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 460
    .local v0, "m":Lorg/apache/tools/ant/types/Mapper;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 461
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->addMapper(Lorg/apache/tools/ant/types/Mapper;)V

    .line 462
    return-void
.end method

.method public addMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 2
    .param p1, "mapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 446
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 447
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 450
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 451
    return-void
.end method

.method public createMap()Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    .locals 2

    .prologue
    .line 212
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;-><init>(Lorg/apache/tools/ant/taskdefs/PathConvert;)V

    .line 213
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->prefixMap:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 214
    return-object v0
.end method

.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 180
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 182
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 183
    .local v0, "result":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 184
    return-object v0
.end method

.method public execute()V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 333
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    move-object/from16 v16, v0

    .line 334
    .local v16, "savedPath":Lorg/apache/tools/ant/types/resources/Resources;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 335
    .local v17, "savedPathSep":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 339
    .local v15, "savedDirSep":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->isReference()Z

    move-result v21

    if-eqz v21, :cond_1

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->refid:Lorg/apache/tools/ant/types/Reference;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v11

    .line 341
    .local v11, "o":Ljava/lang/Object;
    instance-of v0, v11, Lorg/apache/tools/ant/types/ResourceCollection;

    move/from16 v21, v0

    if-nez v21, :cond_0

    .line 342
    new-instance v21, Lorg/apache/tools/ant/BuildException;

    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "refid \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->refid:Lorg/apache/tools/ant/types/Reference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, "\' does not refer to a resource collection."

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v21
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 401
    .end local v11    # "o":Ljava/lang/Object;
    :catchall_0
    move-exception v21

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    .line 402
    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 403
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 401
    throw v21

    .line 345
    .restart local v11    # "o":Ljava/lang/Object;
    :cond_0
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getPath()Lorg/apache/tools/ant/types/resources/Resources;

    move-result-object v21

    check-cast v11, Lorg/apache/tools/ant/types/ResourceCollection;

    .end local v11    # "o":Ljava/lang/Object;
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 347
    :cond_1
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->validateSetup()V

    .line 357
    sget-boolean v21, Lorg/apache/tools/ant/taskdefs/PathConvert;->onWindows:Z

    if-eqz v21, :cond_3

    const-string/jumbo v5, "\\"

    .line 359
    .local v5, "fromDirSep":Ljava/lang/String;
    :goto_0
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    .line 361
    .local v14, "rslt":Ljava/lang/StringBuffer;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->isPreserveDuplicates()Z

    move-result v21

    if-eqz v21, :cond_4

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    .line 362
    .local v12, "resources":Lorg/apache/tools/ant/types/ResourceCollection;
    :goto_1
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .local v13, "ret":Ljava/util/List;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapper:Lorg/apache/tools/ant/types/Mapper;

    move-object/from16 v21, v0

    if-nez v21, :cond_5

    new-instance v10, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v10}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .line 364
    .local v10, "mapperImpl":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_2
    invoke-interface {v12}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "iter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_6

    .line 365
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-interface {v10, v0}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 366
    .local v8, "mapped":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "m":I
    :goto_3
    if-eqz v8, :cond_2

    array-length v0, v8

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v7, v0, :cond_2

    .line 367
    aget-object v21, v8, v7

    move-object/from16 v0, v21

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 357
    .end local v5    # "fromDirSep":Ljava/lang/String;
    .end local v6    # "iter":Ljava/util/Iterator;
    .end local v7    # "m":I
    .end local v8    # "mapped":[Ljava/lang/String;
    .end local v10    # "mapperImpl":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v12    # "resources":Lorg/apache/tools/ant/types/ResourceCollection;
    .end local v13    # "ret":Ljava/util/List;
    .end local v14    # "rslt":Ljava/lang/StringBuffer;
    :cond_3
    const-string/jumbo v5, "/"

    goto :goto_0

    .line 361
    .restart local v5    # "fromDirSep":Ljava/lang/String;
    .restart local v14    # "rslt":Ljava/lang/StringBuffer;
    :cond_4
    new-instance v12, Lorg/apache/tools/ant/types/resources/Union;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-direct {v12, v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_1

    .line 363
    .restart local v12    # "resources":Lorg/apache/tools/ant/types/ResourceCollection;
    .restart local v13    # "ret":Ljava/util/List;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapper:Lorg/apache/tools/ant/types/Mapper;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v10

    goto :goto_2

    .line 370
    .restart local v6    # "iter":Ljava/util/Iterator;
    .restart local v10    # "mapperImpl":Lorg/apache/tools/ant/util/FileNameMapper;
    :cond_6
    const/4 v4, 0x1

    .line 371
    .local v4, "first":Z
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "mappedIter":Ljava/util/Iterator;
    :cond_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_a

    .line 372
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/PathConvert;->mapElement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 377
    .local v3, "elem":Ljava/lang/String;
    if-nez v4, :cond_8

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 380
    :cond_8
    const/4 v4, 0x0

    .line 382
    new-instance v18, Ljava/util/StringTokenizer;

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-direct {v0, v3, v5, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 384
    .local v18, "stDirectory":Ljava/util/StringTokenizer;
    :goto_4
    invoke-virtual/range {v18 .. v18}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v21

    if-eqz v21, :cond_7

    .line 385
    invoke-virtual/range {v18 .. v18}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v19

    .line 386
    .local v19, "token":Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    move-object/from16 v19, v0

    .end local v19    # "token":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 391
    .end local v3    # "elem":Ljava/lang/String;
    .end local v18    # "stDirectory":Ljava/util/StringTokenizer;
    :cond_a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->setonempty:Z

    move/from16 v21, v0

    if-nez v21, :cond_b

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->length()I

    move-result v21

    if-lez v21, :cond_c

    .line 392
    :cond_b
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 393
    .local v20, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->property:Ljava/lang/String;

    move-object/from16 v21, v0

    if-nez v21, :cond_d

    .line 394
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/PathConvert;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 401
    .end local v20    # "value":Ljava/lang/String;
    :cond_c
    :goto_5
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    .line 402
    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 403
    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 405
    return-void

    .line 396
    .restart local v20    # "value":Ljava/lang/String;
    :cond_d
    :try_start_2
    new-instance v21, Ljava/lang/StringBuffer;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v22, "Set property "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->property:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    const-string/jumbo v22, " = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/PathConvert;->log(Ljava/lang/String;I)V

    .line 397
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PathConvert;->property:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5
.end method

.method public isPreserveDuplicates()Z
    .locals 1

    .prologue
    .line 317
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->preserveDuplicates:Z

    return v0
.end method

.method public isReference()Z
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->refid:Lorg/apache/tools/ant/types/Reference;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDirSep(Ljava/lang/String;)V
    .locals 0
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 299
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->dirSep:Ljava/lang/String;

    .line 300
    return-void
.end method

.method public setPathSep(Ljava/lang/String;)V
    .locals 0
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 289
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->pathSep:Ljava/lang/String;

    .line 290
    return-void
.end method

.method public setPreserveDuplicates(Z)V
    .locals 0
    .param p1, "preserveDuplicates"    # Z

    .prologue
    .line 308
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->preserveDuplicates:Z

    .line 309
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 269
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->property:Ljava/lang/String;

    .line 270
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->path:Lorg/apache/tools/ant/types/resources/Resources;

    if-eqz v0, :cond_0

    .line 278
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 280
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->refid:Lorg/apache/tools/ant/types/Reference;

    .line 281
    return-void
.end method

.method public setSetonempty(Z)V
    .locals 0
    .param p1, "setonempty"    # Z

    .prologue
    .line 261
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->setonempty:Z

    .line 262
    return-void
.end method

.method public setTargetos(Ljava/lang/String;)V
    .locals 1
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 227
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;-><init>()V

    .line 228
    .local v0, "to":Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;->setValue(Ljava/lang/String;)V

    .line 229
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/PathConvert;->setTargetos(Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;)V

    .line 230
    return-void
.end method

.method public setTargetos(Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;)V
    .locals 2
    .param p1, "target"    # Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;

    .prologue
    .line 241
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/PathConvert$TargetOs;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetOS:Ljava/lang/String;

    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetOS:Ljava/lang/String;

    const-string/jumbo v1, "unix"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetOS:Ljava/lang/String;

    const-string/jumbo v1, "tandem"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert;->targetWindows:Z

    .line 251
    return-void

    .line 250
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
