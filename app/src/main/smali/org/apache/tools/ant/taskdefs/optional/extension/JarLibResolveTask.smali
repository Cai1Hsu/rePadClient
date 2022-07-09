.class public Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;
.super Lorg/apache/tools/ant/Task;
.source "JarLibResolveTask.java"


# instance fields
.field private checkExtension:Z

.field private failOnError:Z

.field private propertyName:Ljava/lang/String;

.field private requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

.field private final resolvers:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    .line 59
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->checkExtension:Z

    .line 66
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->failOnError:Z

    return-void
.end method

.method private checkExtension(Ljava/io/File;)V
    .locals 9
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v8, 0x3

    .line 211
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 212
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "File "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " does not exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 214
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v5

    if-nez v5, :cond_1

    .line 215
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "File "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " is not a file"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 217
    :cond_1
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->checkExtension:Z

    if-nez v5, :cond_2

    .line 218
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Setting property to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " without verifying library satisfies extension"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 220
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->setLibraryProperty(Ljava/io/File;)V

    .line 238
    :goto_0
    return-void

    .line 222
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Checking file "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " to see if it satisfies extension"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 224
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->getManifest(Ljava/io/File;)Ljava/util/jar/Manifest;

    move-result-object v3

    .line 225
    .local v3, "manifest":Ljava/util/jar/Manifest;
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getAvailable(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    .line 226
    .local v1, "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v1

    if-ge v2, v5, :cond_4

    .line 227
    aget-object v0, v1, v2

    .line 228
    .local v0, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->isCompatibleWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 229
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->setLibraryProperty(Ljava/io/File;)V

    goto :goto_0

    .line 226
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 233
    .end local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    :cond_4
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "File "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " skipped as it "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "does not satisfy extension"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 235
    .local v4, "message":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5, v4, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 236
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private missingExtension()V
    .locals 4

    .prologue
    .line 195
    const-string/jumbo v0, "Unable to resolve extension to a file"

    .line 196
    .local v0, "message":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->failOnError:Z

    if-eqz v1, :cond_0

    .line 197
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unable to resolve extension to a file"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 199
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "Unable to resolve extension to a file"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 200
    return-void
.end method

.method private setLibraryProperty(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 248
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->propertyName:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 257
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->propertyName:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 258
    const-string/jumbo v0, "Property attribute must be specified."

    .line 259
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Property attribute must be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 262
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    if-nez v1, :cond_1

    .line 263
    const-string/jumbo v0, "Extension element must be specified."

    .line 264
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Extension element must be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 266
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method public addConfiguredAnt(Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;)V
    .locals 1
    .param p1, "ant"    # Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method public addConfiguredExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;)V
    .locals 3
    .param p1, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    .prologue
    .line 133
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    if-eqz v1, :cond_0

    .line 134
    const-string/jumbo v0, "Can not specify extension to resolve multiple times."

    .line 136
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Can not specify extension to resolve multiple times."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .line 139
    return-void
.end method

.method public addConfiguredLocation(Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;)V
    .locals 1
    .param p1, "loc"    # Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/LocationResolver;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    return-void
.end method

.method public addConfiguredUrl(Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;)V
    .locals 1
    .param p1, "url"    # Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver;

    .prologue
    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method

.method public execute()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x1

    .line 147
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->validate()V

    .line 149
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Resolving extension: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v11}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->propertyName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "candidate":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 154
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Property Already set to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 155
    .local v4, "message":Ljava/lang/String;
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->failOnError:Z

    if-eqz v7, :cond_0

    .line 156
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 158
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v4, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 187
    .end local v4    # "message":Ljava/lang/String;
    :goto_0
    return-void

    .line 162
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 163
    .local v6, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v6, :cond_2

    .line 164
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->resolvers:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;

    .line 167
    .local v5, "resolver":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Searching for extension using Resolver:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v11}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 171
    :try_start_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-interface {v5, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;->resolve(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Lorg/apache/tools/ant/Project;)Ljava/io/File;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 173
    .local v2, "file":Ljava/io/File;
    :try_start_1
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->checkExtension(Ljava/io/File;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    :try_start_2
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "File "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " returned by "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "resolver failed to satisfy extension due to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 178
    .restart local v4    # "message":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v4, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_1

    .line 163
    .end local v2    # "file":Ljava/io/File;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 180
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v4    # "message":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 181
    .restart local v0    # "be":Lorg/apache/tools/ant/BuildException;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to resolve extension to file using resolver "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " due to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 183
    .restart local v4    # "message":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v7, v4, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 186
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v4    # "message":Ljava/lang/String;
    .end local v5    # "resolver":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->missingExtension()V

    goto/16 :goto_0
.end method

.method public setCheckExtension(Z)V
    .locals 0
    .param p1, "checkExtension"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->checkExtension:Z

    .line 87
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->failOnError:Z

    .line 96
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibResolveTask;->propertyName:Ljava/lang/String;

    .line 77
    return-void
.end method
