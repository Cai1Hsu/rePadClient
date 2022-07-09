.class public Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;
.super Ljava/lang/Object;
.source "XMLValidateTask.java"

# interfaces
.implements Lorg/xml/sax/ErrorHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ValidatorErrorHandler"
.end annotation


# instance fields
.field protected currentFile:Ljava/io/File;

.field protected failed:Z

.field protected lastErrorMessage:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;


# direct methods
.method protected constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;

    .prologue
    const/4 v0, 0x0

    .line 591
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 594
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->currentFile:Ljava/io/File;

    .line 595
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->lastErrorMessage:Ljava/lang/String;

    .line 596
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->failed:Z

    return-void
.end method

.method private doLog(Lorg/xml/sax/SAXParseException;I)V
    .locals 2
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;
    .param p2, "logLevel"    # I

    .prologue
    .line 644
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->getMessage(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->log(Ljava/lang/String;I)V

    .line 645
    return-void
.end method

.method private getMessage(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;
    .locals 8
    .param p1, "e"    # Lorg/xml/sax/SAXParseException;

    .prologue
    const/4 v7, -0x1

    .line 648
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getSystemId()Ljava/lang/String;

    move-result-object v3

    .line 649
    .local v3, "sysID":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 650
    move-object v2, v3

    .line 651
    .local v2, "name":Ljava/lang/String;
    const-string/jumbo v4, "file:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 653
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->access$000()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 658
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v1

    .line 659
    .local v1, "line":I
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v0

    .line 660
    .local v0, "col":I
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-ne v1, v7, :cond_1

    const-string/jumbo v4, ""

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 667
    .end local v0    # "col":I
    .end local v1    # "line":I
    .end local v2    # "name":Ljava/lang/String;
    :goto_2
    return-object v4

    .line 660
    .restart local v0    # "col":I
    .restart local v1    # "line":I
    .restart local v2    # "name":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    if-ne v0, v7, :cond_2

    const-string/jumbo v4, ""

    :goto_3
    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 667
    .end local v0    # "col":I
    .end local v1    # "line":I
    .end local v2    # "name":Ljava/lang/String;
    :cond_3
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 654
    .restart local v2    # "name":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method


# virtual methods
.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 1
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;

    .prologue
    .line 627
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->failed:Z

    .line 628
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->doLog(Lorg/xml/sax/SAXParseException;I)V

    .line 629
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 1
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;

    .prologue
    .line 619
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->failed:Z

    .line 620
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->doLog(Lorg/xml/sax/SAXParseException;I)V

    .line 621
    return-void
.end method

.method public getFailure()Z
    .locals 1

    .prologue
    .line 611
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->failed:Z

    return v0
.end method

.method public init(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 603
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->currentFile:Ljava/io/File;

    .line 604
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->failed:Z

    .line 605
    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 1
    .param p1, "exception"    # Lorg/xml/sax/SAXParseException;

    .prologue
    .line 637
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;->warn:Z

    if-eqz v0, :cond_0

    .line 638
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler;->doLog(Lorg/xml/sax/SAXParseException;I)V

    .line 640
    :cond_0
    return-void
.end method
