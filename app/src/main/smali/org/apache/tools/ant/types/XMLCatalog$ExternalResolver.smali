.class Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;
.super Ljava/lang/Object;
.source "XMLCatalog.java"

# interfaces
.implements Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/XMLCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExternalResolver"
.end annotation


# instance fields
.field private externalCatalogsProcessed:Z

.field private parseCatalog:Ljava/lang/reflect/Method;

.field private resolve:Ljava/lang/reflect/Method;

.field private resolveEntity:Ljava/lang/reflect/Method;

.field private resolverImpl:Ljava/lang/Object;

.field private setXMLCatalog:Ljava/lang/reflect/Method;

.field private final this$0:Lorg/apache/tools/ant/types/XMLCatalog;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/Class;Ljava/lang/Object;)V
    .locals 5
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/XMLCatalog;
    .param p2, "resolverImplClass"    # Ljava/lang/Class;
    .param p3, "resolverImpl"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 921
    iput-object p1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 910
    iput-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->setXMLCatalog:Ljava/lang/reflect/Method;

    .line 911
    iput-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->parseCatalog:Ljava/lang/reflect/Method;

    .line 912
    iput-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolveEntity:Ljava/lang/reflect/Method;

    .line 913
    iput-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolve:Ljava/lang/reflect/Method;

    .line 916
    iput-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    .line 918
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->externalCatalogsProcessed:Z

    .line 923
    iput-object p3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    .line 933
    :try_start_0
    const-string/jumbo v2, "setXMLCatalog"

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.types.XMLCatalog"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    :goto_0
    aput-object v1, v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->setXMLCatalog:Ljava/lang/reflect/Method;

    .line 937
    const-string/jumbo v2, "parseCatalog"

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v1, v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->parseCatalog:Ljava/lang/reflect/Method;

    .line 941
    const-string/jumbo v2, "resolveEntity"

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    :goto_2
    aput-object v1, v3, v4

    const/4 v4, 0x1

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_3

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    :goto_3
    aput-object v1, v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolveEntity:Ljava/lang/reflect/Method;

    .line 945
    const-string/jumbo v2, "resolve"

    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_4

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    :goto_4
    aput-object v1, v3, v4

    const/4 v4, 0x1

    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_5

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/types/XMLCatalog;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    :goto_5
    aput-object v1, v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolve:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 952
    const-string/jumbo v1, "Apache resolver library found, xml-commons resolver will be used"

    const/4 v2, 0x3

    invoke-virtual {p1, v1, v2}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 954
    return-void

    .line 933
    :cond_0
    :try_start_1
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$org$apache$tools$ant$types$XMLCatalog:Ljava/lang/Class;

    goto/16 :goto_0

    .line 937
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1

    .line 941
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_2

    :cond_3
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_3

    .line 945
    :cond_4
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_4

    :cond_5
    sget-object v1, Lorg/apache/tools/ant/types/XMLCatalog;->class$java$lang$String:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    .line 948
    :catch_0
    move-exception v0

    .line 949
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private processExternalCatalogs()V
    .locals 12

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x1

    .line 1095
    iget-boolean v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->externalCatalogsProcessed:Z

    if-nez v5, :cond_0

    .line 1098
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->setXMLCatalog:Ljava/lang/reflect/Method;

    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-object v9, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1105
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 1106
    .local v1, "catPath":Lorg/apache/tools/ant/types/Path;
    if-eqz v1, :cond_0

    .line 1107
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Using catalogpath \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v11}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 1109
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/XMLCatalog;->getCatalogPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 1111
    .local v2, "catPathList":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_0

    .line 1112
    new-instance v0, Ljava/io/File;

    aget-object v5, v2, v4

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1113
    .local v0, "catFile":Ljava/io/File;
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Parsing "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v11}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 1115
    :try_start_1
    iget-object v5, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->parseCatalog:Ljava/lang/reflect/Method;

    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 1111
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1100
    .end local v0    # "catFile":Ljava/io/File;
    .end local v1    # "catPath":Lorg/apache/tools/ant/types/Path;
    .end local v2    # "catPathList":[Ljava/lang/String;
    .end local v4    # "i":I
    :catch_0
    move-exception v3

    .line 1101
    .local v3, "ex":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1117
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v0    # "catFile":Ljava/io/File;
    .restart local v1    # "catPath":Lorg/apache/tools/ant/types/Path;
    .restart local v2    # "catPathList":[Ljava/lang/String;
    .restart local v4    # "i":I
    :catch_1
    move-exception v3

    .line 1118
    .restart local v3    # "ex":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1123
    .end local v0    # "catFile":Ljava/io/File;
    .end local v1    # "catPath":Lorg/apache/tools/ant/types/Path;
    .end local v2    # "catPathList":[Ljava/lang/String;
    .end local v3    # "ex":Ljava/lang/Exception;
    .end local v4    # "i":I
    :cond_0
    iput-boolean v10, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->externalCatalogsProcessed:Z

    .line 1124
    return-void
