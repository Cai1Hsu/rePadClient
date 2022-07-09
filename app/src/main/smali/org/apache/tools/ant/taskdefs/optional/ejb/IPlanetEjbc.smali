.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
.super Ljava/lang/Object;
.source "IPlanetEjbc.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;,
        Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
    }
.end annotation


# static fields
.field private static final ENTITY_BEAN:Ljava/lang/String; = "entity"

.field private static final MAX_NUM_ARGS:I = 0x8

.field private static final MIN_NUM_ARGS:I = 0x2

.field private static final NUM_CLASSES_WITHOUT_IIOP:I = 0x9

.field private static final NUM_CLASSES_WITH_IIOP:I = 0xf

.field private static final STATEFUL_SESSION:Ljava/lang/String; = "stateful"

.field private static final STATELESS_SESSION:Ljava/lang/String; = "stateless"


# instance fields
.field private classpath:Ljava/lang/String;

.field private classpathElements:[Ljava/lang/String;

.field private debugOutput:Z

.field private destDirectory:Ljava/io/File;

.field private displayName:Ljava/lang/String;

.field private ejbFiles:Ljava/util/Hashtable;

.field private handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

.field private iasDescriptor:Ljava/io/File;

.field private iasHomeDir:Ljava/io/File;

.field private parser:Ljavax/xml/parsers/SAXParser;

.field private retainSource:Z

.field private stdDescriptor:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 3
    .param p1, "stdDescriptor"    # Ljava/io/File;
    .param p2, "iasDescriptor"    # Ljava/io/File;
    .param p3, "destDirectory"    # Ljava/io/File;
    .param p4, "classpath"    # Ljava/lang/String;
    .param p5, "parser"    # Ljavax/xml/parsers/SAXParser;

    .prologue
    const/4 v2, 0x0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->retainSource:Z

    .line 95
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->debugOutput:Z

    .line 102
    new-instance v2, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-direct {v2, p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    .line 111
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->ejbFiles:Ljava/util/Hashtable;

    .line 137
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->stdDescriptor:Ljava/io/File;

    .line 138
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasDescriptor:Ljava/io/File;

    .line 139
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    .line 140
    iput-object p4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->classpath:Ljava/lang/String;

    .line 141
    iput-object p5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->parser:Ljavax/xml/parsers/SAXParser;

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    .local v0, "elements":Ljava/util/List;
    if-eqz p4, :cond_1

    .line 149
    new-instance v1, Ljava/util/StringTokenizer;

    sget-object v2, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-direct {v1, p4, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .local v1, "st":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 152
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 154
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->classpathElements:[Ljava/lang/String;

    .line 157
    .end local v1    # "st":Ljava/util/StringTokenizer;
    :cond_1
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method static access$102(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->displayName:Ljava/lang/String;

    return-object p1
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    return-void
.end method

.method static access$300(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/util/Hashtable;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->ejbFiles:Ljava/util/Hashtable;

    return-object v0
.end method

.method private buildArgumentList(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;)[Ljava/lang/String;
    .locals 3
    .param p1, "ejb"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    .prologue
    .line 519
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 523
    .local v0, "arguments":Ljava/util/List;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->debugOutput:Z

    if-eqz v1, :cond_0

    .line 524
    const-string/jumbo v1, "-debug"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 528
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getBeantype()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "stateless"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 529
    const-string/jumbo v1, "-sl"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getIiop()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 535
    const-string/jumbo v1, "-iiop"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 538
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getCmp()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 539
    const-string/jumbo v1, "-cmp"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    :cond_3
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->retainSource:Z

    if-eqz v1, :cond_4

    .line 543
    const-string/jumbo v1, "-gs"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 546
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getHasession()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 547
    const-string/jumbo v1, "-fo"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 552
    :cond_5
    const-string/jumbo v1, "-classpath"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 553
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->classpath:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 555
    const-string/jumbo v1, "-d"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 556
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getHome()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getRemote()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 560
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getImplementation()Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname;->getQualifiedClassName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 563
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1

    .line 530
    :cond_6
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getBeantype()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "stateful"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 531
    const-string/jumbo v1, "-sf"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method private callEjbc([Ljava/lang/String;)V
    .locals 9
    .param p1, "arguments"    # [Ljava/lang/String;

    .prologue
    .line 410
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 411
    .local v0, "args":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, p1

    if-ge v4, v7, :cond_0

    .line 412
    aget-object v7, p1, v4

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 411
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 417
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasHomeDir:Ljava/io/File;

    if-nez v7, :cond_1

    .line 418
    const-string/jumbo v1, ""

    .line 423
    .local v1, "command":Ljava/lang/String;
    :goto_1
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "ejbc "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 425
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    .line 433
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    .line 434
    .local v6, "p":Ljava/lang/Process;
    new-instance v5, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;-><init>(Ljava/io/InputStream;)V

    .line 435
    .local v5, "output":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;

    invoke-virtual {v6}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v3, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;-><init>(Ljava/io/InputStream;)V

    .line 436
    .local v3, "error":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;->start()V

    .line 437
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;->start()V

    .line 438
    invoke-virtual {v6}, Ljava/lang/Process;->waitFor()I

    .line 439
    invoke-virtual {v6}, Ljava/lang/Process;->destroy()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 446
    .end local v3    # "error":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;
    .end local v5    # "output":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput;
    .end local v6    # "p":Ljava/lang/Process;
    :goto_2
    return-void

    .line 420
    .end local v1    # "command":Ljava/lang/String;
    :cond_1
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasHomeDir:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "bin"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "command":Ljava/lang/String;
    goto/16 :goto_1

    .line 440
    :catch_0
    move-exception v2

    .line 441
    .local v2, "e":Ljava/io/IOException;
    const-string/jumbo v7, "An IOException has occurred while trying to execute ejbc."

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    .line 442
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 443
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v7

    goto :goto_2
.end method

.method private getEjbs()[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 495
    const/4 v0, 0x0

    .line 502
    .local v0, "ejbs":[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->parser:Ljavax/xml/parsers/SAXParser;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->stdDescriptor:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-virtual {v1, v2, v3}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/File;Lorg/xml/sax/HandlerBase;)V

    .line 503
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->parser:Ljavax/xml/parsers/SAXParser;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasDescriptor:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-virtual {v1, v2, v3}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/File;Lorg/xml/sax/HandlerBase;)V

    .line 504
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->getEjbs()[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    move-result-object v0

    .line 506
    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 573
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->debugOutput:Z

    if-eqz v0, :cond_0

    .line 574
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 576
    :cond_0
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 15
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 255
    const/4 v3, 0x0

    .line 256
    .local v3, "destDirectory":Ljava/io/File;
    const/4 v4, 0x0

    .line 257
    .local v4, "classpath":Ljava/lang/String;
    const/4 v5, 0x0

    .line 258
    .local v5, "parser":Ljavax/xml/parsers/SAXParser;
    const/4 v6, 0x0

    .line 259
    .local v6, "debug":Z
    const/4 v11, 0x0

    .line 262
    .local v11, "retainSource":Z
    array-length v12, p0

    const/4 v13, 0x2

    if-lt v12, v13, :cond_0

    array-length v12, p0

    const/16 v13, 0x8

    if-le v12, v13, :cond_1

    .line 263
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->usage()V

    .line 335
    :goto_0
    return-void

    .line 267
    :cond_1
    new-instance v1, Ljava/io/File;

    array-length v12, p0

    add-int/lit8 v12, v12, -0x2

    aget-object v12, p0, v12

    invoke-direct {v1, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 268
    .local v1, "stdDescriptor":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    array-length v12, p0

    add-int/lit8 v12, v12, -0x1

    aget-object v12, p0, v12

    invoke-direct {v2, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 270
    .local v2, "iasDescriptor":Ljava/io/File;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    array-length v12, p0

    add-int/lit8 v12, v12, -0x2

    if-ge v8, v12, :cond_6

    .line 271
    aget-object v12, p0, v8

    const-string/jumbo v13, "-classpath"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 272
    add-int/lit8 v8, v8, 0x1

    aget-object v4, p0, v8

    .line 270
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 273
    :cond_2
    aget-object v12, p0, v8

    const-string/jumbo v13, "-d"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 274
    new-instance v3, Ljava/io/File;

    .end local v3    # "destDirectory":Ljava/io/File;
    add-int/lit8 v8, v8, 0x1

    aget-object v12, p0, v8

    invoke-direct {v3, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v3    # "destDirectory":Ljava/io/File;
    goto :goto_2

    .line 275
    :cond_3
    aget-object v12, p0, v8

    const-string/jumbo v13, "-debug"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 276
    const/4 v6, 0x1

    goto :goto_2

    .line 277
    :cond_4
    aget-object v12, p0, v8

    const-string/jumbo v13, "-keepsource"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 278
    const/4 v11, 0x1

    goto :goto_2

    .line 280
    :cond_5
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->usage()V

    goto :goto_0

    .line 286
    :cond_6
    if-nez v4, :cond_7

    .line 287
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v10

    .line 288
    .local v10, "props":Ljava/util/Properties;
    const-string/jumbo v12, "java.class.path"

    invoke-virtual {v10, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 295
    .end local v10    # "props":Ljava/util/Properties;
    :cond_7
    if-nez v3, :cond_8

    .line 296
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v10

    .line 297
    .restart local v10    # "props":Ljava/util/Properties;
    new-instance v3, Ljava/io/File;

    .end local v3    # "destDirectory":Ljava/io/File;
    const-string/jumbo v12, "user.dir"

    invoke-virtual {v10, v12}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v3, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 301
    .end local v10    # "props":Ljava/util/Properties;
    .restart local v3    # "destDirectory":Ljava/io/File;
    :cond_8
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v9

    .line 302
    .local v9, "parserFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 304
    :try_start_0
    invoke-virtual {v9}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 314
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;-><init>(Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 316
    .local v0, "ejbc":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setDebugOutput(Z)V

    .line 317
    invoke-virtual {v0, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->setRetainSource(Z)V

    .line 321
    :try_start_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->execute()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException; {:try_start_1 .. :try_end_1} :catch_3

    goto/16 :goto_0

    .line 322
    :catch_0
    move-exception v7

    .line 323
    .local v7, "e":Ljava/io/IOException;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "An IOException has occurred while reading the XML descriptors ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v7}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ")."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 305
    .end local v0    # "ejbc":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    .end local v7    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v7

    .line 307
    .local v7, "e":Ljava/lang/Exception;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v13, "An exception was generated while trying to "

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 308
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v13, "create a new SAXParser."

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 309
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 326
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v0    # "ejbc":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
    :catch_2
    move-exception v7

    .line 327
    .local v7, "e":Lorg/xml/sax/SAXException;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "A SAXException has occurred while reading the XML descriptors ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v7}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ")."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 330
    .end local v7    # "e":Lorg/xml/sax/SAXException;
    :catch_3
    move-exception v7

    .line 331
    .local v7, "e":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
    sget-object v12, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "An error has occurred while executing the ejbc utility ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ")."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static usage()V
    .locals 2

    .prologue
    .line 341
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "java org.apache.tools.ant.taskdefs.optional.ejb.IPlanetEjbc \\"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 342
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  [OPTIONS] [EJB 1.1 descriptor] [iAS EJB descriptor]"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 343
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 344
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "Where OPTIONS are:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 345
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -debug -- for additional debugging output"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 346
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -keepsource -- to retain Java source files generated"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 347
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -classpath [classpath] -- classpath used for compilation"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 348
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "  -d [destination directory] -- directory for compiled classes"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 349
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 350
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "If a classpath is not specified, the system classpath"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 351
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "will be used.  If a destination directory is not specified,"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 352
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "the current working directory will be used (classes will"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 353
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "still be placed in subfolders which correspond to their"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 354
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "package name)."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 355
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 356
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "The EJB home interface, remote interface, and implementation"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 357
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "class must be found in the destination directory.  In"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "addition, the destination will look for the stubs and skeletons"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 359
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v1, "in the destination directory to ensure they are up to date."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 360
    return-void
.end method


# virtual methods
.method protected checkConfiguration()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;
        }
    .end annotation

    .prologue
    .line 455
    const-string/jumbo v0, ""

    .line 457
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->stdDescriptor:Ljava/io/File;

    if-nez v1, :cond_0

    .line 458
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "A standard XML descriptor file must be specified.  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 460
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasDescriptor:Ljava/io/File;

    if-nez v1, :cond_1

    .line 461
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "An iAS-specific XML descriptor file must be specified.  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 463
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->classpath:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 464
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "A classpath must be specified.    "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 466
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->parser:Ljavax/xml/parsers/SAXParser;

    if-nez v1, :cond_3

    .line 467
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "An XML parser must be specified.    "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 470
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    if-nez v1, :cond_5

    .line 471
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "A destination directory must be specified.  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 478
    :cond_4
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_7

    .line 479
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;

    invoke-direct {v1, p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    throw v1

    .line 472
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_6

    .line 473
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "The destination directory specified does not exist.  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 474
    :cond_6
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_4

    .line 475
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "The destination specified is not a directory.  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 481
    :cond_7
    return-void
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException;,
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 376
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->checkConfiguration()V

    .line 378
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->getEjbs()[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    move-result-object v2

    .line 380
    .local v2, "ejbs":[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    .line 381
    const-string/jumbo v4, "EJBInfo..."

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    .line 382
    aget-object v4, v2, v3

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    .line 380
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 385
    :cond_0
    const/4 v3, 0x0

    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 386
    aget-object v1, v2, v3

    .line 388
    .local v1, "ejb":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    invoke-static {v1, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;Ljava/io/File;)V

    .line 390
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->destDirectory:Ljava/io/File;

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->mustBeRecompiled(Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 391
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " must be recompiled using ejbc."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    .line 393
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->buildArgumentList(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;)[Ljava/lang/String;

    move-result-object v0

    .line 394
    .local v0, "arguments":[Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->callEjbc([Ljava/lang/String;)V

    .line 385
    .end local v0    # "arguments":[Ljava/lang/String;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 397
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " is up to date."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 400
    .end local v1    # "ejb":Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    :cond_2
    return-void
.end method

.method public getCmpDescriptors()[Ljava/lang/String;
    .locals 5

    .prologue
    .line 233
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v3, "returnList":Ljava/util/List;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->getEjbs()[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    move-result-object v1

    .line 237
    .local v1, "ejbs":[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-ge v2, v4, :cond_0

    .line 238
    aget-object v4, v1, v2

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->getCmpDescriptors()Ljava/util/List;

    move-result-object v0

    .line 239
    .local v0, "descriptors":Ljava/util/List;
    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 237
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 242
    .end local v0    # "descriptors":Ljava/util/List;
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    return-object v4
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEjbFiles()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->ejbFiles:Ljava/util/Hashtable;

    return-object v0
.end method

.method public registerDTD(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "publicID"    # Ljava/lang/String;
    .param p2, "location"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method public setDebugOutput(Z)V
    .locals 0
    .param p1, "debugOutput"    # Z

    .prologue
    .line 178
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->debugOutput:Z

    .line 179
    return-void
.end method

.method public setIasHomeDir(Ljava/io/File;)V
    .locals 0
    .param p1, "iasHomeDir"    # Ljava/io/File;

    .prologue
    .line 202
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->iasHomeDir:Ljava/io/File;

    .line 203
    return-void
.end method

.method public setRetainSource(Z)V
    .locals 0
    .param p1, "retainSource"    # Z

    .prologue
    .line 168
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->retainSource:Z

    .line 169
    return-void
.end method
