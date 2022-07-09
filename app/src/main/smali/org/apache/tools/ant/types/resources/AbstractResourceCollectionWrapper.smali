.class public abstract Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;
.super Lorg/apache/tools/ant/types/DataType;
.source "AbstractResourceCollectionWrapper.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;
.implements Ljava/lang/Cloneable;


# static fields
.field private static final ONE_NESTED_MESSAGE:Ljava/lang/String; = " expects exactly one nested resource collection."

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private cache:Z

.field private rc:Lorg/apache/tools/ant/types/ResourceCollection;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->cache:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 143
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

.method private oneNested()Lorg/apache/tools/ant/BuildException;
    .locals 3

    .prologue
    .line 207
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " expects exactly one nested resource collection."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 65
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 68
    :cond_0
    if-nez p1, :cond_1

    .line 82
    :goto_0
    monitor-exit p0

    return-void

    .line 71
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-eqz v1, :cond_2

    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->oneNested()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 74
    :cond_2
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 75
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-static {v1}, Lorg/apache/tools/ant/Project;->getProject(Ljava/lang/Object;)Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-nez v1, :cond_3

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 77
    .local v0, "p":Lorg/apache/tools/ant/Project;
    if-eqz v0, :cond_3

    .line 78
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 81
    .end local v0    # "p":Lorg/apache/tools/ant/Project;
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected abstract createIterator()Ljava/util/Iterator;
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 159
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    :goto_0
    monitor-exit p0

    return-void

    .line 162
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 163
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 159
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 165
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    instance-of v0, v0, Lorg/apache/tools/ant/types/DataType;

    if-eqz v0, :cond_2

    .line 166
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    check-cast v0, Lorg/apache/tools/ant/types/DataType;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 168
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected final declared-synchronized getResourceCollection()Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 1

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->dieOnCircularReference()V

    .line 179
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-nez v0, :cond_0

    .line 180
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->oneNested()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 182
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method protected abstract getSize()I
.end method

.method public declared-synchronized isCache()Z
    .locals 1

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->cache:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isFilesystemOnly()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 131
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/BaseResourceCollectionContainer;->isFilesystemOnly()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 147
    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    .line 134
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->dieOnCircularReference()V

    .line 136
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->rc:Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v3}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v3

    if-nez v3, :cond_0

    .line 141
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->createIterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 142
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 143
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v3, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_3

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    .line 144
    const/4 v2, 0x0

    goto :goto_0

    .line 143
    :cond_3
    sget-object v3, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 131
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public final declared-synchronized iterator()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 89
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 93
    :goto_0
    monitor-exit p0

    return-object v0

    .line 92
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->dieOnCircularReference()V

    .line 93
    new-instance v0, Lorg/apache/tools/ant/types/resources/FailFast;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->createIterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/resources/FailFast;-><init>(Ljava/lang/Object;Ljava/util/Iterator;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCache(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->cache:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit p0

    return-void

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 115
    :goto_0
    monitor-exit p0

    return v0

    .line 114
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->dieOnCircularReference()V

    .line 115
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getSize()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 191
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 203
    :goto_0
    monitor-exit p0

    return-object v2

    .line 193
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->getSize()I

    move-result v2

    if-nez v2, :cond_1

    .line 194
    const-string/jumbo v2, ""

    goto :goto_0

    .line 196
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 197
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractResourceCollectionWrapper;->createIterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 198
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 199
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 201
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 190
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 203
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_3
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_0
.end method
