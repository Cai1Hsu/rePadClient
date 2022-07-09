.class public Lorg/apache/tools/ant/taskdefs/ImportTask;
.super Lorg/apache/tools/ant/Task;
.source "ImportTask.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private file:Ljava/lang/String;

.field private optional:Z

.field private prefixSeparator:Ljava/lang/String;

.field private final resources:Lorg/apache/tools/ant/types/resources/Union;

.field private targetPrefix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 71
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/ImportTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 69
    const-string/jumbo v0, "."

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->prefixSeparator:Ljava/lang/String;

    .line 70
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Union;->setCache(Z)V

    .line 75
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 187
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

.method private getFileAttributeResource()Lorg/apache/tools/ant/types/Resource;
    .locals 8

    .prologue
    .line 249
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 250
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    .line 252
    .local v0, "buildFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 253
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 254
    .local v1, "buildFileParent":Ljava/io/File;
    sget-object v5, Lorg/apache/tools/ant/taskdefs/ImportTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    invoke-virtual {v5, v1, v6}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 256
    .local v4, "importedFile":Ljava/io/File;
    new-instance v5, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v5, v4}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    .line 270
    .end local v0    # "buildFile":Ljava/io/File;
    .end local v1    # "buildFileParent":Ljava/io/File;
    .end local v4    # "importedFile":Ljava/io/File;
    :goto_0
    return-object v5

    .line 260
    .restart local v0    # "buildFile":Ljava/io/File;
    :cond_0
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 261
    .local v2, "buildFileURL":Ljava/net/URL;
    new-instance v4, Ljava/net/URL;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    invoke-direct {v4, v2, v5}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 262
    .local v4, "importedFile":Ljava/net/URL;
    new-instance v5, Lorg/apache/tools/ant/types/resources/URLResource;

    invoke-direct {v5, v4}, Lorg/apache/tools/ant/types/resources/URLResource;-><init>(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 263
    .end local v2    # "buildFileURL":Ljava/net/URL;
    .end local v4    # "importedFile":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 264
    .local v3, "ex":Ljava/net/MalformedURLException;
    invoke-virtual {v3}, Ljava/net/MalformedURLException;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/ImportTask;->log(Ljava/lang/String;I)V

    .line 266
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "failed to resolve "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " relative to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 270
    .end local v0    # "buildFile":Ljava/io/File;
    .end local v3    # "ex":Ljava/net/MalformedURLException;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private importResource(Lorg/apache/tools/ant/ProjectHelper;Lorg/apache/tools/ant/types/Resource;)V
    .locals 13
    .param p1, "helper"    # Lorg/apache/tools/ant/ProjectHelper;
    .param p2, "importedResource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 169
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v2

    .line 171
    .local v2, "importStack":Ljava/util/Vector;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Importing file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " from "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {v10, v11, v12}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 174
    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v10

    if-nez v10, :cond_1

    .line 175
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Cannot find "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " imported from "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "message":Ljava/lang/String;
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->optional:Z

    if-eqz v10, :cond_0

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {v10, v4, v11}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 243
    .end local v4    # "message":Ljava/lang/String;
    :goto_0
    return-void

    .line 182
    .restart local v4    # "message":Ljava/lang/String;
    :cond_0
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 186
    .end local v4    # "message":Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    .line 187
    .local v3, "importedFile":Ljava/io/File;
    sget-object v10, Lorg/apache/tools/ant/taskdefs/ImportTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v10, :cond_4

    const-string/jumbo v10, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/ImportTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/ImportTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p2, v10}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 188
    .local v1, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v1, :cond_2

    .line 189
    invoke-interface {v1}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v3

    .line 192
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->isInIncludeMode()Z

    move-result v10

    if-nez v10, :cond_5

    invoke-virtual {v2, p2}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    if-eqz v3, :cond_5

    invoke-virtual {v2, v3}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 197
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Skipped already imported file:\n   "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {v10, v11, v12}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 187
    .end local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_4
    sget-object v10, Lorg/apache/tools/ant/taskdefs/ImportTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 205
    .restart local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_5
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentTargetPrefix()Ljava/lang/String;

    move-result-object v6

    .line 206
    .local v6, "oldPrefix":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->isInIncludeMode()Z

    move-result v5

    .line 207
    .local v5, "oldIncludeMode":Z
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelper;->getCurrentPrefixSeparator()Ljava/lang/String;

    move-result-object v7

    .line 210
    .local v7, "oldSep":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->isInIncludeMode()Z

    move-result v10

    if-eqz v10, :cond_6

    if-eqz v6, :cond_6

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->targetPrefix:Ljava/lang/String;

    if-eqz v10, :cond_6

    .line 212
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->targetPrefix:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 218
    .local v8, "prefix":Ljava/lang/String;
    :goto_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->prefixSeparator:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->isInIncludeMode()Z

    move-result v11

    invoke-static {v8, v10, v11}, Lorg/apache/tools/ant/taskdefs/ImportTask;->setProjectHelperProps(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 221
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v10

    invoke-virtual {v10, p2}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperForBuildFile(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/ProjectHelper;

    move-result-object v9

    .line 225
    .local v9, "subHelper":Lorg/apache/tools/ant/ProjectHelper;
    invoke-virtual {v9}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v10

    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 226
    invoke-virtual {v9}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v10

    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 227
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    const-string/jumbo v11, "ant.projectHelper"

    invoke-virtual {v10, v11, v9}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 229
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v9, v10, p2}, Lorg/apache/tools/ant/ProjectHelper;->parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)V

    .line 232
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    const-string/jumbo v11, "ant.projectHelper"

    invoke-virtual {v10, v11, p1}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 233
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/Vector;->clear()V

    .line 234
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v10

    invoke-virtual {v9}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 235
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 236
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v10

    invoke-virtual {v9}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    invoke-static {v6, v7, v5}, Lorg/apache/tools/ant/taskdefs/ImportTask;->setProjectHelperProps(Ljava/lang/String;Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 213
    .end local v8    # "prefix":Ljava/lang/String;
    .end local v9    # "subHelper":Lorg/apache/tools/ant/ProjectHelper;
    :cond_6
    :try_start_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->targetPrefix:Ljava/lang/String;

    if-eqz v10, :cond_7

    .line 214
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->targetPrefix:Ljava/lang/String;
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v8    # "prefix":Ljava/lang/String;
    goto :goto_2

    .line 216
    .end local v8    # "prefix":Ljava/lang/String;
    :cond_7
    move-object v8, v6

    .restart local v8    # "prefix":Ljava/lang/String;
    goto :goto_2

    .line 237
    .end local v8    # "prefix":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 238
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-static {v0, v10}, Lorg/apache/tools/ant/ProjectHelper;->addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;

    move-result-object v10

    throw v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 241
    .end local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v10

    invoke-static {v6, v7, v5}, Lorg/apache/tools/ant/taskdefs/ImportTask;->setProjectHelperProps(Ljava/lang/String;Ljava/lang/String;Z)V

    throw v10
.end method

.method private static setProjectHelperProps(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "prefix"    # Ljava/lang/String;
    .param p1, "prefixSep"    # Ljava/lang/String;
    .param p2, "inIncludeMode"    # Z

    .prologue
    .line 299
    invoke-static {p0}, Lorg/apache/tools/ant/ProjectHelper;->setCurrentTargetPrefix(Ljava/lang/String;)V

    .line 300
    invoke-static {p1}, Lorg/apache/tools/ant/ProjectHelper;->setCurrentPrefixSeparator(Ljava/lang/String;)V

    .line 301
    invoke-static {p2}, Lorg/apache/tools/ant/ProjectHelper;->setInIncludeMode(Z)V

    .line 302
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 124
    return-void
.end method

.method public execute()V
    .locals 7

    .prologue
    .line 127
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    if-nez v5, :cond_0

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 128
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "import requires file attribute or at least one nested resource"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 131
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v5

    if-eqz v5, :cond_1

    const-string/jumbo v5, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 133
    :cond_1
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "import only allowed as a top-level task"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 136
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    const-string/jumbo v6, "ant.projectHelper"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/ProjectHelper;

    .line 140
    .local v1, "helper":Lorg/apache/tools/ant/ProjectHelper;
    if-nez v1, :cond_3

    .line 142
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "import requires support in ProjectHelper"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 145
    :cond_3
    invoke-virtual {v1}, Lorg/apache/tools/ant/ProjectHelper;->getImportStack()Ljava/util/Vector;

    move-result-object v3

    .line 147
    .local v3, "importStack":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v5

    if-nez v5, :cond_4

    .line 150
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "import requires support in ProjectHelper"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 153
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    if-eqz v5, :cond_5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Location;->getFileName()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_6

    .line 154
    :cond_5
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Unable to get location of import task"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 157
    :cond_6
    new-instance v4, Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v4, v5, v6}, Lorg/apache/tools/ant/types/resources/Union;-><init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 158
    .local v4, "resourcesToImport":Lorg/apache/tools/ant/types/resources/Union;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getFileAttributeResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    .line 159
    .local v0, "fromFileAttribute":Lorg/apache/tools/ant/types/Resource;
    if-eqz v0, :cond_7

    .line 160
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 162
    :cond_7
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 163
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Resource;

    invoke-direct {p0, v1, v5}, Lorg/apache/tools/ant/taskdefs/ImportTask;->importResource(Lorg/apache/tools/ant/ProjectHelper;Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 165
    :cond_8
    return-void
.end method

.method protected final isInIncludeMode()Z
    .locals 2

    .prologue
    .line 288
    const-string/jumbo v0, "include"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ImportTask;->getTaskType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setAs(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->targetPrefix:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setFile(Ljava/lang/String;)V
    .locals 0
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->file:Ljava/lang/String;

    .line 96
    return-void
.end method

.method public setOptional(Z)V
    .locals 0
    .param p1, "optional"    # Z

    .prologue
    .line 84
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->optional:Z

    .line 85
    return-void
.end method

.method public setPrefixSeparator(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ImportTask;->prefixSeparator:Ljava/lang/String;

    .line 115
    return-void
.end method
