.class public Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;
.super Lorg/apache/tools/ant/Task;
.source "JarLibAvailableTask.java"


# instance fields
.field private final extensionFileSets:Ljava/util/Vector;

.field private libraryFile:Ljava/io/File;

.field private propertyName:Ljava/lang/String;

.field private requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 42
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->extensionFileSets:Ljava/util/Vector;

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
    .line 138
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    if-nez v1, :cond_0

    .line 139
    const-string/jumbo v0, "Extension element must be specified."

    .line 140
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Extension element must be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 143
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->extensionFileSets:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 144
    const-string/jumbo v0, "File attribute not specified."

    .line 145
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "File attribute not specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 147
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 148
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "File \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 149
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_3

    .line 152
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' is not a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 153
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 155
    .end local v0    # "message":Ljava/lang/String;
    :cond_3
    return-void
.end method


# virtual methods
.method public addConfiguredExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;)V
    .locals 3
    .param p1, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    .prologue
    .line 78
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    if-eqz v1, :cond_0

    .line 79
    const-string/jumbo v0, "Can not specify extension to search for multiple times."

    .line 81
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Can not specify extension to search for multiple times."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 83
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    .line 84
    return-void
.end method

.method public addConfiguredExtensionSet(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;)V
    .locals 1
    .param p1, "extensionSet"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->extensionFileSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public execute()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->validate()V

    .line 103
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->requiredExtension:Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v6

    .line 106
    .local v6, "test":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->extensionFileSets:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 107
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->extensionFileSets:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 108
    .local v4, "iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 109
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    .line 111
    .local v1, "extensionSet":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->toExtensions(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v2

    .line 113
    .local v2, "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v7, v2

    if-ge v3, v7, :cond_0

    .line 114
    aget-object v0, v2, v3

    .line 115
    .local v0, "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->isCompatibleWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 116
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->propertyName:Ljava/lang/String;

    const-string/jumbo v9, "true"

    invoke-virtual {v7, v8, v9}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 121
    .end local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v1    # "extensionSet":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;
    .end local v2    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v3    # "i":I
    .end local v4    # "iterator":Ljava/util/Iterator;
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->getManifest(Ljava/io/File;)Ljava/util/jar/Manifest;

    move-result-object v5

    .line 122
    .local v5, "manifest":Ljava/util/jar/Manifest;
    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->getAvailable(Ljava/util/jar/Manifest;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v2

    .line 123
    .restart local v2    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_1
    array-length v7, v2

    if-ge v3, v7, :cond_4

    .line 124
    aget-object v0, v2, v3

    .line 125
    .restart local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->isCompatibleWith(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 126
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->propertyName:Ljava/lang/String;

    const-string/jumbo v9, "true"

    invoke-virtual {v7, v8, v9}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 130
    .end local v0    # "extension":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v3    # "i":I
    .end local v5    # "manifest":Ljava/util/jar/Manifest;
    :cond_4
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 69
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->libraryFile:Ljava/io/File;

    .line 70
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibAvailableTask;->propertyName:Ljava/lang/String;

    .line 61
    return-void
.end method
