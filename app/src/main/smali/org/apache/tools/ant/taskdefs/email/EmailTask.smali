.class public Lorg/apache/tools/ant/taskdefs/email/EmailTask;
.super Lorg/apache/tools/ant/Task;
.source "EmailTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/email/EmailTask$Encoding;
    }
.end annotation


# static fields
.field public static final AUTO:Ljava/lang/String; = "auto"

.field public static final MIME:Ljava/lang/String; = "mime"

.field public static final PLAIN:Ljava/lang/String; = "plain"

.field private static final SMTP_PORT:I = 0x19

.field public static final UU:Ljava/lang/String; = "uu"

.field static class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private attachments:Lorg/apache/tools/ant/types/Path;

.field private bccList:Ljava/util/Vector;

.field private ccList:Ljava/util/Vector;

.field private charset:Ljava/lang/String;

.field private encoding:Ljava/lang/String;

.field private failOnError:Z

.field private from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

.field private headers:Ljava/util/Vector;

.field private host:Ljava/lang/String;

.field private ignoreInvalidRecipients:Z

.field private includeFileNames:Z

.field private message:Lorg/apache/tools/ant/taskdefs/email/Message;

.field private messageMimeType:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private port:Ljava/lang/Integer;

.field private replyToList:Ljava/util/Vector;

.field private ssl:Z

.field private starttls:Z

.field private subject:Ljava/lang/String;

.field private toList:Ljava/util/Vector;

.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 69
    const-string/jumbo v0, "auto"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    .line 71
    const-string/jumbo v0, "localhost"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->host:Ljava/lang/String;

    .line 72
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->port:Ljava/lang/Integer;

    .line 74
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->subject:Ljava/lang/String;

    .line 76
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->failOnError:Z

    .line 79
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->includeFileNames:Z

    .line 80
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->messageMimeType:Ljava/lang/String;

    .line 83
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .line 85
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->replyToList:Ljava/util/Vector;

    .line 87
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    .line 89
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    .line 91
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    .line 94
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->headers:Ljava/util/Vector;

    .line 97
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    .line 99
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->charset:Ljava/lang/String;

    .line 101
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->user:Ljava/lang/String;

    .line 103
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->password:Ljava/lang/String;

    .line 105
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ssl:Z

    .line 107
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->starttls:Z

    .line 110
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ignoreInvalidRecipients:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 456
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

