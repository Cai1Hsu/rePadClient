.class public Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;
.super Lorg/apache/tools/ant/taskdefs/Copy;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Sync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MyCopy"
.end annotation


# instance fields
.field private nonOrphans:Ljava/util/Set;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 461
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Copy;-><init>()V

    .line 458
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->nonOrphans:Ljava/util/Set;

    .line 462
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    .prologue
    .line 454
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->nonOrphans:Ljava/util/Set;

    return-object v0
.end method


# virtual methods
.method public getIncludeEmptyDirs()Z
    .locals 1

    .prologue
    .line 508
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->includeEmpty:Z

    return v0
.end method

.method public getToDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 500
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->destDir:Ljava/io/File;

    return-object v0
.end method

.method protected scan([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)Ljava/util/Map;
    .locals 3
    .param p1, "resources"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "toDir"    # Ljava/io/File;

    .prologue
    .line 487
    const-string/jumbo v2, "No mapper"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lorg/apache/tools/ant/taskdefs/Sync;->access$200(Ljava/lang/String;Z)V

    .line 489
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 490
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->nonOrphans:Ljava/util/Set;

    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 489
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 487
    .end local v0    # "i":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 492
    .restart local v0    # "i":I
    :cond_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Copy;->scan([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method protected scan(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .param p1, "fromDir"    # Ljava/io/File;
    .param p2, "toDir"    # Ljava/io/File;
    .param p3, "files"    # [Ljava/lang/String;
    .param p4, "dirs"    # [Ljava/lang/String;

    .prologue
    .line 470
    const-string/jumbo v2, "No mapper"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v2, v1}, Lorg/apache/tools/ant/taskdefs/Sync;->access$200(Ljava/lang/String;Z)V

    .line 472
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Copy;->scan(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 474
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p3

    if-ge v0, v1, :cond_1

    .line 475
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->nonOrphans:Ljava/util/Set;

    aget-object v2, p3, v0

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 474
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 470
    .end local v0    # "i":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 477
    .restart local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    :goto_2
    array-length v1, p4

    if-ge v0, v1, :cond_2

    .line 478
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->nonOrphans:Ljava/util/Set;

    aget-object v2, p4, v0

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 477
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 480
    :cond_2
    return-void
.end method

.method protected supportsNonFileResources()Z
    .locals 1

    .prologue
    .line 517
    const/4 v0, 0x1

    return v0
.end method
