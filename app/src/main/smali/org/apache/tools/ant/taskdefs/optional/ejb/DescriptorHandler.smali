.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
.super Lorg/xml/sax/HandlerBase;
.source "DescriptorHandler.java"


# static fields
.field private static final BEAN_CLASS:Ljava/lang/String; = "ejb-class"

.field private static final DEFAULT_HASH_TABLE_SIZE:I = 0xa

.field private static final EJB_JAR:Ljava/lang/String; = "ejb-jar"

.field private static final EJB_LOCAL_REF:Ljava/lang/String; = "ejb-local-ref"

.field private static final EJB_NAME:Ljava/lang/String; = "ejb-name"

.field private static final EJB_REF:Ljava/lang/String; = "ejb-ref"

.field private static final ENTERPRISE_BEANS:Ljava/lang/String; = "enterprise-beans"

.field private static final ENTITY_BEAN:Ljava/lang/String; = "entity"

.field private static final HOME_INTERFACE:Ljava/lang/String; = "home"

.field private static final LOCAL_HOME_INTERFACE:Ljava/lang/String; = "local-home"

.field private static final LOCAL_INTERFACE:Ljava/lang/String; = "local"

.field private static final MESSAGE_BEAN:Ljava/lang/String; = "message-driven"

.field private static final PK_CLASS:Ljava/lang/String; = "prim-key-class"

.field private static final REMOTE_INTERFACE:Ljava/lang/String; = "remote"

.field private static final SESSION_BEAN:Ljava/lang/String; = "session"

.field private static final STATE_IN_BEANS:I = 0x3

.field private static final STATE_IN_EJBJAR:I = 0x2

.field private static final STATE_IN_ENTITY:I = 0x5

.field private static final STATE_IN_MESSAGE:I = 0x6

.field private static final STATE_IN_SESSION:I = 0x4

.field private static final STATE_LOOKING_EJBJAR:I = 0x1


# instance fields
.field protected currentElement:Ljava/lang/String;

.field protected currentText:Ljava/lang/String;

.field protected ejbFiles:Ljava/util/Hashtable;

.field protected ejbName:Ljava/lang/String;

.field private fileDTDs:Ljava/util/Hashtable;

.field private inEJBRef:Z

.field private owningTask:Lorg/apache/tools/ant/Task;

.field private parseState:I

.field private publicId:Ljava/lang/String;

.field private resourceDTDs:Ljava/util/Hashtable;

.field private srcDir:Ljava/io/File;

.field private urlDTDs:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Task;Ljava/io/File;)V
    .locals 2
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "srcDir"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 124
    invoke-direct {p0}, Lorg/xml/sax/HandlerBase;-><init>()V

    .line 53
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->publicId:Ljava/lang/String;

    .line 77
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    .line 85
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    .line 90
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    .line 97
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbFiles:Ljava/util/Hashtable;

    .line 102
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbName:Ljava/lang/String;

    .line 104
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->fileDTDs:Ljava/util/Hashtable;

    .line 106
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->resourceDTDs:Ljava/util/Hashtable;

    .line 108
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->inEJBRef:Z

    .line 110
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->urlDTDs:Ljava/util/Hashtable;

    .line 125
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    .line 126
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->srcDir:Ljava/io/File;

    .line 127
    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 340
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    .line 341
    return-void
.end method

