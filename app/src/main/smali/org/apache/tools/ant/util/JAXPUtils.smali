.class public Lorg/apache/tools/ant/util/JAXPUtils;
.super Ljava/lang/Object;
.source "JAXPUtils.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

.field private static nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;

.field private static parserFactory:Ljavax/xml/parsers/SAXParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 57
    sput-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->parserFactory:Ljavax/xml/parsers/SAXParserFactory;

    .line 64
    sput-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;

    .line 71
    sput-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertToBuildException(Lorg/xml/sax/SAXException;)Lorg/apache/tools/ant/BuildException;
    .locals 2
    .param p0, "e"    # Lorg/xml/sax/SAXException;

    .prologue
    .line 230
    invoke-virtual {p0}, Lorg/xml/sax/SAXException;->getException()Ljava/lang/Exception;

    move-result-object v0

    .line 231
    .local v0, "nested":Ljava/lang/Exception;
    if-eqz v0, :cond_0

    .line 232
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .line 234
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 200
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static declared-synchronized getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 246
    const-class v2, Lorg/apache/tools/ant/util/JAXPUtils;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 248
    :try_start_1
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_end_1
    .catch Ljavax/xml/parsers/FactoryConfigurationError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    :cond_0
    :try_start_2
    sget-object v1, Lorg/apache/tools/ant/util/JAXPUtils;->builderFactory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v2

    return-object v1

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, "e":Ljavax/xml/parsers/FactoryConfigurationError;
    :try_start_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Document builder factory has not been configured correctly: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljavax/xml/parsers/FactoryConfigurationError;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 246
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized getNSParserFactory()Ljavax/xml/parsers/SAXParserFactory;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 103
    const-class v1, Lorg/apache/tools/ant/util/JAXPUtils;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;

    if-nez v0, :cond_0

    .line 104
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->newParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;

    .line 105
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 107
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->nsParserFactory:Ljavax/xml/parsers/SAXParserFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getNamespaceXMLReader()Lorg/xml/sax/XMLReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 172
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getNSParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/util/JAXPUtils;->newSAXParser(Ljavax/xml/parsers/SAXParserFactory;)Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-static {v0}, Lorg/apache/tools/ant/util/JAXPUtils;->convertToBuildException(Lorg/xml/sax/SAXException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
.end method

.method public static getParser()Lorg/xml/sax/Parser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 139
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/util/JAXPUtils;->newSAXParser(Ljavax/xml/parsers/SAXParserFactory;)Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getParser()Lorg/xml/sax/Parser;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 140
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-static {v0}, Lorg/apache/tools/ant/util/JAXPUtils;->convertToBuildException(Lorg/xml/sax/SAXException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
.end method

.method public static declared-synchronized getParserFactory()Ljavax/xml/parsers/SAXParserFactory;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 85
    const-class v1, Lorg/apache/tools/ant/util/JAXPUtils;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->parserFactory:Ljavax/xml/parsers/SAXParserFactory;

    if-nez v0, :cond_0

    .line 86
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->newParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->parserFactory:Ljavax/xml/parsers/SAXParserFactory;

    .line 88
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->parserFactory:Ljavax/xml/parsers/SAXParserFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getSystemId(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 188
    sget-object v0, Lorg/apache/tools/ant/util/JAXPUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getXMLReader()Lorg/xml/sax/XMLReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 156
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/util/JAXPUtils;->newSAXParser(Ljavax/xml/parsers/SAXParserFactory;)Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-static {v0}, Lorg/apache/tools/ant/util/JAXPUtils;->convertToBuildException(Lorg/xml/sax/SAXException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
.end method

.method public static newParserFactory()Ljavax/xml/parsers/SAXParserFactory;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 120
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;
    :try_end_0
    .catch Ljavax/xml/parsers/FactoryConfigurationError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljavax/xml/parsers/FactoryConfigurationError;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "XML parser factory has not been configured correctly: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljavax/xml/parsers/FactoryConfigurationError;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static newSAXParser(Ljavax/xml/parsers/SAXParserFactory;)Ljavax/xml/parsers/SAXParser;
    .locals 4
    .param p0, "factory"    # Ljavax/xml/parsers/SAXParserFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 215
    :try_start_0
    invoke-virtual {p0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    return-object v1

    .line 216
    :catch_0
    move-exception v0

    .line 217
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Cannot create parser for the given configuration: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 219
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v0

    .line 220
    .local v0, "e":Lorg/xml/sax/SAXException;
    invoke-static {v0}, Lorg/apache/tools/ant/util/JAXPUtils;->convertToBuildException(Lorg/xml/sax/SAXException;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
.end method
