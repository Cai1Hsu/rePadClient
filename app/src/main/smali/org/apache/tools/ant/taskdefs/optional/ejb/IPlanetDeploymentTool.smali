.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.source "IPlanetDeploymentTool.java"


# static fields
.field private static final IAS_DD:Ljava/lang/String; = "ias-ejb-jar.xml"


# instance fields
.field private debug:Z

.field private descriptorName:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private iasDescriptorName:Ljava/lang/String;

.field private iashome:Ljava/io/File;

.field private jarSuffix:Ljava/lang/String;

.field private keepgenerated:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;-><init>()V

    .line 89
    const-string/jumbo v0, ".jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 90
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->keepgenerated:Z

    .line 91
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->debug:Z

    return-void
.end method

.method private getIasDescriptorName()Ljava/lang/String;
    .locals 8

    .prologue
    .line 351
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iasDescriptorName:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 352
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iasDescriptorName:Ljava/lang/String;

    .line 392
    :goto_0
    return-object v5

    .line 355
    :cond_0
    const-string/jumbo v2, ""

    .line 360
    .local v2, "path":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 361
    .local v4, "startOfFileName":I
    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    .line 362
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    const/4 v6, 0x0

    add-int/lit8 v7, v4, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 366
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "ejb-jar.xml"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 367
    const-string/jumbo v0, ""

    .line 368
    .local v0, "basename":Ljava/lang/String;
    const-string/jumbo v3, "ejb-jar.xml"

    .line 391
    .local v3, "remainder":Ljava/lang/String;
    :goto_1
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "ias-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iasDescriptorName:Ljava/lang/String;

    .line 392
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iasDescriptorName:Ljava/lang/String;

    goto :goto_0

    .line 371
    .end local v0    # "basename":Ljava/lang/String;
    .end local v3    # "remainder":Ljava/lang/String;
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v6

    iget-object v6, v6, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {v5, v6, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 379
    .local v1, "endOfBaseName":I
    if-gez v1, :cond_3

    .line 380
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .line 381
    if-gez v1, :cond_3

    .line 382
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .line 386
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v6, v4, 0x1

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 388
    .restart local v0    # "basename":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "remainder":Ljava/lang/String;
    goto :goto_1
.end method


# virtual methods
.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 4
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 310
    const-string/jumbo v0, "META-INF/ias-ejb-jar.xml"

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v2

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getIasDescriptorName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    return-void
.end method

.method protected checkConfiguration(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 6
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 197
    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v2, v4, 0x1

    .line 198
    .local v2, "startOfName":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 199
    .local v3, "stdXml":Ljava/lang/String;
    const-string/jumbo v4, "ejb-jar.xml"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    if-nez v4, :cond_0

    .line 200
    const-string/jumbo v1, "No name specified for the completed JAR file.  The EJB descriptor should be prepended with the JAR name or it should be specified using the attribute \"basejarname\" in the \"ejbjar\" task."

    .line 204
    .local v1, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 207
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getIasDescriptorName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 209
    .local v0, "iasDescriptor":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_2

    .line 210
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "The iAS-specific EJB descriptor ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ") was not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 212
    .restart local v1    # "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 215
    .end local v1    # "msg":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_3

    .line 216
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "If \"iashome\" is specified, it must be a valid directory (it was set to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ")."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 218
    .restart local v1    # "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 220
    .end local v1    # "msg":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method protected getPublicId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 337
    const/4 v0, 0x0

    return-object v0
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 324
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getDestDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->jarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 325
    .local v0, "jarFile":Ljava/io/File;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "JAR file name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->log(Ljava/lang/String;I)V

    .line 326
    return-object v0
.end method

