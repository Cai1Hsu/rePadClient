.class public Lorg/apache/tools/ant/taskdefs/Classloader;
.super Lorg/apache/tools/ant/Task;
.source "Classloader.java"


# static fields
.field public static final SYSTEM_LOADER_REF:Ljava/lang/String; = "ant.coreLoader"


# instance fields
.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private name:Ljava/lang/String;

.field private parentFirst:Z

.field private parentName:Ljava/lang/String;

.field private reset:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 66
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->reset:Z

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentFirst:Z

    .line 70
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentName:Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 155
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 14

    .prologue
    const/4 v3, 0x1

    const/4 v10, 0x0

    .line 165
    :try_start_0
    const-string/jumbo v11, "only"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    const-string/jumbo v13, "build.sysclasspath"

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    if-eqz v11, :cond_0

    const-string/jumbo v11, "ant.coreLoader"

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 167
    :cond_0
    const-string/jumbo v10, "Changing the system loader is disabled by build.sysclasspath=only"

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Classloader;->log(Ljava/lang/String;I)V

    .line 243
    :cond_1
    :goto_0
    return-void

    .line 172
    :cond_2
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    if-nez v11, :cond_4

    const-string/jumbo v7, "ant.coreLoader"

    .line 174
    .local v7, "loaderName":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v11, v7}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 175
    .local v8, "obj":Ljava/lang/Object;
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->reset:Z

    if-eqz v11, :cond_3

    .line 178
    const/4 v8, 0x0

    .line 182
    .end local v8    # "obj":Ljava/lang/Object;
    :cond_3
    if-eqz v8, :cond_5

    instance-of v11, v8, Lorg/apache/tools/ant/AntClassLoader;

    if-nez v11, :cond_5

    .line 183
    const-string/jumbo v10, "Referenced object is not an AntClassLoader"

    const/4 v11, 0x0

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Classloader;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 240
    .end local v7    # "loaderName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 241
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 172
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_4
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    goto :goto_1

    .line 188
    .restart local v7    # "loaderName":Ljava/lang/String;
    :cond_5
    move-object v0, v8

    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    move-object v1, v0

    .line 189
    .local v1, "acl":Lorg/apache/tools/ant/AntClassLoader;
    if-eqz v1, :cond_a

    .line 191
    .local v3, "existingLoader":Z
    :goto_2
    if-nez v1, :cond_8

    .line 193
    const/4 v9, 0x0

    .line 194
    .local v9, "parent":Ljava/lang/Object;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentName:Ljava/lang/String;

    if-eqz v10, :cond_6

    .line 195
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    .line 196
    instance-of v10, v9, Ljava/lang/ClassLoader;

    if-nez v10, :cond_6

    .line 197
    const/4 v9, 0x0

    .line 201
    .end local v9    # "parent":Ljava/lang/Object;
    :cond_6
    if-nez v9, :cond_b

    .line 202
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    .local v9, "parent":Ljava/lang/ClassLoader;
    move-object v10, v9

    .line 205
    .end local v9    # "parent":Ljava/lang/ClassLoader;
    :goto_3
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    if-nez v11, :cond_7

    .line 209
    :cond_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Setting parent loader "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-boolean v13, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentFirst:Z

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x4

    invoke-virtual {v11, v12, v13}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 213
    check-cast v10, Ljava/lang/ClassLoader;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    iget-boolean v13, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentFirst:Z

    invoke-static {v10, v11, v12, v13}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v1

    .line 216
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10, v7, v1}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 218
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    if-nez v10, :cond_8

    .line 221
    const-string/jumbo v10, "org.apache.tools.ant.taskdefs.optional"

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/AntClassLoader;->addLoaderPackageRoot(Ljava/lang/String;)V

    .line 222
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10, v1}, Lorg/apache/tools/ant/Project;->setCoreLoader(Ljava/lang/ClassLoader;)V

    .line 226
    :cond_8
    if-eqz v3, :cond_1

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v10, :cond_1

    .line 227
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v6

    .line 228
    .local v6, "list":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_4
    array-length v10, v6

    if-ge v5, v10, :cond_1

    .line 229
    new-instance v4, Ljava/io/File;

    aget-object v10, v6, v5

    invoke-direct {v4, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 230
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 231
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Adding to class loader "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x4

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Classloader;->log(Ljava/lang/String;I)V

    .line 233
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/AntClassLoader;->addPathElement(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 228
    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .end local v3    # "existingLoader":Z
    .end local v4    # "f":Ljava/io/File;
    .end local v5    # "i":I
    .end local v6    # "list":[Ljava/lang/String;
    :cond_a
    move v3, v10

    .line 189
    goto/16 :goto_2

    .restart local v3    # "existingLoader":Z
    :cond_b
    move-object v10, v9

    goto/16 :goto_3
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 141
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "pathRef"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Classloader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Path;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 132
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->name:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setParentFirst(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentFirst:Z

    .line 113
    return-void
.end method

.method public setParentName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentName:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setReset(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->reset:Z

    .line 96
    return-void
.end method

.method public setReverse(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 104
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Classloader;->parentFirst:Z

    .line 105
    return-void

    .line 104
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
