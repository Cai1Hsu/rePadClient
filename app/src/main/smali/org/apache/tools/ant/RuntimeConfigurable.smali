.class public Lorg/apache/tools/ant/RuntimeConfigurable;
.super Ljava/lang/Object;
.source "RuntimeConfigurable.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final EMPTY_HASHTABLE:Ljava/util/Hashtable;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private attributeMap:Ljava/util/LinkedHashMap;

.field private transient attributes:Lorg/xml/sax/AttributeList;

.field private characters:Ljava/lang/StringBuffer;

.field private children:Ljava/util/List;

.field private transient creator:Lorg/apache/tools/ant/IntrospectionHelper$Creator;

.field private elementTag:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private polyType:Ljava/lang/String;

.field private proxyConfigured:Z

.field private transient wrappedObject:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    new-instance v0, Ljava/util/Hashtable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(I)V

    sput-object v0, Lorg/apache/tools/ant/RuntimeConfigurable;->EMPTY_HASHTABLE:Ljava/util/Hashtable;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "elementTag"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->elementTag:Ljava/lang/String;

    .line 54
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    .line 59
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    .line 80
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    .line 83
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    .line 86
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->proxyConfigured:Z

    .line 89
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->id:Ljava/lang/String;

    .line 101
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 102
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setElementTag(Ljava/lang/String;)V

    .line 104
    instance-of v0, p1, Lorg/apache/tools/ant/Task;

    if-eqz v0, :cond_0

    .line 105
    check-cast p1, Lorg/apache/tools/ant/Task;

    .end local p1    # "proxy":Ljava/lang/Object;
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/Task;->setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 107
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 1
    .param p1, "child"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 241
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    .line 242
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    monitor-exit p0

    return-void

    .line 241
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 274
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 279
    :goto_0
    monitor-exit p0

    return-void

    .line 277
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 274
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 277
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto :goto_1
.end method

