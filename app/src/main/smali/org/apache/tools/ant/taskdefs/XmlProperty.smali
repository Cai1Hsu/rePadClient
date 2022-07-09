.class public Lorg/apache/tools/ant/taskdefs/XmlProperty;
.super Lorg/apache/tools/ant/Task;
.source "XmlProperty.java"


# static fields
.field private static final ATTRIBUTES:[Ljava/lang/String;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final ID:Ljava/lang/String; = "id"

.field private static final LOCATION:Ljava/lang/String; = "location"

.field private static final PATH:Ljava/lang/String; = "path"

.field private static final PATHID:Ljava/lang/String; = "pathid"

.field private static final REF_ID:Ljava/lang/String; = "refid"

.field private static final VALUE:Ljava/lang/String; = "value"

.field static class$org$apache$tools$ant$taskdefs$XmlProperty:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private addedAttributes:Ljava/util/Hashtable;

.field private collapseAttributes:Z

.field private delimiter:Ljava/lang/String;

.field private includeSemanticAttribute:Z

.field private keepRoot:Z

.field private prefix:Ljava/lang/String;

.field private rootDirectory:Ljava/io/File;

.field private semanticAttributes:Z

.field private src:Lorg/apache/tools/ant/types/Resource;

.field private validate:Z

.field private xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 195
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "refid"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "location"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "value"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "path"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "pathid"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->ATTRIBUTES:[Ljava/lang/String;

    .line 199
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 205
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 178
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->prefix:Ljava/lang/String;

    .line 179
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->keepRoot:Z

    .line 180
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->validate:Z

    .line 181
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->collapseAttributes:Z

    .line 182
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    .line 183
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->includeSemanticAttribute:Z

    .line 184
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->rootDirectory:Ljava/io/File;

    .line 185
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    .line 186
    new-instance v0, Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/XMLCatalog;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    .line 187
    const-string/jumbo v0, ","

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->delimiter:Ljava/lang/String;

    .line 206
    return-void
.end method

.method private addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7
    .param p1, "node"    # Lorg/w3c/dom/Node;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "container"    # Ljava/lang/Object;

    .prologue
    .line 293
    move-object v3, p2

    .line 294
    .local v3, "nodePrefix":Ljava/lang/String;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    .line 295
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 296
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 298
    :cond_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 301
    :cond_1
    invoke-virtual {p0, p1, v3, p3}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->processNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 304
    .local v2, "nodeObject":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 305
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 306
    .local v1, "nodeChildren":Lorg/w3c/dom/NodeList;
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    .line 308
    .local v4, "numChildren":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_2

    .line 312
    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    invoke-direct {p0, v5, v3, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)V

    .line 308
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 315
    .end local v0    # "i":I
    .end local v1    # "nodeChildren":Lorg/w3c/dom/NodeList;
    .end local v4    # "numChildren":I
    :cond_2
    return-void
.end method

.method private addProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;

    .prologue
    .line 465
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 466
    .local v0, "msg":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 467
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "(id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 469
    :cond_0
    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->log(Ljava/lang/String;I)V

    .line 471
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 480
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getDelimiter()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 481
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/Project;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 482
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 489
    :goto_0
    if-eqz p3, :cond_1

    .line 490
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p3, p2}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 492
    :cond_1
    return-void

    .line 483
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 484
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    invoke-virtual {v1, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 487
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Override ignored for property "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 247
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

.method private getAttributeName(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 3
    .param p1, "attributeNode"    # Lorg/w3c/dom/Node;

    .prologue
    .line 502
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 504
    .local v0, "attributeName":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-eqz v1, :cond_3

    .line 507
    const-string/jumbo v1, "refid"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 508
    const-string/jumbo v1, ""

    .line 516
    :goto_0
    return-object v1

    .line 511
    :cond_0
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->isSemanticAttribute(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->includeSemanticAttribute:Z

    if-eqz v1, :cond_2

    .line 512
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 514
    :cond_2
    const-string/jumbo v1, ""

    goto :goto_0

    .line 516
    :cond_3
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->collapseAttributes:Z

    if-eqz v1, :cond_4

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getAttributeValue(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 5
    .param p1, "attributeNode"    # Lorg/w3c/dom/Node;

    .prologue
    .line 544
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 545
    .local v2, "nodeValue":Ljava/lang/String;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-eqz v4, :cond_1

    .line 546
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 547
    .local v0, "attributeName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 548
    const-string/jumbo v4, "location"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 549
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 550
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 559
    .end local v0    # "attributeName":Ljava/lang/String;
    .end local v1    # "f":Ljava/io/File;
    :goto_0
    return-object v4

    .line 552
    .restart local v0    # "attributeName":Ljava/lang/String;
    :cond_0
    const-string/jumbo v4, "refid"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 553
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 554
    .local v3, "ref":Ljava/lang/Object;
    if-eqz v3, :cond_1

    .line 555
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .end local v0    # "attributeName":Ljava/lang/String;
    .end local v3    # "ref":Ljava/lang/Object;
    :cond_1
    move-object v4, v2

    .line 559
    goto :goto_0
.end method

.method private static isSemanticAttribute(Ljava/lang/String;)Z
    .locals 2
    .param p0, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 523
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->ATTRIBUTES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 524
    sget-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->ATTRIBUTES:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 525
    const/4 v1, 0x1

    .line 528
    :goto_1
    return v1

    .line 523
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 528
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private resolveFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 743
    sget-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->rootDirectory:Ljava/io/File;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->rootDirectory:Ljava/io/File;

    goto :goto_0
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 590
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 591
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported as archives"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 594
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 595
    return-void
.end method

.method public addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V
    .locals 1
    .param p1, "catalog"    # Lorg/apache/tools/ant/types/XMLCatalog;

    .prologue
    .line 664
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V

    .line 665
    return-void
.end method

.method addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;)V
    .locals 1
    .param p1, "node"    # Lorg/w3c/dom/Node;
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 318
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)V

    .line 319
    return-void
.end method

.method public execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v12

    .line 233
    .local v12, "r":Lorg/apache/tools/ant/types/Resource;
    if-nez v12, :cond_0

    .line 234
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v18, "XmlProperty task requires a source resource"

    invoke-direct/range {v17 .. v18}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 237
    :cond_0
    :try_start_0
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Loading "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->log(Ljava/lang/String;I)V

    .line 239
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v17

    if-eqz v17, :cond_5

    .line 241
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 242
    .local v6, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->validate:Z

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setValidating(Z)V

    .line 243
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 244
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v4

    .line 245
    .local v4, "builder":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getEntityResolver()Lorg/xml/sax/EntityResolver;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 246
    const/4 v5, 0x0

    .line 247
    .local v5, "document":Lorg/w3c/dom/Document;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v18, v0

    sget-object v17, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v17, :cond_2

    const-string/jumbo v17, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v17

    sput-object v17, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 248
    .local v7, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v7, :cond_3

    .line 249
    invoke-interface {v7}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v5

    .line 253
    :goto_1
    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v15

    .line 259
    .local v15, "topElement":Lorg/w3c/dom/Element;
    new-instance v17, Ljava/util/Hashtable;

    invoke-direct/range {v17 .. v17}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addedAttributes:Ljava/util/Hashtable;

    .line 261
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->keepRoot:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->prefix:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v15, v1, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)V

    .line 288
    .end local v4    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v5    # "document":Lorg/w3c/dom/Document;
    .end local v6    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v15    # "topElement":Lorg/w3c/dom/Element;
    :cond_1
    :goto_2
    return-void

    .line 247
    .restart local v4    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .restart local v5    # "document":Lorg/w3c/dom/Document;
    .restart local v6    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    :cond_2
    sget-object v17, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 251
    .restart local v7    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v5

    goto :goto_1

    .line 264
    .restart local v15    # "topElement":Lorg/w3c/dom/Element;
    :cond_4
    invoke-interface {v15}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v14

    .line 265
    .local v14, "topChildren":Lorg/w3c/dom/NodeList;
    invoke-interface {v14}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    .line 266
    .local v10, "numChildren":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_3
    if-ge v8, v10, :cond_1

    .line 267
    invoke-interface {v14, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->prefix:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addNodeRecursively(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 271
    .end local v4    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v5    # "document":Lorg/w3c/dom/Document;
    .end local v6    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    .end local v7    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v8    # "i":I
    .end local v10    # "numChildren":I
    .end local v14    # "topChildren":Lorg/w3c/dom/NodeList;
    .end local v15    # "topElement":Lorg/w3c/dom/Element;
    :cond_5
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Unable to find property resource: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_2

    .line 274
    :catch_0
    move-exception v13

    .line 276
    .local v13, "sxe":Lorg/xml/sax/SAXException;
    move-object/from16 v16, v13

    .line 277
    .local v16, "x":Ljava/lang/Exception;
    invoke-virtual {v13}, Lorg/xml/sax/SAXException;->getException()Ljava/lang/Exception;

    move-result-object v17

    if-eqz v17, :cond_6

    .line 278
    invoke-virtual {v13}, Lorg/xml/sax/SAXException;->getException()Ljava/lang/Exception;

    move-result-object v16

    .line 280
    :cond_6
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Failed to load "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v17

    .line 281
    .end local v13    # "sxe":Lorg/xml/sax/SAXException;
    .end local v16    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v11

    .line 283
    .local v11, "pce":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v17

    .line 284
    .end local v11    # "pce":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_2
    move-exception v9

    .line 286
    .local v9, "ioe":Ljava/io/IOException;
    new-instance v17, Lorg/apache/tools/ant/BuildException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Failed to load "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v17
.end method

.method protected getCollapseAttributes()Z
    .locals 1

    .prologue
    .line 714
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->collapseAttributes:Z

    return v0
.end method

.method public getDelimiter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 767
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->delimiter:Ljava/lang/String;

    return-object v0
.end method

.method protected getEntityResolver()Lorg/xml/sax/EntityResolver;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    return-object v0
.end method

.method protected getFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 673
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 674
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    :goto_1
    return-object v1

    .line 673
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 674
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected getIncludeSementicAttribute()Z
    .locals 1

    .prologue
    .line 735
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->includeSemanticAttribute:Z

    return v0
.end method

.method protected getKeeproot()Z
    .locals 1

    .prologue
    .line 700
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->keepRoot:Z

    return v0
.end method

.method protected getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 693
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method protected getResource()Lorg/apache/tools/ant/types/Resource;
    .locals 4

    .prologue
    .line 683
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getFile()Ljava/io/File;

    move-result-object v0

    .line 684
    .local v0, "f":Ljava/io/File;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    sget-object v2, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 685
    .local v1, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-nez v0, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    :goto_1
    return-object v2

    .line 684
    .end local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 685
    .restart local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    goto :goto_1

    :cond_2
    new-instance v2, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    goto :goto_1
.end method

.method protected getRootDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 728
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->rootDirectory:Ljava/io/File;

    return-object v0
.end method

.method protected getSemanticAttributes()Z
    .locals 1

    .prologue
    .line 721
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    return v0
.end method

.method protected getValidate()Z
    .locals 1

    .prologue
    .line 707
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->validate:Z

    return v0
.end method

.method public init()V
    .locals 2

    .prologue
    .line 213
    invoke-super {p0}, Lorg/apache/tools/ant/Task;->init()V

    .line 214
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 215
    return-void
.end method

.method public processNode(Lorg/w3c/dom/Node;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17
    .param p1, "node"    # Lorg/w3c/dom/Node;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "container"    # Ljava/lang/Object;

    .prologue
    .line 342
    const/4 v2, 0x0

    .line 345
    .local v2, "addedPath":Ljava/lang/Object;
    const/4 v9, 0x0

    .line 347
    .local v9, "id":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->hasAttributes()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 349
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v11

    .line 352
    .local v11, "nodeAttributes":Lorg/w3c/dom/NamedNodeMap;
    const-string/jumbo v15, "id"

    invoke-interface {v11, v15}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v10

    .line 353
    .local v10, "idNode":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-eqz v15, :cond_1

    if-eqz v10, :cond_1

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v9

    .line 356
    :goto_0
    const/4 v8, 0x0

    .end local v2    # "addedPath":Ljava/lang/Object;
    .local v8, "i":I
    :goto_1
    invoke-interface {v11}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v15

    if-ge v8, v15, :cond_9

    .line 358
    invoke-interface {v11, v8}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 360
    .local v4, "attributeNode":Lorg/w3c/dom/Node;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-nez v15, :cond_2

    .line 361
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getAttributeName(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 362
    .local v3, "attributeName":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getAttributeValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    .line 363
    .local v5, "attributeValue":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v5, v1}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    .end local v3    # "attributeName":Ljava/lang/String;
    :cond_0
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 353
    .end local v4    # "attributeNode":Lorg/w3c/dom/Node;
    .end local v5    # "attributeValue":Ljava/lang/String;
    .end local v8    # "i":I
    .restart local v2    # "addedPath":Ljava/lang/Object;
    :cond_1
    const/4 v9, 0x0

    goto :goto_0

    .line 365
    .end local v2    # "addedPath":Ljava/lang/Object;
    .restart local v4    # "attributeNode":Lorg/w3c/dom/Node;
    .restart local v8    # "i":I
    :cond_2
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    .line 366
    .local v12, "nodeName":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getAttributeValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    .line 368
    .restart local v5    # "attributeValue":Ljava/lang/String;
    if-eqz p3, :cond_3

    move-object/from16 v0, p3

    instance-of v15, v0, Lorg/apache/tools/ant/types/Path;

    if-eqz v15, :cond_3

    move-object/from16 v15, p3

    check-cast v15, Lorg/apache/tools/ant/types/Path;

    move-object v6, v15

    .line 378
    .local v6, "containingPath":Lorg/apache/tools/ant/types/Path;
    :goto_3
    const-string/jumbo v15, "id"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 382
    if-eqz v6, :cond_4

    const-string/jumbo v15, "path"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 384
    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/types/Path;->setPath(Ljava/lang/String;)V

    goto :goto_2

    .line 368
    .end local v6    # "containingPath":Lorg/apache/tools/ant/types/Path;
    :cond_3
    const/4 v6, 0x0

    goto :goto_3

    .line 385
    .restart local v6    # "containingPath":Lorg/apache/tools/ant/types/Path;
    :cond_4
    move-object/from16 v0, p3

    instance-of v15, v0, Lorg/apache/tools/ant/types/Path;

    if-eqz v15, :cond_5

    const-string/jumbo v15, "refid"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 387
    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/types/Path;->setPath(Ljava/lang/String;)V

    goto :goto_2

    .line 388
    :cond_5
    move-object/from16 v0, p3

    instance-of v15, v0, Lorg/apache/tools/ant/types/Path;

    if-eqz v15, :cond_6

    const-string/jumbo v15, "location"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 391
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v15

    invoke-virtual {v6, v15}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    goto :goto_2

    .line 392
    :cond_6
    const-string/jumbo v15, "pathid"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 394
    if-eqz p3, :cond_7

    .line 395
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v16, "XmlProperty does not support nested paths"

    invoke-direct/range {v15 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 397
    :cond_7
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    invoke-direct {v2, v15}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 398
    .local v2, "addedPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    invoke-virtual {v15, v5, v2}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 401
    .end local v2    # "addedPath":Lorg/apache/tools/ant/types/Path;
    :cond_8
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getAttributeName(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    .line 402
    .restart local v3    # "attributeName":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15, v5, v9}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 407
    .end local v3    # "attributeName":Ljava/lang/String;
    .end local v4    # "attributeNode":Lorg/w3c/dom/Node;
    .end local v5    # "attributeValue":Ljava/lang/String;
    .end local v6    # "containingPath":Lorg/apache/tools/ant/types/Path;
    .end local v8    # "i":I
    .end local v10    # "idNode":Lorg/w3c/dom/Node;
    .end local v11    # "nodeAttributes":Lorg/w3c/dom/NamedNodeMap;
    .end local v12    # "nodeName":Ljava/lang/String;
    :cond_9
    const/4 v13, 0x0

    .line 408
    .local v13, "nodeText":Ljava/lang/String;
    const/4 v7, 0x0

    .line 409
    .local v7, "emptyNode":Z
    const/4 v14, 0x0

    .line 410
    .local v14, "semanticEmptyOverride":Z
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_b

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-eqz v15, :cond_b

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->hasAttributes()Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string/jumbo v16, "value"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-nez v15, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string/jumbo v16, "location"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-nez v15, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string/jumbo v16, "refid"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-nez v15, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string/jumbo v16, "path"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-nez v15, :cond_a

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string/jumbo v16, "pathid"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-eqz v15, :cond_b

    .line 418
    :cond_a
    const/4 v14, 0x1

    .line 420
    :cond_b
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x3

    move/from16 v0, v16

    if-ne v15, v0, :cond_10

    .line 422
    invoke-direct/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->getAttributeValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v13

    .line 444
    :cond_c
    :goto_4
    if-eqz v13, :cond_f

    .line 446
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    if-eqz v15, :cond_d

    if-nez v9, :cond_d

    move-object/from16 v0, p3

    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_d

    move-object/from16 v9, p3

    .line 447
    check-cast v9, Ljava/lang/String;

    .line 449
    :cond_d
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    if-nez v15, :cond_e

    if-eqz v7, :cond_f

    .line 450
    :cond_e
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v13, v9}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->addProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    :cond_f
    if-eqz v2, :cond_13

    :goto_5
    return-object v2

    .line 423
    :cond_10
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_11

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_11

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x4

    move/from16 v0, v16

    if-ne v15, v0, :cond_11

    .line 427
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v13

    .line 428
    const-string/jumbo v15, ""

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c

    if-nez v14, :cond_c

    .line 429
    const/4 v7, 0x1

    goto :goto_4

    .line 431
    :cond_11
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_12

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v15

    if-nez v15, :cond_12

    if-nez v14, :cond_12

    .line 434
    const-string/jumbo v13, ""

    .line 435
    const/4 v7, 0x1

    goto :goto_4

    .line 436
    :cond_12
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v15

    const/16 v16, 0x3

    move/from16 v0, v16

    if-ne v15, v0, :cond_c

    const-string/jumbo v15, ""

    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_c

    if-nez v14, :cond_c

    .line 441
    const-string/jumbo v13, ""

    .line 442
    const/4 v7, 0x1

    goto/16 :goto_4

    :cond_13
    move-object v2, v9

    .line 457
    goto/16 :goto_5
.end method

.method public setCollapseAttributes(Z)V
    .locals 0
    .param p1, "collapseAttributes"    # Z

    .prologue
    .line 629
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->collapseAttributes:Z

    .line 630
    return-void
.end method

.method public setDelimiter(Ljava/lang/String;)V
    .locals 0
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 776
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->delimiter:Ljava/lang/String;

    .line 777
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 567
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 568
    return-void
.end method

.method public setIncludeSemanticAttribute(Z)V
    .locals 0
    .param p1, "includeSemanticAttribute"    # Z

    .prologue
    .line 656
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->includeSemanticAttribute:Z

    .line 657
    return-void
.end method

.method public setKeeproot(Z)V
    .locals 0
    .param p1, "keepRoot"    # Z

    .prologue
    .line 612
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->keepRoot:Z

    .line 613
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 602
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->prefix:Ljava/lang/String;

    .line 603
    return-void
.end method

.method public setRootDirectory(Ljava/io/File;)V
    .locals 0
    .param p1, "rootDirectory"    # Ljava/io/File;

    .prologue
    .line 646
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->rootDirectory:Ljava/io/File;

    .line 647
    return-void
.end method

.method public setSemanticAttributes(Z)V
    .locals 0
    .param p1, "semanticAttributes"    # Z

    .prologue
    .line 637
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->semanticAttributes:Z

    .line 638
    return-void
.end method

.method public setSrcResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 575
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 576
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "the source can\'t be a directory"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 578
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->supportsNonFileResources()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 579
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->src:Lorg/apache/tools/ant/types/Resource;

    .line 583
    return-void

    .line 578
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 581
    :cond_3
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only FileSystem resources are supported."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setValidate(Z)V
    .locals 0
    .param p1, "validate"    # Z

    .prologue
    .line 620
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->validate:Z

    .line 621
    return-void
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 759
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$taskdefs$XmlProperty:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.XmlProperty"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$taskdefs$XmlProperty:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/XmlProperty;->class$org$apache$tools$ant$taskdefs$XmlProperty:Ljava/lang/Class;

    goto :goto_0
.end method
