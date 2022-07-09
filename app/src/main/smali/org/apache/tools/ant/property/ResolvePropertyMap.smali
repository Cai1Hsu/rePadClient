.class public Lorg/apache/tools/ant/property/ResolvePropertyMap;
.super Ljava/lang/Object;
.source "ResolvePropertyMap.java"

# interfaces
.implements Lorg/apache/tools/ant/property/GetProperty;


# instance fields
.field private expandingLHS:Z

.field private map:Ljava/util/Map;

.field private final master:Lorg/apache/tools/ant/property/GetProperty;

.field private final parseProperties:Lorg/apache/tools/ant/property/ParseProperties;

.field private prefix:Ljava/lang/String;

.field private prefixValues:Z

.field private final seen:Ljava/util/Set;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/property/GetProperty;Ljava/util/Collection;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "master"    # Lorg/apache/tools/ant/property/GetProperty;
    .param p3, "expanders"    # Ljava/util/Collection;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefixValues:Z

    .line 44
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->expandingLHS:Z

    .line 53
    iput-object p2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->master:Lorg/apache/tools/ant/property/GetProperty;

    .line 54
    new-instance v0, Lorg/apache/tools/ant/property/ParseProperties;

    invoke-direct {v0, p1, p3, p0}, Lorg/apache/tools/ant/property/ParseProperties;-><init>(Lorg/apache/tools/ant/Project;Ljava/util/Collection;Lorg/apache/tools/ant/property/GetProperty;)V

    iput-object v0, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->parseProperties:Lorg/apache/tools/ant/property/ParseProperties;

    .line 55
    return-void
.end method


# virtual methods
.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Property "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " was circularly "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "defined."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 76
    :cond_0
    move-object v0, p1

    .line 77
    .local v0, "fullKey":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefix:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->expandingLHS:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefixValues:Z

    if-eqz v2, :cond_2

    .line 78
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 81
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->master:Lorg/apache/tools/ant/property/GetProperty;

    invoke-interface {v2, v0}, Lorg/apache/tools/ant/property/GetProperty;->getProperty(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 82
    .local v1, "masterValue":Ljava/lang/Object;
    if-eqz v1, :cond_3

    .line 96
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .end local v1    # "masterValue":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 90
    .restart local v1    # "masterValue":Ljava/lang/Object;
    :cond_3
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 91
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->expandingLHS:Z

    .line 94
    iget-object v3, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->parseProperties:Lorg/apache/tools/ant/property/ParseProperties;

    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/property/ParseProperties;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 96
    .end local v1    # "masterValue":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->seen:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw v2
.end method

.method public resolveAllProperties(Ljava/util/Map;)V
    .locals 2
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 106
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/ant/property/ResolvePropertyMap;->resolveAllProperties(Ljava/util/Map;Ljava/lang/String;Z)V

    .line 107
    return-void
.end method

.method public resolveAllProperties(Ljava/util/Map;Ljava/lang/String;)V
    .locals 2
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/ant/property/ResolvePropertyMap;->resolveAllProperties(Ljava/util/Map;Ljava/lang/String;Z)V

    .line 118
    return-void
.end method

.method public resolveAllProperties(Ljava/util/Map;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "prefixValues"    # Z

    .prologue
    .line 132
    iput-object p1, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->map:Ljava/util/Map;

    .line 133
    iput-object p2, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefix:Ljava/lang/String;

    .line 134
    iput-boolean p3, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->prefixValues:Z

    .line 136
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 137
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/tools/ant/property/ResolvePropertyMap;->expandingLHS:Z

    .line 138
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 139
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/property/ResolvePropertyMap;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 140
    .local v2, "result":Ljava/lang/Object;
    if-nez v2, :cond_0

    const-string/jumbo v3, ""

    .line 141
    .local v3, "value":Ljava/lang/String;
    :goto_1
    invoke-interface {p1, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 140
    .end local v3    # "value":Ljava/lang/String;
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 143
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1
    return-void
.end method
