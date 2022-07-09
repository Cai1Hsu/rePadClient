.class public Lorg/apache/tools/ant/UnknownElement;
.super Lorg/apache/tools/ant/Task;
.source "UnknownElement.java"


# instance fields
.field private children:Ljava/util/List;

.field private final elementName:Ljava/lang/String;

.field private namespace:Ljava/lang/String;

.field private presetDefed:Z

.field private qname:Ljava/lang/String;

.field private realThing:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "elementName"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 47
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->namespace:Ljava/lang/String;

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/UnknownElement;->presetDefed:Z

    .line 74
    iput-object p1, p0, Lorg/apache/tools/ant/UnknownElement;->elementName:Ljava/lang/String;

    .line 75
    return-void
.end method

.method private static equalsString(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/String;
    .param p1, "b"    # Ljava/lang/String;

    .prologue
    .line 645
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private handleChild(Ljava/lang/String;Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/Object;Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Z
    .locals 13
    .param p1, "parentUri"    # Ljava/lang/String;
    .param p2, "ih"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p3, "parent"    # Ljava/lang/Object;
    .param p4, "child"    # Lorg/apache/tools/ant/UnknownElement;
    .param p5, "childWrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 546
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 548
    .local v6, "childName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {p2, p1, v6, v2, v0}, Lorg/apache/tools/ant/IntrospectionHelper;->supportsNestedElement(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 550
    const/4 v9, 0x0

    .line 552
    .local v9, "creator":Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    move-object v2, p2

    move-object v4, p1

    move-object/from16 v5, p3

    move-object/from16 v7, p4

    invoke-virtual/range {v2 .. v7}, Lorg/apache/tools/ant/IntrospectionHelper;->getElementCreator(Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Lorg/apache/tools/ant/UnknownElement;)Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    :try_end_0
    .catch Lorg/apache/tools/ant/UnsupportedElementException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 561
    invoke-virtual/range {p5 .. p5}, Lorg/apache/tools/ant/RuntimeConfigurable;->getPolyType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->setPolyType(Ljava/lang/String;)V

    .line 562
    invoke-virtual {v9}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->create()Ljava/lang/Object;

    move-result-object v11

    .line 563
    .local v11, "realChild":Ljava/lang/Object;
    instance-of v2, v11, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    if-eqz v2, :cond_0

    move-object v10, v11

    .line 564
    check-cast v10, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .line 566
    .local v10, "def":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    invoke-virtual {v9}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->getRealObject()Ljava/lang/Object;

    move-result-object v11

    .line 567
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->getPreSets()Lorg/apache/tools/ant/UnknownElement;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/UnknownElement;->applyPreSet(Lorg/apache/tools/ant/UnknownElement;)V

    .line 569
    .end local v10    # "def":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    :cond_0
    move-object/from16 v0, p5

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/RuntimeConfigurable;->setCreator(Lorg/apache/tools/ant/IntrospectionHelper$Creator;)V

    .line 570
    move-object/from16 v0, p5

    invoke-virtual {v0, v11}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 571
    instance-of v2, v11, Lorg/apache/tools/ant/Task;

    if-eqz v2, :cond_1

    move-object v8, v11

    .line 572
    check-cast v8, Lorg/apache/tools/ant/Task;

    .line 573
    .local v8, "childTask":Lorg/apache/tools/ant/Task;
    move-object/from16 v0, p5

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/Task;->setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 574
    invoke-virtual {v8, v6}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 575
    invoke-virtual {v8, v6}, Lorg/apache/tools/ant/Task;->setTaskType(Ljava/lang/String;)V

    .line 577
    .end local v8    # "childTask":Lorg/apache/tools/ant/Task;
    :cond_1
    instance-of v2, v11, Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v2, :cond_2

    move-object v2, v11

    .line 578
    check-cast v2, Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/ProjectComponent;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 580
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;)V

    .line 581
    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {v0, v11, v1}, Lorg/apache/tools/ant/UnknownElement;->handleChildren(Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 582
    invoke-virtual {v9}, Lorg/apache/tools/ant/IntrospectionHelper$Creator;->store()V

    .line 583
    const/4 v2, 0x1

    .line 585
    .end local v9    # "creator":Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    .end local v11    # "realChild":Ljava/lang/Object;
    :goto_0
    return v2

    .line 554
    .restart local v9    # "creator":Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    :catch_0
    move-exception v12

    .line 555
    .local v12, "use":Lorg/apache/tools/ant/UnsupportedElementException;
    invoke-virtual {p2}, Lorg/apache/tools/ant/IntrospectionHelper;->isDynamic()Z

    move-result v2

    if-nez v2, :cond_3

    .line 556
    throw v12

    .line 559
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 585
    .end local v9    # "creator":Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    .end local v12    # "use":Lorg/apache/tools/ant/UnsupportedElementException;
    :cond_4
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addChild(Lorg/apache/tools/ant/UnknownElement;)V
    .locals 1
    .param p1, "child"    # Lorg/apache/tools/ant/UnknownElement;

    .prologue
    .line 311
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    .line 314
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    return-void
.end method

.method public applyPreSet(Lorg/apache/tools/ant/UnknownElement;)V
    .locals 3
    .param p1, "u"    # Lorg/apache/tools/ant/UnknownElement;

    .prologue
    .line 387
    iget-boolean v1, p0, Lorg/apache/tools/ant/UnknownElement;->presetDefed:Z

    if-eqz v1, :cond_0

    .line 401
    :goto_0
    return-void

    .line 391
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->applyPreSet(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 392
    iget-object v1, p1, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 393
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 394
    .local v0, "newChildren":Ljava/util/List;
    iget-object v1, p1, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 395
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 396
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 398
    :cond_1
    iput-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    .line 400
    .end local v0    # "newChildren":Ljava/util/List;
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/UnknownElement;->presetDefed:Z

    goto :goto_0
.end method

.method public configure(Ljava/lang/Object;)V
    .locals 3
    .param p1, "realObject"    # Ljava/lang/Object;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 176
    const/4 v0, 0x0

    .line 177
    .local v0, "task":Lorg/apache/tools/ant/Task;
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v1, v1, Lorg/apache/tools/ant/Task;

    if-eqz v1, :cond_0

    .line 178
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    .end local v0    # "task":Lorg/apache/tools/ant/Task;
    check-cast v0, Lorg/apache/tools/ant/Task;

    .line 180
    .restart local v0    # "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Task;->setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 185
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 186
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v1, Lorg/apache/tools/ant/Task;

    invoke-virtual {v2, p0, v1}, Lorg/apache/tools/ant/Target;->replaceChild(Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/Task;)V

    .line 195
    :cond_0
    if-eqz v0, :cond_1

    .line 196
    invoke-virtual {v0}, Lorg/apache/tools/ant/Task;->maybeConfigure()V

    .line 201
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/UnknownElement;->handleChildren(Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 202
    return-void

    .line 198
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;)V

    goto :goto_0
.end method

.method public copy(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/UnknownElement;
    .locals 12
    .param p1, "newProject"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 654
    new-instance v7, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 655
    .local v7, "ret":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setNamespace(Ljava/lang/String;)V

    .line 656
    invoke-virtual {v7, p1}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 657
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getQName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setQName(Ljava/lang/String;)V

    .line 658
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getTaskType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setTaskType(Ljava/lang/String;)V

    .line 659
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setTaskName(Ljava/lang/String;)V

    .line 660
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 661
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v10

    if-nez v10, :cond_0

    .line 662
    new-instance v8, Lorg/apache/tools/ant/Target;

    invoke-direct {v8}, Lorg/apache/tools/ant/Target;-><init>()V

    .line 663
    .local v8, "t":Lorg/apache/tools/ant/Target;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/apache/tools/ant/Target;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 664
    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 668
    .end local v8    # "t":Lorg/apache/tools/ant/Target;
    :goto_0
    new-instance v1, Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v1, v7, v10}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 670
    .local v1, "copyRC":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->getPolyType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->setPolyType(Ljava/lang/String;)V

    .line 671
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->getAttributeMap()Ljava/util/Hashtable;

    move-result-object v5

    .line 672
    .local v5, "m":Ljava/util/Map;
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 673
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 674
    .local v3, "entry":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v1, v10, v11}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 666
    .end local v1    # "copyRC":Lorg/apache/tools/ant/RuntimeConfigurable;
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "i":Ljava/util/Iterator;
    .end local v5    # "m":Ljava/util/Map;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v10

    invoke-virtual {v7, v10}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    goto :goto_0

    .line 677
    .restart local v1    # "copyRC":Lorg/apache/tools/ant/RuntimeConfigurable;
    .restart local v4    # "i":Ljava/util/Iterator;
    .restart local v5    # "m":Ljava/util/Map;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText(Ljava/lang/String;)V

    .line 679
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->getChildren()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 680
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 681
    .local v6, "r":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual {v6}, Lorg/apache/tools/ant/RuntimeConfigurable;->getProxy()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/UnknownElement;

    .line 682
    .local v9, "ueChild":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/UnknownElement;->copy(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/UnknownElement;

    move-result-object v0

    .line 683
    .local v0, "copyChild":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 684
    invoke-virtual {v7, v0}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    goto :goto_2

    .line 686
    .end local v0    # "copyChild":Lorg/apache/tools/ant/UnknownElement;
    .end local v6    # "r":Lorg/apache/tools/ant/RuntimeConfigurable;
    .end local v9    # "ueChild":Lorg/apache/tools/ant/UnknownElement;
    :cond_2
    return-object v7
.end method

.method public execute()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 283
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 286
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Could not create task of type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/UnknownElement;->elementName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 290
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_1

    .line 291
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Task;->execute()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->getId()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 299
    iput-object v2, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 303
    :cond_2
    return-void

    .line 298
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->getId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 299
    iput-object v2, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v1

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 298
    :cond_3
    throw v0
.end method

.method public getChildren()Ljava/util/List;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    return-object v0
.end method

.method protected getComponentName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 375
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->namespace:Ljava/lang/String;

    return-object v0
.end method

.method protected getNotFoundException(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/BuildException;
    .locals 4
    .param p1, "what"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 485
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    .line 486
    .local v0, "helper":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {v0, p2, p1}, Lorg/apache/tools/ant/ComponentHelper;->diagnoseCreationFailure(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 487
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    return-object v2
.end method

.method public getQName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->qname:Ljava/lang/String;

    return-object v0
.end method

.method public getRealThing()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 523
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->elementName:Ljava/lang/String;

    return-object v0
.end method

.method public getTask()Lorg/apache/tools/ant/Task;
    .locals 1

    .prologue
    .line 509
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 510
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    .line 512
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTaskName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 497
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-nez v0, :cond_1

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 1

    .prologue
    .line 148
    invoke-super {p0}, Lorg/apache/tools/ant/Task;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    return-object v0
.end method

.method protected handleChildren(Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 13
    .param p1, "parent"    # Ljava/lang/Object;
    .param p2, "parentWrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 334
    instance-of v1, p1, Lorg/apache/tools/ant/TypeAdapter;

    if-eqz v1, :cond_0

    .line 335
    check-cast p1, Lorg/apache/tools/ant/TypeAdapter;

    .end local p1    # "parent":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/tools/ant/TypeAdapter;->getProxy()Ljava/lang/Object;

    move-result-object p1

    .line 338
    .restart local p1    # "parent":Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v2

    .line 339
    .local v2, "parentUri":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    .line 340
    .local v11, "parentClass":Ljava/lang/Class;
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1, v11}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v3

    .line 343
    .local v3, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-eqz v1, :cond_3

    .line 344
    iget-object v1, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 345
    .local v10, "it":Ljava/util/Iterator;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 346
    invoke-virtual {p2, v9}, Lorg/apache/tools/ant/RuntimeConfigurable;->getChild(I)Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v6

    .line 347
    .local v6, "childWrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/UnknownElement;

    .local v5, "child":Lorg/apache/tools/ant/UnknownElement;
    move-object v1, p0

    move-object v4, p1

    .line 349
    :try_start_0
    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/UnknownElement;->handleChild(Ljava/lang/String;Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/Object;Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 351
    instance-of v1, p1, Lorg/apache/tools/ant/TaskContainer;

    if-nez v1, :cond_2

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v5}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, p1, v4}, Lorg/apache/tools/ant/IntrospectionHelper;->throwNotSupported(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    .line 345
    :cond_1
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 357
    :cond_2
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/TaskContainer;

    move-object v7, v0

    .line 358
    .local v7, "container":Lorg/apache/tools/ant/TaskContainer;
    invoke-interface {v7, v5}, Lorg/apache/tools/ant/TaskContainer;->addTask(Lorg/apache/tools/ant/Task;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/UnsupportedElementException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 361
    .end local v7    # "container":Lorg/apache/tools/ant/TaskContainer;
    :catch_0
    move-exception v8

    .line 362
    .local v8, "ex":Lorg/apache/tools/ant/UnsupportedElementException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p2}, Lorg/apache/tools/ant/RuntimeConfigurable;->getElementTag()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v12, " doesn\'t support the nested \""

    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v8}, Lorg/apache/tools/ant/UnsupportedElementException;->getElement()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v12, "\" element."

    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 369
    .end local v5    # "child":Lorg/apache/tools/ant/UnknownElement;
    .end local v6    # "childWrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    .end local v8    # "ex":Lorg/apache/tools/ant/UnsupportedElementException;
    .end local v9    # "i":I
    .end local v10    # "it":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method protected handleErrorFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 272
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    .line 276
    :goto_0
    return-void

    .line 274
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected handleErrorOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    .line 263
    :goto_0
    return-void

    .line 261
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected handleFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    .line 250
    :goto_0
    return-void

    .line 248
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected handleInput([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v0

    .line 234
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v0

    goto :goto_0
.end method

.method protected handleOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    check-cast v0, Lorg/apache/tools/ant/Task;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    .line 215
    :goto_0
    return-void

    .line 213
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected makeObject(Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Ljava/lang/Object;
    .locals 7
    .param p1, "ue"    # Lorg/apache/tools/ant/UnknownElement;
    .param p2, "w"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 414
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v1

    .line 416
    .local v1, "helper":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getComponentName()Ljava/lang/String;

    move-result-object v2

    .line 417
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, p1, v5, v2}, Lorg/apache/tools/ant/ComponentHelper;->createComponent(Lorg/apache/tools/ant/UnknownElement;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 418
    .local v3, "o":Ljava/lang/Object;
    if-nez v3, :cond_0

    .line 419
    const-string/jumbo v5, "task or type"

    invoke-virtual {p0, v5, v2}, Lorg/apache/tools/ant/UnknownElement;->getNotFoundException(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/BuildException;

    move-result-object v5

    throw v5

    .line 421
    :cond_0
    instance-of v5, v3, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    if-eqz v5, :cond_2

    move-object v0, v3

    .line 422
    check-cast v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .line 423
    .local v0, "def":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->createObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v3

    .line 424
    if-nez v3, :cond_1

    .line 425
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "preset "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->getPreSets()Lorg/apache/tools/ant/UnknownElement;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/UnknownElement;->getComponentName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/UnknownElement;->getNotFoundException(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/BuildException;

    move-result-object v5

    throw v5

    .line 429
    :cond_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->getPreSets()Lorg/apache/tools/ant/UnknownElement;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/UnknownElement;->applyPreSet(Lorg/apache/tools/ant/UnknownElement;)V

    .line 430
    instance-of v5, v3, Lorg/apache/tools/ant/Task;

    if-eqz v5, :cond_2

    move-object v4, v3

    .line 431
    check-cast v4, Lorg/apache/tools/ant/Task;

    .line 432
    .local v4, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Task;->setTaskType(Ljava/lang/String;)V

    .line 433
    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getTaskName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 434
    invoke-virtual {v4}, Lorg/apache/tools/ant/Task;->init()V

    .line 437
    .end local v0    # "def":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    .end local v4    # "task":Lorg/apache/tools/ant/Task;
    :cond_2
    instance-of v5, v3, Lorg/apache/tools/ant/UnknownElement;

    if-eqz v5, :cond_3

    move-object v5, v3

    .line 438
    check-cast v5, Lorg/apache/tools/ant/UnknownElement;

    check-cast v3, Lorg/apache/tools/ant/UnknownElement;

    .end local v3    # "o":Ljava/lang/Object;
    invoke-virtual {v5, v3, p2}, Lorg/apache/tools/ant/UnknownElement;->makeObject(Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Ljava/lang/Object;

    move-result-object v3

    .line 440
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_3
    instance-of v5, v3, Lorg/apache/tools/ant/Task;

    if-eqz v5, :cond_4

    move-object v5, v3

    .line 441
    check-cast v5, Lorg/apache/tools/ant/Task;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Task;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 443
    :cond_4
    instance-of v5, v3, Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v5, :cond_5

    move-object v5, v3

    .line 444
    check-cast v5, Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/ProjectComponent;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 446
    :cond_5
    return-object v3
.end method

.method protected makeTask(Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Lorg/apache/tools/ant/Task;
    .locals 3
    .param p1, "ue"    # Lorg/apache/tools/ant/UnknownElement;
    .param p2, "w"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 460
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v0

    .line 462
    .local v0, "task":Lorg/apache/tools/ant/Task;
    if-eqz v0, :cond_0

    .line 463
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Task;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 465
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Task;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 466
    invoke-virtual {v0}, Lorg/apache/tools/ant/Task;->init()V

    .line 468
    :cond_0
    return-object v0
.end method

.method public maybeConfigure()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 164
    :goto_0
    return-void

    .line 163
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    invoke-virtual {p0, p0, v0}, Lorg/apache/tools/ant/UnknownElement;->makeObject(Lorg/apache/tools/ant/UnknownElement;Lorg/apache/tools/ant/RuntimeConfigurable;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/UnknownElement;->configure(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setNamespace(Ljava/lang/String;)V
    .locals 2
    .param p1, "namespace"    # Ljava/lang/String;

    .prologue
    .line 113
    const-string/jumbo v1, "ant:current"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v0

    .line 116
    .local v0, "helper":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {v0}, Lorg/apache/tools/ant/ComponentHelper;->getCurrentAntlibUri()Ljava/lang/String;

    move-result-object p1

    .line 118
    .end local v0    # "helper":Lorg/apache/tools/ant/ComponentHelper;
    :cond_0
    if-nez p1, :cond_1

    const-string/jumbo p1, ""

    .end local p1    # "namespace":Ljava/lang/String;
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/UnknownElement;->namespace:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setQName(Ljava/lang/String;)V
    .locals 0
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 137
    iput-object p1, p0, Lorg/apache/tools/ant/UnknownElement;->qname:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public setRealThing(Ljava/lang/Object;)V
    .locals 0
    .param p1, "realThing"    # Ljava/lang/Object;

    .prologue
    .line 532
    iput-object p1, p0, Lorg/apache/tools/ant/UnknownElement;->realThing:Ljava/lang/Object;

    .line 533
    return-void
.end method

.method public similar(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 594
    if-nez p1, :cond_1

    .line 641
    :cond_0
    :goto_0
    return v4

    .line 597
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move-object v3, p1

    .line 600
    check-cast v3, Lorg/apache/tools/ant/UnknownElement;

    .line 602
    .local v3, "other":Lorg/apache/tools/ant/UnknownElement;
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->elementName:Ljava/lang/String;

    iget-object v7, v3, Lorg/apache/tools/ant/UnknownElement;->elementName:Ljava/lang/String;

    invoke-static {v6, v7}, Lorg/apache/tools/ant/UnknownElement;->equalsString(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 605
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->namespace:Ljava/lang/String;

    iget-object v7, v3, Lorg/apache/tools/ant/UnknownElement;->namespace:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 608
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->qname:Ljava/lang/String;

    iget-object v7, v3, Lorg/apache/tools/ant/UnknownElement;->qname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 612
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/RuntimeConfigurable;->getAttributeMap()Ljava/util/Hashtable;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/RuntimeConfigurable;->getAttributeMap()Ljava/util/Hashtable;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/Hashtable;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 620
    invoke-virtual {p0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 625
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-nez v6, :cond_3

    move v1, v4

    .line 626
    .local v1, "childrenSize":I
    :goto_1
    if-nez v1, :cond_4

    .line 627
    iget-object v6, v3, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-eqz v6, :cond_2

    iget-object v6, v3, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-nez v6, :cond_0

    :cond_2
    move v4, v5

    goto :goto_0

    .line 625
    .end local v1    # "childrenSize":I
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_1

    .line 629
    .restart local v1    # "childrenSize":I
    :cond_4
    iget-object v6, v3, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    if-eqz v6, :cond_0

    .line 632
    iget-object v6, v3, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ne v1, v6, :cond_0

    .line 635
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v1, :cond_5

    .line 636
    iget-object v6, p0, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/UnknownElement;

    .line 637
    .local v0, "child":Lorg/apache/tools/ant/UnknownElement;
    iget-object v6, v3, Lorg/apache/tools/ant/UnknownElement;->children:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/UnknownElement;->similar(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 635
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v0    # "child":Lorg/apache/tools/ant/UnknownElement;
    :cond_5
    move v4, v5

    .line 641
    goto/16 :goto_0
.end method
