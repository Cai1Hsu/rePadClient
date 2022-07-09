.class public abstract Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;
.super Lorg/apache/tools/ant/Task;
.source "AbstractJarSignerTask.java"


# static fields
.field public static final ERROR_NO_SOURCE:Ljava/lang/String; = "jar must be set through jar attribute or nested filesets"

.field protected static final JARSIGNER_COMMAND:Ljava/lang/String; = "jarsigner"


# instance fields
.field protected alias:Ljava/lang/String;

.field private executable:Ljava/lang/String;

.field protected filesets:Ljava/util/Vector;

.field protected jar:Ljava/io/File;

.field protected keypass:Ljava/lang/String;

.field protected keystore:Ljava/lang/String;

.field protected maxMemory:Ljava/lang/String;

.field private path:Lorg/apache/tools/ant/types/Path;

.field private redirector:Lorg/apache/tools/ant/types/RedirectorElement;

.field protected storepass:Ljava/lang/String;

.field protected storetype:Ljava/lang/String;

.field private sysProperties:Lorg/apache/tools/ant/types/Environment;

.field protected verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 77
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->filesets:Ljava/util/Vector;

    .line 93
    new-instance v0, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->sysProperties:Lorg/apache/tools/ant/types/Environment;

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    return-void
.end method

.method private createRedirector()Lorg/apache/tools/ant/types/RedirectorElement;
    .locals 7

    .prologue
    const/16 v6, 0xa

    .line 241
    new-instance v2, Lorg/apache/tools/ant/types/RedirectorElement;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/RedirectorElement;-><init>()V

    .line 242
    .local v2, "result":Lorg/apache/tools/ant/types/RedirectorElement;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storepass:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 243
    new-instance v4, Ljava/lang/StringBuffer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storepass:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    .line 244
    .local v1, "input":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keypass:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 245
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keypass:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 247
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/RedirectorElement;->setInputString(Ljava/lang/String;)V

    .line 248
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/RedirectorElement;->setLogInputString(Z)V

    .line 250
    new-instance v0, Lorg/apache/tools/ant/filters/LineContainsRegExp;

    invoke-direct {v0}, Lorg/apache/tools/ant/filters/LineContainsRegExp;-><init>()V

    .line 251
    .local v0, "filter":Lorg/apache/tools/ant/filters/LineContainsRegExp;
    new-instance v3, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    .line 253
    .local v3, "rx":Lorg/apache/tools/ant/types/RegularExpression;
    const-string/jumbo v4, "^(Enter Passphrase for keystore: |Enter key password for .+: )$"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 254
    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->addConfiguredRegexp(Lorg/apache/tools/ant/types/RegularExpression;)V

    .line 255
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/filters/LineContainsRegExp;->setNegate(Z)V

    .line 256
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/RedirectorElement;->createErrorFilterChain()Lorg/apache/tools/ant/types/FilterChain;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/types/FilterChain;->addLineContainsRegExp(Lorg/apache/tools/ant/filters/LineContainsRegExp;)V

    .line 258
    .end local v0    # "filter":Lorg/apache/tools/ant/filters/LineContainsRegExp;
    .end local v1    # "input":Ljava/lang/StringBuffer;
    .end local v3    # "rx":Lorg/apache/tools/ant/types/RegularExpression;
    :cond_1
    return-object v2
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 196
    return-void
.end method

.method public addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->sysProperties:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 205
    return-void
.end method

.method protected addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/taskdefs/ExecTask;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 408
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 409
    return-void
.end method

.method protected beginExecution()V
    .locals 1

    .prologue
    .line 225
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->createRedirector()Lorg/apache/tools/ant/types/RedirectorElement;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->redirector:Lorg/apache/tools/ant/types/RedirectorElement;

    .line 226
    return-void
.end method

.method protected bindToKeystore(Lorg/apache/tools/ant/taskdefs/ExecTask;)V
    .locals 4
    .param p1, "cmd"    # Lorg/apache/tools/ant/taskdefs/ExecTask;

    .prologue
    .line 319
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keystore:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 321
    const-string/jumbo v2, "-keystore"

    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 323
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keystore:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 324
    .local v0, "keystoreFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 325
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 330
    .local v1, "loc":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p1, v1}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 332
    .end local v0    # "keystoreFile":Ljava/io/File;
    .end local v1    # "loc":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storetype:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 333
    const-string/jumbo v2, "-storetype"

    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 334
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storetype:Ljava/lang/String;

    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 336
    :cond_1
    return-void

    .line 328
    .restart local v0    # "keystoreFile":Ljava/io/File;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keystore:Ljava/lang/String;

    .restart local v1    # "loc":Ljava/lang/String;
    goto :goto_0
.end method

