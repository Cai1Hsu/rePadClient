.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;
.super Lorg/xml/sax/HandlerBase;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RootHandler"
.end annotation


# instance fields
.field helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)V
    .locals 0
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 276
    invoke-direct {p0}, Lorg/xml/sax/HandlerBase;-><init>()V

    .line 277
    iput-object p1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .line 278
    return-void
.end method


# virtual methods
.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 9
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 291
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

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

    .line 293
    const-string/jumbo v4, "file:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 294
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$300()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {v4, p2}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 296
    .local v3, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 297
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_0

    .line 298
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$300()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$400(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 299
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

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

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v6}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$500(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;

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

    .line 304
    :cond_0
    :try_start_0
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 305
    .local v2, "inputSource":Lorg/xml/sax/InputSource;
    invoke-static {}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$300()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v3    # "path":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 307
    .restart local v0    # "file":Ljava/io/File;
    .restart local v3    # "path":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 308
    .local v1, "fne":Ljava/io/FileNotFoundException;
    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

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

    .line 313
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "fne":Ljava/io/FileNotFoundException;
    .end local v3    # "path":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setDocumentLocator(Lorg/xml/sax/Locator;)V
    .locals 1
    .param p1, "locator"    # Lorg/xml/sax/Locator;

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v0, p1}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$102(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/Locator;)Lorg/xml/sax/Locator;

    .line 345
    return-void
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 329
    const-string/jumbo v0, "project"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 330
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-direct {v0, v1, p0}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 335
    return-void

    .line 332
    :cond_0
    new-instance v0, Lorg/xml/sax/SAXParseException;

    const-string/jumbo v1, "Config file is not of expected XML type"

    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;)V

    throw v0
.end method
