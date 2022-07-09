.class public abstract Lorg/apache/tools/ant/util/ContainerMapper;
.super Ljava/lang/Object;
.source "ContainerMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# instance fields
.field private mappers:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/ContainerMapper;->mappers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 3
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 66
    monitor-enter p0

    if-eq p0, p1, :cond_0

    :try_start_0
    instance-of v1, p1, Lorg/apache/tools/ant/util/ContainerMapper;

    if-eqz v1, :cond_1

    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/util/ContainerMapper;

    move-object v1, v0

    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/util/ContainerMapper;->contains(Lorg/apache/tools/ant/util/FileNameMapper;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 69
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Circular mapper containment condition detected"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 72
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/util/ContainerMapper;->mappers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    monitor-exit p0

    return-void
.end method

.method public addConfigured(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 0
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/ContainerMapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 55
    return-void
.end method

.method public addConfiguredMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 1
    .param p1, "mapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 41
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ContainerMapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 42
    return-void
.end method

.method protected declared-synchronized contains(Lorg/apache/tools/ant/util/FileNameMapper;)Z
    .locals 4
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 83
    monitor-enter p0

    const/4 v0, 0x0

    .line 84
    .local v0, "foundit":Z
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/util/ContainerMapper;->mappers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_2

    .line 85
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 86
    .local v2, "next":Lorg/apache/tools/ant/util/FileNameMapper;
    if-eq v2, p1, :cond_0

    instance-of v3, v2, Lorg/apache/tools/ant/util/ContainerMapper;

    if-eqz v3, :cond_1

    check-cast v2, Lorg/apache/tools/ant/util/ContainerMapper;

    .end local v2    # "next":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/util/ContainerMapper;->contains(Lorg/apache/tools/ant/util/FileNameMapper;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_1
    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 90
    :cond_2
    monitor-exit p0

    return v0

    .line 83
    .end local v1    # "iter":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getMappers()Ljava/util/List;
    .locals 1

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ContainerMapper;->mappers:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "ignore"    # Ljava/lang/String;

    .prologue
    .line 107
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "ignore"    # Ljava/lang/String;

    .prologue
    .line 115
    return-void
.end method
