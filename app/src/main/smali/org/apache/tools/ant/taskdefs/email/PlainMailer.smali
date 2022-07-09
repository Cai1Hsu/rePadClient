.class Lorg/apache/tools/ant/taskdefs/email/PlainMailer;
.super Lorg/apache/tools/ant/taskdefs/email/Mailer;
.source "PlainMailer.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/email/Mailer;-><init>()V

    return-void
.end method

.method private badRecipient(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 3
    .param p1, "rcpt"    # Ljava/lang/String;
    .param p2, "reason"    # Ljava/io/IOException;

    .prologue
    .line 163
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Failed to send mail to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->shouldIgnoreInvalidRecipients()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 165
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " because of :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 166
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->task:Lorg/apache/tools/ant/Task;

    if-eqz v1, :cond_0

    .line 167
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->task:Lorg/apache/tools/ant/Task;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 174
    :goto_0
    return-void

    .line 169
    :cond_0
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 172
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0, p2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method protected attach(Ljava/io/File;Ljava/io/PrintStream;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "out"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v8

    if-nez v8, :cond_1

    .line 128
    :cond_0
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "File \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\" does not exist or is not "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "readable."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 133
    :cond_1
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->includeFileNames:Z

    if-eqz v8, :cond_3

    .line 134
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 136
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "filename":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 139
    .local v2, "filenamelength":I
    invoke-virtual {p2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 140
    const/4 v7, 0x0

    .local v7, "star":I
    :goto_0
    if-ge v7, v2, :cond_2

    .line 141
    const/16 v8, 0x3d

    invoke-virtual {p2, v8}, Ljava/io/PrintStream;->print(C)V

    .line 140
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 143
    :cond_2
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 147
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "filenamelength":I
    .end local v7    # "star":I
    :cond_3
    const/16 v6, 0x400

    .line 148
    .local v6, "maxBuf":I
    const/16 v8, 0x400

    new-array v0, v8, [B

    .line 149
    .local v0, "buf":[B
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 152
    .local v3, "finstr":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v4, Ljava/io/BufferedInputStream;

    array-length v8, v0

    invoke-direct {v4, v3, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 154
    .local v4, "in":Ljava/io/BufferedInputStream;
    :goto_1
    invoke-virtual {v4, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v5

    .local v5, "length":I
    const/4 v8, -0x1

    if-eq v5, v8, :cond_4

    .line 155
    const/4 v8, 0x0

    invoke-virtual {p2, v0, v8, v5}, Ljava/io/PrintStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 158
    .end local v4    # "in":Ljava/io/BufferedInputStream;
    .end local v5    # "length":I
    :catchall_0
    move-exception v8

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    throw v8

    .restart local v4    # "in":Ljava/io/BufferedInputStream;
    .restart local v5    # "length":I
    :cond_4
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 160
    return-void
.end method

.method public send()V
    .locals 11

    .prologue
    .line 43
    :try_start_0
    new-instance v5, Lorg/apache/tools/mail/MailMessage;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->host:Ljava/lang/String;

    iget v9, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->port:I

    invoke-direct {v5, v8, v9}, Lorg/apache/tools/mail/MailMessage;-><init>(Ljava/lang/String;I)V

    .line 45
    .local v5, "mailMessage":Lorg/apache/tools/mail/MailMessage;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->from:Lorg/apache/tools/ant/taskdefs/email/EmailAddress;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/email/EmailAddress;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/tools/mail/MailMessage;->from(Ljava/lang/String;)V

    .line 48
    const/4 v0, 0x0

    .line 50
    .local v0, "atLeastOneRcptReached":Z
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->replyToList:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 51
    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 52
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/apache/tools/mail/MailMessage;->replyto(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 112
    .end local v0    # "atLeastOneRcptReached":Z
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v5    # "mailMessage":Lorg/apache/tools/mail/MailMessage;
    :catch_0
    move-exception v4

    .line 113
    .local v4, "ioe":Ljava/io/IOException;
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "IO error sending mail"

    invoke-direct {v8, v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 54
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v0    # "atLeastOneRcptReached":Z
    .restart local v1    # "e":Ljava/util/Enumeration;
    .restart local v5    # "mailMessage":Lorg/apache/tools/mail/MailMessage;
    :cond_0
    :try_start_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->toList:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 55
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 56
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    .line 58
    .local v7, "to":Ljava/lang/String;
    :try_start_2
    invoke-virtual {v5, v7}, Lorg/apache/tools/mail/MailMessage;->to(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 59
    const/4 v0, 0x1

    goto :goto_1

    .line 60
    :catch_1
    move-exception v2

    .line 61
    .local v2, "ex":Ljava/io/IOException;
    :try_start_3
    invoke-direct {p0, v7, v2}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->badRecipient(Ljava/lang/String;Ljava/io/IOException;)V

    goto :goto_1

    .line 64
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v7    # "to":Ljava/lang/String;
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->ccList:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 65
    :goto_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 66
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v7

    .line 68
    .restart local v7    # "to":Ljava/lang/String;
    :try_start_4
    invoke-virtual {v5, v7}, Lorg/apache/tools/mail/MailMessage;->cc(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 69
    const/4 v0, 0x1

    goto :goto_2

    .line 70
    :catch_2
    move-exception v2

    .line 71
    .restart local v2    # "ex":Ljava/io/IOException;
    :try_start_5
    invoke-direct {p0, v7, v2}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->badRecipient(Ljava/lang/String;Ljava/io/IOException;)V

    goto :goto_2

    .line 74
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v7    # "to":Ljava/lang/String;
    :cond_2
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->bccList:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 75
    :goto_3
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 76
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v7

    .line 78
    .restart local v7    # "to":Ljava/lang/String;
    :try_start_6
    invoke-virtual {v5, v7}, Lorg/apache/tools/mail/MailMessage;->bcc(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 79
    const/4 v0, 0x1

    goto :goto_3

    .line 80
    :catch_3
    move-exception v2

    .line 81
    .restart local v2    # "ex":Ljava/io/IOException;
    :try_start_7
    invoke-direct {p0, v7, v2}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->badRecipient(Ljava/lang/String;Ljava/io/IOException;)V

    goto :goto_3

    .line 84
    .end local v2    # "ex":Ljava/io/IOException;
    .end local v7    # "to":Ljava/lang/String;
    :cond_3
    if-nez v0, :cond_4

    .line 85
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Couldn\'t reach any recipient"

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 87
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->subject:Ljava/lang/String;

    if-eqz v8, :cond_5

    .line 88
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->subject:Ljava/lang/String;

    invoke-virtual {v5, v8}, Lorg/apache/tools/mail/MailMessage;->setSubject(Ljava/lang/String;)V

    .line 90
    :cond_5
    const-string/jumbo v8, "Date"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->getDate()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/email/Message;->getCharset()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_6

    .line 92
    const-string/jumbo v8, "Content-Type"

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/email/Message;->getMimeType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "; charset=\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/email/Message;->getCharset()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    :goto_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->headers:Ljava/util/Vector;

    if-eqz v8, :cond_7

    .line 98
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->headers:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 99
    :goto_5
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 100
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/email/Header;

    .line 101
    .local v3, "h":Lorg/apache/tools/ant/taskdefs/email/Header;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/email/Header;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/email/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 95
    .end local v3    # "h":Lorg/apache/tools/ant/taskdefs/email/Header;
    :cond_6
    const-string/jumbo v8, "Content-Type"

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/email/Message;->getMimeType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 104
    :cond_7
    invoke-virtual {v5}, Lorg/apache/tools/mail/MailMessage;->getPrintStream()Ljava/io/PrintStream;

    move-result-object v6

    .line 105
    .local v6, "out":Ljava/io/PrintStream;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->message:Lorg/apache/tools/ant/taskdefs/email/Message;

    invoke-virtual {v8, v6}, Lorg/apache/tools/ant/taskdefs/email/Message;->print(Ljava/io/PrintStream;)V

    .line 107
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->files:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 108
    :goto_6
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 109
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/io/File;

    invoke-virtual {p0, v8, v6}, Lorg/apache/tools/ant/taskdefs/email/PlainMailer;->attach(Ljava/io/File;Ljava/io/PrintStream;)V

    goto :goto_6

    .line 111
    :cond_8
    invoke-virtual {v5}, Lorg/apache/tools/mail/MailMessage;->sendAndClose()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 116
    return-void
.end method
