.class public Lorg/apache/tools/ant/taskdefs/Manifest$Section;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Section"
.end annotation


# instance fields
.field private attributes:Ljava/util/Map;

.field private name:Ljava/lang/String;

.field private warnings:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 403
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 405
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    .line 411
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    .line 414
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    return-void
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .param p1, "x1"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .prologue
    .line 403
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    return-void
.end method

.method private storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 2
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .prologue
    .line 740
    if-nez p1, :cond_0

    .line 745
    :goto_0
    return-void

    .line 743
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 744
    .local v0, "attributeKey":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public addAttributeAndCheck(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)Ljava/lang/String;
    .locals 7
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 670
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    .line 671
    :cond_0
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Attributes must have name and value"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 673
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 674
    .local v0, "attributeKey":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Manifest;->access$000()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 675
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "\"Name\" attributes should not occur in the main section and must be the first element in all other sections: \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 679
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 712
    :goto_0
    return-object v4

    .line 682
    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Manifest;->access$100()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 683
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Manifest attributes should not start with \"From\" in \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 712
    :cond_3
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 687
    :cond_4
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Manifest;->access$200()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 688
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .line 691
    .local v1, "classpathAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    if-nez v1, :cond_5

    .line 692
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_1

    .line 694
    :cond_5
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    const-string/jumbo v5, "Multiple Class-Path attributes are supported but violate the Jar specification and may not be correctly processed in all environments"

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 698
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValues()Ljava/util/Enumeration;

    move-result-object v2

    .line 699
    .local v2, "e":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 700
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 701
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->addValue(Ljava/lang/String;)V

    goto :goto_2

    .line 704
    .end local v1    # "classpathAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v2    # "e":Ljava/util/Enumeration;
    .end local v3    # "value":Ljava/lang/String;
    :cond_6
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 705
    new-instance v4, Lorg/apache/tools/ant/taskdefs/ManifestException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "The attribute \""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\" may not occur more "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "than once in the same section"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/taskdefs/ManifestException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 709
    :cond_7
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_1
.end method

.method public addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V
    .locals 3
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 649
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->addAttributeAndCheck(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)Ljava/lang/String;

    move-result-object v0

    .line 650
    .local v0, "check":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 651
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Specify the section name using the \"name\" attribute of the <section> element rather than using a \"Name\" manifest attribute"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 655
    :cond_0
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 7

    .prologue
    .line 722
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;-><init>()V

    .line 723
    .local v1, "cloned":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->setName(Ljava/lang/String;)V

    .line 724
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeKeys()Ljava/util/Enumeration;

    move-result-object v2

    .line 725
    .local v2, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 726
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 727
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v0

    .line 728
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v1, v4}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_0

    .line 731
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v3    # "key":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "rhs"    # Ljava/lang/Object;

    .prologue
    .line 770
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    .line 771
    :cond_0
    const/4 v1, 0x0

    .line 780
    :goto_0
    return v1

    .line 774
    :cond_1
    if-ne p1, p0, :cond_2

    .line 775
    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 778
    check-cast v0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    .line 780
    .local v0, "rhsSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .locals 2
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 601
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    return-object v0
.end method

