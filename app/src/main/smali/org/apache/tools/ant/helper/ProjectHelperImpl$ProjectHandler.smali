.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ProjectHandler"
.end annotation


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V
    .locals 0
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p2, "parentHandler"    # Lorg/xml/sax/DocumentHandler;

    .prologue
    .line 361
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 362
    return-void
.end method

.method private handleTarget(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 476
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-direct {v0, v1, p0}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 477
    return-void
.end method


# virtual methods
.method public init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 11
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 381
    const/4 v1, 0x0

    .line 382
    .local v1, "def":Ljava/lang/String;
    const/4 v5, 0x0

    .line 383
    .local v5, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 384
    .local v3, "id":Ljava/lang/String;
    const/4 v0, 0x0

    .line 386
    .local v0, "baseDir":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/xml/sax/AttributeList;->getLength()I

    move-result v8

    if-ge v2, v8, :cond_4

    .line 387
    invoke-interface {p2, v2}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v4

    .line 388
    .local v4, "key":Ljava/lang/String;
    invoke-interface {p2, v2}, Lorg/xml/sax/AttributeList;->getValue(I)Ljava/lang/String;

    move-result-object v7

    .line 390
    .local v7, "value":Ljava/lang/String;
    const-string/jumbo v8, "default"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 391
    move-object v1, v7

    .line 386
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 392
    :cond_0
    const-string/jumbo v8, "name"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 393
    move-object v5, v7

    goto :goto_1

    .line 394
    :cond_1
    const-string/jumbo v8, "id"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 395
    move-object v3, v7

    goto :goto_1

    .line 396
    :cond_2
    const-string/jumbo v8, "basedir"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 397
    move-object v0, v7

    goto :goto_1

    .line 399
    :cond_3
    new-instance v8, Lorg/xml/sax/SAXParseException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unexpected attribute \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-interface {p2, v2}, Lorg/xml/sax/AttributeList;->getName(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v10}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v8

    .line 405
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_4
    if-eqz v1, :cond_7

    const-string/jumbo v8, ""

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 406
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8, v1}, Lorg/apache/tools/ant/Project;->setDefault(Ljava/lang/String;)V

    .line 411
    if-eqz v5, :cond_5

    .line 412
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8, v5}, Lorg/apache/tools/ant/Project;->setName(Ljava/lang/String;)V

    .line 413
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v8, v5, v9}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 416
    :cond_5
    if-eqz v3, :cond_6

    .line 417
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v8, v3, v9}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 420
    :cond_6
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, "basedir"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_8

    .line 421
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v9

    const-string/jumbo v10, "basedir"

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    .line 437
    :goto_2
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, ""

    iget-object v10, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v10}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$600(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Target;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/Project;->addTarget(Ljava/lang/String;Lorg/apache/tools/ant/Target;)V

    .line 438
    return-void

    .line 408
    :cond_7
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "The default attribute is required"

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 423
    :cond_8
    if-nez v0, :cond_9

    .line 424
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$400(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    goto :goto_2

    .line 427
    :cond_9
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/io/File;->isAbsolute()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 428
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/Project;->setBasedir(Ljava/lang/String;)V

    goto :goto_2

    .line 430
    :cond_a
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$300()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v9}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$400(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9, v0}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 432
    .local v6, "resolvedBaseDir":Ljava/io/File;
    iget-object v8, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v8}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8, v6}, Lorg/apache/tools/ant/Project;->setBaseDir(Ljava/io/File;)V

    goto :goto_2
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
    .line 456
    const-string/jumbo v0, "target"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 457
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->handleTarget(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 461
    :goto_0
    return-void

    .line 459
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v1}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$600(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Target;

    move-result-object v1

    invoke-static {v0, p0, v1, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$700(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    goto :goto_0
.end method