.method public endElement(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x3

    .line 303
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->processElement()V

    .line 304
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    .line 305
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    .line 306
    const-string/jumbo v0, "ejb-ref"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "ejb-local-ref"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 307
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->inEJBRef:Z

    .line 319
    :cond_1
    :goto_0
    return-void

    .line 308
    :cond_2
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_3

    const-string/jumbo v0, "entity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 309
    iput v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 310
    :cond_3
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    const-string/jumbo v0, "session"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 311
    iput v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 312
    :cond_4
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_5

    const-string/jumbo v0, "message-driven"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 313
    iput v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 314
    :cond_5
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v2, :cond_6

    const-string/jumbo v0, "enterprise-beans"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 315
    iput v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 316
    :cond_6
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v3, :cond_1

    const-string/jumbo v0, "ejb-jar"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 317
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0
.end method

.method public getEjbName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbName:Ljava/lang/String;

    return-object v0
.end method

.method public getFiles()Ljava/util/Hashtable;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbFiles:Ljava/util/Hashtable;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbFiles:Ljava/util/Hashtable;

    goto :goto_0
.end method

.method public getPublicId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->publicId:Ljava/lang/String;

    return-object v0
.end method

.method protected processElement()V
    .locals 4

    .prologue
    .line 351
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->inEJBRef:Z

    if-nez v2, :cond_0

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_1

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_1

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    const/4 v3, 0x6

    if-eq v2, v3, :cond_1

    .line 388
    :cond_0
    :goto_0
    return-void

    .line 358
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "home"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "remote"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "local"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "local-home"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "ejb-class"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "prim-key-class"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 366
    :cond_2
    const/4 v0, 0x0

    .line 367
    .local v0, "classFile":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 371
    .local v1, "className":Ljava/lang/String;
    const-string/jumbo v2, "java."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "javax."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 375
    const/16 v2, 0x2e

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 376
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 377
    new-instance v0, Ljava/io/File;

    .end local v0    # "classFile":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->srcDir:Ljava/io/File;

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 378
    .restart local v0    # "classFile":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbFiles:Ljava/util/Hashtable;

    invoke-virtual {v2, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    .end local v0    # "classFile":Ljava/io/File;
    .end local v1    # "className":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    const-string/jumbo v3, "ejb-name"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 384
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbName:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 385
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbName:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public registerDTD(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "location"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x3

    .line 137
    if-nez p2, :cond_1

    .line 173
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, "fileDTD":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 144
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 147
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 148
    if-eqz p1, :cond_0

    .line 149
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->fileDTDs:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Mapped publicId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " to file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 156
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 157
    if-eqz p1, :cond_4

    .line 158
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->resourceDTDs:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Mapped publicId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " to resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 165
    :cond_4
    if-eqz p1, :cond_0

    .line 166
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 167
    .local v1, "urldtd":Ljava/net/URL;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->urlDTDs:Ljava/util/Hashtable;

    invoke-virtual {v2, p1, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 169
    .end local v1    # "urldtd":Ljava/net/URL;
    :catch_0
    move-exception v2

    goto/16 :goto_0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 8
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x3

    .line 187
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->publicId:Ljava/lang/String;

    .line 189
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->fileDTDs:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 190
    .local v0, "dtdFile":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 192
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Resolved "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " to local file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 194
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v5}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    :goto_0
    return-object v4

    .line 195
    :catch_0
    move-exception v4

    .line 200
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->resourceDTDs:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 201
    .local v1, "dtdResourceName":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 202
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 203
    .local v3, "is":Ljava/io/InputStream;
    if-eqz v3, :cond_1

    .line 204
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Resolved "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " to local resource "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 206
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 210
    .end local v3    # "is":Ljava/io/InputStream;
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->urlDTDs:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 211
    .local v2, "dtdUrl":Ljava/net/URL;
    if-eqz v2, :cond_2

    .line 213
    :try_start_1
    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    .line 214
    .restart local v3    # "is":Ljava/io/InputStream;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Resolved "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " to url "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 216
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 217
    .end local v3    # "is":Ljava/io/InputStream;
    :catch_1
    move-exception v4

    .line 222
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->owningTask:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not resolve ( publicId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ", systemId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") to a local entity"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 225
    const/4 v4, 0x0

    goto/16 :goto_0
.end method

.method public startDocument()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 258
    new-instance v0, Ljava/util/Hashtable;

    const/16 v1, 0xa

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Ljava/util/Hashtable;-><init>(IF)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->ejbFiles:Ljava/util/Hashtable;

    .line 259
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    .line 260
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->inEJBRef:Z

    .line 261
    return-void
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x3

    .line 274
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentElement:Ljava/lang/String;

    .line 275
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->currentText:Ljava/lang/String;

    .line 276
    const-string/jumbo v0, "ejb-ref"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "ejb-local-ref"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 277
    :cond_0
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->inEJBRef:Z

    .line 289
    :cond_1
    :goto_0
    return-void

    .line 278
    :cond_2
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v2, :cond_3

    const-string/jumbo v0, "ejb-jar"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 279
    iput v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 280
    :cond_3
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v3, :cond_4

    const-string/jumbo v0, "enterprise-beans"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 281
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 282
    :cond_4
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v1, :cond_5

    const-string/jumbo v0, "session"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 283
    const/4 v0, 0x4

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 284
    :cond_5
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v1, :cond_6

    const-string/jumbo v0, "entity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 285
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0

    .line 286
    :cond_6
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    if-ne v0, v1, :cond_1

    const-string/jumbo v0, "message-driven"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 287
    const/4 v0, 0x6

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->parseState:I

    goto :goto_0
.end method