.method private logBuildException(Ljava/lang/String;Lorg/apache/tools/ant/BuildException;)V
    .locals 3
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "e"    # Lorg/apache/tools/ant/BuildException;

    .prologue
    .line 600
    invoke-virtual {p2}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_0

    move-object v0, p2

    .line 601
    .local v0, "t":Ljava/lang/Throwable;
    :goto_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 602
    return-void

    .line 600
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_0
    invoke-virtual {p2}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public addBcc(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 1
    .param p1, "address"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 332
    return-void
.end method

.method public addCc(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 1
    .param p1, "address"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 310
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 376
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->createAttachments()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 377
    return-void
.end method

.method public addFrom(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 2
    .param p1, "address"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 243
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    if-eqz v0, :cond_0

    .line 244
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Emails can only be from one address"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 246
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .line 247
    return-void
.end method

.method public addMessage(Lorg/apache/tools/ant/taskdefs/email/Message;)V
    .locals 2
    .param p1, "message"    # Lorg/apache/tools/ant/taskdefs/email/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 230
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    if-eqz v0, :cond_0

    .line 231
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one message can be sent in an email"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 234
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 235
    return-void
.end method

.method public addReplyTo(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 1
    .param p1, "address"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->replyToList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 269
    return-void
.end method

.method public addTo(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 1
    .param p1, "address"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 287
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 288
    return-void
.end method

.method public createAttachments()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 386
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 387
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    .line 389
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createHeader()Lorg/apache/tools/ant/taskdefs/email/Header;
    .locals 2

    .prologue
    .line 397
    new-instance v0, Lorg/apache/tools/ant/taskdefs/email/Header;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/email/Header;-><init>()V

    .line 398
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/email/Header;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->headers:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 399
    return-object v0
.end method

.method public execute()V
    .locals 14

    .prologue
    const/4 v13, 0x1

    .line 438
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 441
    .local v9, "savedMessage":Lorg/apache/tools/ant/taskdefs/email/Message;
    const/4 v6, 0x0

    .line 444
    .local v6, "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    const/4 v1, 0x0

    .line 446
    .local v1, "autoFound":Z
    :try_start_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "mime"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "auto"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v10

    if-eqz v10, :cond_1

    if-nez v1, :cond_1

    .line 451
    :cond_0
    :try_start_1
    const-string/jumbo v10, "javax.activation.DataHandler"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 452
    const-string/jumbo v10, "javax.mail.internet.MimeMessage"

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 454
    const-string/jumbo v11, "org.apache.tools.ant.taskdefs.email.MimeMailer"

    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    if-nez v10, :cond_4

    const-string/jumbo v10, "org.apache.tools.ant.taskdefs.email.EmailTask"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v12

    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    if-nez v10, :cond_5

    const-string/jumbo v10, "org.apache.tools.ant.taskdefs.email.Mailer"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    :goto_1
    invoke-static {v11, v12, v10}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/apache/tools/ant/taskdefs/email/Mailer;

    move-object v6, v0

    .line 457
    const/4 v1, 0x1

    .line 459
    const-string/jumbo v10, "Using MIME mail"

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 465
    :cond_1
    :goto_2
    if-nez v1, :cond_6

    :try_start_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->user:Ljava/lang/String;

    if-nez v10, :cond_2

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->password:Ljava/lang/String;

    if-eqz v10, :cond_6

    :cond_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "uu"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "plain"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 467
    :cond_3
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "SMTP auth only possible with MIME mail"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 584
    :catch_0
    move-exception v3

    .line 585
    .local v3, "e":Lorg/apache/tools/ant/BuildException;
    :goto_3
    :try_start_3
    const-string/jumbo v10, "Failed to send email: "

    invoke-direct {p0, v10, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->logBuildException(Ljava/lang/String;Lorg/apache/tools/ant/BuildException;)V

    .line 586
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->failOnError:Z

    if-eqz v10, :cond_1c

    .line 587
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 595
    .end local v3    # "e":Lorg/apache/tools/ant/BuildException;
    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :catchall_0
    move-exception v10

    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    throw v10

    .line 454
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :cond_4
    :try_start_4
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    goto :goto_0

    :cond_5
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;
    :try_end_4
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 460
    :catch_1
    move-exception v3

    .line 461
    .restart local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :try_start_5
    const-string/jumbo v10, "Failed to initialise MIME mail: "

    invoke-direct {p0, v10, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->logBuildException(Ljava/lang/String;Lorg/apache/tools/ant/BuildException;)V
    :try_end_5
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 589
    .end local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :catch_2
    move-exception v3

    .line 590
    .local v3, "e":Ljava/lang/Exception;
    :goto_4
    :try_start_6
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Failed to send email: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 591
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->failOnError:Z

    if-eqz v10, :cond_1d

    .line 592
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v10
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 470
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_6
    if-nez v1, :cond_9

    :try_start_7
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ssl:Z

    if-nez v10, :cond_7

    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->starttls:Z

    if-eqz v10, :cond_9

    :cond_7
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "uu"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_8

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "plain"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 472
    :cond_8
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "SSL and STARTTLS only possible with MIME mail"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 476
    :cond_9
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "uu"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "auto"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_7
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v10

    if-eqz v10, :cond_e

    if-nez v1, :cond_e

    .line 479
    :cond_a
    :try_start_8
    const-string/jumbo v11, "org.apache.tools.ant.taskdefs.email.UUMailer"

    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    if-nez v10, :cond_c

    const-string/jumbo v10, "org.apache.tools.ant.taskdefs.email.EmailTask"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    :goto_5
    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v12

    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    if-nez v10, :cond_d

    const-string/jumbo v10, "org.apache.tools.ant.taskdefs.email.Mailer"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;

    :goto_6
    invoke-static {v11, v12, v10}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/apache/tools/ant/taskdefs/email/Mailer;

    move-object v6, v0

    .line 482
    const/4 v1, 0x1

    .line 483
    const-string/jumbo v10, "Using UU mail"

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V
    :try_end_8
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-object v7, v6

    .line 489
    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .local v7, "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :goto_7
    :try_start_9
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "plain"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_b

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    const-string/jumbo v11, "auto"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1e

    if-nez v1, :cond_1e

    .line 491
    :cond_b
    new-instance v6, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;

    invoke-direct {v6}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;-><init>()V
    :try_end_9
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 492
    .end local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    const/4 v1, 0x1

    .line 493
    :try_start_a
    const-string/jumbo v10, "Using plain mail"

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 496
    :goto_8
    if-nez v6, :cond_f

    .line 497
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Failed to initialise encoding: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_a
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 479
    :cond_c
    :try_start_b
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$EmailTask:Ljava/lang/Class;

    goto :goto_5

    :cond_d
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$taskdefs$email$Mailer:Ljava/lang/Class;
    :try_end_b
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_b .. :try_end_b} :catch_3
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_6

    .line 484
    :catch_3
    move-exception v3

    .line 485
    .local v3, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_c
    const-string/jumbo v10, "Failed to initialise UU mail: "

    invoke-direct {p0, v10, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->logBuildException(Ljava/lang/String;Lorg/apache/tools/ant/BuildException;)V

    .end local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_e
    move-object v7, v6

    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    goto :goto_7

    .line 501
    .end local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :cond_f
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    if-nez v10, :cond_10

    .line 502
    new-instance v10, Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-direct {v10}, Lorg/apache/tools/ant/taskdefs/email/Message;-><init>()V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 503
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/email/Message;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 506
    :cond_10
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    if-eqz v10, :cond_11

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->getAddress()Ljava/lang/String;

    move-result-object v10

    if-nez v10, :cond_12

    .line 507
    :cond_11
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "A from element is required"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 510
    :cond_12
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_13

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_13

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_13

    .line 511
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "At least one of to, cc or bcc must be supplied"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 515
    :cond_13
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->messageMimeType:Ljava/lang/String;

    if-eqz v10, :cond_15

    .line 516
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/email/Message;->isMimeTypeSpecified()Z

    move-result v10

    if-eqz v10, :cond_14

    .line 517
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "The mime type can only be specified in one location"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 520
    :cond_14
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->messageMimeType:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/email/Message;->setMimeType(Ljava/lang/String;)V

    .line 523
    :cond_15
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->charset:Ljava/lang/String;

    if-eqz v10, :cond_17

    .line 524
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/email/Message;->getCharset()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_16

    .line 525
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "The charset can only be specified in one location"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 528
    :cond_16
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->charset:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/email/Message;->setCharset(Ljava/lang/String;)V

    .line 532
    :cond_17
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 533
    .local v4, "files":Ljava/util/Vector;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    if-eqz v10, :cond_19

    .line 534
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->attachments:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 536
    .local v5, "iter":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_19

    .line 537
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Resource;

    .line 538
    .local v8, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v10, :cond_18

    const-string/jumbo v10, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_a
    invoke-virtual {v8, v10}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface {v10}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_9

    :cond_18
    sget-object v10, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_a

    .line 543
    .end local v5    # "iter":Ljava/util/Iterator;
    .end local v8    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_19
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Sending email: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->subject:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 544
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "From "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 545
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "ReplyTo "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->replyToList:Ljava/util/Vector;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 546
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "To "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 547
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Cc "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 548
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Bcc "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V

    .line 551
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->host:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setHost(Ljava/lang/String;)V

    .line 552
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->port:Ljava/lang/Integer;

    if-eqz v10, :cond_1a

    .line 553
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->port:Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPort(I)V

    .line 554
    const/4 v10, 0x1

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPortExplicitlySpecified(Z)V

    .line 559
    :goto_b
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->user:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setUser(Ljava/lang/String;)V

    .line 560
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->password:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPassword(Ljava/lang/String;)V

    .line 561
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ssl:Z

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setSSL(Z)V

    .line 562
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->starttls:Z

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setEnableStartTLS(Z)V

    .line 563
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setMessage(Lorg/apache/tools/ant/taskdefs/email/Message;)V

    .line 564
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setFrom(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V

    .line 565
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->replyToList:Ljava/util/Vector;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setReplyToList(Ljava/util/Vector;)V

    .line 566
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setToList(Ljava/util/Vector;)V

    .line 567
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setCcList(Ljava/util/Vector;)V

    .line 568
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setBccList(Ljava/util/Vector;)V

    .line 569
    invoke-virtual {v6, v4}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setFiles(Ljava/util/Vector;)V

    .line 570
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->subject:Ljava/lang/String;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setSubject(Ljava/lang/String;)V

    .line 571
    invoke-virtual {v6, p0}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setTask(Lorg/apache/tools/ant/Task;)V

    .line 572
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->includeFileNames:Z

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setIncludeFileNames(Z)V

    .line 573
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->headers:Ljava/util/Vector;

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setHeaders(Ljava/util/Vector;)V

    .line 574
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ignoreInvalidRecipients:Z

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setIgnoreInvalidRecipients(Z)V

    .line 577
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->send()V

    .line 580
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v2

    .line 582
    .local v2, "count":I
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Sent email with "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " attachment"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    if-ne v2, v13, :cond_1b

    const-string/jumbo v10, ""

    :goto_c
    invoke-virtual {v11, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->log(Ljava/lang/String;I)V
    :try_end_c
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_c .. :try_end_c} :catch_0
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 595
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 597
    .end local v2    # "count":I
    .end local v4    # "files":Ljava/util/Vector;
    :goto_d
    return-void

    .line 556
    .restart local v4    # "files":Ljava/util/Vector;
    :cond_1a
    const/16 v10, 0x19

    :try_start_d
    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPort(I)V

    .line 557
    const/4 v10, 0x0

    invoke-virtual {v6, v10}, Lorg/apache/tools/ant/taskdefs/email/Mailer;->setPortExplicitlySpecified(Z)V

    goto/16 :goto_b

    .line 582
    .restart local v2    # "count":I
    :cond_1b
    const-string/jumbo v10, "s"
    :try_end_d
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_c

    .line 595
    .end local v2    # "count":I
    .end local v4    # "files":Ljava/util/Vector;
    .restart local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_1c
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    goto :goto_d

    .local v3, "e":Ljava/lang/Exception;
    :cond_1d
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    goto :goto_d

    .line 589
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :catch_4
    move-exception v3

    move-object v6, v7

    .end local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    goto/16 :goto_4

    .line 584
    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :catch_5
    move-exception v3

    move-object v6, v7

    .end local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    goto/16 :goto_3

    .end local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    :cond_1e
    move-object v6, v7

    .end local v7    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    .restart local v6    # "mailer":Lorg/apache/tools/ant/taskdefs/email/Mailer;
    goto/16 :goto_8
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 622
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludeFileNames()Z
    .locals 1

    .prologue
    .line 418
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->includeFileNames:Z

    return v0
.end method

.method public setBccList(Ljava/lang/String;)V
    .locals 4
    .param p1, "list"    # Ljava/lang/String;

    .prologue
    .line 340
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ","

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    .local v0, "tokens":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 343
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->bccList:Ljava/util/Vector;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 345
    :cond_0
    return-void
.end method

.method public setCcList(Ljava/lang/String;)V
    .locals 4
    .param p1, "list"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ","

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .local v0, "tokens":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 321
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ccList:Ljava/util/Vector;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 323
    :cond_0
    return-void
.end method

.method public setCharset(Ljava/lang/String;)V
    .locals 0
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 612
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->charset:Ljava/lang/String;

    .line 613
    return-void
.end method

.method public setEnableStartTLS(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 146
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->starttls:Z

    .line 147
    return-void
.end method

.method public setEncoding(Lorg/apache/tools/ant/taskdefs/email/EmailTask$Encoding;)V
    .locals 1
    .param p1, "encoding"    # Lorg/apache/tools/ant/taskdefs/email/EmailTask$Encoding;

    .prologue
    .line 155
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/email/EmailTask$Encoding;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->encoding:Ljava/lang/String;

    .line 156
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 353
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->failOnError:Z

    .line 354
    return-void
.end method

.method public setFiles(Ljava/lang/String;)V
    .locals 5
    .param p1, "filenames"    # Ljava/lang/String;

    .prologue
    .line 362
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ", "

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    .local v0, "t":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 365
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->createAttachments()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    new-instance v2, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_0

    .line 368
    :cond_0
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 255
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    if-eqz v0, :cond_0

    .line 256
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Emails can only be from one address"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .line 259
    return-void
.end method

.method public setIgnoreInvalidRecipients(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 431
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ignoreInvalidRecipients:Z

    .line 432
    return-void
.end method

.method public setIncludefilenames(Z)V
    .locals 0
    .param p1, "includeFileNames"    # Z

    .prologue
    .line 409
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->includeFileNames:Z

    .line 410
    return-void
.end method

.method public setMailhost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->host:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public setMailport(I)V
    .locals 1
    .param p1, "port"    # I

    .prologue
    .line 164
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->port:Ljava/lang/Integer;

    .line 165
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    if-eqz v0, :cond_0

    .line 192
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one message can be sent in an email"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/email/Message;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 196
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/email/Message;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 197
    return-void
.end method

.method public setMessageFile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 205
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    if-eqz v0, :cond_0

    .line 206
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one message can be sent in an email"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/email/Message;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/email/Message;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 211
    return-void
.end method

.method public setMessageMimeType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->messageMimeType:Ljava/lang/String;

    .line 221
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->password:Ljava/lang/String;

    .line 128
    return-void
.end method

.method public setReplyTo(Ljava/lang/String;)V
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 278
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->replyToList:Ljava/util/Vector;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 279
    return-void
.end method

.method public setSSL(Z)V
    .locals 0
    .param p1, "ssl"    # Z

    .prologue
    .line 136
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->ssl:Z

    .line 137
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 182
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->subject:Ljava/lang/String;

    .line 183
    return-void
.end method

.method public setToList(Ljava/lang/String;)V
    .locals 4
    .param p1, "list"    # Ljava/lang/String;

    .prologue
    .line 296
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ","

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    .local v0, "tokens":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 299
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->toList:Ljava/util/Vector;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 301
    :cond_0
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/EmailTask;->user:Ljava/lang/String;

    .line 119
    return-void
.end method
