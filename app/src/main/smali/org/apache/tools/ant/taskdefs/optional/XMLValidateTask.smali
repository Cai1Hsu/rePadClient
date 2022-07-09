.class public Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;
.super Lorg/apache/tools/ant/Task;
.source "XMLValidateTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;,
        Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;,
        Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field protected static final INIT_FAILED_MSG:Ljava/lang/String; = "Could not start xml validation: "

.field public static final MESSAGE_FILES_VALIDATED:Ljava/lang/String; = " file(s) have been successfully validated."


# instance fields
.field private attributeList:Ljava/util/Vector;

.field protected classpath:Lorg/apache/tools/ant/types/Path;

.field protected errorHandler:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

.field protected failOnError:Z

.field protected file:Ljava/io/File;

.field protected filesets:Ljava/util/Vector;

.field protected lenient:Z

.field private final propertyList:Ljava/util/Vector;

.field protected readerClassName:Ljava/lang/String;

.field private readerLoader:Lorg/apache/tools/ant/AntClassLoader;

.field protected warn:Z

.field private xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

.field protected xmlReader:Lorg/xml/sax/XMLReader;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 70
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->failOnError:Z

    .line 71
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->warn:Z

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->lenient:Z

    .line 73
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    .line 76
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    .line 78
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->filesets:Ljava/util/Vector;

    .line 87
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    .line 89
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;-><init>(Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->errorHandler:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

    .line 94
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->attributeList:Ljava/util/Vector;

    .line 99
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->propertyList:Ljava/util/Vector;

    .line 101
    new-instance v0, Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/XMLCatalog;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    .line 106
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    .line 727
    return-void
.end method

.method static access$000()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method private createDefaultReaderOrParser()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 461
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->createDefaultReader()Lorg/xml/sax/XMLReader;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 465
    :goto_0
    return-object v1

    .line 462
    :catch_0
    move-exception v0

    .line 463
    .local v0, "exc":Lorg/apache/tools/ant/BuildException;
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getParser()Lorg/xml/sax/Parser;

    move-result-object v1

    .local v1, "reader":Lorg/xml/sax/Parser;
    goto :goto_0
.end method


# virtual methods
.method public addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V
    .locals 1
    .param p1, "catalog"    # Lorg/apache/tools/ant/types/XMLCatalog;

    .prologue
    .line 205
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V

    .line 206
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 214
    return-void
.end method

.method protected cleanup()V
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v0, :cond_0

    .line 449
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 450
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    .line 452
    :cond_0
    return-void
.end method

.method public createAttribute()Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;
    .locals 2

    .prologue
    .line 227
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;-><init>()V

    .line 228
    .local v0, "feature":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->attributeList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 229
    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 177
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 178
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 180
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createDTD()Lorg/apache/tools/ant/types/DTDLocation;
    .locals 2

    .prologue
    .line 261
    new-instance v0, Lorg/apache/tools/ant/types/DTDLocation;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/DTDLocation;-><init>()V

    .line 262
    .local v0, "dtdLocation":Lorg/apache/tools/ant/types/DTDLocation;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->addDTD(Lorg/apache/tools/ant/types/ResourceLocation;)V

    .line 263
    return-object v0
.end method

.method protected createDefaultReader()Lorg/xml/sax/XMLReader;
    .locals 1

    .prologue
    .line 476
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    return-object v0
.end method

.method public createProperty()Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;
    .locals 2

    .prologue
    .line 239
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;-><init>()V

    .line 240
    .local v0, "prop":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->propertyList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 241
    return-object v0
.end method

.method protected createXmlReader()Lorg/xml/sax/XMLReader;
    .locals 8

    .prologue
    const/4 v7, 0x3

    .line 391
    const/4 v2, 0x0

    .line 392
    .local v2, "reader":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    if-nez v4, :cond_0

    .line 393
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->createDefaultReaderOrParser()Ljava/lang/Object;

    move-result-object v2

    .line 419
    :goto_0
    instance-of v4, v2, Lorg/xml/sax/XMLReader;

    if-eqz v4, :cond_2

    move-object v1, v2

    .line 420
    check-cast v1, Lorg/xml/sax/XMLReader;

    .line 421
    .local v1, "newReader":Lorg/xml/sax/XMLReader;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Using SAX2 reader "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v7}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 439
    :goto_1
    return-object v1

    .line 396
    .end local v1    # "newReader":Lorg/xml/sax/XMLReader;
    :cond_0
    const/4 v3, 0x0

    .line 399
    .local v3, "readerClass":Ljava/lang/Class;
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v4, :cond_1

    .line 400
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    .line 401
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    const/4 v5, 0x1

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerLoader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-static {v4, v5, v6}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    .line 407
    :goto_2
    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    goto :goto_0

    .line 404
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v3

    goto :goto_2

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not start xml validation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 410
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v0

    .line 411
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not start xml validation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 412
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v0

    .line 413
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not start xml validation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 427
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v3    # "readerClass":Ljava/lang/Class;
    :cond_2
    instance-of v4, v2, Lorg/xml/sax/Parser;

    if-eqz v4, :cond_3

    .line 428
    new-instance v1, Lorg/xml/sax/helpers/ParserAdapter;

    move-object v4, v2

    check-cast v4, Lorg/xml/sax/Parser;

    invoke-direct {v1, v4}, Lorg/xml/sax/helpers/ParserAdapter;-><init>(Lorg/xml/sax/Parser;)V

    .line 429
    .restart local v1    # "newReader":Lorg/xml/sax/XMLReader;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Using SAX1 parser "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v7}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 433
    .end local v1    # "newReader":Lorg/xml/sax/XMLReader;
    :cond_3
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not start xml validation: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " implements nor SAX1 Parser nor SAX2 XMLReader."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected doValidate(Ljava/io/File;)Z
    .locals 7
    .param p1, "afile"    # Ljava/io/File;

    .prologue
    .line 551
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->initValidator()V

    .line 552
    const/4 v2, 0x1

    .line 554
    .local v2, "result":Z
    :try_start_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Validating "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "... "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 555
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->errorHandler:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->init(Ljava/io/File;)V

    .line 556
    new-instance v1, Lorg/xml/sax/InputSource;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v4}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 557
    .local v1, "is":Lorg/xml/sax/InputSource;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 558
    .local v3, "uri":Ljava/lang/String;
    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 559
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v4, v1}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 573
    .end local v1    # "is":Lorg/xml/sax/InputSource;
    .end local v3    # "uri":Ljava/lang/String;
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->errorHandler:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->getFailure()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 574
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->failOnError:Z

    if-eqz v4, :cond_1

    .line 575
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " is not a valid XML document."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 560
    :catch_0
    move-exception v0

    .line 561
    .local v0, "ex":Lorg/xml/sax/SAXException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Caught when validating: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 562
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->failOnError:Z

    if-eqz v4, :cond_0

    .line 563
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not validate document "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 566
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not validate document "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;)V

    .line 567
    const/4 v2, 0x0

    .line 572
    goto/16 :goto_0

    .line 568
    .end local v0    # "ex":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v0

    .line 569
    .local v0, "ex":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not validate document "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 578
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1
    const/4 v2, 0x0

    .line 579
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " is not a valid XML document"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 581
    :cond_2
    return v2
