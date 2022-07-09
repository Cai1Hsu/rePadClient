.class public Lorg/apache/tools/ant/helper/AntXMLContext;
.super Ljava/lang/Object;
.source "AntXMLContext.java"


# instance fields
.field private buildFile:Ljava/io/File;

.field private buildFileParent:Ljava/io/File;

.field private buildFileParentURL:Ljava/net/URL;

.field private buildFileURL:Ljava/net/URL;

.field private currentProjectName:Ljava/lang/String;

.field private currentTarget:Lorg/apache/tools/ant/Target;

.field private currentTargets:Ljava/util/Map;

.field private ignoreProjectTag:Z

.field private implicitTarget:Lorg/apache/tools/ant/Target;

.field private locator:Lorg/xml/sax/Locator;

.field private prefixMapping:Ljava/util/Map;

.field private project:Lorg/apache/tools/ant/Project;

.field private targetVector:Ljava/util/Vector;

.field private wStack:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v1, 0x0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->targetVector:Ljava/util/Vector;

    .line 86
    new-instance v0, Lorg/apache/tools/ant/Target;

    invoke-direct {v0}, Lorg/apache/tools/ant/Target;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    .line 90
    iput-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTarget:Lorg/apache/tools/ant/Target;

    .line 95
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    .line 101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->ignoreProjectTag:Z

    .line 104
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->prefixMapping:Ljava/util/Map;

    .line 108
    iput-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTargets:Ljava/util/Map;

    .line 115
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->project:Lorg/apache/tools/ant/Project;

    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->targetVector:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 119
    return-void
.end method


# virtual methods
.method public addTarget(Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->targetVector:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 266
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTarget:Lorg/apache/tools/ant/Target;

    .line 267
    return-void
.end method

.method public configureId(Ljava/lang/Object;Lorg/xml/sax/Attributes;)V
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "attr"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 320
    const-string/jumbo v1, "id"

    invoke-interface {p2, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 322
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v1, v0, p1}, Lorg/apache/tools/ant/Project;->addIdReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 324
    :cond_0
    return-void
.end method

.method public currentWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    .line 218
    const/4 v0, 0x0

    .line 220
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/RuntimeConfigurable;

    goto :goto_0
.end method

.method public endPrefixMapping(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 379
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->prefixMapping:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 380
    .local v0, "list":Ljava/util/List;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 384
    :cond_0
    :goto_0
    return-void

    .line 383
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0
.end method

.method public getBuildFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFile:Ljava/io/File;

    return-object v0
.end method

.method public getBuildFileParent()Ljava/io/File;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileParent:Ljava/io/File;

    return-object v0
.end method

.method public getBuildFileParentURL()Ljava/net/URL;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileParentURL:Ljava/net/URL;

    return-object v0
.end method

.method public getBuildFileURL()Ljava/net/URL;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileURL:Ljava/net/URL;

    return-object v0
.end method

.method public getCurrentProjectName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentProjectName:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentTarget()Lorg/apache/tools/ant/Target;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTarget:Lorg/apache/tools/ant/Target;

    return-object v0
.end method

.method public getCurrentTargets()Ljava/util/Map;
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTargets:Ljava/util/Map;

    return-object v0
.end method

.method public getImplicitTarget()Lorg/apache/tools/ant/Target;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    return-object v0
.end method

.method public getLocator()Lorg/xml/sax/Locator;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method public getPrefixMapping(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 393
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->prefixMapping:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 394
    .local v0, "list":Ljava/util/List;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 395
    :cond_0
    const/4 v1, 0x0

    .line 397
    :goto_0
    return-object v1

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getTargets()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->targetVector:Ljava/util/Vector;

    return-object v0
.end method

.method public getWrapperStack()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    return-object v0
.end method

.method public isIgnoringProjectTag()Z
    .locals 1

    .prologue
    .line 347
    iget-boolean v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->ignoreProjectTag:Z

    return v0
.end method

.method public parentWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 2

    .prologue
    .line 229
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 230
    const/4 v0, 0x0

    .line 232
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/RuntimeConfigurable;

    goto :goto_0
.end method

.method public popWrapper()V
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 250
    :cond_0
    return-void
.end method

.method public pushWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 1
    .param p1, "wrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->wStack:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 241
    return-void
.end method

.method public setBuildFile(Ljava/io/File;)V
    .locals 4
    .param p1, "buildFile"    # Ljava/io/File;

    .prologue
    .line 126
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFile:Ljava/io/File;

    .line 127
    if-eqz p1, :cond_0

    .line 128
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileParent:Ljava/io/File;

    .line 129
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    new-instance v2, Lorg/apache/tools/ant/Location;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Target;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 131
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/helper/AntXMLContext;->setBuildFile(Ljava/net/URL;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v0

    .line 133
    .local v0, "ex":Ljava/net/MalformedURLException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 136
    .end local v0    # "ex":Ljava/net/MalformedURLException;
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileParent:Ljava/io/File;

    goto :goto_0
.end method

.method public setBuildFile(Ljava/net/URL;)V
    .locals 3
    .param p1, "buildFile"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileURL:Ljava/net/URL;

    .line 147
    new-instance v0, Ljava/net/URL;

    const-string/jumbo v1, "."

    invoke-direct {v0, p1, v1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->buildFileParentURL:Ljava/net/URL;

    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Target;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v0

    if-nez v0, :cond_0

    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    new-instance v1, Lorg/apache/tools/ant/Location;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 151
    :cond_0
    return-void
.end method

.method public setCurrentProjectName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentProjectName:Ljava/lang/String;

    .line 209
    return-void
.end method

.method public setCurrentTarget(Lorg/apache/tools/ant/Target;)V
    .locals 0
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 290
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTarget:Lorg/apache/tools/ant/Target;

    .line 291
    return-void
.end method

.method public setCurrentTargets(Ljava/util/Map;)V
    .locals 0
    .param p1, "currentTargets"    # Ljava/util/Map;

    .prologue
    .line 413
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->currentTargets:Ljava/util/Map;

    .line 414
    return-void
.end method

.method public setIgnoreProjectTag(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 355
    iput-boolean p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->ignoreProjectTag:Z

    .line 356
    return-void
.end method

.method public setImplicitTarget(Lorg/apache/tools/ant/Target;)V
    .locals 0
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 298
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->implicitTarget:Lorg/apache/tools/ant/Target;

    .line 299
    return-void
.end method

.method public setLocator(Lorg/xml/sax/Locator;)V
    .locals 0
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 339
    iput-object p1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->locator:Lorg/xml/sax/Locator;

    .line 340
    return-void
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 365
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->prefixMapping:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 366
    .local v0, "list":Ljava/util/List;
    if-nez v0, :cond_0

    .line 367
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/List;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 368
    .restart local v0    # "list":Ljava/util/List;
    iget-object v1, p0, Lorg/apache/tools/ant/helper/AntXMLContext;->prefixMapping:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    return-void
.end method
