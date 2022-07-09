.class public Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "ProjectHelper2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelper2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RootHandler"
.end annotation


# instance fields
.field private antHandlers:Ljava/util/Stack;

.field private context:Lorg/apache/tools/ant/helper/AntXMLContext;

.field private currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/AntXMLContext;Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;)V
    .locals 2
    .param p1, "context"    # Lorg/apache/tools/ant/helper/AntXMLContext;
    .param p2, "rootHandler"    # Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .prologue
    .line 526
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 516
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->antHandlers:Ljava/util/Stack;

    .line 517
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 527
    iput-object p2, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 528
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->antHandlers:Ljava/util/Stack;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    iput-object p1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    .line 530
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;)Lorg/apache/tools/ant/helper/AntXMLContext;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;

    .prologue
    .line 515
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    return-object v0
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 642
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v0, p1, p2, p3, v1}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;->characters([CIILorg/apache/tools/ant/helper/AntXMLContext;)V

    .line 643
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 625
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v1, p1, p2, v2}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;->onEndElement(Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/helper/AntXMLContext;)V

    .line 626
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->antHandlers:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 627
    .local v0, "prev":Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 628
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    if-eqz v1, :cond_0

    .line 629
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v1, p1, p2, p3, v2}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;->onEndChild(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/helper/AntXMLContext;)V

    .line 631
    :cond_0
    return-void
.end method

.method public endPrefixMapping(Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 661
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/helper/AntXMLContext;->endPrefixMapping(Ljava/lang/String;)V

    .line 662
    return-void
.end method

.method public getCurrentAntHandler()Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    .locals 1

    .prologue
    .line 537
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    return-object v0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 10
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x1

    .line 552
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "resolving systemId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 554
    const-string/jumbo v4, "file:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 555
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$100()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {v4, p2}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 557
    .local v3, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 558
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_0

    .line 559
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$100()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v5}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFileParent()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 560
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Warning: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\' in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v6}, Lorg/apache/tools/ant/helper/AntXMLContext;->getBuildFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " should be expressed simply as \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const/16 v6, 0x5c

    const/16 v7, 0x2f

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\' for compliance with other XML tools"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 565
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "file="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v9}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 567
    :try_start_0
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 568
    .local v2, "inputSource":Lorg/xml/sax/InputSource;
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelper2;->access$100()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v3    # "path":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 570
    .restart local v0    # "file":Ljava/io/File;
    .restart local v3    # "path":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 571
    .local v1, "fne":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " could not be found"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 577
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "fne":Ljava/io/FileNotFoundException;
    .end local v3    # "path":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v4}, Lorg/apache/tools/ant/helper/AntXMLContext;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "could not resolve systemId"

    invoke-virtual {v4, v5, v9}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 578
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 1
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 610
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/helper/AntXMLContext;->setLocator(Lorg/xml/sax/Locator;)V

    .line 611
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 7
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/String;
    .param p3, "qname"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 597
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;->onStartChild(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    move-result-object v6

    .line 598
    .local v6, "next":Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->antHandlers:Ljava/util/Stack;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    iput-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    .line 600
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->currentHandler:Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelper2$AntHandler;->onStartElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;Lorg/apache/tools/ant/helper/AntXMLContext;)V

    .line 601
    return-void
.end method

.method public startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 652
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelper2$RootHandler;->context:Lorg/apache/tools/ant/helper/AntXMLContext;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/AntXMLContext;->startPrefixMapping(Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    return-void
.end method
