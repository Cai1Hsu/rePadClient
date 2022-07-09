.class public Lorg/apache/tools/ant/taskdefs/MacroDef;
.super Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
.source "MacroDef.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;,
        Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;,
        Lorg/apache/tools/ant/taskdefs/MacroDef$Text;,
        Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;,
        Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$taskdefs$MacroInstance:Ljava/lang/Class;


# instance fields
.field private attributes:Ljava/util/List;

.field private backTrace:Z

.field private elements:Ljava/util/Map;

.field private hasImplicitElement:Z

.field private name:Ljava/lang/String;

.field private nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

.field private text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

.field private textName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;-><init>()V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->backTrace:Z

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->textName:Ljava/lang/String;

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->hasImplicitElement:Z

    .line 786
    return-void
.end method

.method static access$000(Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->isValidName(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static access$100(Ljava/lang/Object;)I
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;

    .prologue
    .line 43
    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->objectHashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method static access$200(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 43
    invoke-static {p0, p1}, Lorg/apache/tools/ant/taskdefs/MacroDef;->safeCompare(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 316
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

.method private static isValidName(Ljava/lang/String;)Z
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 238
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 246
    :cond_0
    :goto_0
    return v1

    .line 241
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 242
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/MacroDef;->isValidNameCharacter(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 241
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 246
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isValidNameCharacter(C)Z
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 228
    invoke-static {p0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x2e

    if-eq p0, v0, :cond_0

    const/16 v0, 0x2d

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static objectHashCode(Ljava/lang/Object;)I
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 846
    if-nez p0, :cond_0

    .line 847
    const/4 v0, 0x0

    .line 849
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method private static safeCompare(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .prologue
    .line 570
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private sameOrSimilar(Ljava/lang/Object;Z)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "same"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 704
    if-ne p1, p0, :cond_1

    move v2, v1

    .line 758
    :cond_0
    :goto_0
    return v2

    .line 708
    :cond_1
    if-eqz p1, :cond_0

    .line 711
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v0, p1

    .line 714
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef;

    .line 715
    .local v0, "other":Lorg/apache/tools/ant/taskdefs/MacroDef;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 716
    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    if-nez v3, :cond_2

    :goto_1
    move v2, v1

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 718
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 723
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Location;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    if-nez p2, :cond_4

    move v2, v1

    .line 726
    goto :goto_0

    .line 728
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    if-nez v3, :cond_8

    .line 729
    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    if-nez v3, :cond_0

    .line 737
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "antlib:org.apache.tools.ant"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 739
    :cond_6
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "antlib:org.apache.tools.ant"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 749
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->similar(Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 752
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 755
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v2, v1

    .line 758
    goto/16 :goto_0

    .line 733
    :cond_8
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto/16 :goto_0

    .line 744
    :cond_9
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    goto/16 :goto_0
.end method


# virtual methods
.method public addConfiguredAttribute(Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;)V
    .locals 6
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .prologue
    .line 255
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 256
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "the attribute nested element needed a \"name\" attribute"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 259
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->textName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 260
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "the name \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" has already been used by the text element"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 264
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 265
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 266
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .line 267
    .local v0, "att":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 268
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "the name \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" has already been used in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "another attribute element"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 265
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 274
    .end local v0    # "att":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 275
    return-void
.end method

.method public addConfiguredElement(Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;)V
    .locals 3
    .param p1, "element"    # Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;

    .prologue
    .line 283
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 284
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "the element nested element needed a \"name\" attribute"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 288
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "the element "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " has already been specified"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->hasImplicitElement:Z

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isImplicit()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_3

    .line 294
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one element allowed when using implicit elements"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 297
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->isImplicit()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->hasImplicitElement:Z

    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    return-void
.end method

.method public addConfiguredText(Lorg/apache/tools/ant/taskdefs/MacroDef$Text;)V
    .locals 5
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    .prologue
    .line 68
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    if-eqz v2, :cond_0

    .line 69
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Only one nested text element allowed"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 73
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "the text nested element needed a \"name\" attribute"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 77
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .line 79
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 80
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "the name \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\" is already used as an attribute"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    :cond_3
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    .line 86
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->textName:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public createSequential()Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;
    .locals 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    if-eqz v0, :cond_0

    .line 126
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one sequential allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    return-object v0
.end method

.method public execute()V
    .locals 4

    .prologue
    .line 305
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    if-nez v2, :cond_0

    .line 306
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Missing sequential element"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 308
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 309
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Name not specified"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 312
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getURI()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    .line 314
    new-instance v0, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;-><init>(Lorg/apache/tools/ant/taskdefs/MacroDef;)V

    .line 315
    .local v0, "def":Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 316
    sget-object v2, Lorg/apache/tools/ant/taskdefs/MacroDef;->class$org$apache$tools$ant$taskdefs$MacroInstance:Ljava/lang/Class;

    if-nez v2, :cond_2

    const-string/jumbo v2, "org.apache.tools.ant.taskdefs.MacroInstance"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/MacroDef;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/MacroDef;->class$org$apache$tools$ant$taskdefs$MacroInstance:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/MacroDef$MyAntTypeDefinition;->setClass(Ljava/lang/Class;)V

    .line 318
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v1

    .line 321
    .local v1, "helper":Lorg/apache/tools/ant/ComponentHelper;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/ComponentHelper;->addDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 322
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "creating macro  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/MacroDef;->log(Ljava/lang/String;I)V

    .line 323
    return-void

    .line 316
    .end local v1    # "helper":Lorg/apache/tools/ant/ComponentHelper;
    :cond_2
    sget-object v2, Lorg/apache/tools/ant/taskdefs/MacroDef;->class$org$apache$tools$ant$taskdefs$MacroInstance:Ljava/lang/Class;

    goto :goto_0
.end method

.method public getAttributes()Ljava/util/List;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->attributes:Ljava/util/List;

    return-object v0
.end method

.method public getBackTrace()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->backTrace:Z

    return v0
.end method

.method public getElements()Ljava/util/Map;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->elements:Ljava/util/Map;

    return-object v0
.end method

.method public getNestedTask()Lorg/apache/tools/ant/UnknownElement;
    .locals 6

    .prologue
    .line 184
    new-instance v2, Lorg/apache/tools/ant/UnknownElement;

    const-string/jumbo v4, "sequential"

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 185
    .local v2, "ret":Lorg/apache/tools/ant/UnknownElement;
    const-string/jumbo v4, "sequential"

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/UnknownElement;->setTaskName(Ljava/lang/String;)V

    .line 186
    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/UnknownElement;->setNamespace(Ljava/lang/String;)V

    .line 187
    const-string/jumbo v4, "sequential"

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/UnknownElement;->setQName(Ljava/lang/String;)V

    .line 188
    new-instance v4, Lorg/apache/tools/ant/RuntimeConfigurable;

    const-string/jumbo v5, "sequential"

    invoke-direct {v4, v2, v5}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    .line 189
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->getNested()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    .line 190
    .local v3, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_0

    .line 191
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->nestedSequential:Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/MacroDef$NestedSequential;->getNested()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/UnknownElement;

    .line 193
    .local v0, "e":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    .line 194
    invoke-virtual {v2}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    .end local v0    # "e":Lorg/apache/tools/ant/UnknownElement;
    :cond_0
    return-object v2
.end method

.method public getText()Lorg/apache/tools/ant/taskdefs/MacroDef$Text;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->text:Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    return-object v0
.end method

.method public sameDefinition(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 778
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->sameOrSimilar(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method

.method public setBackTrace(Z)V
    .locals 0
    .param p1, "backTrace"    # Z

    .prologue
    .line 108
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->backTrace:Z

    .line 109
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef;->name:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public similar(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 768
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->sameOrSimilar(Ljava/lang/Object;Z)Z

    move-result v0

    return v0
.end method
