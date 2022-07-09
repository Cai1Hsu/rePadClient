.class public Lorg/apache/tools/ant/types/resources/Resources;
.super Lorg/apache/tools/ant/types/DataType;
.source "Resources.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/Resources$MyCollection;
    }
.end annotation


# static fields
.field public static final EMPTY_ITERATOR:Ljava/util/Iterator;

.field public static final NONE:Lorg/apache/tools/ant/types/ResourceCollection;

.field static class$org$apache$tools$ant$types$ResourceCollection:Ljava/lang/Class;


# instance fields
.field private cache:Z

.field private coll:Ljava/util/Collection;

.field private rc:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/resources/Resources;->NONE:Lorg/apache/tools/ant/types/ResourceCollection;

    .line 57
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources$2;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources$2;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/resources/Resources;->EMPTY_ITERATOR:Ljava/util/Iterator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 121
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->cache:Z

    .line 122
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 128
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->cache:Z

    .line 129
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 130
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/types/resources/Resources;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/Resources;

    .prologue
    .line 42
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->cache:Z

    return v0
.end method

.method static access$300(Lorg/apache/tools/ant/types/resources/Resources;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/types/resources/Resources;

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getNested()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 263
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

.method private declared-synchronized getNested()Ljava/util/List;
    .locals 1

    .prologue
    .line 272
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->rc:Ljava/util/Vector;

    if-nez v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->rc:Ljava/util/Vector;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getRef()Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 2

    .prologue
    .line 262
    sget-object v0, Lorg/apache/tools/ant/types/resources/Resources;->class$org$apache$tools$ant$types$ResourceCollection:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.types.ResourceCollection"

    invoke-static {v0}, Lorg/apache/tools/ant/types/resources/Resources;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/Resources;->class$org$apache$tools$ant$types$ResourceCollection:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v1, "ResourceCollection"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ResourceCollection;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/resources/Resources;->class$org$apache$tools$ant$types$ResourceCollection:Ljava/lang/Class;

    goto :goto_0
.end method

.method private declared-synchronized validate()V
    .locals 1

    .prologue
    .line 267
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->dieOnCircularReference()V

    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/resources/Resources$MyCollection;-><init>(Lorg/apache/tools/ant/types/resources/Resources;)V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    monitor-exit p0

    return-void

    .line 268
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 267
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 146
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 149
    :cond_0
    if-nez p1, :cond_1

    .line 159
    :goto_0
    monitor-exit p0

    return-void

    .line 152
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->rc:Ljava/util/Vector;

    if-nez v0, :cond_2

    .line 153
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->rc:Ljava/util/Vector;

    .line 155
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->rc:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 156
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->invalidateExistingIterators()V

    .line 157
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    .line 158
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Resources;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 248
    :goto_0
    return-void

    .line 237
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 238
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 240
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getNested()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 241
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 242
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 243
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/resources/Resources;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 246
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/Resources;->setChecked(Z)V

    goto :goto_0
.end method

.method protected invalidateExistingIterators()V
    .locals 0

    .prologue
    .line 254
    invoke-static {p0}, Lorg/apache/tools/ant/types/resources/FailFast;->invalidate(Ljava/lang/Object;)V

    .line 255
    return-void
.end method

.method public isFilesystemOnly()Z
    .locals 2

    .prologue
    .line 190
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getRef()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v1

    .line 200
    :goto_0
    return v1

    .line 193
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->validate()V

    .line 195
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getNested()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 196
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v1

    if-nez v1, :cond_1

    .line 197
    const/4 v1, 0x0

    goto :goto_0

    .line 200
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public declared-synchronized iterator()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 167
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getRef()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 170
    :goto_0
    monitor-exit p0

    return-object v0

    .line 169
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->validate()V

    .line 170
    new-instance v0, Lorg/apache/tools/ant/types/resources/FailFast;

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/types/resources/FailFast;-><init>(Ljava/lang/Object;Ljava/util/Iterator;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCache(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/Resources;->cache:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    monitor-exit p0

    return-void

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getRef()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 182
    :goto_0
    monitor-exit p0

    return v0

    .line 181
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->validate()V

    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 208
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 209
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Resources;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 222
    :goto_0
    monitor-exit p0

    return-object v2

    .line 211
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Resources;->validate()V

    .line 212
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 213
    :cond_1
    const-string/jumbo v2, ""

    goto :goto_0

    .line 215
    :cond_2
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 216
    .local v1, "sb":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/Resources;->coll:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 217
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 218
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 220
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 208
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "sb":Ljava/lang/StringBuffer;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 222
    .restart local v0    # "i":Ljava/util/Iterator;
    .restart local v1    # "sb":Ljava/lang/StringBuffer;
    :cond_4
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v2

    goto :goto_0
.end method
