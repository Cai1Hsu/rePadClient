.class public final Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;
.super Lorg/apache/tools/ant/Task;
.source "JarLibManifestTask.java"


# static fields
.field private static final CREATED_BY:Ljava/lang/String; = "Created-By"

.field private static final MANIFEST_VERSION:Ljava/lang/String; = "1.0"


# instance fields
.field private final dependencies:Ljava/util/ArrayList;

.field private destFile:Ljava/io/File;

.field private extension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

.field private final extraAttributes:Ljava/util/ArrayList;

.field private final optionals:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->dependencies:Ljava/util/ArrayList;

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->optionals:Ljava/util/ArrayList;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extraAttributes:Ljava/util/ArrayList;

    return-void
.end method

.method private appendExtensionList(Ljava/util/jar/Attributes;Ljava/util/jar/Attributes$Name;Ljava/lang/String;I)V
    .locals 3
    .param p1, "attributes"    # Ljava/util/jar/Attributes;
    .param p2, "extensionKey"    # Ljava/util/jar/Attributes$Name;
    .param p3, "listPrefix"    # Ljava/lang/String;
    .param p4, "size"    # I

    .prologue
    .line 265
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 266
    .local v1, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 267
    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 268
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 269
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 266
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 273
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    return-void
.end method

.method private appendExtraAttributes(Ljava/util/jar/Attributes;)V
    .locals 4
    .param p1, "attributes"    # Ljava/util/jar/Attributes;

    .prologue
    .line 199
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extraAttributes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 200
    .local v1, "iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 201
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;

    .line 203
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 206
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;
    :cond_0
    return-void
.end method

.method private appendLibraryList(Ljava/util/jar/Attributes;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 6
    .param p1, "attributes"    # Ljava/util/jar/Attributes;
    .param p2, "listPrefix"    # Ljava/lang/String;
    .param p3, "extensions"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 244
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 245
    .local v3, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 246
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .line 247
    .local v0, "ext":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 248
    .local v2, "prefix":Ljava/lang/String;
    invoke-static {v0, v2, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Ljava/lang/String;Ljava/util/jar/Attributes;)V

    .line 245
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 250
    .end local v0    # "ext":Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private toExtensions(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "extensionSets"    # Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 283
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 285
    .local v3, "results":Ljava/util/ArrayList;
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 286
    .local v5, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v5, :cond_1

    .line 287
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    .line 288
    .local v4, "set":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->toExtensions(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    .line 289
    .local v0, "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    array-length v6, v0

    if-ge v2, v6, :cond_0

    .line 290
    aget-object v6, v0, v2

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 286
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 293
    .end local v0    # "extensions":[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .end local v2    # "j":I
    .end local v4    # "set":Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;
    :cond_1
    return-object v3
.end method

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 185
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Destfile attribute not specified."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 187
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_1

    .line 188
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is not a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_1
    return-void
.end method

.method private writeManifest(Ljava/util/jar/Manifest;)V
    .locals 4
    .param p1, "manifest"    # Ljava/util/jar/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    const/4 v0, 0x0

    .line 217
    .local v0, "output":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    .end local v0    # "output":Ljava/io/FileOutputStream;
    .local v1, "output":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {p1, v1}, Ljava/util/jar/Manifest;->write(Ljava/io/OutputStream;)V

    .line 219
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 221
    if-eqz v1, :cond_0

    .line 223
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 221
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v0    # "output":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v2

    :goto_1
    if-eqz v0, :cond_1

    .line 223
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 221
    :cond_1
    :goto_2
    throw v2

    .line 224
    :catch_0
    move-exception v3

    goto :goto_2

    .end local v0    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v2

    goto :goto_0

    .line 221
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v0    # "output":Ljava/io/FileOutputStream;
    goto :goto_1
.end method


# virtual methods
.method public addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;)V
    .locals 1
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extraAttributes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    return-void
.end method

.method public addConfiguredDepends(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;)V
    .locals 1
    .param p1, "extensionSet"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method

.method public addConfiguredExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;)V
    .locals 2
    .param p1, "extensionAdapter"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    if-eqz v0, :cond_0

    .line 106
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can not have multiple extensions defined in one library."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;->toExtension()Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    .line 109
    return-void
.end method

.method public addConfiguredOptions(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;)V
    .locals 1
    .param p1, "extensionSet"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    .prologue
    .line 126
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->optionals:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    return-void
.end method

.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 144
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->validate()V

    .line 146
    new-instance v3, Ljava/util/jar/Manifest;

    invoke-direct {v3}, Ljava/util/jar/Manifest;-><init>()V

    .line 147
    .local v3, "manifest":Ljava/util/jar/Manifest;
    invoke-virtual {v3}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v0

    .line 149
    .local v0, "attributes":Ljava/util/jar/Attributes;
    sget-object v5, Ljava/util/jar/Attributes$Name;->MANIFEST_VERSION:Ljava/util/jar/Attributes$Name;

    const-string/jumbo v6, "1.0"

    invoke-virtual {v0, v5, v6}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    const-string/jumbo v5, "Created-By"

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Apache Ant "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    const-string/jumbo v8, "ant.version"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 153
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->appendExtraAttributes(Ljava/util/jar/Attributes;)V

    .line 155
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    if-eqz v5, :cond_0

    .line 156
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->extension:Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-static {v5, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Ljava/util/jar/Attributes;)V

    .line 160
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->dependencies:Ljava/util/ArrayList;

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->toExtensions(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .line 161
    .local v1, "depends":Ljava/util/ArrayList;
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    const-string/jumbo v6, "lib"

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {p0, v0, v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->appendExtensionList(Ljava/util/jar/Attributes;Ljava/util/jar/Attributes$Name;Ljava/lang/String;I)V

    .line 162
    const-string/jumbo v5, "lib"

    invoke-direct {p0, v0, v5, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->appendLibraryList(Ljava/util/jar/Attributes;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 166
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->optionals:Ljava/util/ArrayList;

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->toExtensions(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v4

    .line 167
    .local v4, "option":Ljava/util/ArrayList;
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;->OPTIONAL_EXTENSION_LIST:Ljava/util/jar/Attributes$Name;

    const-string/jumbo v6, "opt"

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {p0, v0, v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->appendExtensionList(Ljava/util/jar/Attributes;Ljava/util/jar/Attributes$Name;Ljava/lang/String;I)V

    .line 168
    const-string/jumbo v5, "opt"

    invoke-direct {p0, v0, v5, v4}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->appendLibraryList(Ljava/util/jar/Attributes;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 171
    :try_start_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Generating manifest "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->log(Ljava/lang/String;I)V

    .line 172
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->writeManifest(Ljava/util/jar/Manifest;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    return-void

    .line 173
    :catch_0
    move-exception v2

    .line 174
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "destFile"    # Ljava/io/File;

    .prologue
    .line 92
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask;->destFile:Ljava/io/File;

    .line 93
    return-void
.end method
