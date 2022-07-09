.class public Lorg/apache/tools/ant/types/Mapper;
.super Lorg/apache/tools/ant/types/DataType;
.source "Mapper.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Mapper$MapperType;
    }
.end annotation


# instance fields
.field protected classname:Ljava/lang/String;

.field protected classpath:Lorg/apache/tools/ant/types/Path;

.field private container:Lorg/apache/tools/ant/util/ContainerMapper;

.field protected from:Ljava/lang/String;

.field protected to:Ljava/lang/String;

.field protected type:Lorg/apache/tools/ant/types/Mapper$MapperType;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v0, 0x0

    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 35
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    .line 36
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 38
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->from:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->to:Ljava/lang/String;

    .line 43
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    .line 50
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Mapper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 51
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 4
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 81
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    if-nez v1, :cond_1

    .line 82
    iget-object v1, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 83
    new-instance v1, Lorg/apache/tools/ant/util/CompositeMapper;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/CompositeMapper;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    .line 94
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/util/ContainerMapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 95
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/Mapper;->setChecked(Z)V

    .line 96
    return-void

    .line 85
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    .line 86
    .local v0, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    instance-of v1, v0, Lorg/apache/tools/ant/util/ContainerMapper;

    if-eqz v1, :cond_3

    .line 87
    check-cast v0, Lorg/apache/tools/ant/util/ContainerMapper;

    .end local v0    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    goto :goto_0

    .line 89
    .restart local v0    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " mapper implementation does not support nested mappers!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public addConfigured(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 0
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 71
    return-void
.end method

.method public addConfiguredMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 1
    .param p1, "mapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 103
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 104
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 140
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 141
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 143
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Mapper;->setChecked(Z)V

    .line 144
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 203
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->dieOnCircularReference()V

    .line 204
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v5

    .line 205
    .local v5, "r":Lorg/apache/tools/ant/types/Reference;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v2

    .line 206
    .local v2, "o":Ljava/lang/Object;
    instance-of v7, v2, Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v7, :cond_0

    .line 207
    check-cast v2, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 242
    .end local v2    # "o":Ljava/lang/Object;
    .end local v5    # "r":Lorg/apache/tools/ant/types/Reference;
    :goto_0
    return-object v2

    .line 209
    .restart local v2    # "o":Ljava/lang/Object;
    .restart local v5    # "r":Lorg/apache/tools/ant/types/Reference;
    :cond_0
    instance-of v7, v2, Lorg/apache/tools/ant/types/Mapper;

    if-eqz v7, :cond_1

    .line 210
    check-cast v2, Lorg/apache/tools/ant/types/Mapper;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v2

    goto :goto_0

    .line 212
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_1
    if-nez v2, :cond_2

    const-string/jumbo v3, "null"

    .line 213
    .local v3, "od":Ljava/lang/String;
    :goto_1
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " at reference \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\' is not a valid mapper reference."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 212
    .end local v3    # "od":Ljava/lang/String;
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 217
    .end local v2    # "o":Ljava/lang/Object;
    .end local v5    # "r":Lorg/apache/tools/ant/types/Reference;
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    if-nez v7, :cond_4

    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    if-nez v7, :cond_4

    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    if-nez v7, :cond_4

    .line 218
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "nested mapper or one of the attributes type or classname is required"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 223
    :cond_4
    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    if-eqz v7, :cond_5

    .line 224
    iget-object v2, p0, Lorg/apache/tools/ant/types/Mapper;->container:Lorg/apache/tools/ant/util/ContainerMapper;

    goto :goto_0

    .line 227
    :cond_5
    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    if-eqz v7, :cond_6

    .line 228
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "must not specify both type and classname attribute"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 233
    :cond_6
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getImplementationClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/util/FileNameMapper;

    .line 235
    .local v1, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    .line 236
    .local v4, "p":Lorg/apache/tools/ant/Project;
    if-eqz v4, :cond_7

    .line 237
    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 239
    :cond_7
    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->from:Ljava/lang/String;

    invoke-interface {v1, v7}, Lorg/apache/tools/ant/util/FileNameMapper;->setFrom(Ljava/lang/String;)V

    .line 240
    iget-object v7, p0, Lorg/apache/tools/ant/types/Mapper;->to:Ljava/lang/String;

    invoke-interface {v1, v7}, Lorg/apache/tools/ant/util/FileNameMapper;->setTo(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-object v2, v1

    .line 242
    goto/16 :goto_0

    .line 243
    .end local v1    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v4    # "p":Lorg/apache/tools/ant/Project;
    :catch_0
    move-exception v0

    .line 244
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    throw v0

    .line 245
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v6

    .line 246
    .local v6, "t":Ljava/lang/Throwable;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method protected getImplementationClass()Ljava/lang/Class;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 257
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    .line 258
    .local v0, "cName":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    if-eqz v2, :cond_0

    .line 259
    iget-object v2, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Mapper$MapperType;->getImplementation()Ljava/lang/String;

    move-result-object v0

    .line 262
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 267
    .local v1, "loader":Ljava/lang/ClassLoader;
    :goto_0
    const/4 v2, 0x1

    invoke-static {v0, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    return-object v2

    .line 262
    .end local v1    # "loader":Ljava/lang/ClassLoader;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v1

    goto :goto_0
.end method

.method protected getRef()Lorg/apache/tools/ant/types/Mapper;
    .locals 1

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 1
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 114
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Mapper;->classname:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 125
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 126
    iput-object p1, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 130
    :goto_0
    return-void

    .line 128
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 156
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 157
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 167
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Mapper;->from:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->from:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Mapper;->to:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 191
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 193
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 194
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 178
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Mapper;->to:Ljava/lang/String;

    .line 179
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/types/Mapper$MapperType;)V
    .locals 1
    .param p1, "type"    # Lorg/apache/tools/ant/types/Mapper$MapperType;

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Mapper;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 61
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/Mapper;->type:Lorg/apache/tools/ant/types/Mapper$MapperType;

    .line 62
    return-void
.end method
