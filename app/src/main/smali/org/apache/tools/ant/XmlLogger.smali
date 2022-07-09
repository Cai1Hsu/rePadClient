.class public Lorg/apache/tools/ant/XmlLogger;
.super Ljava/lang/Object;
.source "XmlLogger.java"

# interfaces
.implements Lorg/apache/tools/ant/BuildLogger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/XmlLogger$1;,
        Lorg/apache/tools/ant/XmlLogger$TimedElement;
    }
.end annotation


# static fields
.field private static final BUILD_TAG:Ljava/lang/String; = "build"

.field private static final ERROR_ATTR:Ljava/lang/String; = "error"

.field private static final LOCATION_ATTR:Ljava/lang/String; = "location"

.field private static final MESSAGE_TAG:Ljava/lang/String; = "message"

.field private static final NAME_ATTR:Ljava/lang/String; = "name"

.field private static final PRIORITY_ATTR:Ljava/lang/String; = "priority"

.field private static final STACKTRACE_TAG:Ljava/lang/String; = "stacktrace"

.field private static final TARGET_TAG:Ljava/lang/String; = "target"

.field private static final TASK_TAG:Ljava/lang/String; = "task"

.field private static final TIME_ATTR:Ljava/lang/String; = "time"

.field private static builder:Ljavax/xml/parsers/DocumentBuilder;


# instance fields
.field private buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

.field private doc:Lorg/w3c/dom/Document;

.field private msgOutputLevel:I

.field private outStream:Ljava/io/PrintStream;

.field private targets:Ljava/util/Hashtable;

.field private tasks:Ljava/util/Hashtable;

.field private threadStacks:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    invoke-static {}, Lorg/apache/tools/ant/XmlLogger;->getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/XmlLogger;->builder:Ljavax/xml/parsers/DocumentBuilder;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x4

    iput v0, p0, Lorg/apache/tools/ant/XmlLogger;->msgOutputLevel:I

    .line 106
    sget-object v0, Lorg/apache/tools/ant/XmlLogger;->builder:Ljavax/xml/parsers/DocumentBuilder;

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    .line 109
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    .line 112
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    .line 118
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->threadStacks:Ljava/util/Hashtable;

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 143
    return-void
.end method

.method private static getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    .locals 2

    .prologue
    .line 69
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "exc":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v1, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getStack()Ljava/util/Stack;
    .locals 3

    .prologue
    .line 214
    iget-object v1, p0, Lorg/apache/tools/ant/XmlLogger;->threadStacks:Ljava/util/Hashtable;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    .line 215
    .local v0, "threadStack":Ljava/util/Stack;
    if-nez v0, :cond_0

    .line 216
    new-instance v0, Ljava/util/Stack;

    .end local v0    # "threadStack":Ljava/util/Stack;
    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 217
    .restart local v0    # "threadStack":Ljava/util/Stack;
    iget-object v1, p0, Lorg/apache/tools/ant/XmlLogger;->threadStacks:Ljava/util/Hashtable;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_0
    return-object v0
.end method

