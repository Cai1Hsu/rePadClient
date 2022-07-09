.class public Lorg/apache/tools/ant/taskdefs/ManifestClassPath;
.super Lorg/apache/tools/ant/Task;
.source "ManifestClassPath.java"


# instance fields
.field private dir:Ljava/io/File;

.field private maxParentLevels:I

.field private name:Ljava/lang/String;

.field private path:Lorg/apache/tools/ant/types/Path;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 45
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->maxParentLevels:I

    return-void
.end method


# virtual methods
.method public addClassPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->path:Lorg/apache/tools/ant/types/Path;

    .line 175
    return-void
.end method

.method public execute()V
    .locals 15

    .prologue
    const/16 v14, 0x2f

    .line 56
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->name:Ljava/lang/String;

    if-nez v12, :cond_0

    .line 57
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "Missing \'property\' attribute!"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 59
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    if-nez v12, :cond_1

    .line 60
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "Missing \'jarfile\' attribute!"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 62
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_2

    .line 63
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Property \'"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "\' already set!"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 65
    :cond_2
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v12, :cond_3

    .line 66
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "Missing nested <classpath>!"

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 69
    :cond_3
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    .line 70
    .local v11, "tooLongSb":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->maxParentLevels:I

    add-int/lit8 v12, v12, 0x1

    if-ge v7, v12, :cond_4

    .line 71
    const-string/jumbo v12, "../"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 70
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 73
    :cond_4
    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 76
    .local v10, "tooLongPrefix":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v5

    .line 77
    .local v5, "fileUtils":Lorg/apache/tools/ant/util/FileUtils;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v5, v12}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v12

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    .line 79
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "elements":[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 81
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v7, 0x0

    :goto_1
    array-length v12, v3

    if-ge v7, v12, :cond_9

    .line 83
    new-instance v8, Ljava/io/File;

    aget-object v12, v3, v7

    invoke-direct {v8, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    .local v8, "pathEntry":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    .line 85
    .local v6, "fullPath":Ljava/lang/String;
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    .line 87
    const/4 v9, 0x0

    .line 88
    .local v9, "relPath":Ljava/lang/String;
    const/4 v1, 0x0

    .line 90
    .local v1, "canonicalPath":Ljava/lang/String;
    :try_start_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    invoke-static {v12, v8}, Lorg/apache/tools/ant/util/FileUtils;->getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v9

    .line 92
    invoke-virtual {v8}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    .line 94
    sget-char v12, Ljava/io/File;->separatorChar:C

    if-eq v12, v14, :cond_5

    .line 95
    sget-char v12, Ljava/io/File;->separatorChar:C

    const/16 v13, 0x2f

    invoke-virtual {v1, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 105
    :cond_5
    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 107
    :cond_6
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "No suitable relative path from "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " to "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 98
    :catch_0
    move-exception v2

    .line 99
    .local v2, "e":Ljava/lang/Exception;
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "error trying to get the relative path from "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " to "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 112
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_7
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-eqz v12, :cond_8

    const-string/jumbo v12, "/"

    invoke-virtual {v9, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_8

    .line 113
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v14}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 116
    :cond_8
    :try_start_1
    invoke-static {v9}, Lorg/apache/tools/ant/launch/Locator;->encodeURI(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v9

    .line 123
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    const/16 v12, 0x20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 81
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1

    .line 117
    :catch_1
    move-exception v4

    .line 118
    .local v4, "exc":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v12, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 128
    .end local v1    # "canonicalPath":Ljava/lang/String;
    .end local v4    # "exc":Ljava/io/UnsupportedEncodingException;
    .end local v6    # "fullPath":Ljava/lang/String;
    .end local v8    # "pathEntry":Ljava/io/File;
    .end local v9    # "relPath":Ljava/lang/String;
    :cond_9
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public setJarFile(Ljava/io/File;)V
    .locals 4
    .param p1, "jarfile"    # Ljava/io/File;

    .prologue
    .line 147
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 148
    .local v0, "parent":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Jar\'s directory not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    :cond_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->dir:Ljava/io/File;

    .line 152
    return-void
.end method

.method public setMaxParentLevels(I)V
    .locals 2
    .param p1, "levels"    # I

    .prologue
    .line 161
    if-gez p1, :cond_0

    .line 162
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "maxParentLevels must not be a negative number"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_0
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->maxParentLevels:I

    .line 166
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 137
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ManifestClassPath;->name:Ljava/lang/String;

    .line 138
    return-void
.end method