.method protected parseEjbFiles(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)Ljava/util/Hashtable;
    .locals 18
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 243
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getIasDescriptorName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v4

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 251
    .local v1, "ejbc":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->keepgenerated:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setRetainSource(Z)V

    .line 252
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->debug:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setDebugOutput(Z)V

    .line 253
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    if-eqz v2, :cond_0

    .line 254
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setIasHomeDir(Ljava/io/File;)V

    .line 256
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v2

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 257
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v2

    iget-object v2, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .line 258
    .local v16, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 259
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 261
    .local v11, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 268
    .end local v11    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    .end local v16    # "i":Ljava/util/Iterator;
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->execute()V
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->displayName:Ljava/lang/String;

    .line 275
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->getEjbFiles()Ljava/util/Hashtable;

    move-result-object v15

    .line 278
    .local v15, "files":Ljava/util/Hashtable;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->getCmpDescriptors()[Ljava/lang/String;

    move-result-object v9

    .line 279
    .local v9, "cmpDescriptors":[Ljava/lang/String;
    array-length v2, v9

    if-lez v2, :cond_3

    .line 280
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v2

    iget-object v7, v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    .line 282
    .local v7, "baseDir":Ljava/io/File;
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v14

    .line 283
    .local v14, "endOfPath":I
    const/4 v2, 0x0

    add-int/lit8 v3, v14, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    .line 285
    .local v17, "relativePath":Ljava/lang/String;
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_1
    array-length v2, v9

    move/from16 v0, v16

    if-ge v0, v2, :cond_3

    .line 286
    aget-object v2, v9, v16

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v13

    .line 287
    .local v13, "endOfCmp":I
    aget-object v2, v9, v16

    add-int/lit8 v3, v13, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 289
    .local v8, "cmpDescriptor":Ljava/lang/String;
    new-instance v10, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v10, v7, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 290
    .local v10, "cmpFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 291
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "The CMP descriptor file ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ") could not be found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 269
    .end local v7    # "baseDir":Ljava/io/File;
    .end local v8    # "cmpDescriptor":Ljava/lang/String;
    .end local v9    # "cmpDescriptors":[Ljava/lang/String;
    .end local v10    # "cmpFile":Ljava/io/File;
    .end local v13    # "endOfCmp":I
    .end local v14    # "endOfPath":I
    .end local v15    # "files":Ljava/util/Hashtable;
    .end local v16    # "i":I
    .end local v17    # "relativePath":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 270
    .local v12, "e":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "An error has occurred while trying to execute the iAS ejbc utility"

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v12, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 294
    .end local v12    # "e":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
    .restart local v7    # "baseDir":Ljava/io/File;
    .restart local v8    # "cmpDescriptor":Ljava/lang/String;
    .restart local v9    # "cmpDescriptors":[Ljava/lang/String;
    .restart local v10    # "cmpFile":Ljava/io/File;
    .restart local v13    # "endOfCmp":I
    .restart local v14    # "endOfPath":I
    .restart local v15    # "files":Ljava/util/Hashtable;
    .restart local v16    # "i":I
    .restart local v17    # "relativePath":Ljava/lang/String;
    :cond_2
    aget-object v2, v9, v16

    invoke-virtual {v15, v2, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 298
    .end local v7    # "baseDir":Ljava/io/File;
    .end local v8    # "cmpDescriptor":Ljava/lang/String;
    .end local v10    # "cmpFile":Ljava/io/File;
    .end local v13    # "endOfCmp":I
    .end local v14    # "endOfPath":I
    .end local v16    # "i":I
    .end local v17    # "relativePath":Ljava/lang/String;
    :cond_3
    return-object v15
.end method

.method public processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 2
    .param p1, "descriptorName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->descriptorName:Ljava/lang/String;

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iasDescriptorName:Ljava/lang/String;

    .line 179
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "iPlanet Deployment Tool processing: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " (and "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->getIasDescriptorName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->log(Ljava/lang/String;I)V

    .line 182
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 183
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 147
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->debug:Z

    .line 148
    return-void
.end method

.method public setGenericJarSuffix(Ljava/lang/String;)V
    .locals 2
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 168
    const-string/jumbo v0, "Since a generic JAR file is not created during processing, the iPlanet Deployment Tool does not support the \"genericjarsuffix\" attribute.  It will be ignored."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->log(Ljava/lang/String;I)V

    .line 172
    return-void
.end method

.method public setIashome(Ljava/io/File;)V
    .locals 0
    .param p1, "iashome"    # Ljava/io/File;

    .prologue
    .line 125
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->iashome:Ljava/io/File;

    .line 126
    return-void
.end method

.method public setKeepgenerated(Z)V
    .locals 0
    .param p1, "keepgenerated"    # Z

    .prologue
    .line 137
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->keepgenerated:Z

    .line 138
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "jarSuffix"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetDeploymentTool;->jarSuffix:Ljava/lang/String;

    .line 158
    return-void
.end method
