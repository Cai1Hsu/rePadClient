.class public Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.super Lorg/apache/tools/ant/ProjectHelper;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;,
        Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private buildFile:Ljava/io/File;

.field private buildFileParent:Ljava/io/File;

.field private implicitTarget:Lorg/apache/tools/ant/Target;

.field private locator:Lorg/xml/sax/Locator;

.field private parser:Lorg/xml/sax/Parser;

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectHelper;-><init>()V

    .line 89
    new-instance v0, Lorg/apache/tools/ant/Target;

    invoke-direct {v0}, Lorg/apache/tools/ant/Target;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->implicitTarget:Lorg/apache/tools/ant/Target;

    .line 95
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->implicitTarget:Lorg/apache/tools/ant/Target;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Target;->setName(Ljava/lang/String;)V

    .line 96
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Parser;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method static access$102(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/Locator;)Lorg/xml/sax/Locator;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p1, "x1"    # Lorg/xml/sax/Locator;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->locator:Lorg/xml/sax/Locator;

    return-object p1
.end method

.method static access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method static access$300()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method static access$400(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->buildFileParent:Ljava/io/File;

    return-object v0
.end method

.method static access$500(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->buildFile:Ljava/io/File;

    return-object v0
.end method

.method static access$600(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Target;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->implicitTarget:Lorg/apache/tools/ant/Target;

    return-object v0
.end method

.method static access$700(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p1, "x1"    # Lorg/xml/sax/DocumentHandler;
    .param p2, "x2"    # Lorg/apache/tools/ant/Target;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-static {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->handleElement(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    return-void
.end method

.method static access$800(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Ljava/lang/Object;Lorg/xml/sax/AttributeList;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Lorg/xml/sax/AttributeList;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->configureId(Ljava/lang/Object;Lorg/xml/sax/AttributeList;)V

    return-void
.end method

.method private configureId(Ljava/lang/Object;Lorg/xml/sax/AttributeList;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "attr"    # Lorg/xml/sax/AttributeList;

    .prologue
    .line 1020
    const-string/jumbo v1, "id"

    invoke-interface {p2, v1}, Lorg/xml/sax/AttributeList;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1021
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1022
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v1, v0, p1}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1024
    :cond_0
    return-void
.end method

.method private static handleElement(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 6
    .param p0, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p1, "parent"    # Lorg/xml/sax/DocumentHandler;
    .param p2, "target"    # Lorg/apache/tools/ant/Target;
    .param p3, "elementName"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 601
    const-string/jumbo v0, "description"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 602
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;

    invoke-direct {v0, p0, p1}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 608
    :goto_0
    return-void

    .line 603
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 604
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;)V

    invoke-virtual {v0, p3, p4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    goto :goto_0

    .line 606
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/TaskContainer;Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/Target;)V

    invoke-virtual {v0, p3, p4}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    goto :goto_0
.end method


# virtual methods
.method public parse(Lorg/apache/tools/ant/Project;Ljava/lang/Object;)V
    .locals 17
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 107
    move-object/from16 v0, p2

    instance-of v14, v0, Ljava/io/File;

    if-nez v14, :cond_0

    .line 108
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Only File source supported by default plugin"

    invoke-direct {v14, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14

    :cond_0
    move-object/from16 v2, p2

    .line 111
    check-cast v2, Ljava/io/File;

    .line 112
    .local v2, "bFile":Ljava/io/File;
    const/4 v9, 0x0

    .line 113
    .local v9, "inputStream":Ljava/io/FileInputStream;
    const/4 v7, 0x0

    .line 115
    .local v7, "inputSource":Lorg/xml/sax/InputSource;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->project:Lorg/apache/tools/ant/Project;

    .line 116
    new-instance v14, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->buildFile:Ljava/io/File;

    .line 117
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->buildFile:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->buildFileParent:Ljava/io/File;

    .line 121
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getParser()Lorg/xml/sax/Parser;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    :goto_0
    :try_start_1
    sget-object v14, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 126
    .local v13, "uri":Ljava/lang/String;
    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Lorg/xml/sax/SAXParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 127
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .local v10, "inputStream":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v8, Lorg/xml/sax/InputSource;

    invoke-direct {v8, v10}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Lorg/xml/sax/SAXParseException; {:try_start_2 .. :try_end_2} :catch_e
    .catch Lorg/xml/sax/SAXException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 128
    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .local v8, "inputSource":Lorg/xml/sax/InputSource;
    :try_start_3
    invoke-virtual {v8, v13}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 129
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "parsing buildfile "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, " with URI = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 130
    new-instance v6, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$RootHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)V

    .line 131
    .local v6, "hb":Lorg/xml/sax/HandlerBase;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    invoke-interface {v14, v6}, Lorg/xml/sax/Parser;->setDocumentHandler(Lorg/xml/sax/DocumentHandler;)V

    .line 132
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    invoke-interface {v14, v6}, Lorg/xml/sax/Parser;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 133
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    invoke-interface {v14, v6}, Lorg/xml/sax/Parser;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 134
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    invoke-interface {v14, v6}, Lorg/xml/sax/Parser;->setDTDHandler(Lorg/xml/sax/DTDHandler;)V

    .line 135
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;

    invoke-interface {v14, v8}, Lorg/xml/sax/Parser;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_3
    .catch Lorg/xml/sax/SAXParseException; {:try_start_3 .. :try_end_3} :catch_f
    .catch Lorg/xml/sax/SAXException; {:try_start_3 .. :try_end_3} :catch_d
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_9
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 162
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 164
    return-void

    .line 122
    .end local v6    # "hb":Lorg/xml/sax/HandlerBase;
    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .end local v13    # "uri":Ljava/lang/String;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    :catch_0
    move-exception v4

    .line 123
    .local v4, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_4
    new-instance v14, Lorg/xml/sax/helpers/XMLReaderAdapter;

    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/xml/sax/helpers/XMLReaderAdapter;-><init>(Lorg/xml/sax/XMLReader;)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->parser:Lorg/xml/sax/Parser;
    :try_end_4
    .catch Lorg/xml/sax/SAXParseException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 136
    .end local v4    # "e":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v5

    .line 137
    .local v5, "exc":Lorg/xml/sax/SAXParseException;
    :goto_1
    :try_start_5
    new-instance v11, Lorg/apache/tools/ant/Location;

    invoke-virtual {v5}, Lorg/xml/sax/SAXParseException;->getSystemId()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v15

    invoke-virtual {v5}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v16

    move/from16 v0, v16

    invoke-direct {v11, v14, v15, v0}, Lorg/apache/tools/ant/Location;-><init>(Ljava/lang/String;II)V

    .line 140
    .local v11, "location":Lorg/apache/tools/ant/Location;
    invoke-virtual {v5}, Lorg/xml/sax/SAXParseException;->getException()Ljava/lang/Exception;

    move-result-object v12

    .line 141
    .local v12, "t":Ljava/lang/Throwable;
    instance-of v14, v12, Lorg/apache/tools/ant/BuildException;

    if-eqz v14, :cond_2

    .line 142
    move-object v0, v12

    check-cast v0, Lorg/apache/tools/ant/BuildException;

    move-object v3, v0

    .line 143
    .local v3, "be":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v14

    sget-object v15, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    if-ne v14, v15, :cond_1

    .line 144
    invoke-virtual {v3, v11}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 146
    :cond_1
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 162
    .end local v3    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v5    # "exc":Lorg/xml/sax/SAXParseException;
    .end local v11    # "location":Lorg/apache/tools/ant/Location;
    .end local v12    # "t":Ljava/lang/Throwable;
    :catchall_0
    move-exception v14

    :goto_2
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v14

    .line 148
    .restart local v5    # "exc":Lorg/xml/sax/SAXParseException;
    .restart local v11    # "location":Lorg/apache/tools/ant/Location;
    .restart local v12    # "t":Ljava/lang/Throwable;
    :cond_2
    :try_start_6
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v5}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v12, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v14

    .line 149
    .end local v5    # "exc":Lorg/xml/sax/SAXParseException;
    .end local v11    # "location":Lorg/apache/tools/ant/Location;
    .end local v12    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v5

    .line 150
    .local v5, "exc":Lorg/xml/sax/SAXException;
    :goto_3
    invoke-virtual {v5}, Lorg/xml/sax/SAXException;->getException()Ljava/lang/Exception;

    move-result-object v12

    .line 151
    .restart local v12    # "t":Ljava/lang/Throwable;
    instance-of v14, v12, Lorg/apache/tools/ant/BuildException;

    if-eqz v14, :cond_3

    .line 152
    check-cast v12, Lorg/apache/tools/ant/BuildException;

    .end local v12    # "t":Ljava/lang/Throwable;
    throw v12

    .line 154
    .restart local v12    # "t":Ljava/lang/Throwable;
    :cond_3
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v5}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 155
    .end local v5    # "exc":Lorg/xml/sax/SAXException;
    .end local v12    # "t":Ljava/lang/Throwable;
    :catch_3
    move-exception v5

    .line 156
    .local v5, "exc":Ljava/io/FileNotFoundException;
    :goto_4
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v14, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 157
    .end local v5    # "exc":Ljava/io/FileNotFoundException;
    :catch_4
    move-exception v5

    .line 158
    .local v5, "exc":Ljava/io/UnsupportedEncodingException;
    :goto_5
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Encoding of project file is invalid."

    invoke-direct {v14, v15, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 159
    .end local v5    # "exc":Ljava/io/UnsupportedEncodingException;
    :catch_5
    move-exception v5

    .line 160
    .local v5, "exc":Ljava/io/IOException;
    :goto_6
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Error reading project file: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v5}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 162
    .end local v5    # "exc":Ljava/io/IOException;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v13    # "uri":Ljava/lang/String;
    :catchall_1
    move-exception v14

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catchall_2
    move-exception v14

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_2

    .line 159
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_6
    move-exception v5

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_6

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_7
    move-exception v5

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_6

    .line 157
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_8
    move-exception v5

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_9
    move-exception v5

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_5

    .line 155
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_a
    move-exception v5

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_4

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_b
    move-exception v5

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_4

    .line 149
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_c
    move-exception v5

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_d
    move-exception v5

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_3

    .line 136
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_e
    move-exception v5

    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto/16 :goto_1

    .end local v7    # "inputSource":Lorg/xml/sax/InputSource;
    .end local v9    # "inputStream":Ljava/io/FileInputStream;
    .restart local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v10    # "inputStream":Ljava/io/FileInputStream;
    :catch_f
    move-exception v5

    move-object v7, v8

    .end local v8    # "inputSource":Lorg/xml/sax/InputSource;
    .restart local v7    # "inputSource":Lorg/xml/sax/InputSource;
    move-object v9, v10

    .end local v10    # "inputStream":Ljava/io/FileInputStream;
    .restart local v9    # "inputStream":Ljava/io/FileInputStream;
    goto/16 :goto_1
.end method