.end method

.method public execute()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 291
    const/4 v2, 0x0

    .line 292
    .local v2, "fileProcessed":I
    :try_start_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    if-nez v9, :cond_0

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-nez v9, :cond_0

    .line 293
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Specify at least one source - a file or a fileset."

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 328
    :catchall_0
    move-exception v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->cleanup()V

    throw v9

    .line 299
    :cond_0
    :try_start_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    if-eqz v9, :cond_1

    .line 300
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->canRead()Z

    move-result v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 301
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->doValidate(Ljava/io/File;)Z

    .line 302
    add-int/lit8 v2, v2, 0x1

    .line 313
    :cond_1
    :goto_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v7

    .line 314
    .local v7, "size":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v7, :cond_5

    .line 316
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v9, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/FileSet;

    .line 317
    .local v4, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v4, v9}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 318
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 320
    .local v3, "files":[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    array-length v9, v3

    if-ge v6, v9, :cond_4

    .line 321
    new-instance v8, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v4, v9}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v9

    aget-object v10, v3, v6

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 322
    .local v8, "srcFile":Ljava/io/File;
    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->doValidate(Ljava/io/File;)Z

    .line 323
    add-int/lit8 v2, v2, 0x1

    .line 320
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 304
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v5    # "i":I
    .end local v6    # "j":I
    .end local v7    # "size":I
    .end local v8    # "srcFile":Ljava/io/File;
    :cond_2
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "File "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " cannot be read"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 305
    .local v1, "errorMsg":Ljava/lang/String;
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->failOnError:Z

    if-eqz v9, :cond_3

    .line 306
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 308
    :cond_3
    const/4 v9, 0x0

    invoke-virtual {p0, v1, v9}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 314
    .end local v1    # "errorMsg":Ljava/lang/String;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v3    # "files":[Ljava/lang/String;
    .restart local v4    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .restart local v5    # "i":I
    .restart local v6    # "j":I
    .restart local v7    # "size":I
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 326
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v6    # "j":I
    :cond_5
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->onSuccessfulValidation(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 328
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->cleanup()V

    .line 330
    return-void
.end method

.method protected getEntityResolver()Lorg/xml/sax/EntityResolver;
    .locals 1

    .prologue
    .line 270
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    return-object v0
.end method

.method protected getXmlReader()Lorg/xml/sax/XMLReader;
    .locals 1

    .prologue
    .line 282
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    return-object v0
.end method

.method public init()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 250
    invoke-super {p0}, Lorg/apache/tools/ant/Task;->init()V

    .line 251
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 252
    return-void
.end method

.method protected initValidator()V
    .locals 7

    .prologue
    .line 348
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->createXmlReader()Lorg/xml/sax/XMLReader;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    .line 350
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getEntityResolver()Lorg/xml/sax/EntityResolver;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 351
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->errorHandler:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;

    invoke-interface {v5, v6}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 353
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->isSax1Parser()Z

    move-result v5

    if-nez v5, :cond_2

    .line 355
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->lenient:Z

    if-nez v5, :cond_0

    .line 356
    const-string/jumbo v5, "http://xml.org/sax/features/validation"

    const/4 v6, 0x1

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->setFeature(Ljava/lang/String;Z)V

    .line 359
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->attributeList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v0

    .line 360
    .local v0, "attSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 361
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->attributeList:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;

    .line 362
    .local v1, "feature":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;->getValue()Z

    move-result v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->setFeature(Ljava/lang/String;Z)V

    .line 360
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 366
    .end local v1    # "feature":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute;
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->propertyList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 367
    .local v4, "propSize":I
    const/4 v2, 0x0

    :goto_1
    if-ge v2, v4, :cond_2

    .line 368
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->propertyList:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;

    .line 369
    .local v3, "prop":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->setProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 372
    .end local v0    # "attSize":I
    .end local v2    # "i":I
    .end local v3    # "prop":Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;
    .end local v4    # "propSize":I
    :cond_2
    return-void
.end method

.method protected isSax1Parser()Z
    .locals 1

    .prologue
    .line 379
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    instance-of v0, v0, Lorg/xml/sax/helpers/ParserAdapter;

    return v0
.end method

.method protected onSuccessfulValidation(I)V
    .locals 2
    .param p1, "fileProcessed"    # I

    .prologue
    .line 337
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " file(s) have been successfully validated."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;)V

    .line 338
    return-void
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->readerClassName:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 166
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 170
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 189
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 190
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "fail"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->failOnError:Z

    .line 118
    return-void
