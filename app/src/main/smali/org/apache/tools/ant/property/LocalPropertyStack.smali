.class public Lorg/apache/tools/ant/property/LocalPropertyStack;
.super Ljava/lang/Object;
.source "LocalPropertyStack.java"


# instance fields
.field private stack:Ljava/util/LinkedList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    return-void
.end method

.method private getMapForProperty(Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-object v2, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 143
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 144
    .local v1, "map":Ljava/util/Map;
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 148
    .end local v1    # "map":Ljava/util/Map;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addLocal(Ljava/lang/String;)V
    .locals 2
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    iget-object v0, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sget-object v1, Lorg/apache/tools/ant/property/NullReturn;->NULL:Lorg/apache/tools/ant/property/NullReturn;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    :cond_0
    return-void
.end method

.method public copy()Lorg/apache/tools/ant/property/LocalPropertyStack;
    .locals 3

    .prologue
    .line 77
    new-instance v0, Lorg/apache/tools/ant/property/LocalPropertyStack;

    invoke-direct {v0}, Lorg/apache/tools/ant/property/LocalPropertyStack;-><init>()V

    .line 78
    .local v0, "ret":Lorg/apache/tools/ant/property/LocalPropertyStack;
    iget-object v1, v0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    iget-object v2, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 79
    return-object v0
.end method

.method public enterScope()V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 57
    return-void
.end method

.method public evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;
    .locals 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "helper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 95
    iget-object v3, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 96
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 97
    .local v1, "map":Ljava/util/Map;
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 98
    .local v2, "ret":Ljava/lang/Object;
    if-eqz v2, :cond_0

    .line 102
    .end local v1    # "map":Ljava/util/Map;
    .end local v2    # "ret":Ljava/lang/Object;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public exitScope()V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/property/LocalPropertyStack;->stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 64
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z
    .locals 2
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/property/LocalPropertyStack;->getMapForProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 134
    .local v0, "map":Ljava/util/Map;
    if-nez v0, :cond_0

    .line 135
    const/4 v1, 0x0

    .line 138
    :goto_0
    return v1

    .line 137
    :cond_0
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public setNew(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z
    .locals 3
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/property/LocalPropertyStack;->getMapForProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 115
    .local v1, "map":Ljava/util/Map;
    if-nez v1, :cond_0

    .line 116
    const/4 v2, 0x0

    .line 122
    :goto_0
    return v2

    .line 118
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 119
    .local v0, "currValue":Ljava/lang/Object;
    sget-object v2, Lorg/apache/tools/ant/property/NullReturn;->NULL:Lorg/apache/tools/ant/property/NullReturn;

    if-ne v0, v2, :cond_1

    .line 120
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method
