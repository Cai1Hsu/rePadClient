.class public Lorg/apache/tools/ant/types/PropertySet;
.super Lorg/apache/tools/ant/types/DataType;
.source "PropertySet.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;,
        Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$types$PropertySet:Ljava/lang/Class;


# instance fields
.field private cachedNames:Ljava/util/Set;

.field private dynamic:Z

.field private mapper:Lorg/apache/tools/ant/types/Mapper;

.field private negate:Z

.field private noAttributeSet:Z

.field private ptyRefs:Ljava/util/Vector;

.field private setRefs:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 47
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/PropertySet;->dynamic:Z

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/PropertySet;->negate:Z

    .line 50
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->ptyRefs:Ljava/util/Vector;

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->setRefs:Ljava/util/Vector;

    .line 459
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/PropertySet;->noAttributeSet:Z

    .line 464
    return-void
.end method

.method private addPropertyNames(Ljava/util/Set;Ljava/util/Hashtable;)V
    .locals 8
    .param p1, "names"    # Ljava/util/Set;
    .param p2, "properties"    # Ljava/util/Hashtable;

    .prologue
    .line 368
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 369
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v6

    invoke-direct {v6, p1, p2}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyNames(Ljava/util/Set;Ljava/util/Hashtable;)V

    .line 371
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 373
    iget-object v6, p0, Lorg/apache/tools/ant/types/PropertySet;->ptyRefs:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 374
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .line 375
    .local v5, "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$000(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    .line 376
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$000(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 377
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$000(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 379
    :cond_2
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$100(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 380
    invoke-virtual {p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v4

    .local v4, "p":Ljava/util/Enumeration;
    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 381
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 382
    .local v3, "name":Ljava/lang/String;
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$100(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 383
    invoke-interface {p1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 386
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "p":Ljava/util/Enumeration;
    :cond_4
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$200(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    .line 387
    new-instance v1, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;-><init>()V

    .line 388
    .local v1, "matchMaker":Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;
    invoke-virtual {v1}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->newRegexpMatcher()Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    move-result-object v2

    .line 389
    .local v2, "matcher":Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$200(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;->setPattern(Ljava/lang/String;)V

    .line 390
    invoke-virtual {p2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v4

    .restart local v4    # "p":Ljava/util/Enumeration;
    :cond_5
    :goto_2
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 391
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 392
    .restart local v3    # "name":Ljava/lang/String;
    invoke-interface {v2, v3}, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;->matches(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 393
    invoke-interface {p1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 396
    .end local v1    # "matchMaker":Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;
    .end local v2    # "matcher":Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "p":Ljava/util/Enumeration;
    :cond_6
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$300(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    .line 398
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$300(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "all"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 399
    invoke-virtual {p2}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 400
    :cond_7
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$300(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "system"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 401
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 402
    :cond_8
    invoke-static {v5}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->access$300(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "commandline"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 404
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getUserProperties()Ljava/util/Hashtable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 406
    :cond_9
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Impossible: Invalid builtin attribute!"

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 410
    :cond_a
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Impossible: Invalid PropertyRef!"

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 413
    .end local v5    # "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    :cond_b
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 421
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

.method private getAllSystemProperties()Ljava/util/Hashtable;
    .locals 4

    .prologue
    .line 278
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 279
    .local v2, "ret":Ljava/util/Hashtable;
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .line 280
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 281
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 282
    .local v1, "name":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 284
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method private getEffectiveProperties()Ljava/util/Hashtable;
    .locals 5

    .prologue
    .line 326
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    .line 327
    .local v1, "prj":Lorg/apache/tools/ant/Project;
    if-nez v1, :cond_0

    invoke-direct {p0}, Lorg/apache/tools/ant/types/PropertySet;->getAllSystemProperties()Ljava/util/Hashtable;

    move-result-object v2

    .line 329
    .local v2, "result":Ljava/util/Hashtable;
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/types/PropertySet;->setRefs:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 330
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/PropertySet;

    .line 331
    .local v3, "set":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/Hashtable;->putAll(Ljava/util/Map;)V

    goto :goto_1

    .line 327
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "result":Ljava/util/Hashtable;
    .end local v3    # "set":Lorg/apache/tools/ant/types/PropertySet;
    :cond_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v2

    goto :goto_0

    .line 333
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v2    # "result":Ljava/util/Hashtable;
    :cond_1
    return-object v2
.end method

.method private getPropertyNames(Ljava/util/Hashtable;)Ljava/util/Set;
    .locals 5
    .param p1, "props"    # Ljava/util/Hashtable;

    .prologue
    .line 338
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getDynamic()Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/types/PropertySet;->cachedNames:Ljava/util/Set;

    if-nez v4, :cond_4

    .line 339
    :cond_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 340
    .local v2, "names":Ljava/util/Set;
    invoke-direct {p0, v2, p1}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyNames(Ljava/util/Set;Ljava/util/Hashtable;)V

    .line 342
    iget-object v4, p0, Lorg/apache/tools/ant/types/PropertySet;->setRefs:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 343
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/PropertySet;

    .line 344
    .local v3, "set":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 346
    .end local v3    # "set":Lorg/apache/tools/ant/types/PropertySet;
    :cond_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/PropertySet;->negate:Z

    if-eqz v4, :cond_2

    .line 348
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 349
    .local v0, "complement":Ljava/util/HashSet;
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->removeAll(Ljava/util/Collection;)Z

    .line 350
    move-object v2, v0

    .line 352
    .end local v0    # "complement":Ljava/util/HashSet;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getDynamic()Z

    move-result v4

    if-nez v4, :cond_3

    .line 353
    iput-object v2, p0, Lorg/apache/tools/ant/types/PropertySet;->cachedNames:Ljava/util/Set;

    .line 358
    .end local v1    # "e":Ljava/util/Enumeration;
    :cond_3
    :goto_1
    return-object v2

    .line 356
    .end local v2    # "names":Ljava/util/Set;
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/types/PropertySet;->cachedNames:Ljava/util/Set;

    .restart local v2    # "names":Ljava/util/Set;
    goto :goto_1
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 221
    return-void
.end method

.method public addPropertyref(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    .prologue
    .line 185
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->assertNotReference()V

    .line 186
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->setChecked(Z)V

    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->ptyRefs:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 188
    return-void
.end method

.method public addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 195
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->assertNotReference()V

    .line 196
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->setChecked(Z)V

    .line 197
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->setRefs:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 198
    return-void
.end method

.method public appendBuiltin(Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;)V
    .locals 1
    .param p1, "b"    # Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;

    .prologue
    .line 160
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;-><init>()V

    .line 161
    .local v0, "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->setBuiltin(Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;)V

    .line 162
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyref(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)V

    .line 163
    return-void
.end method

.method public appendName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 130
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;-><init>()V

    .line 131
    .local v0, "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->setName(Ljava/lang/String;)V

    .line 132
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyref(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)V

    .line 133
    return-void
.end method

.method public appendPrefix(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 150
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;-><init>()V

    .line 151
    .local v0, "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->setPrefix(Ljava/lang/String;)V

    .line 152
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyref(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)V

    .line 153
    return-void
.end method

.method public appendRegex(Ljava/lang/String;)V
    .locals 1
    .param p1, "regex"    # Ljava/lang/String;

    .prologue
    .line 140
    new-instance v0, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;-><init>()V

    .line 141
    .local v0, "r":Lorg/apache/tools/ant/types/PropertySet$PropertyRef;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PropertySet$PropertyRef;->setRegex(Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->addPropertyref(Lorg/apache/tools/ant/types/PropertySet$PropertyRef;)V

    .line 143
    return-void
.end method

.method protected final assertNotReference()V
    .locals 1

    .prologue
    .line 449
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 450
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 452
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/PropertySet;->noAttributeSet:Z

    .line 453
    return-void
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 2

    .prologue
    .line 205
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->assertNotReference()V

    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 207
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Too many <mapper>s!"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 210
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PropertySet;->setChecked(Z)V

    .line 211
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 553
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 568
    :goto_0
    monitor-exit p0

    return-void

    .line 556
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 557
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 553
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 559
    :cond_1
    :try_start_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v1, :cond_2

    .line 560
    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/PropertySet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 562
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/PropertySet;->setRefs:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 563
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/PropertySet;

    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/PropertySet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 566
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/PropertySet;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getDynamic()Z
    .locals 1

    .prologue
    .line 253
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v0

    iget-boolean v0, v0, Lorg/apache/tools/ant/types/PropertySet;->dynamic:Z

    .line 257
    :goto_0
    return v0

    .line 256
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 257
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/PropertySet;->dynamic:Z

    goto :goto_0
.end method

.method public getMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 1

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v0

    iget-object v0, v0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    .line 269
    :goto_0
    return-object v0

    .line 268
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 269
    iget-object v0, p0, Lorg/apache/tools/ant/types/PropertySet;->mapper:Lorg/apache/tools/ant/types/Mapper;

    goto :goto_0
.end method

.method public getProperties()Ljava/util/Properties;
    .locals 10

    .prologue
    .line 292
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 293
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v9

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v6

    .line 322
    :cond_0
    return-object v6

    .line 295
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 296
    invoke-direct {p0}, Lorg/apache/tools/ant/types/PropertySet;->getEffectiveProperties()Ljava/util/Hashtable;

    move-result-object v7

    .line 297
    .local v7, "props":Ljava/util/Hashtable;
    invoke-direct {p0, v7}, Lorg/apache/tools/ant/types/PropertySet;->getPropertyNames(Ljava/util/Hashtable;)Ljava/util/Set;

    move-result-object v4

    .line 299
    .local v4, "names":Ljava/util/Set;
    const/4 v1, 0x0

    .line 300
    .local v1, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v2

    .line 301
    .local v2, "myMapper":Lorg/apache/tools/ant/types/Mapper;
    if-eqz v2, :cond_2

    .line 302
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v1

    .line 304
    :cond_2
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 306
    .local v6, "properties":Ljava/util/Properties;
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 307
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 308
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 309
    .local v8, "value":Ljava/lang/String;
    if-eqz v8, :cond_3

    .line 312
    if-eqz v1, :cond_4

    .line 314
    invoke-interface {v1, v3}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 315
    .local v5, "newname":[Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 316
    const/4 v9, 0x0

    aget-object v3, v5, v9

    .line 319
    .end local v5    # "newname":[Ljava/lang/String;
    :cond_4
    invoke-virtual {v6, v3, v8}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0
.end method

.method protected getRef()Lorg/apache/tools/ant/types/PropertySet;
    .locals 2

    .prologue
    .line 421
    sget-object v0, Lorg/apache/tools/ant/types/PropertySet;->class$org$apache$tools$ant$types$PropertySet:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.types.PropertySet"

    invoke-static {v0}, Lorg/apache/tools/ant/types/PropertySet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/PropertySet;->class$org$apache$tools$ant$types$PropertySet:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v1, "propertyset"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/types/PropertySet;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/PropertySet;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/PropertySet;->class$org$apache$tools$ant$types$PropertySet:Ljava/lang/Class;

    goto :goto_0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 544
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 545
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PropertySet;->isFilesystemOnly()Z

    move-result v0

    .line 548
    :goto_0
    return v0

    .line 547
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 548
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 6

    .prologue
    .line 506
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 507
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/PropertySet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 517
    :goto_0
    return-object v5

    .line 509
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 510
    invoke-direct {p0}, Lorg/apache/tools/ant/types/PropertySet;->getEffectiveProperties()Ljava/util/Hashtable;

    move-result-object v4

    .line 511
    .local v4, "props":Ljava/util/Hashtable;
    invoke-direct {p0, v4}, Lorg/apache/tools/ant/types/PropertySet;->getPropertyNames(Ljava/util/Hashtable;)Ljava/util/Set;

    move-result-object v3

    .line 513
    .local v3, "names":Ljava/util/Set;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v2

    .line 514
    .local v2, "myMapper":Lorg/apache/tools/ant/types/Mapper;
    if-nez v2, :cond_1

    const/4 v1, 0x0

    .line 515
    .local v1, "m":Lorg/apache/tools/ant/util/FileNameMapper;
    :goto_1
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 517
    .local v0, "iter":Ljava/util/Iterator;
    new-instance v5, Lorg/apache/tools/ant/types/PropertySet$1;

    invoke-direct {v5, p0, v0, v1}, Lorg/apache/tools/ant/types/PropertySet$1;-><init>(Lorg/apache/tools/ant/types/PropertySet;Ljava/util/Iterator;Lorg/apache/tools/ant/util/FileNameMapper;)V

    goto :goto_0

    .line 514
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "m":Lorg/apache/tools/ant/util/FileNameMapper;
    :cond_1
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v1

    goto :goto_1
.end method

.method public setDynamic(Z)V
    .locals 0
    .param p1, "dynamic"    # Z

    .prologue
    .line 233
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->assertNotReference()V

    .line 234
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/PropertySet;->dynamic:Z

    .line 235
    return-void
.end method

.method public setMapper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;

    .prologue
    .line 172
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    .line 173
    .local v0, "m":Lorg/apache/tools/ant/types/Mapper;
    new-instance v1, Lorg/apache/tools/ant/types/Mapper$MapperType;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Mapper$MapperType;-><init>()V

    .line 174
    .local v1, "mapperType":Lorg/apache/tools/ant/types/Mapper$MapperType;
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/Mapper$MapperType;->setValue(Ljava/lang/String;)V

    .line 175
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Mapper;->setType(Lorg/apache/tools/ant/types/Mapper$MapperType;)V

    .line 176
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Mapper;->setFrom(Ljava/lang/String;)V

    .line 177
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/Mapper;->setTo(Ljava/lang/String;)V

    .line 178
    return-void
.end method

.method public setNegate(Z)V
    .locals 0
    .param p1, "negate"    # Z

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->assertNotReference()V

    .line 245
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/PropertySet;->negate:Z

    .line 246
    return-void
.end method

.method public final setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 432
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/PropertySet;->noAttributeSet:Z

    if-nez v0, :cond_0

    .line 433
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 435
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 436
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 536
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PropertySet;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Properties;->size()I

    move-result v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 482
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->isReference()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 483
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getRef()Lorg/apache/tools/ant/types/PropertySet;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/PropertySet;->toString()Ljava/lang/String;

    move-result-object v4

    .line 497
    :goto_0
    return-object v4

    .line 485
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->dieOnCircularReference()V

    .line 486
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 487
    .local v0, "b":Ljava/lang/StringBuffer;
    new-instance v3, Ljava/util/TreeMap;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 488
    .local v3, "sorted":Ljava/util/TreeMap;
    invoke-virtual {v3}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 489
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 490
    .local v1, "e":Ljava/util/Map$Entry;
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-eqz v4, :cond_1

    .line 491
    const-string/jumbo v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 493
    :cond_1
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 494
    const-string/jumbo v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 495
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 497
    .end local v1    # "e":Ljava/util/Map$Entry;
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method
