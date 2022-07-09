.class public Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;
.super Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;
.source "SchemaValidate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
    }
.end annotation


# static fields
.field public static final ERROR_DUPLICATE_SCHEMA:Ljava/lang/String; = "Duplicate declaration of schema "

.field public static final ERROR_NO_XSD_SUPPORT:Ljava/lang/String; = "Parser does not support Xerces or JAXP schema features"

.field public static final ERROR_PARSER_CREATION_FAILURE:Ljava/lang/String; = "Could not create parser"

.field public static final ERROR_SAX_1:Ljava/lang/String; = "SAX1 parsers are not supported"

.field public static final ERROR_TOO_MANY_DEFAULT_SCHEMAS:Ljava/lang/String; = "Only one of defaultSchemaFile and defaultSchemaURL allowed"

.field public static final MESSAGE_ADDING_SCHEMA:Ljava/lang/String; = "Adding schema "


# instance fields
.field private anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

.field private disableDTD:Z

.field private fullChecking:Z

.field private schemaLocations:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;-><init>()V

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->schemaLocations:Ljava/util/HashMap;

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->fullChecking:Z

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->disableDTD:Z

    .line 327
    return-void
.end method

.method private setNoNamespaceSchemaProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->getNoNamespaceSchemaURL()Ljava/lang/String;

    move-result-object v0

    .line 124
    .local v0, "anonSchema":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    :cond_0
    return-void
.end method


# virtual methods
.method public addConfiguredSchema(Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;)V
    .locals 4
    .param p1, "location"    # Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    .prologue
    .line 155
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "adding schema "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    .line 156
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->validateNamespace()V

    .line 157
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->schemaLocations:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    .line 158
    .local v0, "old":Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 159
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Duplicate declaration of schema "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 161
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->schemaLocations:Ljava/util/HashMap;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    return-void
.end method

.method protected addSchemaLocations()V
    .locals 7

    .prologue
    .line 267
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->schemaLocations:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 268
    .local v2, "it":Ljava/util/Iterator;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 269
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 270
    .local v1, "count":I
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 271
    if-lez v1, :cond_0

    .line 272
    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 274
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    .line 275
    .local v3, "schemaLocation":Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getURIandLocation()Ljava/lang/String;

    move-result-object v4

    .line 276
    .local v4, "tuple":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 277
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Adding schema "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    .line 278
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 280
    .end local v3    # "schemaLocation":Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;
    .end local v4    # "tuple":Ljava/lang/String;
    :cond_1
    if-lez v1, :cond_2

    .line 281
    const-string/jumbo v5, "http://apache.org/xml/properties/schema/external-schemaLocation"

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    :cond_2
    return-void
.end method

.method protected createAnonymousSchema()V
    .locals 2

    .prologue
    .line 177
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    if-nez v0, :cond_0

    .line 178
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    .line 180
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    const-string/jumbo v1, "(no namespace)"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->setNamespace(Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method protected createDefaultReader()Lorg/xml/sax/XMLReader;
    .locals 6

    .prologue
    const/4 v4, 0x1

    .line 247
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    .line 248
    .local v1, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 249
    invoke-virtual {v1, v4}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 250
    const/4 v2, 0x0

    .line 252
    .local v2, "reader":Lorg/xml/sax/XMLReader;
    :try_start_0
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    .line 253
    .local v3, "saxParser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 259
    return-object v2

    .line 254
    .end local v3    # "saxParser":Ljavax/xml/parsers/SAXParser;
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Could not create parser"

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 256
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_1
    move-exception v0

    .line 257
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Could not create parser"

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public enableJAXP12SchemaValidation()Z
    .locals 3

    .prologue
    .line 138
    :try_start_0
    const-string/jumbo v1, "http://java.sun.com/xml/jaxp/properties/schemaLanguage"

    const-string/jumbo v2, "http://www.w3.org/2001/XMLSchema"

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    const-string/jumbo v1, "http://java.sun.com/xml/jaxp/properties/schemaSource"

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setNoNamespaceSchemaProperty(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    .line 143
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public enableXercesSchemaValidation()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 108
    :try_start_0
    const-string/jumbo v2, "http://apache.org/xml/features/validation/schema"

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setFeature(Ljava/lang/String;Z)V

    .line 110
    const-string/jumbo v2, "http://apache.org/xml/properties/schema/external-noNamespaceSchemaLocation"

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setNoNamespaceSchemaProperty(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    :goto_0
    return v1

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    .line 113
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getNoNamespaceSchemaURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    if-nez v0, :cond_0

    .line 292
    const/4 v0, 0x0

    .line 294
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->getSchemaLocationURL()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->init()V

    .line 99
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setLenient(Z)V

    .line 100
    return-void
.end method

.method protected initValidator()V
    .locals 2

    .prologue
    .line 216
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->initValidator()V

    .line 218
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->isSax1Parser()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "SAX1 parsers are not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_0
    const-string/jumbo v0, "http://xml.org/sax/features/namespaces"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setFeature(Ljava/lang/String;Z)V

    .line 225
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->enableXercesSchemaValidation()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->enableJAXP12SchemaValidation()Z

    move-result v0

    if-nez v0, :cond_1

    .line 227
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Parser does not support Xerces or JAXP schema features"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_1
    const-string/jumbo v0, "http://apache.org/xml/features/validation/schema-full-checking"

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->fullChecking:Z

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setFeature(Ljava/lang/String;Z)V

    .line 234
    const-string/jumbo v0, "http://apache.org/xml/features/disallow-doctype-decl"

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->disableDTD:Z

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->setFeatureIfSupported(Ljava/lang/String;Z)V

    .line 237
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->addSchemaLocations()V

    .line 238
    return-void
.end method

.method protected onSuccessfulValidation(I)V
    .locals 2
    .param p1, "fileProcessed"    # I

    .prologue
    .line 320
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " file(s) have been successfully validated."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    .line 321
    return-void
.end method

.method public setDisableDTD(Z)V
    .locals 0
    .param p1, "disableDTD"    # Z

    .prologue
    .line 206
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->disableDTD:Z

    .line 207
    return-void
.end method

.method protected setFeatureIfSupported(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "feature"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    const/4 v3, 0x3

    .line 306
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->getXmlReader()Lorg/xml/sax/XMLReader;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 312
    :goto_0
    return-void

    .line 307
    :catch_0
    move-exception v0

    .line 308
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Not recognizied: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 309
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    :catch_1
    move-exception v0

    .line 310
    .local v0, "e":Lorg/xml/sax/SAXNotSupportedException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Not supported: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setFullChecking(Z)V
    .locals 0
    .param p1, "fullChecking"    # Z

    .prologue
    .line 169
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->fullChecking:Z

    .line 170
    return-void
.end method

.method public setNoNamespaceFile(Ljava/io/File;)V
    .locals 1
    .param p1, "defaultSchemaFile"    # Ljava/io/File;

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->createAnonymousSchema()V

    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->setFile(Ljava/io/File;)V

    .line 199
    return-void
.end method

.method public setNoNamespaceURL(Ljava/lang/String;)V
    .locals 1
    .param p1, "defaultSchemaURL"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->createAnonymousSchema()V

    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate;->anonymousSchema:Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation;->setUrl(Ljava/lang/String;)V

    .line 190
    return-void
.end method
