.class public Lorg/apache/tools/ant/property/ParseProperties;
.super Ljava/lang/Object;
.source "ParseProperties.java"

# interfaces
.implements Lorg/apache/tools/ant/property/ParseNextProperty;


# instance fields
.field private final expanders:Ljava/util/Collection;

.field private final getProperty:Lorg/apache/tools/ant/property/GetProperty;

.field private final project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/util/Collection;Lorg/apache/tools/ant/property/GetProperty;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "expanders"    # Ljava/util/Collection;
    .param p3, "getProperty"    # Lorg/apache/tools/ant/property/GetProperty;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/apache/tools/ant/property/ParseProperties;->project:Lorg/apache/tools/ant/Project;

    .line 44
    iput-object p2, p0, Lorg/apache/tools/ant/property/ParseProperties;->expanders:Ljava/util/Collection;

    .line 45
    iput-object p3, p0, Lorg/apache/tools/ant/property/ParseProperties;->getProperty:Lorg/apache/tools/ant/property/GetProperty;

    .line 46
    return-void
.end method

.method private getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/property/ParseProperties;->getProperty:Lorg/apache/tools/ant/property/GetProperty;

    invoke-interface {v0, p1}, Lorg/apache/tools/ant/property/GetProperty;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 186
    iget-object v2, p0, Lorg/apache/tools/ant/property/ParseProperties;->expanders:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 187
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/property/PropertyExpander;

    invoke-interface {v2, p1, p2, p0}, Lorg/apache/tools/ant/property/PropertyExpander;->parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;Lorg/apache/tools/ant/property/ParseNextProperty;)Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "propertyName":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 194
    .end local v1    # "propertyName":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public containsProperties(Ljava/lang/String;)Z
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 132
    if-nez p1, :cond_1

    .line 142
    :cond_0
    :goto_0
    return v2

    .line 135
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 136
    .local v0, "len":I
    new-instance v1, Ljava/text/ParsePosition;

    invoke-direct {v1, v2}, Ljava/text/ParsePosition;-><init>(I)V

    .local v1, "pos":Ljava/text/ParsePosition;
    :goto_1
    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    if-ge v3, v0, :cond_0

    .line 137
    invoke-direct {p0, p1, v1}, Lorg/apache/tools/ant/property/ParseProperties;->parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 138
    const/4 v2, 0x1

    goto :goto_0

    .line 140
    :cond_2
    invoke-virtual {v1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1, v3}, Ljava/text/ParsePosition;->setIndex(I)V

    goto :goto_1
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/property/ParseProperties;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public parseNextProperty(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;
    .locals 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    const/4 v1, 0x0

    .line 161
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    .line 163
    .local v2, "start":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 182
    :cond_0
    :goto_0
    return-object v1

    .line 169
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/property/ParseProperties;->parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "propertyName":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 171
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/property/ParseProperties;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 172
    .local v1, "result":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 175
    iget-object v3, p0, Lorg/apache/tools/ant/property/ParseProperties;->project:Lorg/apache/tools/ant/Project;

    if-eqz v3, :cond_2

    .line 176
    iget-object v3, p0, Lorg/apache/tools/ant/property/ParseProperties;->project:Lorg/apache/tools/ant/Project;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Property \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" has not been set"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 180
    :cond_2
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public parseProperties(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 93
    if-eqz p1, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_0
    move-object v1, p1

    .line 118
    :cond_1
    :goto_0
    return-object v1

    .line 96
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 97
    .local v0, "len":I
    new-instance v2, Ljava/text/ParsePosition;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/text/ParsePosition;-><init>(I)V

    .line 98
    .local v2, "pos":Ljava/text/ParsePosition;
    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/property/ParseProperties;->parseNextProperty(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;

    move-result-object v1

    .line 99
    .local v1, "o":Ljava/lang/Object;
    if-eqz v1, :cond_3

    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    if-ge v4, v0, :cond_1

    .line 102
    :cond_3
    new-instance v3, Ljava/lang/StringBuffer;

    mul-int/lit8 v4, v0, 0x2

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 103
    .local v3, "sb":Ljava/lang/StringBuffer;
    if-nez v1, :cond_4

    .line 104
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 105
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 109
    :goto_1
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    if-ge v4, v0, :cond_6

    .line 110
    invoke-virtual {p0, p1, v2}, Lorg/apache/tools/ant/property/ParseProperties;->parseNextProperty(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;

    move-result-object v1

    .line 111
    if-nez v1, :cond_5

    .line 112
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 113
    invoke-virtual {v2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2, v4}, Ljava/text/ParsePosition;->setIndex(I)V

    goto :goto_1

    .line 107
    :cond_4
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 115
    :cond_5
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 118
    :cond_6
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