.end method


# virtual methods
.method public resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;
    .locals 11
    .param p1, "href"    # Ljava/lang/String;
    .param p2, "base"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 1010
    const/4 v5, 0x0

    .line 1011
    .local v5, "result":Ljavax/xml/transform/sax/SAXSource;
    const/4 v6, 0x0

    .line 1013
    .local v6, "source":Lorg/xml/sax/InputSource;
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->processExternalCatalogs()V

    .line 1015
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v7, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$000(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;

    move-result-object v4

    .line 1017
    .local v4, "matchingEntry":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz v4, :cond_3

    .line 1019
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Matching catalog entry found for uri: \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\' location: \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    invoke-virtual {v7, v8, v9}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 1036
    move-object v1, v4

    .line 1037
    .local v1, "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz p2, :cond_0

    .line 1039
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1040
    .local v0, "baseURL":Ljava/net/URL;
    new-instance v2, Lorg/apache/tools/ant/types/ResourceLocation;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/ResourceLocation;-><init>()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_2

    .line 1041
    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .local v2, "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :try_start_1
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/types/ResourceLocation;->setBase(Ljava/net/URL;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_3

    move-object v1, v2

    .line 1046
    .end local v0    # "baseURL":Ljava/net/URL;
    .end local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :cond_0
    :goto_0
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/ResourceLocation;->setPublicId(Ljava/lang/String;)V

    .line 1047
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/ResourceLocation;->setLocation(Ljava/lang/String;)V

    .line 1049
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v7, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$100(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v6

    .line 1051
    if-nez v6, :cond_1

    .line 1052
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v7, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$200(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v6

    .line 1055
    :cond_1
    if-eqz v6, :cond_2

    .line 1056
    new-instance v5, Ljavax/xml/transform/sax/SAXSource;

    .end local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    invoke-direct {v5, v6}, Ljavax/xml/transform/sax/SAXSource;-><init>(Lorg/xml/sax/InputSource;)V

    .line 1083
    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    :goto_1
    return-object v5

    .line 1059
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :cond_2
    :try_start_2
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolve:Ljava/lang/reflect/Method;

    iget-object v8, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    check-cast v5, Ljavax/xml/transform/sax/SAXSource;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .restart local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    goto :goto_1

    .line 1062
    .end local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    :catch_0
    move-exception v3

    .line 1063
    .local v3, "ex":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 1076
    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    :cond_3
    :try_start_3
    iget-object v7, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolve:Ljava/lang/reflect/Method;

    iget-object v8, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-virtual {v7, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    check-cast v5, Ljavax/xml/transform/sax/SAXSource;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .restart local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    goto :goto_1

    .line 1079
    .end local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    :catch_1
    move-exception v3

    .line 1080
    .restart local v3    # "ex":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 1042
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v5    # "result":Ljavax/xml/transform/sax/SAXSource;
    :catch_2
    move-exception v7

    goto :goto_0

    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v0    # "baseURL":Ljava/net/URL;
    .restart local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :catch_3
    move-exception v7

    move-object v1, v2

    .end local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    goto :goto_0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 7
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    .line 958
    const/4 v2, 0x0

    .line 960
    .local v2, "result":Lorg/xml/sax/InputSource;
    invoke-direct {p0}, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->processExternalCatalogs()V

    .line 962
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v3, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$000(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;

    move-result-object v1

    .line 964
    .local v1, "matchingEntry":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz v1, :cond_2

    .line 966
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Matching catalog entry found for publicId: \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' location: \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 971
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v3, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$100(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v2

    .line 973
    if-nez v2, :cond_0

    .line 974
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v3, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$200(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v2

    .line 977
    :cond_0
    if-nez v2, :cond_1

    .line 979
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolveEntity:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":Lorg/xml/sax/InputSource;
    check-cast v2, Lorg/xml/sax/InputSource;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1004
    .restart local v2    # "result":Lorg/xml/sax/InputSource;
    :cond_1
    :goto_0
    return-object v2

    .line 982
    .end local v2    # "result":Lorg/xml/sax/InputSource;
    :catch_0
    move-exception v0

    .line 983
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 996
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v2    # "result":Lorg/xml/sax/InputSource;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolveEntity:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lorg/apache/tools/ant/types/XMLCatalog$ExternalResolver;->resolverImpl:Ljava/lang/Object;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":Lorg/xml/sax/InputSource;
    check-cast v2, Lorg/xml/sax/InputSource;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .restart local v2    # "result":Lorg/xml/sax/InputSource;
    goto :goto_0

    .line 999
    .end local v2    # "result":Lorg/xml/sax/InputSource;
    :catch_1
    move-exception v0

    .line 1000
    .restart local v0    # "ex":Ljava/lang/Exception;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
