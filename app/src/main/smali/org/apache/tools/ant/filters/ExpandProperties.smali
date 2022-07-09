.class public final Lorg/apache/tools/ant/filters/ExpandProperties;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "ExpandProperties.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# static fields
.field private static final EOF:I = -0x1


# instance fields
.field private buffer:[C

.field private index:I

.field private propertySet:Lorg/apache/tools/ant/types/PropertySet;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>()V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 0
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    .line 68
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 2
    .param p1, "propertySet"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->propertySet:Lorg/apache/tools/ant/types/PropertySet;

    if-eqz v0, :cond_0

    .line 76
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "expandproperties filter accepts only one propertyset"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->propertySet:Lorg/apache/tools/ant/types/PropertySet;

    .line 79
    return-void
.end method

.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 2
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 133
    new-instance v0, Lorg/apache/tools/ant/filters/ExpandProperties;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/filters/ExpandProperties;-><init>(Ljava/io/Reader;)V

    .line 134
    .local v0, "newFilter":Lorg/apache/tools/ant/filters/ExpandProperties;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ExpandProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ExpandProperties;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 135
    iget-object v1, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->propertySet:Lorg/apache/tools/ant/types/PropertySet;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/ExpandProperties;->add(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 136
    return-object v0
.end method

.method public read()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 94
    iget v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->index:I

    if-le v5, v4, :cond_1

    .line 95
    iget-object v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->buffer:[C

    if-nez v5, :cond_0

    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ExpandProperties;->readFully()Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/filters/ExpandProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    .line 99
    .local v2, "project":Lorg/apache/tools/ant/Project;
    iget-object v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->propertySet:Lorg/apache/tools/ant/types/PropertySet;

    if-nez v5, :cond_2

    .line 100
    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    .line 110
    .local v1, "getProperty":Lorg/apache/tools/ant/property/GetProperty;
    :goto_0
    new-instance v5, Lorg/apache/tools/ant/property/ParseProperties;

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/PropertyHelper;->getExpanders()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v2, v6, v1}, Lorg/apache/tools/ant/property/ParseProperties;-><init>(Lorg/apache/tools/ant/Project;Ljava/util/Collection;Lorg/apache/tools/ant/property/GetProperty;)V

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/property/ParseProperties;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->buffer:[C

    .line 114
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "getProperty":Lorg/apache/tools/ant/property/GetProperty;
    .end local v2    # "project":Lorg/apache/tools/ant/Project;
    :cond_0
    iget v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->index:I

    iget-object v6, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->buffer:[C

    array-length v6, v6

    if-ge v5, v6, :cond_3

    .line 115
    iget-object v4, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->buffer:[C

    iget v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->index:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->index:I

    aget-char v4, v4, v5

    .line 119
    :cond_1
    :goto_1
    return v4

    .line 102
    .restart local v0    # "data":Ljava/lang/String;
    .restart local v2    # "project":Lorg/apache/tools/ant/Project;
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->propertySet:Lorg/apache/tools/ant/types/PropertySet;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/PropertySet;->getProperties()Ljava/util/Properties;

    move-result-object v3

    .line 103
    .local v3, "props":Ljava/util/Properties;
    new-instance v1, Lorg/apache/tools/ant/filters/ExpandProperties$1;

    invoke-direct {v1, p0, v3}, Lorg/apache/tools/ant/filters/ExpandProperties$1;-><init>(Lorg/apache/tools/ant/filters/ExpandProperties;Ljava/util/Properties;)V

    .restart local v1    # "getProperty":Lorg/apache/tools/ant/property/GetProperty;
    goto :goto_0

    .line 117
    .end local v0    # "data":Ljava/lang/String;
    .end local v1    # "getProperty":Lorg/apache/tools/ant/property/GetProperty;
    .end local v2    # "project":Lorg/apache/tools/ant/Project;
    .end local v3    # "props":Ljava/util/Properties;
    :cond_3
    iput v4, p0, Lorg/apache/tools/ant/filters/ExpandProperties;->index:I

    goto :goto_1
.end method
