.class public Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;
.super Ljava/lang/Object;
.source "TraXLiaison.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/XSLTLiaison3;
.implements Ljavax/xml/transform/ErrorListener;
.implements Lorg/apache/tools/ant/taskdefs/XSLTLoggerAware;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;


# instance fields
.field private attributes:Ljava/util/Vector;

.field private entityResolver:Lorg/xml/sax/EntityResolver;

.field private factoryName:Ljava/lang/String;

.field private logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

.field private outputProperties:Ljava/util/Vector;

.field private params:Ljava/util/Hashtable;

.field private project:Lorg/apache/tools/ant/Project;

.field private stylesheet:Lorg/apache/tools/ant/types/Resource;

.field private suppressWarnings:Z

.field private templates:Ljavax/xml/transform/Templates;

.field private templatesModTime:J

.field private tfactory:Ljavax/xml/transform/TransformerFactory;

.field private traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

.field private transformer:Ljavax/xml/transform/Transformer;

.field private uriResolver:Ljavax/xml/transform/URIResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    .line 118
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->outputProperties:Ljava/util/Vector;

    .line 121
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->params:Ljava/util/Hashtable;

    .line 124
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->attributes:Ljava/util/Vector;

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->suppressWarnings:Z

    .line 130
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    .line 137
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 270
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private createTransformer()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 316
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templates:Ljavax/xml/transform/Templates;

    if-nez v7, :cond_0

    .line 317
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->readTemplates()V

    .line 320
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templates:Ljavax/xml/transform/Templates;

    invoke-interface {v7}, Ljavax/xml/transform/Templates;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    .line 323
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    invoke-virtual {v7, p0}, Ljavax/xml/transform/Transformer;->setErrorListener(Ljavax/xml/transform/ErrorListener;)V

    .line 324
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->uriResolver:Ljavax/xml/transform/URIResolver;

    if-eqz v7, :cond_1

    .line 325
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->uriResolver:Ljavax/xml/transform/URIResolver;

    invoke-virtual {v7, v8}, Ljavax/xml/transform/Transformer;->setURIResolver(Ljavax/xml/transform/URIResolver;)V

    .line 327
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->outputProperties:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v4

    .line 328
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_2

    .line 329
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->outputProperties:Ljava/util/Vector;

    invoke-virtual {v7, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 330
    .local v3, "pair":[Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    const/4 v8, 0x0

    aget-object v8, v3, v8

    aget-object v9, v3, v10

    invoke-virtual {v7, v8, v9}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 333
    .end local v3    # "pair":[Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    if-eqz v7, :cond_3

    .line 334
    const-string/jumbo v7, "org.apache.xalan.transformer.TransformerImpl"

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 337
    :try_start_0
    const-string/jumbo v7, "org.apache.tools.ant.taskdefs.optional.Xalan2TraceSupport"

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    invoke-static {v7, v8, v9}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    .line 342
    .local v5, "traceSupport":Ljava/lang/Class;
    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/taskdefs/optional/XSLTTraceSupport;

    .line 344
    .local v6, "ts":Lorg/apache/tools/ant/taskdefs/optional/XSLTTraceSupport;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    invoke-interface {v6, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/XSLTTraceSupport;->configureTrace(Ljavax/xml/transform/Transformer;Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    .end local v5    # "traceSupport":Ljava/lang/Class;
    .end local v6    # "ts":Lorg/apache/tools/ant/taskdefs/optional/XSLTTraceSupport;
    :cond_3
    :goto_1
    return-void

    .line 345
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to enable tracing because of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 347
    .local v2, "msg":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    if-eqz v7, :cond_4

    .line 348
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7, v2, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 350
    :cond_4
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v7, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 354
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_5
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Not enabling trace support for transformer implementation"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 356
    .restart local v2    # "msg":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    if-eqz v7, :cond_6

    .line 357
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v7, v2, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 359
    :cond_6
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v7, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getFactory()Ljavax/xml/transform/TransformerFactory;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 386
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    if-eqz v9, :cond_0

    .line 387
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    .line 444
    :goto_0
    return-object v9

    .line 390
    :cond_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    if-nez v9, :cond_2

    .line 391
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v9

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    .line 423
    :goto_1
    :try_start_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string/jumbo v10, "_isNotSecureProcessing"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 424
    .local v0, "_isNotSecureProcessing":Ljava/lang/reflect/Field;
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 425
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v9, v10}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 432
    .end local v0    # "_isNotSecureProcessing":Ljava/lang/reflect/Field;
    :cond_1
    :goto_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    invoke-virtual {v9, p0}, Ljavax/xml/transform/TransformerFactory;->setErrorListener(Ljavax/xml/transform/ErrorListener;)V

    .line 435
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->attributes:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v7

    .line 436
    .local v7, "size":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    if-ge v4, v7, :cond_6

    .line 437
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->attributes:Ljava/util/Vector;

    invoke-virtual {v9, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    .line 438
    .local v6, "pair":[Ljava/lang/Object;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    const/4 v9, 0x0

    aget-object v9, v6, v9

    check-cast v9, Ljava/lang/String;

    aget-object v11, v6, v12

    invoke-virtual {v10, v9, v11}, Ljavax/xml/transform/TransformerFactory;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 436
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 394
    .end local v4    # "i":I
    .end local v6    # "pair":[Ljava/lang/Object;
    .end local v7    # "size":I
    :cond_2
    const/4 v1, 0x0

    .line 396
    .local v1, "clazz":Ljava/lang/Class;
    :try_start_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    const/4 v10, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v11

    invoke-static {v9, v10, v11}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 413
    :goto_4
    if-nez v1, :cond_3

    .line 414
    :try_start_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 416
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljavax/xml/transform/TransformerFactory;

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 417
    :catch_0
    move-exception v3

    .line 418
    .local v3, "e":Ljava/lang/Exception;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 400
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 401
    .local v2, "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_3
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Failed to load "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " via the configured classpath, will try"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " Ant\'s classpath instead."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 404
    .local v5, "msg":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    if-eqz v9, :cond_4

    .line 405
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    invoke-interface {v9, v5}, Lorg/apache/tools/ant/taskdefs/XSLTLogger;->log(Ljava/lang/String;)V

    goto :goto_4

    .line 406
    :cond_4
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    if-eqz v9, :cond_5

    .line 407
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    const/4 v10, 0x1

    invoke-virtual {v9, v5, v10}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_4

    .line 409
    :cond_5
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v9, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .line 426
    .end local v1    # "clazz":Ljava/lang/Class;
    .end local v2    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v5    # "msg":Ljava/lang/String;
    :catch_2
    move-exception v8

    .line 427
    .local v8, "x":Ljava/lang/Exception;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    if-eqz v9, :cond_1

    .line 428
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v8}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x4

    invoke-virtual {v9, v10, v11}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 441
    .end local v8    # "x":Ljava/lang/Exception;
    .restart local v4    # "i":I
    .restart local v7    # "size":I
    :cond_6
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->uriResolver:Ljavax/xml/transform/URIResolver;

    if-eqz v9, :cond_7

    .line 442
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->uriResolver:Ljavax/xml/transform/URIResolver;

    invoke-virtual {v9, v10}, Ljavax/xml/transform/TransformerFactory;->setURIResolver(Ljavax/xml/transform/URIResolver;)V

    .line 444
    :cond_7
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->tfactory:Ljavax/xml/transform/TransformerFactory;

    goto/16 :goto_0
.end method

.method private getSource(Ljava/io/InputStream;Ljava/io/File;)Ljavax/xml/transform/Source;
    .locals 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "infile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 219
    const/4 v2, 0x0

    .line 220
    .local v2, "src":Ljavax/xml/transform/Source;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->entityResolver:Lorg/xml/sax/EntityResolver;

    if-eqz v3, :cond_1

    .line 221
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->getFactory()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    const-string/jumbo v4, "http://javax.xml.transform.sax.SAXSource/feature"

    invoke-virtual {v3, v4}, Ljavax/xml/transform/TransformerFactory;->getFeature(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 222
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    .line 223
    .local v1, "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 224
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    .line 225
    .local v0, "reader":Lorg/xml/sax/XMLReader;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->entityResolver:Lorg/xml/sax/EntityResolver;

    invoke-interface {v0, v3}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 226
    new-instance v2, Ljavax/xml/transform/sax/SAXSource;

    .end local v2    # "src":Ljavax/xml/transform/Source;
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v0, v3}, Ljavax/xml/transform/sax/SAXSource;-><init>(Lorg/xml/sax/XMLReader;Lorg/xml/sax/InputSource;)V

    .line 236
    .end local v0    # "reader":Lorg/xml/sax/XMLReader;
    .end local v1    # "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v2    # "src":Ljavax/xml/transform/Source;
    :goto_0
    invoke-static {p2}, Lorg/apache/tools/ant/util/JAXPUtils;->getSystemId(Ljava/io/File;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljavax/xml/transform/Source;->setSystemId(Ljava/lang/String;)V

    .line 237
    return-object v2

    .line 228
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "xcatalog specified, but parser doesn\'t support SAX"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 234
    :cond_1
    new-instance v2, Ljavax/xml/transform/stream/StreamSource;

    .end local v2    # "src":Ljavax/xml/transform/Source;
    invoke-direct {v2, p1}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    .restart local v2    # "src":Ljavax/xml/transform/Source;
    goto :goto_0
.end method

.method private getSource(Ljava/io/InputStream;Lorg/apache/tools/ant/types/Resource;)Ljavax/xml/transform/Source;
    .locals 5
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "resource"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 245
    const/4 v2, 0x0

    .line 246
    .local v2, "src":Ljavax/xml/transform/Source;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->entityResolver:Lorg/xml/sax/EntityResolver;

    if-eqz v3, :cond_1

    .line 247
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->getFactory()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    const-string/jumbo v4, "http://javax.xml.transform.sax.SAXSource/feature"

    invoke-virtual {v3, v4}, Ljavax/xml/transform/TransformerFactory;->getFeature(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 248
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    .line 249
    .local v1, "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 250
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    .line 251
    .local v0, "reader":Lorg/xml/sax/XMLReader;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->entityResolver:Lorg/xml/sax/EntityResolver;

    invoke-interface {v0, v3}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 252
    new-instance v2, Ljavax/xml/transform/sax/SAXSource;

    .end local v2    # "src":Ljavax/xml/transform/Source;
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v0, v3}, Ljavax/xml/transform/sax/SAXSource;-><init>(Lorg/xml/sax/XMLReader;Lorg/xml/sax/InputSource;)V

    .line 265
    .end local v0    # "reader":Lorg/xml/sax/XMLReader;
    .end local v1    # "spFactory":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v2    # "src":Ljavax/xml/transform/Source;
    :goto_0
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->resourceToURI(Lorg/apache/tools/ant/types/Resource;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljavax/xml/transform/Source;->setSystemId(Ljava/lang/String;)V

    .line 266
    return-object v2

    .line 254
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "xcatalog specified, but parser doesn\'t support SAX"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 260
    :cond_1
    new-instance v2, Ljavax/xml/transform/stream/StreamSource;

    .end local v2    # "src":Ljavax/xml/transform/Source;
    invoke-direct {v2, p1}, Ljavax/xml/transform/stream/StreamSource;-><init>(Ljava/io/InputStream;)V

    .restart local v2    # "src":Ljavax/xml/transform/Source;
    goto :goto_0
.end method

.method private logError(Ljavax/xml/transform/TransformerException;Ljava/lang/String;)V
    .locals 8
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/4 v7, -0x1

    .line 545
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    if-nez v6, :cond_0

    .line 583
    :goto_0
    return-void

    .line 549
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 550
    .local v3, "msg":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljavax/xml/transform/TransformerException;->getLocator()Ljavax/xml/transform/SourceLocator;

    move-result-object v2

    .line 551
    .local v2, "locator":Ljavax/xml/transform/SourceLocator;
    if-eqz v2, :cond_2

    .line 552
    invoke-interface {v2}, Ljavax/xml/transform/SourceLocator;->getSystemId()Ljava/lang/String;

    move-result-object v4

    .line 553
    .local v4, "systemid":Ljava/lang/String;
    if-eqz v4, :cond_4

    .line 554
    move-object v5, v4

    .line 555
    .local v5, "url":Ljava/lang/String;
    const-string/jumbo v6, "file:"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 556
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v6

    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 558
    :cond_1
    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 562
    .end local v5    # "url":Ljava/lang/String;
    :goto_1
    invoke-interface {v2}, Ljavax/xml/transform/SourceLocator;->getLineNumber()I

    move-result v1

    .line 563
    .local v1, "line":I
    if-eq v1, v7, :cond_2

    .line 564
    const-string/jumbo v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 565
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 566
    invoke-interface {v2}, Ljavax/xml/transform/SourceLocator;->getColumnNumber()I

    move-result v0

    .line 567
    .local v0, "column":I
    if-eq v0, v7, :cond_2

    .line 568
    const-string/jumbo v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 569
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 573
    .end local v0    # "column":I
    .end local v1    # "line":I
    .end local v4    # "systemid":Ljava/lang/String;
    :cond_2
    const-string/jumbo v6, ": "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 574
    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 575
    const-string/jumbo v6, "! "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 576
    invoke-virtual {p1}, Ljavax/xml/transform/TransformerException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 577
    invoke-virtual {p1}, Ljavax/xml/transform/TransformerException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 578
    const-string/jumbo v6, " Cause: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 579
    invoke-virtual {p1}, Ljavax/xml/transform/TransformerException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 582
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/tools/ant/taskdefs/XSLTLogger;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 560
    .restart local v4    # "systemid":Ljava/lang/String;
    :cond_4
    const-string/jumbo v6, "Unknown file"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method private readTemplates()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/transform/TransformerConfigurationException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 294
    const/4 v1, 0x0

    .line 296
    .local v1, "xslStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedInputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    .end local v1    # "xslStream":Ljava/io/InputStream;
    .local v2, "xslStream":Ljava/io/InputStream;
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v4

    iput-wide v4, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templatesModTime:J

    .line 299
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->getSource(Ljava/io/InputStream;Lorg/apache/tools/ant/types/Resource;)Ljavax/xml/transform/Source;

    move-result-object v0

    .line 300
    .local v0, "src":Ljavax/xml/transform/Source;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->getFactory()Ljavax/xml/transform/TransformerFactory;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljavax/xml/transform/TransformerFactory;->newTemplates(Ljavax/xml/transform/Source;)Ljavax/xml/transform/Templates;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templates:Ljavax/xml/transform/Templates;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 302
    if-eqz v2, :cond_0

    .line 303
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 306
    :cond_0
    return-void

    .line 302
    .end local v0    # "src":Ljavax/xml/transform/Source;
    .end local v2    # "xslStream":Ljava/io/InputStream;
    .restart local v1    # "xslStream":Ljava/io/InputStream;
    :catchall_0
    move-exception v3

    :goto_0
    if-eqz v1, :cond_1

    .line 303
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_1
    throw v3

    .line 302
    .end local v1    # "xslStream":Ljava/io/InputStream;
    .restart local v2    # "xslStream":Ljava/io/InputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "xslStream":Ljava/io/InputStream;
    .restart local v1    # "xslStream":Ljava/io/InputStream;
    goto :goto_0
.end method

.method private resourceToURI(Lorg/apache/tools/ant/types/Resource;)Ljava/lang/String;
    .locals 5
    .param p1, "resource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 270
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_0

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 271
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_1

    .line 272
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 279
    :goto_1
    return-object v3

    .line 270
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 274
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    if-nez v3, :cond_2

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.URLProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/URLProvider;

    .line 275
    .local v2, "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    if-eqz v2, :cond_3

    .line 276
    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/URLProvider;->getURL()Ljava/net/URL;

    move-result-object v1

    .line 277
    .local v1, "u":Ljava/net/URL;
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 274
    .end local v1    # "u":Ljava/net/URL;
    .end local v2    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_2
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->class$org$apache$tools$ant$types$resources$URLProvider:Ljava/lang/Class;

    goto :goto_2

    .line 279
    .restart local v2    # "up":Lorg/apache/tools/ant/types/resources/URLProvider;
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private setTransformationParameters()V
    .locals 4

    .prologue
    .line 369
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->params:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .line 370
    .local v0, "enumeration":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 371
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 372
    .local v1, "name":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->params:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 373
    .local v2, "value":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    invoke-virtual {v3, v1, v2}, Ljavax/xml/transform/Transformer;->setParameter(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 375
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method public addParam(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 506
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->params:Ljava/util/Hashtable;

    invoke-virtual {v0, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    return-void
.end method

.method public configure(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V
    .locals 8
    .param p1, "xsltTask"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    .prologue
    .line 603
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    .line 604
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getFactory()Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    move-result-object v2

    .line 605
    .local v2, "factory":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;
    if-eqz v2, :cond_0

    .line 606
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setFactory(Ljava/lang/String;)V

    .line 609
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;->getAttributes()Ljava/util/Enumeration;

    move-result-object v1

    .line 610
    .local v1, "attrs":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 611
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;

    .line 613
    .local v0, "attr":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 617
    .end local v0    # "attr":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory$Attribute;
    .end local v1    # "attrs":Ljava/util/Enumeration;
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getXMLCatalog()Lorg/apache/tools/ant/types/XMLCatalog;

    move-result-object v5

    .line 619
    .local v5, "xmlCatalog":Lorg/apache/tools/ant/types/XMLCatalog;
    if-eqz v5, :cond_1

    .line 620
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 621
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setURIResolver(Ljavax/xml/transform/URIResolver;)V

    .line 626
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getOutputProperties()Ljava/util/Enumeration;

    move-result-object v4

    .line 627
    .local v4, "props":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 628
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;

    .line 630
    .local v3, "prop":Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 633
    .end local v3    # "prop":Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getSuppressWarnings()Z

    move-result v6

    iput-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->suppressWarnings:Z

    .line 635
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getTraceConfiguration()Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    .line 636
    return-void
.end method

.method public error(Ljavax/xml/transform/TransformerException;)V
    .locals 1
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 522
    const-string/jumbo v0, "Error"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logError(Ljavax/xml/transform/TransformerException;Ljava/lang/String;)V

    .line 523
    return-void
.end method

.method public fatalError(Ljavax/xml/transform/TransformerException;)V
    .locals 2
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 530
    const-string/jumbo v0, "Fatal Error"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logError(Ljavax/xml/transform/TransformerException;Ljava/lang/String;)V

    .line 531
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Fatal error during transformation"

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected getSystemId(Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 593
    invoke-static {p1}, Lorg/apache/tools/ant/util/JAXPUtils;->getSystemId(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 466
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 467
    .local v0, "pair":[Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->attributes:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 468
    return-void
.end method

.method public setEntityResolver(Lorg/xml/sax/EntityResolver;)V
    .locals 0
    .param p1, "aResolver"    # Lorg/xml/sax/EntityResolver;

    .prologue
    .line 489
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->entityResolver:Lorg/xml/sax/EntityResolver;

    .line 490
    return-void
.end method

.method public setFactory(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 455
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->factoryName:Ljava/lang/String;

    .line 456
    return-void
.end method

.method public setLogger(Lorg/apache/tools/ant/taskdefs/XSLTLogger;)V
    .locals 0
    .param p1, "l"    # Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    .prologue
    .line 514
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logger:Lorg/apache/tools/ant/taskdefs/XSLTLogger;

    .line 515
    return-void
.end method

.method public setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 480
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 481
    .local v0, "pair":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->outputProperties:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 482
    return-void
.end method

.method public setStylesheet(Ljava/io/File;)V
    .locals 2
    .param p1, "stylesheet"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 145
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>()V

    .line 146
    .local v0, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 147
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 148
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setStylesheet(Lorg/apache/tools/ant/types/Resource;)V

    .line 149
    return-void
.end method

.method public setStylesheet(Lorg/apache/tools/ant/types/Resource;)V
    .locals 5
    .param p1, "stylesheet"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 157
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_1

    .line 159
    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Resource;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templatesModTime:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 164
    :cond_0
    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->templates:Ljavax/xml/transform/Templates;

    .line 167
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->stylesheet:Lorg/apache/tools/ant/types/Resource;

    .line 168
    return-void
.end method

.method public setURIResolver(Ljavax/xml/transform/URIResolver;)V
    .locals 0
    .param p1, "aResolver"    # Ljavax/xml/transform/URIResolver;

    .prologue
    .line 497
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->uriResolver:Ljavax/xml/transform/URIResolver;

    .line 498
    return-void
.end method

.method public transform(Ljava/io/File;Ljava/io/File;)V
    .locals 7
    .param p1, "infile"    # Ljava/io/File;
    .param p2, "outfile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 177
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    if-nez v6, :cond_0

    .line 178
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->createTransformer()V

    .line 181
    :cond_0
    const/4 v0, 0x0

    .line 182
    .local v0, "fis":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 184
    .local v2, "fos":Ljava/io/OutputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    .end local v0    # "fis":Ljava/io/InputStream;
    .local v1, "fis":Ljava/io/InputStream;
    :try_start_1
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 186
    .end local v2    # "fos":Ljava/io/OutputStream;
    .local v3, "fos":Ljava/io/OutputStream;
    :try_start_2
    new-instance v4, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v4, v3}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    .line 188
    .local v4, "res":Ljavax/xml/transform/stream/StreamResult;
    invoke-static {p2}, Lorg/apache/tools/ant/util/JAXPUtils;->getSystemId(Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljavax/xml/transform/stream/StreamResult;->setSystemId(Ljava/lang/String;)V

    .line 189
    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->getSource(Ljava/io/InputStream;Ljava/io/File;)Ljavax/xml/transform/Source;

    move-result-object v5

    .line 193
    .local v5, "src":Ljavax/xml/transform/Source;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->setTransformationParameters()V

    .line 195
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->transformer:Ljavax/xml/transform/Transformer;

    invoke-virtual {v6, v5, v4}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 200
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 201
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 203
    return-void

    .line 200
    .end local v1    # "fis":Ljava/io/InputStream;
    .end local v3    # "fos":Ljava/io/OutputStream;
    .end local v4    # "res":Ljavax/xml/transform/stream/StreamResult;
    .end local v5    # "src":Ljavax/xml/transform/Source;
    .restart local v0    # "fis":Ljava/io/InputStream;
    .restart local v2    # "fos":Ljava/io/OutputStream;
    :catchall_0
    move-exception v6

    :goto_0
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 201
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v6

    .line 200
    .end local v0    # "fis":Ljava/io/InputStream;
    .restart local v1    # "fis":Ljava/io/InputStream;
    :catchall_1
    move-exception v6

    move-object v0, v1

    .end local v1    # "fis":Ljava/io/InputStream;
    .restart local v0    # "fis":Ljava/io/InputStream;
    goto :goto_0

    .end local v0    # "fis":Ljava/io/InputStream;
    .end local v2    # "fos":Ljava/io/OutputStream;
    .restart local v1    # "fis":Ljava/io/InputStream;
    .restart local v3    # "fos":Ljava/io/OutputStream;
    :catchall_2
    move-exception v6

    move-object v2, v3

    .end local v3    # "fos":Ljava/io/OutputStream;
    .restart local v2    # "fos":Ljava/io/OutputStream;
    move-object v0, v1

    .end local v1    # "fis":Ljava/io/InputStream;
    .restart local v0    # "fis":Ljava/io/InputStream;
    goto :goto_0
.end method

.method public warning(Ljavax/xml/transform/TransformerException;)V
    .locals 1
    .param p1, "e"    # Ljavax/xml/transform/TransformerException;

    .prologue
    .line 539
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->suppressWarnings:Z

    if-nez v0, :cond_0

    .line 540
    const-string/jumbo v0, "Warning"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;->logError(Ljavax/xml/transform/TransformerException;Ljava/lang/String;)V

    .line 542
    :cond_0
    return-void
.end method