.method public declared-synchronized addText([CII)V
    .locals 1
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I

    .prologue
    .line 291
    monitor-enter p0

    if-nez p3, :cond_0

    .line 296
    :goto_0
    monitor-exit p0

    return-void

    .line 294
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p3}, Ljava/lang/StringBuffer;-><init>(I)V

    :goto_1
    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 291
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 294
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method public applyPreSet(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 5
    .param p1, "r"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 455
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    if-eqz v3, :cond_2

    .line 456
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 457
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 458
    .local v1, "name":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 459
    :cond_1
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 465
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v1    # "name":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;

    if-nez v3, :cond_7

    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;

    :goto_1
    iput-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;

    .line 468
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    if-eqz v3, :cond_4

    .line 469
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 470
    .local v2, "newChildren":Ljava/util/List;
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 471
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    if-eqz v3, :cond_3

    .line 472
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 474
    :cond_3
    iput-object v2, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    .line 478
    .end local v2    # "newChildren":Ljava/util/List;
    :cond_4
    iget-object v3, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-eqz v3, :cond_6

    .line 479
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_6

    .line 481
    :cond_5
    new-instance v3, Ljava/lang/StringBuffer;

    iget-object v4, p1, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    .line 484
    :cond_6
    return-void

    .line 465
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;

    goto :goto_1
.end method

.method public declared-synchronized getAttributeMap()Ljava/util/Hashtable;
    .locals 2

    .prologue
    .line 219
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    sget-object v0, Lorg/apache/tools/ant/RuntimeConfigurable;->EMPTY_HASHTABLE:Ljava/util/Hashtable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/Hashtable;

    iget-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAttributes()Lorg/xml/sax/AttributeList;
    .locals 1

    .prologue
    .line 231
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributes:Lorg/xml/sax/AttributeList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getChild(I)Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 254
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/RuntimeConfigurable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getChildren()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 263
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Lorg/apache/tools/ant/util/CollectionUtils$EmptyEnumeration;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/CollectionUtils$EmptyEnumeration;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->children:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getElementTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 325
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->elementTag:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->id:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPolyType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getProxy()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 136
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getText()Ljava/lang/StringBuffer;
    .locals 2

    .prologue
    .line 307
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public maybeConfigure(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 346
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;Z)V

    .line 347
    return-void
.end method

.method public declared-synchronized maybeConfigure(Lorg/apache/tools/ant/Project;Z)V
    .locals 14
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "configureChildren"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 370
    monitor-enter p0

    :try_start_0
    iget-boolean v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->proxyConfigured:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v11, :cond_0

    .line 435
    :goto_0
    monitor-exit p0

    return-void

    .line 375
    :cond_0
    :try_start_1
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    instance-of v11, v11, Lorg/apache/tools/ant/TypeAdapter;

    if-eqz v11, :cond_4

    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    check-cast v11, Lorg/apache/tools/ant/TypeAdapter;

    invoke-interface {v11}, Lorg/apache/tools/ant/TypeAdapter;->getProxy()Ljava/lang/Object;

    move-result-object v9

    .line 378
    .local v9, "target":Ljava/lang/Object;
    :goto_1
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-static {p1, v11}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v6

    .line 381
    .local v6, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    if-eqz v11, :cond_6

    .line 382
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v11}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "iter":Ljava/util/Iterator;
    :cond_1
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 383
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 384
    .local v5, "entry":Ljava/util/Map$Entry;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 385
    .local v8, "name":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 390
    .local v10, "value":Ljava/lang/String;
    invoke-static {p1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v11

    invoke-virtual {v11, v10}, Lorg/apache/tools/ant/PropertyHelper;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 391
    .local v2, "attrValue":Ljava/lang/Object;
    instance-of v11, v9, Lorg/apache/tools/ant/taskdefs/MacroInstance;

    if-eqz v11, :cond_3

    .line 392
    move-object v0, v9

    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroInstance;

    move-object v11, v0

    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/MacroInstance;->getMacroDef()Lorg/apache/tools/ant/taskdefs/MacroDef;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getAttributes()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "attrs":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    .line 393
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .line 394
    .local v1, "attr":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 395
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->isDoubleExpanding()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v11

    if-nez v11, :cond_3

    .line 396
    move-object v2, v10

    .line 403
    .end local v1    # "attr":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    .end local v2    # "attrValue":Ljava/lang/Object;
    .end local v3    # "attrs":Ljava/util/Iterator;
    :cond_3
    :try_start_2
    invoke-virtual {v6, p1, v9, v8, v2}, Lorg/apache/tools/ant/IntrospectionHelper;->setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Lorg/apache/tools/ant/UnsupportedAttributeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 404
    :catch_0
    move-exception v4

    .line 406
    .local v4, "be":Lorg/apache/tools/ant/UnsupportedAttributeException;
    :try_start_3
    const-string/jumbo v11, "id"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 408
    invoke-virtual {p0}, Lorg/apache/tools/ant/RuntimeConfigurable;->getElementTag()Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_5

    .line 409
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 370
    .end local v4    # "be":Lorg/apache/tools/ant/UnsupportedAttributeException;
    .end local v5    # "entry":Ljava/util/Map$Entry;
    .end local v6    # "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    .end local v7    # "iter":Ljava/util/Iterator;
    .end local v8    # "name":Ljava/lang/String;
    .end local v9    # "target":Ljava/lang/Object;
    .end local v10    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v11

    monitor-exit p0

    throw v11

    .line 375
    :cond_4
    :try_start_4
    iget-object v9, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    goto/16 :goto_1

    .line 411
    .restart local v4    # "be":Lorg/apache/tools/ant/UnsupportedAttributeException;
    .restart local v5    # "entry":Ljava/util/Map$Entry;
    .restart local v6    # "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    .restart local v7    # "iter":Ljava/util/Iterator;
    .restart local v8    # "name":Ljava/lang/String;
    .restart local v9    # "target":Ljava/lang/Object;
    .restart local v10    # "value":Ljava/lang/String;
    :cond_5
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/RuntimeConfigurable;->getElementTag()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " doesn\'t support the \""

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v4}, Lorg/apache/tools/ant/UnsupportedAttributeException;->getAttribute()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "\" attribute"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 415
    .end local v4    # "be":Lorg/apache/tools/ant/UnsupportedAttributeException;
    :catch_1
    move-exception v4

    .line 416
    .local v4, "be":Lorg/apache/tools/ant/BuildException;
    const-string/jumbo v11, "id"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 421
    throw v4

    .line 427
    .end local v4    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v5    # "entry":Ljava/util/Map$Entry;
    .end local v7    # "iter":Ljava/util/Iterator;
    .end local v8    # "name":Ljava/lang/String;
    .end local v10    # "value":Ljava/lang/String;
    :cond_6
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    if-eqz v11, :cond_7

    .line 428
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    iget-object v12, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->characters:Ljava/lang/StringBuffer;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {p1, v11, v12}, Lorg/apache/tools/ant/ProjectHelper;->addText(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    .line 431
    :cond_7
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->id:Ljava/lang/String;

    if-eqz v11, :cond_8

    .line 432
    iget-object v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->id:Ljava/lang/String;

    iget-object v12, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    invoke-virtual {p1, v11, v12}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 434
    :cond_8
    const/4 v11, 0x1

    iput-boolean v11, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->proxyConfigured:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0
.end method

.method public reconfigure(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 443
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->proxyConfigured:Z

    .line 444
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;)V

    .line 445
    return-void
.end method

.method public declared-synchronized removeAttribute(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 209
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    monitor-exit p0

    return-void

    .line 209
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 184
    monitor-enter p0

    :try_start_0
    const-string/jumbo v1, "ant-type"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 185
    iput-object p2, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 187
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_2

    .line 188
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    .line 190
    :cond_2
    const-string/jumbo v1, "refid"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 191
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 192
    .local v0, "newAttributeMap":Ljava/util/LinkedHashMap;
    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    iget-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    .line 194
    iput-object v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    .line 198
    .end local v0    # "newAttributeMap":Ljava/util/LinkedHashMap;
    :goto_1
    const-string/jumbo v1, "id"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 199
    iput-object p2, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->id:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 184
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 196
    :cond_3
    :try_start_2
    iget-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributeMap:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public declared-synchronized setAttributes(Lorg/xml/sax/AttributeList;)V
    .locals 3
    .param p1, "attributes"    # Lorg/xml/sax/AttributeList;

    .prologue
    .line 171
    monitor-enter p0

    :try_start_0
    new-instance v1, Lorg/xml/sax/helpers/AttributeListImpl;

    invoke-direct {v1, p1}, Lorg/xml/sax/helpers/AttributeListImpl;-><init>(Lorg/xml/sax/AttributeList;)V

    iput-object v1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->attributes:Lorg/xml/sax/AttributeList;

    .line 172
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Lorg/xml/sax/AttributeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 173
    invoke-interface {p1, v0}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0}, Lorg/xml/sax/AttributeList;->getValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 175
    :cond_0
    monitor-exit p0

    return-void

    .line 171
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized setCreator(Lorg/apache/tools/ant/IntrospectionHelper$Creator;)V
    .locals 1
    .param p1, "creator"    # Lorg/apache/tools/ant/IntrospectionHelper$Creator;

    .prologue
    .line 126
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->creator:Lorg/apache/tools/ant/IntrospectionHelper$Creator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    monitor-exit p0

    return-void

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setElementTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "elementTag"    # Ljava/lang/String;

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->elementTag:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 316
    monitor-exit p0

    return-void

    .line 315
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPolyType(Ljava/lang/String;)V
    .locals 1
    .param p1, "polyType"    # Ljava/lang/String;

    .prologue
    .line 160
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->polyType:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    monitor-exit p0

    return-void

    .line 160
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProxy(Ljava/lang/Object;)V
    .locals 1
    .param p1, "proxy"    # Ljava/lang/Object;

    .prologue
    .line 115
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->wrappedObject:Ljava/lang/Object;

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/RuntimeConfigurable;->proxyConfigured:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    monitor-exit p0

    return-void

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