.method private getTaskElement(Lorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .locals 4
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 347
    iget-object v3, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 348
    .local v1, "element":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-eqz v1, :cond_0

    .line 359
    .end local v1    # "element":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    :goto_0
    return-object v1

    .line 351
    .restart local v1    # "element":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 352
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/Task;

    .line 353
    .local v2, "key":Lorg/apache/tools/ant/Task;
    instance-of v3, v2, Lorg/apache/tools/ant/UnknownElement;

    if-eqz v3, :cond_1

    move-object v3, v2

    .line 354
    check-cast v3, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v3}, Lorg/apache/tools/ant/UnknownElement;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    if-ne v3, p1, :cond_1

    .line 355
    iget-object v3, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v3, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    move-object v1, v3

    goto :goto_0

    .line 359
    .end local v2    # "key":Lorg/apache/tools/ant/Task;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V
    .locals 1
    .param p1, "parent"    # Lorg/w3c/dom/Node;
    .param p2, "child"    # Lorg/w3c/dom/Node;

    .prologue
    .line 465
    monitor-enter p1

    .line 466
    :try_start_0
    invoke-interface {p1, p2}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 467
    monitor-exit p1

    .line 468
    return-void

    .line 467
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 18
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 165
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v13}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$100(Lorg/apache/tools/ant/XmlLogger$TimedElement;)J

    move-result-wide v16

    sub-long v10, v14, v16

    .line 166
    .local v10, "totalTime":J
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v13}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v13

    const-string/jumbo v14, "time"

    invoke-static {v10, v11}, Lorg/apache/tools/ant/DefaultLogger;->formatTime(J)Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v13

    if-eqz v13, :cond_0

    .line 169
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v13}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v13

    const-string/jumbo v14, "error"

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v9

    .line 173
    .local v9, "t":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    invoke-static {v9}, Lorg/apache/tools/ant/util/StringUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14}, Lorg/w3c/dom/Document;->createCDATASection(Ljava/lang/String;)Lorg/w3c/dom/CDATASection;

    move-result-object v2

    .line 174
    .local v2, "errText":Lorg/w3c/dom/Text;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v14, "stacktrace"

    invoke-interface {v13, v14}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 175
    .local v7, "stacktrace":Lorg/w3c/dom/Element;
    invoke-interface {v7, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 176
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v13}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v7}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    .line 178
    .end local v2    # "errText":Lorg/w3c/dom/Text;
    .end local v7    # "stacktrace":Lorg/w3c/dom/Element;
    .end local v9    # "t":Ljava/lang/Throwable;
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    const-string/jumbo v14, "XmlLogger.file"

    invoke-virtual {v13, v14}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 179
    .local v6, "outFilename":Ljava/lang/String;
    if-nez v6, :cond_1

    .line 180
    const-string/jumbo v6, "log.xml"

    .line 182
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    const-string/jumbo v14, "ant.XmlLogger.stylesheet.uri"

    invoke-virtual {v13, v14}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 183
    .local v12, "xslUri":Ljava/lang/String;
    if-nez v12, :cond_2

    .line 184
    const-string/jumbo v12, "log.xsl"

    .line 186
    :cond_2
    const/4 v4, 0x0

    .line 190
    .local v4, "out":Ljava/io/Writer;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/tools/ant/XmlLogger;->outStream:Ljava/io/PrintStream;

    .line 191
    .local v8, "stream":Ljava/io/OutputStream;
    if-nez v8, :cond_3

    .line 192
    new-instance v8, Ljava/io/FileOutputStream;

    .end local v8    # "stream":Ljava/io/OutputStream;
    invoke-direct {v8, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 194
    .restart local v8    # "stream":Ljava/io/OutputStream;
    :cond_3
    new-instance v5, Ljava/io/OutputStreamWriter;

    const-string/jumbo v13, "UTF8"

    invoke-direct {v5, v8, v13}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    .end local v4    # "out":Ljava/io/Writer;
    .local v5, "out":Ljava/io/Writer;
    :try_start_1
    const-string/jumbo v13, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"

    invoke-virtual {v5, v13}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 196
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_4

    .line 197
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "<?xml-stylesheet type=\"text/xsl\" href=\""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "\"?>\n\n"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 199
    :cond_4
    new-instance v13, Lorg/apache/tools/ant/util/DOMElementWriter;

    invoke-direct {v13}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v14}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v14

    const/4 v15, 0x0

    const-string/jumbo v16, "\t"

    move-object/from16 v0, v16

    invoke-virtual {v13, v14, v5, v15, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 200
    invoke-virtual {v5}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 204
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 206
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-object v13, v0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 207
    return-void

    .line 201
    .end local v5    # "out":Ljava/io/Writer;
    .end local v8    # "stream":Ljava/io/OutputStream;
    .restart local v4    # "out":Ljava/io/Writer;
    :catch_0
    move-exception v3

    .line 202
    .local v3, "exc":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v13, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v14, "Unable to write log file"

    invoke-direct {v13, v14, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 204
    .end local v3    # "exc":Ljava/io/IOException;
    :catchall_0
    move-exception v13

    :goto_1
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v13

    .end local v4    # "out":Ljava/io/Writer;
    .restart local v5    # "out":Ljava/io/Writer;
    .restart local v8    # "stream":Ljava/io/OutputStream;
    :catchall_1
    move-exception v13

    move-object v4, v5

    .end local v5    # "out":Ljava/io/Writer;
    .restart local v4    # "out":Ljava/io/Writer;
    goto :goto_1

    .line 201
    .end local v4    # "out":Ljava/io/Writer;
    .restart local v5    # "out":Ljava/io/Writer;
    :catch_1
    move-exception v3

    move-object v4, v5

    .end local v5    # "out":Ljava/io/Writer;
    .restart local v4    # "out":Ljava/io/Writer;
    goto :goto_0
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 152
    new-instance v0, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/XmlLogger$TimedElement;-><init>(Lorg/apache/tools/ant/XmlLogger$1;)V

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 153
    iget-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$102(Lorg/apache/tools/ant/XmlLogger$TimedElement;J)J

    .line 154
    iget-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    iget-object v1, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v2, "build"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$202(Lorg/apache/tools/ant/XmlLogger$TimedElement;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    .line 155
    return-void
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 12
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 371
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v6

    .line 372
    .local v6, "priority":I
    iget v10, p0, Lorg/apache/tools/ant/XmlLogger;->msgOutputLevel:I

    if-le v6, v10, :cond_0

    .line 420
    :goto_0
    return-void

    .line 375
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v11, "message"

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 377
    .local v2, "messageElement":Lorg/w3c/dom/Element;
    const-string/jumbo v4, "debug"

    .line 378
    .local v4, "name":Ljava/lang/String;
    packed-switch v6, :pswitch_data_0

    .line 389
    const-string/jumbo v4, "debug"

    .line 392
    :goto_1
    const-string/jumbo v10, "priority"

    invoke-interface {v2, v10, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v1

    .line 395
    .local v1, "ex":Ljava/lang/Throwable;
    const/4 v10, 0x4

    iget v11, p0, Lorg/apache/tools/ant/XmlLogger;->msgOutputLevel:I

    if-gt v10, v11, :cond_1

    if-eqz v1, :cond_1

    .line 396
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    invoke-static {v1}, Lorg/apache/tools/ant/util/StringUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createCDATASection(Ljava/lang/String;)Lorg/w3c/dom/CDATASection;

    move-result-object v0

    .line 397
    .local v0, "errText":Lorg/w3c/dom/Text;
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v11, "stacktrace"

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 398
    .local v7, "stacktrace":Lorg/w3c/dom/Element;
    invoke-interface {v7, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 399
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v10}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v10

    invoke-direct {p0, v10, v7}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    .line 401
    .end local v0    # "errText":Lorg/w3c/dom/Text;
    .end local v7    # "stacktrace":Lorg/w3c/dom/Element;
    :cond_1
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createCDATASection(Ljava/lang/String;)Lorg/w3c/dom/CDATASection;

    move-result-object v3

    .line 402
    .local v3, "messageText":Lorg/w3c/dom/Text;
    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 404
    const/4 v5, 0x0

    .line 406
    .local v5, "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v9

    .line 408
    .local v9, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v8

    .line 409
    .local v8, "target":Lorg/apache/tools/ant/Target;
    if-eqz v9, :cond_2

    .line 410
    invoke-direct {p0, v9}, Lorg/apache/tools/ant/XmlLogger;->getTaskElement(Lorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/XmlLogger$TimedElement;

    move-result-object v5

    .line 412
    :cond_2
    if-nez v5, :cond_3

    if-eqz v8, :cond_3

    .line 413
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    invoke-virtual {v10, v8}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    check-cast v5, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 415
    .restart local v5    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    :cond_3
    if-eqz v5, :cond_4

    .line 416
    invoke-static {v5}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v10

    invoke-direct {p0, v10, v2}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    goto :goto_0

    .line 380
    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v3    # "messageText":Lorg/w3c/dom/Text;
    .end local v5    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .end local v8    # "target":Lorg/apache/tools/ant/Target;
    .end local v9    # "task":Lorg/apache/tools/ant/Task;
    :pswitch_0
    const-string/jumbo v4, "error"

    .line 381
    goto :goto_1

    .line 383
    :pswitch_1
    const-string/jumbo v4, "warn"

    .line 384
    goto :goto_1

    .line 386
    :pswitch_2
    const-string/jumbo v4, "info"

    .line 387
    goto :goto_1

    .line 418
    .restart local v1    # "ex":Ljava/lang/Throwable;
    .restart local v3    # "messageText":Lorg/w3c/dom/Text;
    .restart local v5    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .restart local v8    # "target":Lorg/apache/tools/ant/Target;
    .restart local v9    # "task":Lorg/apache/tools/ant/Task;
    :cond_4
    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v10}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v10

    invoke-direct {p0, v10, v2}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    goto/16 :goto_0

    .line 378
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setEmacsMode(Z)V
    .locals 0
    .param p1, "emacsMode"    # Z

    .prologue
    .line 452
    return-void
.end method

.method public setErrorPrintStream(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 462
    return-void
.end method

.method public setMessageOutputLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 432
    iput p1, p0, Lorg/apache/tools/ant/XmlLogger;->msgOutputLevel:I

    .line 433
    return-void
.end method

.method public setOutputPrintStream(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "output"    # Ljava/io/PrintStream;

    .prologue
    .line 442
    new-instance v0, Ljava/io/PrintStream;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v0, p0, Lorg/apache/tools/ant/XmlLogger;->outStream:Ljava/io/PrintStream;

    .line 443
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 12
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 252
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    .line 253
    .local v2, "target":Lorg/apache/tools/ant/Target;
    iget-object v5, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    invoke-virtual {v5, v2}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 254
    .local v3, "targetElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-eqz v3, :cond_2

    .line 255
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$100(Lorg/apache/tools/ant/XmlLogger$TimedElement;)J

    move-result-wide v10

    sub-long v6, v8, v10

    .line 256
    .local v6, "totalTime":J
    invoke-static {v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v5

    const-string/jumbo v8, "time"

    invoke-static {v6, v7}, Lorg/apache/tools/ant/DefaultLogger;->formatTime(J)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    const/4 v0, 0x0

    .line 259
    .local v0, "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    invoke-direct {p0}, Lorg/apache/tools/ant/XmlLogger;->getStack()Ljava/util/Stack;

    move-result-object v4

    .line 260
    .local v4, "threadStack":Ljava/util/Stack;
    invoke-virtual {v4}, Ljava/util/Stack;->empty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 261
    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 262
    .local v1, "poppedStack":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-eq v1, v3, :cond_0

    .line 263
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Mismatch - popped element = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " finished target element = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 266
    :cond_0
    invoke-virtual {v4}, Ljava/util/Stack;->empty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 267
    invoke-virtual {v4}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    check-cast v0, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 270
    .end local v1    # "poppedStack":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .restart local v0    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    :cond_1
    if-nez v0, :cond_3

    .line 271
    iget-object v5, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v5}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-static {v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v8

    invoke-direct {p0, v5, v8}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    .line 277
    .end local v0    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .end local v4    # "threadStack":Ljava/util/Stack;
    .end local v6    # "totalTime":J
    :cond_2
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    invoke-virtual {v5, v2}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    return-void

    .line 273
    .restart local v0    # "parentElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .restart local v4    # "threadStack":Ljava/util/Stack;
    .restart local v6    # "totalTime":J
    :cond_3
    invoke-static {v0}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-static {v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v8

    invoke-direct {p0, v5, v8}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    goto :goto_0
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 5
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 235
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    .line 236
    .local v0, "target":Lorg/apache/tools/ant/Target;
    new-instance v1, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/XmlLogger$TimedElement;-><init>(Lorg/apache/tools/ant/XmlLogger$1;)V

    .line 237
    .local v1, "targetElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$102(Lorg/apache/tools/ant/XmlLogger$TimedElement;J)J

    .line 238
    iget-object v2, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v3, "target"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$202(Lorg/apache/tools/ant/XmlLogger$TimedElement;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    .line 239
    invoke-static {v1}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v2

    const-string/jumbo v3, "name"

    invoke-virtual {v0}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v2, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    invoke-virtual {v2, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    invoke-direct {p0}, Lorg/apache/tools/ant/XmlLogger;->getStack()Ljava/util/Stack;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 12
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 312
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    .line 313
    .local v3, "task":Lorg/apache/tools/ant/Task;
    iget-object v8, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v8, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 314
    .local v4, "taskElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-nez v4, :cond_0

    .line 315
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unknown task "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " not in "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 317
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-static {v4}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$100(Lorg/apache/tools/ant/XmlLogger$TimedElement;)J

    move-result-wide v10

    sub-long v6, v8, v10

    .line 318
    .local v6, "totalTime":J
    invoke-static {v4}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v8

    const-string/jumbo v9, "time"

    invoke-static {v6, v7}, Lorg/apache/tools/ant/DefaultLogger;->formatTime(J)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    invoke-virtual {v3}, Lorg/apache/tools/ant/Task;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v1

    .line 320
    .local v1, "target":Lorg/apache/tools/ant/Target;
    const/4 v2, 0x0

    .line 321
    .local v2, "targetElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-eqz v1, :cond_1

    .line 322
    iget-object v8, p0, Lorg/apache/tools/ant/XmlLogger;->targets:Ljava/util/Hashtable;

    invoke-virtual {v8, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "targetElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    check-cast v2, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 324
    .restart local v2    # "targetElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    :cond_1
    if-nez v2, :cond_2

    .line 325
    iget-object v8, p0, Lorg/apache/tools/ant/XmlLogger;->buildElement:Lorg/apache/tools/ant/XmlLogger$TimedElement;

    invoke-static {v8}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v8

    invoke-static {v4}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    .line 329
    :goto_0
    invoke-direct {p0}, Lorg/apache/tools/ant/XmlLogger;->getStack()Ljava/util/Stack;

    move-result-object v5

    .line 330
    .local v5, "threadStack":Ljava/util/Stack;
    invoke-virtual {v5}, Ljava/util/Stack;->empty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 331
    invoke-virtual {v5}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    .line 332
    .local v0, "poppedStack":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    if-eq v0, v4, :cond_3

    .line 333
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Mismatch - popped element = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " finished task element = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 327
    .end local v0    # "poppedStack":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    .end local v5    # "threadStack":Ljava/util/Stack;
    :cond_2
    invoke-static {v2}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v8

    invoke-static {v4}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lorg/apache/tools/ant/XmlLogger;->synchronizedAppend(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)V

    goto :goto_0

    .line 337
    .restart local v5    # "threadStack":Ljava/util/Stack;
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v8, v3}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 6
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 289
    new-instance v2, Lorg/apache/tools/ant/XmlLogger$TimedElement;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;-><init>(Lorg/apache/tools/ant/XmlLogger$1;)V

    .line 290
    .local v2, "taskElement":Lorg/apache/tools/ant/XmlLogger$TimedElement;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$102(Lorg/apache/tools/ant/XmlLogger$TimedElement;J)J

    .line 291
    iget-object v3, p0, Lorg/apache/tools/ant/XmlLogger;->doc:Lorg/w3c/dom/Document;

    const-string/jumbo v4, "task"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$202(Lorg/apache/tools/ant/XmlLogger$TimedElement;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    .line 293
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    .line 294
    .local v1, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 296
    const-string/jumbo v0, ""

    .line 298
    :cond_0
    invoke-static {v2}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v3

    const-string/jumbo v4, "name"

    invoke-interface {v3, v4, v0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    invoke-static {v2}, Lorg/apache/tools/ant/XmlLogger$TimedElement;->access$200(Lorg/apache/tools/ant/XmlLogger$TimedElement;)Lorg/w3c/dom/Element;

    move-result-object v3

    const-string/jumbo v4, "location"

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Location;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    iget-object v3, p0, Lorg/apache/tools/ant/XmlLogger;->tasks:Ljava/util/Hashtable;

    invoke-virtual {v3, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    invoke-direct {p0}, Lorg/apache/tools/ant/XmlLogger;->getStack()Ljava/util/Stack;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    return-void
.end method
