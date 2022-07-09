.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DataTypeHandler"
.end annotation


# instance fields
.field private element:Ljava/lang/Object;

.field private target:Lorg/apache/tools/ant/Target;

.field private wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p2, "parentHandler"    # Lorg/xml/sax/DocumentHandler;
    .param p3, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 944
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 930
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 945
    iput-object p3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->target:Lorg/apache/tools/ant/Target;

    .line 946
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I

    .prologue
    .line 989
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText([CII)V

    .line 990
    return-void
.end method

.method public init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 4
    .param p1, "propType"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 966
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v1}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->createDataType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->element:Ljava/lang/Object;

    .line 967
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->element:Ljava/lang/Object;

    if-nez v1, :cond_0

    .line 968
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unknown data type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 973
    :catch_0
    move-exception v0

    .line 974
    .local v0, "exc":Lorg/apache/tools/ant/BuildException;
    new-instance v1, Lorg/xml/sax/SAXParseException;

    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v3}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v1

    .line 970
    .end local v0    # "exc":Lorg/apache/tools/ant/BuildException;
    :cond_0
    :try_start_1
    new-instance v1, Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->element:Ljava/lang/Object;

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 971
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttributes(Lorg/xml/sax/AttributeList;)V

    .line 972
    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->target:Lorg/apache/tools/ant/Target;

    iget-object v2, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Target;->addDataType(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0

    .line 976
    return-void
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 1005
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->element:Ljava/lang/Object;

    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler;->target:Lorg/apache/tools/ant/Target;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/Target;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 1006
    return-void
.end method
