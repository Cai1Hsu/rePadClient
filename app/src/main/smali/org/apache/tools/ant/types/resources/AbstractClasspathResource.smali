.class public abstract Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;
.super Lorg/apache/tools/ant/types/Resource;
.source "AbstractClasspathResource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$types$resources$JavaResource:Ljava/lang/Class;


# instance fields
.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private loader:Lorg/apache/tools/ant/types/Reference;

.field private parentFirst:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Resource;-><init>()V

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->parentFirst:Z

    .line 249
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 218
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


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->checkChildrenAllowed()V

    .line 65
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 68
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->setChecked(Z)V

    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 236
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    :goto_0
    monitor-exit p0

    return-void

    .line 239
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 240
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/Resource;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 242
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_2

    .line 243
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 245
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method protected getClassLoader()Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, "cl":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 202
    .local v1, "clNeedsCleanup":Z
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    if-eqz v4, :cond_0

    .line 203
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "cl":Ljava/lang/ClassLoader;
    check-cast v0, Ljava/lang/ClassLoader;

    .line 205
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    :cond_0
    if-nez v0, :cond_1

    .line 206
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 207
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    const-string/jumbo v5, "ignore"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 208
    .local v2, "p":Lorg/apache/tools/ant/types/Path;
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->parentFirst:Z

    if-eqz v4, :cond_2

    .line 209
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    .line 216
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    if-nez v4, :cond_3

    const/4 v1, 0x1

    .line 220
    .end local v2    # "p":Lorg/apache/tools/ant/types/Path;
    :goto_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    if-eqz v3, :cond_1

    if-eqz v0, :cond_1

    .line 221
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 224
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;

    invoke-direct {v3, v0, v1}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;-><init>(Ljava/lang/ClassLoader;Z)V

    return-object v3

    .line 211
    .restart local v2    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getCoreLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v4, v5, v2, v3}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    goto :goto_0

    :cond_3
    move v1, v3

    .line 216
    goto :goto_1

    .line 218
    .end local v2    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_4
    sget-object v3, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->class$org$apache$tools$ant$types$resources$JavaResource:Ljava/lang/Class;

    if-nez v3, :cond_5

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.JavaResource"

    invoke-static {v3}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->class$org$apache$tools$ant$types$resources$JavaResource:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_1

    :cond_5
    sget-object v3, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->class$org$apache$tools$ant$types$resources$JavaResource:Ljava/lang/Class;

    goto :goto_2
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 91
    :goto_0
    return-object v0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->dieOnCircularReference()V

    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 172
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 177
    :goto_0
    return-object v1

    .line 174
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->dieOnCircularReference()V

    .line 176
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getClassLoader()Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;

    move-result-object v0

    .line 177
    .local v0, "classLoader":Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->needsCleanup()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->getLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->openInputStream(Ljava/lang/ClassLoader;)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0

    :cond_1
    new-instance v1, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->getLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->openInputStream(Ljava/lang/ClassLoader;)Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$1;-><init>(Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;Ljava/io/InputStream;Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;)V

    goto :goto_0
.end method

.method public getLoader()Lorg/apache/tools/ant/types/Reference;
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    .line 103
    :goto_0
    return-object v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->dieOnCircularReference()V

    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    goto :goto_0
.end method

.method public isExists()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 150
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    .line 161
    :goto_0
    return v2

    .line 153
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->dieOnCircularReference()V

    .line 154
    const/4 v1, 0x0

    .line 156
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 157
    if-eqz v1, :cond_1

    const/4 v2, 0x1

    .line 161
    :cond_1
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    .line 158
    :catch_0
    move-exception v0

    .line 161
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v2
.end method

.method protected abstract openInputStream(Ljava/lang/ClassLoader;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->checkAttributesAllowed()V

    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 56
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->setChecked(Z)V

    .line 57
    return-void

    .line 54
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->checkAttributesAllowed()V

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 80
    return-void
.end method

.method public setLoaderRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->checkAttributesAllowed()V

    .line 119
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    .line 120
    return-void
.end method

.method public setParentFirst(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 130
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->parentFirst:Z

    .line 131
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->loader:Lorg/apache/tools/ant/types/Reference;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_1

    .line 139
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 141
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/Resource;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 142
    return-void
.end method