.method public getAttributeKeys()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 611
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/CollectionUtils;->asEnumeration(Ljava/util/Iterator;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 623
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v0

    .line 624
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    if-nez v0, :cond_0

    .line 625
    const/4 v1, 0x0

    .line 627
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 430
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getWarnings()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 753
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 761
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public merge(Lorg/apache/tools/ant/taskdefs/Manifest$Section;)V
    .locals 1
    .param p1, "section"    # Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 489
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->merge(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Z)V

    .line 490
    return-void
.end method

.method public merge(Lorg/apache/tools/ant/taskdefs/Manifest$Section;Z)V
    .locals 12
    .param p1, "section"    # Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    .param p2, "mergeClassPaths"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 503
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    if-nez v9, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getName()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_1

    :cond_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    if-eqz v9, :cond_2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getName()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    sget-object v10, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v9, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getName()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v10, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 508
    :cond_1
    new-instance v9, Lorg/apache/tools/ant/taskdefs/ManifestException;

    const-string/jumbo v10, "Unable to merge sections with different names"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/taskdefs/ManifestException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 512
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeKeys()Ljava/util/Enumeration;

    move-result-object v6

    .line 513
    .local v6, "e":Ljava/util/Enumeration;
    const/4 v3, 0x0

    .line 514
    .local v3, "classpathAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :cond_3
    :goto_0
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 515
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 516
    .local v2, "attributeName":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v1

    .line 517
    .local v1, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    const-string/jumbo v9, "Class-Path"

    invoke-virtual {v2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 518
    if-nez v3, :cond_4

    .line 519
    new-instance v3, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .end local v3    # "classpathAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>()V

    .line 520
    .restart local v3    # "classpathAttribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    const-string/jumbo v9, "Class-Path"

    invoke-virtual {v3, v9}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->setName(Ljava/lang/String;)V

    .line 522
    :cond_4
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValues()Ljava/util/Enumeration;

    move-result-object v4

    .line 523
    .local v4, "cpe":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 524
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 525
    .local v7, "value":Ljava/lang/String;
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->addValue(Ljava/lang/String;)V

    goto :goto_1

    .line 529
    .end local v4    # "cpe":Ljava/util/Enumeration;
    .end local v7    # "value":Ljava/lang/String;
    :cond_5
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    goto :goto_0

    .line 533
    .end local v1    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v2    # "attributeName":Ljava/lang/String;
    :cond_6
    if-eqz v3, :cond_8

    .line 534
    if-eqz p2, :cond_7

    .line 535
    const-string/jumbo v9, "Class-Path"

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v5

    .line 536
    .local v5, "currentCp":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    if-eqz v5, :cond_7

    .line 537
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValues()Ljava/util/Enumeration;

    move-result-object v0

    .line 538
    .local v0, "attribEnum":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 539
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 540
    .restart local v7    # "value":Ljava/lang/String;
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->addValue(Ljava/lang/String;)V

    goto :goto_2

    .line 544
    .end local v0    # "attribEnum":Ljava/util/Enumeration;
    .end local v5    # "currentCp":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v7    # "value":Ljava/lang/String;
    :cond_7
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->storeAttribute(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)V

    .line 548
    :cond_8
    iget-object v9, p1, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v8

    .line 549
    .local v8, "warnEnum":Ljava/util/Enumeration;
    :goto_3
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 550
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->warnings:Ljava/util/Vector;

    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_3

    .line 552
    :cond_9
    return-void
.end method

.method public read(Ljava/io/BufferedReader;)Ljava/lang/String;
    .locals 6
    .param p1, "reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 448
    const/4 v0, 0x0

    .line 450
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 451
    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 452
    :cond_1
    const/4 v2, 0x0

    .line 475
    :goto_1
    return-object v2

    .line 454
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_5

    .line 456
    if-nez v0, :cond_4

    .line 457
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 461
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    goto :goto_0

    .line 463
    :cond_3
    new-instance v3, Lorg/apache/tools/ant/taskdefs/ManifestException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Can\'t start an attribute with a continuation line "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/taskdefs/ManifestException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 467
    :cond_4
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->addContinuation(Ljava/lang/String;)V

    goto :goto_0

    .line 470
    :cond_5
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;)V

    .line 471
    .restart local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->addAttributeAndCheck(Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;)Ljava/lang/String;

    move-result-object v2

    .line 473
    .local v2, "nameReadAhead":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v0

    .line 474
    if-eqz v2, :cond_0

    goto :goto_1
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 2
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 636
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 637
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->attributes:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 421
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    .line 422
    return-void
.end method

.method public write(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 563
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->write(Ljava/io/PrintWriter;Z)V

    .line 564
    return-void
.end method

.method public write(Ljava/io/PrintWriter;Z)V
    .locals 6
    .param p1, "writer"    # Ljava/io/PrintWriter;
    .param p2, "flatten"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 579
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 580
    new-instance v3, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    const-string/jumbo v4, "Name"

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->name:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    .local v3, "nameAttr":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->write(Ljava/io/PrintWriter;)V

    .line 583
    .end local v3    # "nameAttr":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttributeKeys()Ljava/util/Enumeration;

    move-result-object v1

    .line 584
    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 585
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 586
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v0

    .line 587
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->write(Ljava/io/PrintWriter;Z)V

    goto :goto_0

    .line 589
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    const-string/jumbo v4, "\r\n"

    invoke-virtual {p1, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 590
    return-void
.end method
