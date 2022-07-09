.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;
.super Lorg/apache/tools/ant/Task;
.source "IPlanetEjbcTask.java"


# instance fields
.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private debug:Z

.field private dest:Ljava/io/File;

.field private ejbdescriptor:Ljava/io/File;

.field private iasdescriptor:Ljava/io/File;

.field private iashome:Ljava/io/File;

.field private keepgenerated:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 94
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->keepgenerated:Z

    .line 95
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->debug:Z

    return-void
.end method

.method private checkConfiguration()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 202
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    if-nez v1, :cond_0

    .line 203
    const-string/jumbo v0, "The standard EJB descriptor must be specified using the \"ejbdescriptor\" attribute."

    .line 205
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 207
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_2

    .line 208
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The standard EJB descriptor ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") was not found or isn\'t a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 210
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 213
    .end local v0    # "msg":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    if-nez v1, :cond_3

    .line 214
    const-string/jumbo v0, "The iAS-speific XML descriptor must be specified using the \"iasdescriptor\" attribute."

    .line 216
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 218
    .end local v0    # "msg":Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_5

    .line 219
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The iAS-specific XML descriptor ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") was not found or isn\'t a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 221
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 224
    .end local v0    # "msg":Ljava/lang/String;
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    if-nez v1, :cond_6

    .line 225
    const-string/jumbo v0, "The destination directory must be specified using the \"dest\" attribute."

    .line 227
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 229
    .end local v0    # "msg":Ljava/lang/String;
    :cond_6
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_8

    .line 230
    :cond_7
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The destination directory ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") was not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "found or isn\'t a directory."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 232
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 235
    .end local v0    # "msg":Ljava/lang/String;
    :cond_8
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_9

    .line 236
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "If \"iashome\" is specified, it must be a valid directory (it was set to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ")."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 238
    .restart local v0    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 240
    .end local v0    # "msg":Ljava/lang/String;
    :cond_9
    return-void
.end method

.method private executeEjbc(Ljavax/xml/parsers/SAXParser;)V
    .locals 8
    .param p1, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 275
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 280
    .local v0, "ejbc":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->keepgenerated:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setRetainSource(Z)V

    .line 281
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->debug:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setDebugOutput(Z)V

    .line 282
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 283
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setIasHomeDir(Ljava/io/File;)V

    .line 287
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->execute()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException; {:try_start_0 .. :try_end_0} :catch_2

    .line 301
    return-void

    .line 288
    :catch_0
    move-exception v6

    .line 289
    .local v6, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "An IOException occurred while trying to read the XML descriptor file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 291
    .local v7, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v7, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 292
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 293
    .local v6, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "A SAXException occurred while trying to read the XML descriptor file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v6}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 295
    .restart local v7    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v7, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 296
    .end local v6    # "e":Lorg/xml/sax/SAXException;
    .end local v7    # "msg":Ljava/lang/String;
    :catch_2
    move-exception v6

    .line 297
    .local v6, "e":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "An exception occurred while trying to run the ejbc utility: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 299
    .restart local v7    # "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v7, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
.end method

.method private getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 3

    .prologue
    .line 310
    const/4 v0, 0x0

    .line 311
    .local v0, "cp":Lorg/apache/tools/ant/types/Path;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v1, :cond_0

    .line 312
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    const-string/jumbo v2, "last"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 317
    :goto_0
    return-object v0

    .line 314
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    goto :goto_0
.end method

.method private getParser()Ljavax/xml/parsers/SAXParser;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 250
    const/4 v2, 0x0

    .line 252
    .local v2, "saxParser":Ljavax/xml/parsers/SAXParser;
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v3

    .line 253
    .local v3, "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 254
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 263
    return-object v2

    .line 255
    .end local v3    # "saxParserFactory":Ljavax/xml/parsers/SAXParserFactory;
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to create a SAXParser: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 258
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    .end local v1    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 259
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to create a SAXParser: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 260
    .restart local v1    # "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 149
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 151
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->checkConfiguration()V

    .line 192
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->getParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->executeEjbc(Ljavax/xml/parsers/SAXParser;)V

    .line 193
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 137
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 141
    :goto_0
    return-void

    .line 139
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->debug:Z

    .line 172
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->dest:Ljava/io/File;

    .line 128
    return-void
.end method

.method public setEjbdescriptor(Ljava/io/File;)V
    .locals 0
    .param p1, "ejbdescriptor"    # Ljava/io/File;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->ejbdescriptor:Ljava/io/File;

    .line 106
    return-void
.end method

.method public setIasdescriptor(Ljava/io/File;)V
    .locals 0
    .param p1, "iasdescriptor"    # Ljava/io/File;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iasdescriptor:Ljava/io/File;

    .line 117
    return-void
.end method

.method public setIashome(Ljava/io/File;)V
    .locals 0
    .param p1, "iashome"    # Ljava/io/File;

    .prologue
    .line 182
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->iashome:Ljava/io/File;

    .line 183
    return-void
.end method

.method public setKeepgenerated(Z)V
    .locals 0
    .param p1, "keepgenerated"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbcTask;->keepgenerated:Z

    .line 162
    return-void
.end method
