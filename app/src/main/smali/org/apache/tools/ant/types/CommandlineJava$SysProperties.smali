.class public Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
.super Lorg/apache/tools/ant/types/Environment;
.source "CommandlineJava.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/CommandlineJava;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SysProperties"
.end annotation


# instance fields
.field private propertySets:Ljava/util/Vector;

.field sys:Ljava/util/Properties;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    return-void
.end method

.method private mergePropertySets()Ljava/util/Properties;
    .locals 4

    .prologue
    .line 217
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 218
    .local v1, "p":Ljava/util/Properties;
    iget-object v3, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 219
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 220
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PropertySet;

    .line 221
    .local v2, "ps":Lorg/apache/tools/ant/types/PropertySet;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    goto :goto_0

    .line 223
    .end local v2    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    :cond_0
    return-object v1
.end method


# virtual methods
.method public addDefinitionsToList(Ljava/util/ListIterator;)V
    .locals 8
    .param p1, "listIt"    # Ljava/util/ListIterator;

    .prologue
    .line 107
    invoke-super {p0}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v4

    .line 108
    .local v4, "props":[Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 109
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v6, v4

    if-ge v1, v6, :cond_0

    .line 110
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "-D"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, v4, v1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 109
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    .end local v1    # "i":I
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->mergePropertySets()Ljava/util/Properties;

    move-result-object v3

    .line 114
    .local v3, "propertySetProperties":Ljava/util/Properties;
    invoke-virtual {v3}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 115
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 116
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 117
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 118
    .local v5, "value":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "-D"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 120
    .end local v2    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public addSysproperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V
    .locals 2
    .param p1, "ps"    # Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .prologue
    .line 208
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    iget-object v1, p1, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 209
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    iget-object v1, p1, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addAll(Ljava/util/Collection;)Z

    .line 210
    return-void
.end method

.method public addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 200
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 185
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 186
    .local v0, "c":Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    .line 187
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->propertySets:Ljava/util/Vector;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .end local v0    # "c":Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    :goto_0
    return-object v0

    .line 189
    :catch_0
    move-exception v1

    .line 190
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVariables()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 93
    .local v0, "definitions":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 94
    .local v1, "list":Ljava/util/ListIterator;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addDefinitionsToList(Ljava/util/ListIterator;)V

    .line 95
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 96
    const/4 v2, 0x0

    .line 98
    :goto_0
    return-object v2

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    goto :goto_0
.end method

.method public restoreSystem()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 166
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    if-nez v1, :cond_0

    .line 167
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unbalanced nesting of SysProperties"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 171
    :cond_0
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    invoke-static {v1}, Ljava/lang/System;->setProperties(Ljava/util/Properties;)V

    .line 172
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    return-void

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Cannot modify system properties"

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setSystem()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 139
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    .line 140
    new-instance v2, Ljava/util/Properties;

    invoke-direct {v2}, Ljava/util/Properties;-><init>()V

    .line 141
    .local v2, "p":Ljava/util/Properties;
    iget-object v5, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    invoke-virtual {v5}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 142
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 143
    .local v1, "name":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->sys:Ljava/util/Properties;

    invoke-virtual {v5, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 144
    .local v4, "value":Ljava/lang/String;
    if-eqz v1, :cond_0

    if-eqz v4, :cond_0

    .line 145
    invoke-virtual {v2, v1, v4}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 155
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "p":Ljava/util/Properties;
    .end local v4    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Cannot modify system properties"

    invoke-direct {v5, v6, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 148
    .local v0, "e":Ljava/util/Enumeration;
    .restart local v2    # "p":Ljava/util/Properties;
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->mergePropertySets()Ljava/util/Properties;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 149
    iget-object v5, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 150
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Environment$Variable;

    .line 151
    .local v3, "v":Lorg/apache/tools/ant/types/Environment$Variable;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment$Variable;->validate()V

    .line 152
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment$Variable;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment$Variable;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 154
    .end local v3    # "v":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_2
    invoke-static {v2}, Ljava/lang/System;->setProperties(Ljava/util/Properties;)V
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0

    .line 158
    return-void
.end method

.method public size()I
    .locals 3

    .prologue
    .line 128
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->mergePropertySets()Ljava/util/Properties;

    move-result-object v0

    .line 129
    .local v0, "p":Ljava/util/Properties;
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->variables:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    invoke-virtual {v0}, Ljava/util/Properties;->size()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method
