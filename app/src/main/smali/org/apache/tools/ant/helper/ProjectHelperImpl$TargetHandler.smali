.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TargetHandler"
.end annotation


# instance fields
.field private target:Lorg/apache/tools/ant/Target;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V
    .locals 0
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p2, "parentHandler"    # Lorg/xml/sax/DocumentHandler;

    .prologue
    .line 494
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 495
    return-void
.end method


# virtual methods
.method public init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 13
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 515
    const/4 v6, 0x0

    .line 516
    .local v6, "name":Ljava/lang/String;
    const-string/jumbo v0, ""

    .line 517
    .local v0, "depends":Ljava/lang/String;
    const/4 v4, 0x0

    .line 518
    .local v4, "ifCond":Ljava/lang/String;
    const/4 v7, 0x0

    .line 519
    .local v7, "unlessCond":Ljava/lang/String;
    const/4 v3, 0x0

    .line 520
    .local v3, "id":Ljava/lang/String;
    const/4 v1, 0x0

    .line 522
    .local v1, "description":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/AttributeList;->getLength()I

    move-result v9

    if-ge v2, v9, :cond_7

    .line 523
    invoke-interface {p2, v2}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v5

    .line 524
    .local v5, "key":Ljava/lang/String;
    invoke-interface {p2, v2}, Lorg/xml/sax/AttributeList;->getValue(I)Ljava/lang/String;

    move-result-object v8

    .line 526
    .local v8, "value":Ljava/lang/String;
    const-string/jumbo v9, "name"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 527
    move-object v6, v8

    .line 528
    const-string/jumbo v9, ""

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 529
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "name attribute must not be empty"

    new-instance v11, Lorg/apache/tools/ant/Location;

    iget-object v12, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v12}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/tools/ant/Location;-><init>(Lorg/xml/sax/Locator;)V

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 532
    :cond_0
    const-string/jumbo v9, "depends"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 533
    move-object v0, v8

    .line 522
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 534
    :cond_2
    const-string/jumbo v9, "if"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 535
    move-object v4, v8

    goto :goto_1

    .line 536
    :cond_3
    const-string/jumbo v9, "unless"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 537
    move-object v7, v8

    goto :goto_1

    .line 538
    :cond_4
    const-string/jumbo v9, "id"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 539
    move-object v3, v8

    goto :goto_1

    .line 540
    :cond_5
    const-string/jumbo v9, "description"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 541
    move-object v1, v8

    goto :goto_1

    .line 543
    :cond_6
    new-instance v9, Lorg/xml/sax/SAXParseException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Unexpected attribute \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v11}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v9

    .line 548
    .end local v5    # "key":Ljava/lang/String;
    .end local v8    # "value":Ljava/lang/String;
    :cond_7
    if-nez v6, :cond_8

    .line 549
    new-instance v9, Lorg/xml/sax/SAXParseException;

    const-string/jumbo v10, "target element appears without a name attribute"

    iget-object v11, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v11}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v9

    .line 553
    :cond_8
    new-instance v9, Lorg/apache/tools/ant/Target;

    invoke-direct {v9}, Lorg/apache/tools/ant/Target;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    .line 556
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    const-string/jumbo v10, ""

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/Target;->addDependency(Ljava/lang/String;)V

    .line 558
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 559
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v4}, Lorg/apache/tools/ant/Target;->setIf(Ljava/lang/String;)V

    .line 560
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v7}, Lorg/apache/tools/ant/Target;->setUnless(Ljava/lang/String;)V

    .line 561
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v1}, Lorg/apache/tools/ant/Target;->setDescription(Ljava/lang/String;)V

    .line 562
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v6, v10}, Lorg/apache/tools/ant/Project;->addTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 564
    if-eqz v3, :cond_9

    const-string/jumbo v9, ""

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 565
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v3, v10}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 570
    :cond_9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_a

    .line 571
    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Target;->setDepends(Ljava/lang/String;)V

    .line 573
    :cond_a
    return-void
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 587
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->target:Lorg/apache/tools/ant/Target;

    invoke-static {v0, p0, v1, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$700(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 588
    return-void
.end method
