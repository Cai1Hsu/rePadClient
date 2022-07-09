.class public abstract Lorg/apache/tools/ant/taskdefs/email/Mailer;
.super Ljava/lang/Object;
.source "Mailer.java"


# instance fields
.field protected SSL:Z

.field protected bccList:Ljava/util/Vector;

.field protected ccList:Ljava/util/Vector;

.field protected files:Ljava/util/Vector;

.field protected from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

.field protected headers:Ljava/util/Vector;

.field protected host:Ljava/lang/String;

.field private ignoreInvalidRecipients:Z

.field protected includeFileNames:Z

.field protected message:Lorg/apache/tools/ant/taskdefs/email/Message;

.field protected password:Ljava/lang/String;

.field protected port:I

.field private portExplicitlySpecified:Z

.field protected replyToList:Ljava/util/Vector;

.field private starttls:Z

.field protected subject:Ljava/lang/String;

.field protected task:Lorg/apache/tools/ant/Task;

.field protected toList:Ljava/util/Vector;

.field protected user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->host:Ljava/lang/String;

    .line 33
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->port:I

    .line 34
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->user:Ljava/lang/String;

    .line 35
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->password:Ljava/lang/String;

    .line 37
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->SSL:Z

    .line 41
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->replyToList:Ljava/util/Vector;

    .line 42
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->toList:Ljava/util/Vector;

    .line 43
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->ccList:Ljava/util/Vector;

    .line 44
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->bccList:Ljava/util/Vector;

    .line 45
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->files:Ljava/util/Vector;

    .line 46
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->subject:Ljava/lang/String;

    .line 48
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->includeFileNames:Z

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->headers:Ljava/util/Vector;

    .line 51
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->ignoreInvalidRecipients:Z

    .line 52
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->starttls:Z

    .line 53
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->portExplicitlySpecified:Z

    return-void
.end method


# virtual methods
.method protected final getDate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 272
    invoke-static {}, Lorg/apache/tools/ant/util/DateUtils;->getDateForHeader()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isPortExplicitlySpecified()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->portExplicitlySpecified:Z

    return v0
.end method

.method protected isStartTLSEnabled()Z
    .locals 1

    .prologue
    .line 130
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->starttls:Z

    return v0
.end method

.method public abstract send()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public setBccList(Ljava/util/Vector;)V
    .locals 0
    .param p1, "list"    # Ljava/util/Vector;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->bccList:Ljava/util/Vector;

    .line 186
    return-void
.end method

.method public setCcList(Ljava/util/Vector;)V
    .locals 0
    .param p1, "list"    # Ljava/util/Vector;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->ccList:Ljava/util/Vector;

    .line 177
    return-void
.end method

.method public setEnableStartTLS(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 126
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->starttls:Z

    .line 127
    return-void
.end method

.method public setFiles(Ljava/util/Vector;)V
    .locals 0
    .param p1, "files"    # Ljava/util/Vector;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->files:Ljava/util/Vector;

    .line 195
    return-void
.end method

.method public setFrom(Lorg/apache/tools/ant/taskdefs/email/EmailAddress;)V
    .locals 0
    .param p1, "from"    # Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .prologue
    .line 148
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    .line 149
    return-void
.end method

.method public setHeaders(Ljava/util/Vector;)V
    .locals 0
    .param p1, "v"    # Ljava/util/Vector;

    .prologue
    .line 230
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->headers:Ljava/util/Vector;

    .line 231
    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->host:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setIgnoreInvalidRecipients(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 251
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->ignoreInvalidRecipients:Z

    .line 252
    return-void
.end method

.method public setIncludeFileNames(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 221
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->includeFileNames:Z

    .line 222
    return-void
.end method

.method public setMessage(Lorg/apache/tools/ant/taskdefs/email/Message;)V
    .locals 0
    .param p1, "m"    # Lorg/apache/tools/ant/taskdefs/email/Message;

    .prologue
    .line 139
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    .line 140
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->password:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 70
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->port:I

    .line 71
    return-void
.end method

.method public setPortExplicitlySpecified(Z)V
    .locals 0
    .param p1, "explicit"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->portExplicitlySpecified:Z

    .line 79
    return-void
.end method

.method public setReplyToList(Ljava/util/Vector;)V
    .locals 0
    .param p1, "list"    # Ljava/util/Vector;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->replyToList:Ljava/util/Vector;

    .line 159
    return-void
.end method

.method public setSSL(Z)V
    .locals 0
    .param p1, "ssl"    # Z

    .prologue
    .line 116
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->SSL:Z

    .line 117
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 203
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->subject:Ljava/lang/String;

    .line 204
    return-void
.end method

.method public setTask(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->task:Lorg/apache/tools/ant/Task;

    .line 213
    return-void
.end method

.method public setToList(Ljava/util/Vector;)V
    .locals 0
    .param p1, "list"    # Ljava/util/Vector;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->toList:Ljava/util/Vector;

    .line 168
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->user:Ljava/lang/String;

    .line 97
    return-void
.end method

.method protected shouldIgnoreInvalidRecipients()Z
    .locals 1

    .prologue
    .line 260
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Mailer;->ignoreInvalidRecipients:Z

    return v0
.end method