.end method

.method protected setFeature(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "feature"    # Ljava/lang/String;
    .param p2, "value"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 487
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Setting feature "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 489
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v1, p1, p2}, Lorg/xml/sax/XMLReader;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 507
    return-void

    .line 490
    :catch_0
    move-exception v0

    .line 491
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t recognize feature "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 498
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    :catch_1
    move-exception v0

    .line 499
    .local v0, "e":Lorg/xml/sax/SAXNotSupportedException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support feature "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 197
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->file:Ljava/io/File;

    .line 198
    return-void
.end method

.method public setLenient(Z)V
    .locals 0
    .param p1, "bool"    # Z

    .prologue
    .line 142
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->lenient:Z

    .line 143
    return-void
.end method

.method protected setProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 519
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 520
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Property name and value must be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 524
    :cond_1
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-interface {v1, p1, p2}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 542
    return-void

    .line 525
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Lorg/xml/sax/SAXNotRecognizedException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t recognize property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 533
    .end local v0    # "e":Lorg/xml/sax/SAXNotRecognizedException;
    :catch_1
    move-exception v0

    .line 534
    .local v0, "e":Lorg/xml/sax/SAXNotSupportedException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Parser "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->xmlReader:Lorg/xml/sax/XMLReader;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t support property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
.end method

.method public setWarn(Z)V
    .locals 0
    .param p1, "bool"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->warn:Z

    .line 128
    return-void
.end method
