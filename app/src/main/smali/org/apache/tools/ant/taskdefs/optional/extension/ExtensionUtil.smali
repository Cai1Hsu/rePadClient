.class public final Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;
.super Ljava/lang/Object;
.source "ExtensionUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method private static addExtension(Ljava/util/List;Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;ZZ)V
    .locals 11
    .param p0, "extensionList"    # Ljava/util/List;
    .param p1, "originalExtension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .param p2, "includeImpl"    # Z
    .param p3, "includeURL"    # Z

    .prologue
    .line 161
    move-object v9, p1

    .line 162
    .local v9, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    if-nez p3, :cond_3

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationURL()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 164
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtensionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendor()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendorID()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .end local v9    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .local v0, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :goto_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationURL()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendorID()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationVendor()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    :cond_0
    const/4 v10, 0x1

    .line 180
    .local v10, "hasImplAttributes":Z
    :goto_1
    if-nez p2, :cond_1

    if-eqz v10, :cond_1

    .line 181
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getExtensionName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getSpecificationVendor()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getImplementationURL()Ljava/lang/String;

    move-result-object v8

    invoke-direct/range {v1 .. v8}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .end local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .local v1, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    move-object v0, v1

    .line 191
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .restart local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :cond_1
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    return-void

    .line 174
    .end local v10    # "hasImplAttributes":Z
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .end local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .restart local v9    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :cond_3
    move-object v0, v9

    .end local v9    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .restart local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    goto :goto_0
.end method

.method static extractExtensions(Lorg/apache/tools/ant/Project;Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "libraries"    # Ljava/util/List;
    .param p2, "fileset"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 78
    invoke-static {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->getExtensions(Lorg/apache/tools/ant/Project;Ljava/util/List;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    .line 80
    .local v0, "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 81
    aget-object v2, v0, v1

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 84
    .end local v0    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private static getExtensions(Lorg/apache/tools/ant/Project;Ljava/util/List;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 12
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "libraries"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v1, "extensions":Ljava/util/ArrayList;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 98
    .local v8, "iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 99
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/FileSet;

    .line 101
    .local v3, "fileSet":Lorg/apache/tools/ant/types/FileSet;
    const/4 v6, 0x1

    .line 102
    .local v6, "includeImpl":Z
    const/4 v7, 0x1

    .line 104
    .local v7, "includeURL":Z
    instance-of v11, v3, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;

    if-eqz v11, :cond_1

    move-object v9, v3

    .line 105
    check-cast v9, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;

    .line 106
    .local v9, "libFileSet":Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->isIncludeImpl()Z

    move-result v6

    .line 107
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;->isIncludeURL()Z

    move-result v7

    .line 110
    .end local v9    # "libFileSet":Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;
    :cond_1
    invoke-virtual {v3, p0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v10

    .line 111
    .local v10, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v10}, Lorg/apache/tools/ant/DirectoryScanner;->getBasedir()Ljava/io/File;

    move-result-object v0

    .line 112
    .local v0, "basedir":Ljava/io/File;
    invoke-virtual {v10}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v4

    .line 113
    .local v4, "files":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v11, v4

    if-ge v5, v11, :cond_0

    .line 114
    new-instance v2, Ljava/io/File;

    aget-object v11, v4, v5

    invoke-direct {v2, v0, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 115
    .local v2, "file":Ljava/io/File;
    invoke-static {v2, v1, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->loadExtensions(Ljava/io/File;Ljava/util/List;ZZ)V

    .line 113
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 118
    .end local v0    # "basedir":Ljava/io/File;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fileSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v4    # "files":[Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "includeImpl":Z
    .end local v7    # "includeURL":Z
    .end local v10    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v11

    new-array v11, v11, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    return-object v11
.end method

.method static getManifest(Ljava/io/File;)Ljava/util/jar/Manifest;
    .locals 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 205
    :try_start_0
    new-instance v1, Ljava/util/jar/JarFile;

    invoke-direct {v1, p0}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V

    .line 206
    .local v1, "jarFile":Ljava/util/jar/JarFile;
    invoke-virtual {v1}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v2

    .line 207
    .local v2, "m":Ljava/util/jar/Manifest;
    if-nez v2, :cond_0

    .line 208
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " doesn\'t have a MANIFEST"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .end local v1    # "jarFile":Ljava/util/jar/JarFile;
    .end local v2    # "m":Ljava/util/jar/Manifest;
    :catch_0
    move-exception v0

    .line 212
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 210
    .end local v0    # "ioe":Ljava/io/IOException;
    .restart local v1    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v2    # "m":Ljava/util/jar/Manifest;
    :cond_0
    return-object v2
.end method

.method private static loadExtensions(Ljava/io/File;Ljava/util/List;ZZ)V
    .locals 7
    .param p0, "file"    # Ljava/io/File;
    .param p1, "extensionList"    # Ljava/util/List;
    .param p2, "includeImpl"    # Z
    .param p3, "includeURL"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 134
    :try_start_0
    new-instance v4, Ljava/util/jar/JarFile;

    invoke-direct {v4, p0}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V

    .line 135
    .local v4, "jarFile":Ljava/util/jar/JarFile;
    invoke-virtual {v4}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getAvailable(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v2

    .line 137
    .local v2, "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v2

    if-ge v3, v5, :cond_0

    .line 138
    aget-object v1, v2, v3

    .line 139
    .local v1, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-static {p1, v1, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->addExtension(Ljava/util/List;Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;ZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 141
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v3    # "i":I
    .end local v4    # "jarFile":Ljava/util/jar/JarFile;
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 144
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .restart local v3    # "i":I
    .restart local v4    # "jarFile":Ljava/util/jar/JarFile;
    :cond_0
    return-void
.end method

.method static toExtensions(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 5
    .param p0, "adapters"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 53
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .local v3, "results":Ljava/util/ArrayList;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    .line 56
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 57
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    .line 59
    .local v0, "adapter":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    .line 60
    .local v1, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 63
    .end local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;
    .end local v1    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :cond_0
    return-object v3
.end method