.method protected createJarSigner()Lorg/apache/tools/ant/taskdefs/ExecTask;
    .locals 2

    .prologue
    .line 344
    new-instance v0, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 345
    .local v0, "cmd":Lorg/apache/tools/ant/taskdefs/ExecTask;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->executable:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 346
    const-string/jumbo v1, "jarsigner"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 350
    :goto_0
    const-string/jumbo v1, "jarsigner"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setTaskType(Ljava/lang/String;)V

    .line 351
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setFailonerror(Z)V

    .line 352
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->redirector:Lorg/apache/tools/ant/types/RedirectorElement;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->addConfiguredRedirector(Lorg/apache/tools/ant/types/RedirectorElement;)V

    .line 353
    return-object v0

    .line 348
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->executable:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 215
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    .line 217
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected createUnifiedSourcePath()Lorg/apache/tools/ant/types/Path;
    .locals 4

    .prologue
    .line 384
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v3, :cond_0

    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 385
    .local v1, "p":Lorg/apache/tools/ant/types/Path;
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->createUnifiedSources()Ljava/util/Vector;

    move-result-object v2

    .line 386
    .local v2, "s":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 387
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 388
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_1

    .line 384
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "p":Lorg/apache/tools/ant/types/Path;
    .end local v2    # "s":Ljava/util/Vector;
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Path;

    move-object v1, v3

    goto :goto_0

    .line 390
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v1    # "p":Lorg/apache/tools/ant/types/Path;
    .restart local v2    # "s":Ljava/util/Vector;
    :cond_1
    return-object v1
.end method

.method protected createUnifiedSources()Ljava/util/Vector;
    .locals 3

    .prologue
    .line 362
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Vector;

    .line 363
    .local v1, "sources":Ljava/util/Vector;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->jar:Ljava/io/File;

    if-eqz v2, :cond_0

    .line 367
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 368
    .local v0, "sourceJar":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 369
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->jar:Ljava/io/File;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/FileSet;->setFile(Ljava/io/File;)V

    .line 370
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->jar:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 371
    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 373
    .end local v0    # "sourceJar":Lorg/apache/tools/ant/types/FileSet;
    :cond_0
    return-object v1
.end method

.method protected declareSysProperty(Lorg/apache/tools/ant/taskdefs/ExecTask;Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/taskdefs/ExecTask;
    .param p2, "property"    # Lorg/apache/tools/ant/types/Environment$Variable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 310
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-J-D"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Environment$Variable;->getContent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 311
    return-void
.end method

.method protected endExecution()V
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->redirector:Lorg/apache/tools/ant/types/RedirectorElement;

    .line 233
    return-void
.end method

.method public getRedirector()Lorg/apache/tools/ant/types/RedirectorElement;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->redirector:Lorg/apache/tools/ant/types/RedirectorElement;

    return-object v0
.end method

.method protected hasResources()Z
    .locals 1

    .prologue
    .line 399
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlias(Ljava/lang/String;)V
    .locals 0
    .param p1, "alias"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->alias:Ljava/lang/String;

    .line 141
    return-void
.end method

.method protected setCommonOptions(Lorg/apache/tools/ant/taskdefs/ExecTask;)V
    .locals 5
    .param p1, "cmd"    # Lorg/apache/tools/ant/taskdefs/ExecTask;

    .prologue
    .line 285
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->maxMemory:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 286
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-J-Xmx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->maxMemory:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 289
    :cond_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->verbose:Z

    if-eqz v3, :cond_1

    .line 290
    const-string/jumbo v3, "-verbose"

    invoke-virtual {p0, p1, v3}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 294
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->sysProperties:Lorg/apache/tools/ant/types/Environment;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment;->getVariablesVector()Ljava/util/Vector;

    move-result-object v1

    .line 295
    .local v1, "props":Ljava/util/Vector;
    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 296
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 297
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Environment$Variable;

    .line 298
    .local v2, "variable":Lorg/apache/tools/ant/types/Environment$Variable;
    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->declareSysProperty(Lorg/apache/tools/ant/taskdefs/ExecTask;Lorg/apache/tools/ant/types/Environment$Variable;)V

    goto :goto_0

    .line 300
    .end local v2    # "variable":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_2
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 0
    .param p1, "executable"    # Ljava/lang/String;

    .prologue
    .line 277
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->executable:Ljava/lang/String;

    .line 278
    return-void
.end method

.method public setJar(Ljava/io/File;)V
    .locals 0
    .param p1, "jar"    # Ljava/io/File;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->jar:Ljava/io/File;

    .line 132
    return-void
.end method

.method public setKeypass(Ljava/lang/String;)V
    .locals 0
    .param p1, "keypass"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keypass:Ljava/lang/String;

    .line 177
    return-void
.end method

.method public setKeystore(Ljava/lang/String;)V
    .locals 0
    .param p1, "keystore"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->keystore:Ljava/lang/String;

    .line 150
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 0
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->maxMemory:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public setStorepass(Ljava/lang/String;)V
    .locals 0
    .param p1, "storepass"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storepass:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setStoretype(Ljava/lang/String;)V
    .locals 0
    .param p1, "storetype"    # Ljava/lang/String;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->storetype:Ljava/lang/String;

    .line 168
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 185
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;->verbose:Z

    .line 186
    return-void
.end method
