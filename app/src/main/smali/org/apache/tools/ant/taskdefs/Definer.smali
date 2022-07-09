.class public abstract Lorg/apache/tools/ant/taskdefs/Definer;
.super Lorg/apache/tools/ant/taskdefs/DefBase;
.source "Definer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Definer$Format;,
        Lorg/apache/tools/ant/taskdefs/Definer$OnError;,
        Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;
    }
.end annotation


# static fields
.field private static final ANTLIB_XML:Ljava/lang/String; = "/antlib.xml"

.field private static resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;


# instance fields
.field private adaptTo:Ljava/lang/String;

.field private adaptToClass:Ljava/lang/Class;

.field private adapter:Ljava/lang/String;

.field private adapterClass:Ljava/lang/Class;

.field private classname:Ljava/lang/String;

.field private definerSet:Z

.field private file:Ljava/io/File;

.field private format:I

.field private name:Ljava/lang/String;

.field private onError:I

.field private resource:Ljava/lang/String;

.field private restrict:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 64
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;-><init>(Lorg/apache/tools/ant/taskdefs/Definer$1;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;-><init>()V

    .line 69
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->restrict:Z

    .line 71
    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->format:I

    .line 72
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    .line 73
    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    .line 135
    return-void
.end method

.method private fileToURL()Ljava/net/URL;
    .locals 4

    .prologue
    .line 336
    const/4 v1, 0x0

    .line 337
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 338
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "File "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 340
    :cond_0
    if-nez v1, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-nez v2, :cond_1

    .line 341
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "File "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a file"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 343
    :cond_1
    if-nez v1, :cond_2

    .line 345
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 369
    :goto_0
    return-object v2

    .line 346
    :catch_0
    move-exception v0

    .line 347
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "File "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " cannot use as URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 353
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_2
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    packed-switch v2, :pswitch_data_0

    .line 369
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 355
    :pswitch_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 359
    :pswitch_1
    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 363
    :pswitch_2
    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 353
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private loadAntlib(Ljava/lang/ClassLoader;Ljava/net/URL;)V
    .locals 4
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 440
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, p2, v3}, Lorg/apache/tools/ant/taskdefs/Antlib;->createAntlib(Lorg/apache/tools/ant/Project;Ljava/net/URL;Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Antlib;

    move-result-object v0

    .line 441
    .local v0, "antlib":Lorg/apache/tools/ant/taskdefs/Antlib;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Antlib;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 442
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Antlib;->setURI(Ljava/lang/String;)V

    .line 443
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Antlib;->execute()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 448
    return-void

    .line 444
    .end local v0    # "antlib":Lorg/apache/tools/ant/taskdefs/Antlib;
    :catch_0
    move-exception v1

    .line 445
    .local v1, "ex":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/ProjectHelper;->addLocationToBuildException(Lorg/apache/tools/ant/BuildException;Lorg/apache/tools/ant/Location;)Lorg/apache/tools/ant/BuildException;

    move-result-object v2

    throw v2
.end method

.method public static makeResourceFromURI(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "uri"    # Ljava/lang/String;

    .prologue
    .line 310
    const-string/jumbo v2, "antlib:"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, "path":Ljava/lang/String;
    const-string/jumbo v2, "//"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 315
    const-string/jumbo v2, "//"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 316
    .local v1, "resource":Ljava/lang/String;
    const-string/jumbo v2, ".xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 318
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "/antlib.xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 324
    :cond_0
    :goto_0
    return-object v1

    .line 322
    .end local v1    # "resource":Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v3, 0x2e

    const/16 v4, 0x2f

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "/antlib.xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "resource":Ljava/lang/String;
    goto :goto_0
.end method

.method private resourceToURLs(Ljava/lang/ClassLoader;)Ljava/util/Enumeration;
    .locals 6
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 375
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 381
    .local v2, "ret":Ljava/util/Enumeration;
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_0

    .line 382
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Could not load definitions from resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ". It could not be found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 384
    .local v1, "message":Ljava/lang/String;
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    packed-switch v3, :pswitch_data_0

    .line 399
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v2

    .line 376
    .end local v2    # "ret":Ljava/util/Enumeration;
    :catch_0
    move-exception v0

    .line 377
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not fetch resources named "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 386
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "message":Ljava/lang/String;
    .restart local v2    # "ret":Ljava/util/Enumeration;
    :pswitch_0
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 389
    :pswitch_1
    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 392
    :pswitch_2
    const/4 v3, 0x3

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 384
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private tooManyDefinitions()V
    .locals 3

    .prologue
    .line 650
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one of the attributes name, file and resource can be set"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method


# virtual methods
.method protected addDefinition(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "al"    # Ljava/lang/ClassLoader;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 588
    const/4 v0, 0x0

    .line 591
    .local v0, "cl":Ljava/lang/Class;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p2}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 593
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    const/4 v7, 0x2

    if-eq v6, v7, :cond_0

    .line 594
    const/4 v6, 0x1

    invoke-static {p3, v6, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 597
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapter:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 598
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapter:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-static {v6, v7, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapterClass:Ljava/lang/Class;

    .line 601
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptTo:Ljava/lang/String;

    if-eqz v6, :cond_2

    .line 602
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptTo:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-static {v6, v7, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptToClass:Ljava/lang/Class;

    .line 605
    :cond_2
    new-instance v2, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v2}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 606
    .local v2, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v2, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 607
    invoke-virtual {v2, p3}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassName(Ljava/lang/String;)V

    .line 608
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/AntTypeDefinition;->setClass(Ljava/lang/Class;)V

    .line 609
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapterClass:Ljava/lang/Class;

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdapterClass(Ljava/lang/Class;)V

    .line 610
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptToClass:Ljava/lang/Class;

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->setAdaptToClass(Ljava/lang/Class;)V

    .line 611
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->restrict:Z

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->setRestrict(Z)V

    .line 612
    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 613
    if-eqz v0, :cond_3

    .line 614
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/AntTypeDefinition;->checkClass(Lorg/apache/tools/ant/Project;)V

    .line 616
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/apache/tools/ant/ComponentHelper;->addDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1

    .line 643
    .end local v2    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    :goto_0
    return-void

    .line 618
    :catch_0
    move-exception v1

    .line 619
    .local v1, "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_1
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getTaskName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " cannot be found"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\n using the classloader "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 622
    .local v4, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v6, v4, v1, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_1

    .line 629
    .end local v1    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v4    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 630
    .local v3, "ex":Lorg/apache/tools/ant/BuildException;
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    packed-switch v6, :pswitch_data_0

    .line 639
    :pswitch_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 623
    .end local v3    # "ex":Lorg/apache/tools/ant/BuildException;
    :catch_2
    move-exception v5

    .line 624
    .local v5, "ncdfe":Ljava/lang/NoClassDefFoundError;
    :try_start_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getTaskName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " A class needed by class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " cannot be found: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\n using the classloader "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 627
    .restart local v4    # "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v6, v4, v5, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_1

    .line 633
    .end local v4    # "msg":Ljava/lang/String;
    .end local v5    # "ncdfe":Ljava/lang/NoClassDefFoundError;
    .restart local v3    # "ex":Lorg/apache/tools/ant/BuildException;
    :pswitch_1
    throw v3

    .line 635
    :pswitch_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "Warning: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 630
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 208
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->createLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 210
    .local v0, "al":Ljava/lang/ClassLoader;
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    if-nez v6, :cond_1

    .line 215
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_0

    .line 216
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "name, file or resource attribute of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getTaskName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " is undefined"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 222
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "antlib:"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 224
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v3

    .line 225
    .local v3, "uri1":Ljava/lang/String;
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Definer;->makeResourceFromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/Definer;->setResource(Ljava/lang/String;)V

    .line 233
    .end local v3    # "uri1":Ljava/lang/String;
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    if-eqz v6, :cond_5

    .line 234
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    if-nez v6, :cond_3

    .line 235
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "classname attribute of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getTaskName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " element "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "is undefined"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 227
    :cond_2
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Only antlib URIs can be located from the URI alone,not the URI "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getURI()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 239
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    invoke-virtual {p0, v0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Definer;->addDefinition(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    :cond_4
    :goto_0
    return-void

    .line 241
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 242
    const-string/jumbo v2, "You must not specify classname together with file or resource."

    .line 244
    .local v2, "msg":Ljava/lang/String;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v6, v2, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 246
    .end local v2    # "msg":Ljava/lang/String;
    :cond_6
    const/4 v5, 0x0

    .line 247
    .local v5, "urls":Ljava/util/Enumeration;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    if-eqz v6, :cond_8

    .line 248
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->fileToURL()Ljava/net/URL;

    move-result-object v4

    .line 249
    .local v4, "url":Ljava/net/URL;
    if-eqz v4, :cond_4

    .line 252
    new-instance v5, Lorg/apache/tools/ant/taskdefs/Definer$1;

    .end local v5    # "urls":Ljava/util/Enumeration;
    invoke-direct {v5, p0, v4}, Lorg/apache/tools/ant/taskdefs/Definer$1;-><init>(Lorg/apache/tools/ant/taskdefs/Definer;Ljava/net/URL;)V

    .line 270
    .end local v4    # "url":Ljava/net/URL;
    .restart local v5    # "urls":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 271
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/URL;

    .line 273
    .restart local v4    # "url":Ljava/net/URL;
    iget v1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->format:I

    .line 274
    .local v1, "fmt":I
    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".xml"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 275
    const/4 v1, 0x1

    .line 278
    :cond_7
    if-nez v1, :cond_9

    .line 279
    invoke-virtual {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/Definer;->loadProperties(Ljava/lang/ClassLoader;Ljava/net/URL;)V

    goto :goto_0

    .line 267
    .end local v1    # "fmt":I
    .end local v4    # "url":Ljava/net/URL;
    :cond_8
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Definer;->resourceToURLs(Ljava/lang/ClassLoader;)Ljava/util/Enumeration;

    move-result-object v5

    goto :goto_1

    .line 282
    .restart local v1    # "fmt":I
    .restart local v4    # "url":Ljava/net/URL;
    :cond_9
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->getStack()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_a

    .line 283
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Warning: Recursive loading of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " ignored"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " originally loaded at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->getStack()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 291
    :cond_a
    :try_start_0
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->getStack()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-interface {v6, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    invoke-direct {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/Definer;->loadAntlib(Ljava/lang/ClassLoader;Ljava/net/URL;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->getStack()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    :catchall_0
    move-exception v6

    sget-object v7, Lorg/apache/tools/ant/taskdefs/Definer;->resourceStack:Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->getStack()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v6
.end method

.method public getClassname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 518
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getResource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    return-object v0
.end method

.method protected loadProperties(Ljava/lang/ClassLoader;Ljava/net/URL;)V
    .locals 6
    .param p1, "al"    # Ljava/lang/ClassLoader;
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 409
    const/4 v1, 0x0

    .line 411
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    .line 412
    if-nez v1, :cond_0

    .line 413
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not load definitions from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Definer;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 428
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 430
    :goto_0
    return-void

    .line 417
    :cond_0
    :try_start_1
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 418
    .local v3, "props":Ljava/util/Properties;
    invoke-virtual {v3, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 419
    invoke-virtual {v3}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v2

    .line 420
    .local v2, "keys":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 421
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    .line 422
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    .line 423
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    invoke-virtual {p0, p1, v4, v5}, Lorg/apache/tools/ant/taskdefs/Definer;->addDefinition(Ljava/lang/ClassLoader;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 425
    .end local v2    # "keys":Ljava/util/Enumeration;
    .end local v3    # "props":Ljava/util/Properties;
    :catch_0
    move-exception v0

    .line 426
    .local v0, "ex":Ljava/io/IOException;
    :try_start_2
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 428
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v4

    .restart local v2    # "keys":Ljava/util/Enumeration;
    .restart local v3    # "props":Ljava/util/Properties;
    :cond_1
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0
.end method

.method public setAdaptTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "adaptTo"    # Ljava/lang/String;

    .prologue
    .line 563
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptTo:Ljava/lang/String;

    .line 564
    return-void
.end method

.method protected setAdaptToClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "adaptToClass"    # Ljava/lang/Class;

    .prologue
    .line 574
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adaptToClass:Ljava/lang/Class;

    .line 575
    return-void
.end method

.method public setAdapter(Ljava/lang/String;)V
    .locals 0
    .param p1, "adapter"    # Ljava/lang/String;

    .prologue
    .line 543
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapter:Ljava/lang/String;

    .line 544
    return-void
.end method

.method protected setAdapterClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "adapterClass"    # Ljava/lang/Class;

    .prologue
    .line 552
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->adapterClass:Ljava/lang/Class;

    .line 553
    return-void
.end method

.method public setAntlib(Ljava/lang/String;)V
    .locals 4
    .param p1, "antlib"    # Ljava/lang/String;

    .prologue
    .line 487
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    if-eqz v0, :cond_0

    .line 488
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->tooManyDefinitions()V

    .line 490
    :cond_0
    const-string/jumbo v0, "antlib:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 491
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Invalid antlib attribute - it must start with antlib:"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 494
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Definer;->setURI(Ljava/lang/String;)V

    .line 495
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "antlib:"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "/antlib.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    .line 497
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    .line 498
    return-void
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 528
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->classname:Ljava/lang/String;

    .line 529
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 456
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    if-eqz v0, :cond_0

    .line 457
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->tooManyDefinitions()V

    .line 459
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    .line 460
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->file:Ljava/io/File;

    .line 461
    return-void
.end method

.method public setFormat(Lorg/apache/tools/ant/taskdefs/Definer$Format;)V
    .locals 1
    .param p1, "format"    # Lorg/apache/tools/ant/taskdefs/Definer$Format;

    .prologue
    .line 177
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Definer$Format;->getIndex()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->format:I

    .line 178
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 505
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    if-eqz v0, :cond_0

    .line 506
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->tooManyDefinitions()V

    .line 508
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    .line 509
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->name:Ljava/lang/String;

    .line 510
    return-void
.end method

.method public setOnError(Lorg/apache/tools/ant/taskdefs/Definer$OnError;)V
    .locals 1
    .param p1, "onError"    # Lorg/apache/tools/ant/taskdefs/Definer$OnError;

    .prologue
    .line 169
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Definer$OnError;->getIndex()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->onError:I

    .line 170
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 1
    .param p1, "res"    # Ljava/lang/String;

    .prologue
    .line 469
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    if-eqz v0, :cond_0

    .line 470
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;->tooManyDefinitions()V

    .line 472
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Definer;->definerSet:Z

    .line 473
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->resource:Ljava/lang/String;

    .line 474
    return-void
.end method

.method protected setRestrict(Z)V
    .locals 0
    .param p1, "restrict"    # Z

    .prologue
    .line 154
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Definer;->restrict:Z

    .line 155
    return-void
.end method
