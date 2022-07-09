.class public Lorg/apache/tools/ant/listener/MailLogger;
.super Lorg/apache/tools/ant/DefaultLogger;
.source "MailLogger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/listener/MailLogger$1;,
        Lorg/apache/tools/ant/listener/MailLogger$Values;
    }
.end annotation


# static fields
.field private static final DEFAULT_MIME_TYPE:Ljava/lang/String; = "text/plain"

.field static class$org$apache$tools$ant$listener$MailLogger:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;


# instance fields
.field private buffer:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 88
    invoke-direct {p0}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .line 90
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger;->buffer:Ljava/lang/StringBuffer;

    .line 172
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 367
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

.method private getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "properties"    # Ljava/util/Hashtable;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 303
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "MailLogger."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "propertyName":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 306
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 307
    move-object v1, p3

    .line 310
    :cond_0
    if-nez v1, :cond_1

    .line 311
    new-instance v2, Ljava/lang/Exception;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Missing required parameter: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2

    .line 314
    :cond_1
    return-object v1
.end method

.method private sendMail(Lorg/apache/tools/ant/listener/MailLogger$Values;Ljava/lang/String;)V
    .locals 6
    .param p1, "values"    # Lorg/apache/tools/ant/listener/MailLogger$Values;
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 325
    new-instance v0, Lorg/apache/tools/mail/MailMessage;

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mailhost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->port()I

    move-result v4

    invoke-direct {v0, v3, v4}, Lorg/apache/tools/mail/MailMessage;-><init>(Ljava/lang/String;I)V

    .line 327
    .local v0, "mailMessage":Lorg/apache/tools/mail/MailMessage;
    const-string/jumbo v3, "Date"

    invoke-static {}, Lorg/apache/tools/ant/util/DateUtils;->getDateForHeader()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 329
    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->from()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/mail/MailMessage;->from(Ljava/lang/String;)V

    .line 330
    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 331
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-direct {v2, v3, v4, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 333
    .local v2, "t":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 334
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/mail/MailMessage;->replyto(Ljava/lang/String;)V

    goto :goto_0

    .line 337
    .end local v2    # "t":Ljava/util/StringTokenizer;
    :cond_0
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->toList()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-direct {v2, v3, v4, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 338
    .restart local v2    # "t":Ljava/util/StringTokenizer;
    :goto_1
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 339
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/mail/MailMessage;->to(Ljava/lang/String;)V

    goto :goto_1

    .line 342
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->subject()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/mail/MailMessage;->setSubject(Ljava/lang/String;)V

    .line 344
    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 345
    const-string/jumbo v3, "Content-Type"

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "; charset=\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    :goto_2
    invoke-virtual {v0}, Lorg/apache/tools/mail/MailMessage;->getPrintStream()Ljava/io/PrintStream;

    move-result-object v1

    .line 352
    .local v1, "ps":Ljava/io/PrintStream;
    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->body()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->body()Ljava/lang/String;

    move-result-object p2

    .end local p2    # "message":Ljava/lang/String;
    :cond_2
    invoke-virtual {v1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v0}, Lorg/apache/tools/mail/MailMessage;->sendAndClose()V

    .line 355
    return-void

    .line 348
    .end local v1    # "ps":Ljava/io/PrintStream;
    .restart local p2    # "message":Ljava/lang/String;
    :cond_3
    const-string/jumbo v3, "Content-Type"

    invoke-virtual {p1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method private sendMimeMail(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/listener/MailLogger$Values;Ljava/lang/String;)V
    .locals 10
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "values"    # Lorg/apache/tools/ant/listener/MailLogger$Values;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 363
    const/4 v2, 0x0

    .line 365
    .local v2, "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :try_start_0
    const-string/jumbo v8, "org.apache.tools.ant.taskdefs.email.MimeMailer"

    sget-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$listener$MailLogger:Ljava/lang/Class;

    if-nez v7, :cond_2

    const-string/jumbo v7, "org.apache.tools.ant.listener.MailLogger"

    invoke-static {v7}, Lorg/apache/tools/ant/listener/MailLogger;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$listener$MailLogger:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    sget-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    if-nez v7, :cond_3

    const-string/jumbo v7, "org.apache.tools.ant.taskdefs.email.Mailer"

    invoke-static {v7}, Lorg/apache/tools/ant/listener/MailLogger;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    :goto_1
    invoke-static {v8, v9, v7}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lorg/apache/tools/ant/taskdefs/email/Mailer;

    move-object v2, v0
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 374
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/listener/MailLogger;->vectorizeEmailAddresses(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 375
    .local v4, "replyToList":Ljava/util/Vector;
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mailhost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setHost(Ljava/lang/String;)V

    .line 376
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->port()I

    move-result v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPort(I)V

    .line 377
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->user()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setUser(Ljava/lang/String;)V

    .line 378
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->password()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPassword(Ljava/lang/String;)V

    .line 379
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->ssl()Z

    move-result v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setSSL(Z)V

    .line 380
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->starttls()Z

    move-result v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setEnableStartTLS(Z)V

    .line 381
    new-instance v3, Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->body()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->body()Ljava/lang/String;

    move-result-object p3

    .end local p3    # "message":Ljava/lang/String;
    :cond_0
    invoke-direct {v3, p3}, Lorg/apache/tools/ant/taskdefs/email/Message;-><init>(Ljava/lang/String;)V

    .line 383
    .local v3, "mymessage":Lorg/apache/tools/ant/taskdefs/email/Message;
    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/taskdefs/email/Message;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 384
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/email/Message;->setMimeType(Ljava/lang/String;)V

    .line 385
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 386
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/email/Message;->setCharset(Ljava/lang/String;)V

    .line 388
    :cond_1
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setMessage(Lorg/apache/tools/ant/taskdefs/email/Message;)V

    .line 389
    new-instance v7, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->from()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setFrom(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V

    .line 390
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setReplyToList(Ljava/util/Vector;)V

    .line 391
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->toList()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/listener/MailLogger;->vectorizeEmailAddresses(Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v6

    .line 392
    .local v6, "toList":Ljava/util/Vector;
    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setToList(Ljava/util/Vector;)V

    .line 393
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setCcList(Ljava/util/Vector;)V

    .line 394
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setBccList(Ljava/util/Vector;)V

    .line 395
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setFiles(Ljava/util/Vector;)V

    .line 396
    invoke-virtual {p2}, Lorg/apache/tools/ant/listener/MailLogger$Values;->subject()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setSubject(Ljava/lang/String;)V

    .line 397
    new-instance v7, Ljava/util/Vector;

    invoke-direct {v7}, Ljava/util/Vector;-><init>()V

    invoke-virtual {v2, v7}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setHeaders(Ljava/util/Vector;)V

    .line 398
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->send()V

    .line 399
    .end local v3    # "mymessage":Lorg/apache/tools/ant/taskdefs/email/Message;
    .end local v4    # "replyToList":Ljava/util/Vector;
    .end local v6    # "toList":Ljava/util/Vector;
    :goto_2
    return-void

    .line 365
    .restart local p3    # "message":Ljava/lang/String;
    :cond_2
    :try_start_1
    sget-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$listener$MailLogger:Ljava/lang/Class;

    goto/16 :goto_0

    :cond_3
    sget-object v7, Lorg/apache/tools/ant/listener/MailLogger;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 368
    :catch_0
    move-exception v1

    .line 369
    .local v1, "e":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    if-nez v7, :cond_4

    move-object v5, v1

    .line 370
    .local v5, "t":Ljava/lang/Throwable;
    :goto_3
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to initialise MIME mail: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/listener/MailLogger;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 369
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_4
    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    goto :goto_3
.end method

.method private vectorizeEmailAddresses(Ljava/lang/String;)Ljava/util/Vector;
    .locals 4
    .param p1, "listString"    # Ljava/lang/String;

    .prologue
    .line 401
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 402
    .local v0, "emailList":Ljava/util/Vector;
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v2, ","

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    .local v1, "tokens":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 404
    new-instance v2, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 406
    :cond_0
    return-object v0
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 19
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 100
    invoke-super/range {p0 .. p1}, Lorg/apache/tools/ant/DefaultLogger;->buildFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 102
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    .line 103
    .local v11, "project":Lorg/apache/tools/ant/Project;
    invoke-virtual {v11}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v12

    .line 107
    .local v12, "properties":Ljava/util/Hashtable;
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 108
    .local v4, "fileProperties":Ljava/util/Properties;
    const-string/jumbo v16, "MailLogger.properties.file"

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 109
    .local v5, "filename":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 110
    const/4 v6, 0x0

    .line 112
    .local v6, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v5}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    .end local v6    # "is":Ljava/io/InputStream;
    .local v7, "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {v4, v7}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 117
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 121
    .end local v7    # "is":Ljava/io/InputStream;
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v16

    if-eqz v16, :cond_1

    .line 122
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 123
    .local v8, "key":Ljava/lang/String;
    invoke-virtual {v4, v8}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 124
    .local v14, "value":Ljava/lang/String;
    invoke-virtual {v11, v14}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v8, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 114
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v8    # "key":Ljava/lang/String;
    .end local v14    # "value":Ljava/lang/String;
    .restart local v6    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v16

    .line 117
    :goto_2
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    :catchall_0
    move-exception v16

    :goto_3
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v16

    .line 127
    .end local v6    # "is":Ljava/io/InputStream;
    .restart local v3    # "e":Ljava/util/Enumeration;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v16

    if-nez v16, :cond_2

    const/4 v13, 0x1

    .line 128
    .local v13, "success":Z
    :goto_4
    if-eqz v13, :cond_3

    const-string/jumbo v10, "success"

    .line 131
    .local v10, "prefix":Ljava/lang/String;
    :goto_5
    :try_start_2
    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v17, ".notify"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    const-string/jumbo v17, "on"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v9

    .line 134
    .local v9, "notify":Z
    if-nez v9, :cond_4

    .line 170
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v9    # "notify":Z
    :goto_6
    return-void

    .line 127
    .end local v10    # "prefix":Ljava/lang/String;
    .end local v13    # "success":Z
    .restart local v3    # "e":Ljava/util/Enumeration;
    :cond_2
    const/4 v13, 0x0

    goto :goto_4

    .line 128
    .restart local v13    # "success":Z
    :cond_3
    const-string/jumbo v10, "failure"

    goto :goto_5

    .line 137
    .restart local v9    # "notify":Z
    .restart local v10    # "prefix":Ljava/lang/String;
    :cond_4
    :try_start_3
    new-instance v16, Lorg/apache/tools/ant/listener/MailLogger$Values;

    const/16 v17, 0x0

    invoke-direct/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;-><init>(Lorg/apache/tools/ant/listener/MailLogger$1;)V

    const-string/jumbo v17, "mailhost"

    const-string/jumbo v18, "localhost"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mailhost(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "port"

    const/16 v18, 0x19

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->port(I)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "user"

    const-string/jumbo v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->user(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "password"

    const-string/jumbo v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->password(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "ssl"

    const-string/jumbo v18, "off"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->ssl(Z)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "starttls.enable"

    const-string/jumbo v18, "off"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->starttls(Z)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "from"

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->from(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "replyto"

    const-string/jumbo v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->replytoList(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, ".to"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->toList(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "mimeType"

    const-string/jumbo v18, "text/plain"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->mimeType(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    const-string/jumbo v17, "charset"

    const-string/jumbo v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->charset(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v16

    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string/jumbo v18, ".body"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Lorg/apache/tools/ant/listener/MailLogger$Values;->body(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v17

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string/jumbo v18, ".subject"

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    if-eqz v13, :cond_5

    const-string/jumbo v16, "Build Success"

    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-direct {v0, v12, v1, v2}, Lorg/apache/tools/ant/listener/MailLogger;->getValue(Ljava/util/Hashtable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/listener/MailLogger$Values;->subject(Ljava/lang/String;)Lorg/apache/tools/ant/listener/MailLogger$Values;

    move-result-object v15

    .line 158
    .local v15, "values":Lorg/apache/tools/ant/listener/MailLogger$Values;
    invoke-virtual {v15}, Lorg/apache/tools/ant/listener/MailLogger$Values;->user()Ljava/lang/String;

    move-result-object v16

    const-string/jumbo v17, ""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_6

    invoke-virtual {v15}, Lorg/apache/tools/ant/listener/MailLogger$Values;->password()Ljava/lang/String;

    move-result-object v16

    const-string/jumbo v17, ""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_6

    invoke-virtual {v15}, Lorg/apache/tools/ant/listener/MailLogger$Values;->ssl()Z

    move-result v16

    if-nez v16, :cond_6

    invoke-virtual {v15}, Lorg/apache/tools/ant/listener/MailLogger$Values;->starttls()Z

    move-result v16

    if-nez v16, :cond_6

    .line 161
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/listener/MailLogger;->buffer:Ljava/lang/StringBuffer;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/listener/MailLogger;->sendMail(Lorg/apache/tools/ant/listener/MailLogger$Values;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_6

    .line 166
    .end local v9    # "notify":Z
    .end local v15    # "values":Lorg/apache/tools/ant/listener/MailLogger$Values;
    :catch_1
    move-exception v3

    .line 167
    .local v3, "e":Ljava/lang/Exception;
    sget-object v16, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v17, "MailLogger failed to send e-mail!"

    invoke-virtual/range {v16 .. v17}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 168
    sget-object v16, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    goto/16 :goto_6

    .line 137
    .local v3, "e":Ljava/util/Enumeration;
    .restart local v9    # "notify":Z
    :cond_5
    :try_start_4
    const-string/jumbo v16, "Build Failure"

    goto :goto_7

    .line 163
    .restart local v15    # "values":Lorg/apache/tools/ant/listener/MailLogger$Values;
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/listener/MailLogger;->buffer:Ljava/lang/StringBuffer;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v15, v2}, Lorg/apache/tools/ant/listener/MailLogger;->sendMimeMail(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/listener/MailLogger$Values;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_6

    .line 117
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v9    # "notify":Z
    .end local v10    # "prefix":Ljava/lang/String;
    .end local v13    # "success":Z
    .end local v15    # "values":Lorg/apache/tools/ant/listener/MailLogger$Values;
    .restart local v7    # "is":Ljava/io/InputStream;
    :catchall_1
    move-exception v16

    move-object v6, v7

    .end local v7    # "is":Ljava/io/InputStream;
    .restart local v6    # "is":Ljava/io/InputStream;
    goto/16 :goto_3

    .line 114
    .end local v6    # "is":Ljava/io/InputStream;
    .restart local v7    # "is":Ljava/io/InputStream;
    :catch_2
    move-exception v16

    move-object v6, v7

    .end local v7    # "is":Ljava/io/InputStream;
    .restart local v6    # "is":Ljava/io/InputStream;
    goto/16 :goto_2
.end method

.method protected log(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 285
    iget-object v0, p0, Lorg/apache/tools/ant/listener/MailLogger;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 286
    return-void
.end method
