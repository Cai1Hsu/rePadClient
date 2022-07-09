.class public Lorg/apache/tools/mail/MailMessage;
.super Ljava/lang/Object;
.source "MailMessage.java"


# static fields
.field public static final DEFAULT_HOST:Ljava/lang/String; = "localhost"

.field public static final DEFAULT_PORT:I = 0x19

.field private static final OK_DATA:I = 0x162

.field private static final OK_DOT:I = 0xfa

.field private static final OK_FROM:I = 0xfa

.field private static final OK_HELO:I = 0xfa

.field private static final OK_QUIT:I = 0xdd

.field private static final OK_RCPT_1:I = 0xfa

.field private static final OK_RCPT_2:I = 0xfb

.field private static final OK_READY:I = 0xdc


# instance fields
.field private cc:Ljava/util/Vector;

.field private from:Ljava/lang/String;

.field private headersKeys:Ljava/util/Vector;

.field private headersValues:Ljava/util/Vector;

.field private host:Ljava/lang/String;

.field private in:Lorg/apache/tools/mail/SmtpResponseReader;

.field private out:Lorg/apache/tools/mail/MailPrintStream;

.field private port:I

.field private replyto:Ljava/util/Vector;

.field private socket:Ljava/net/Socket;

.field private to:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    const-string/jumbo v0, "localhost"

    const/16 v1, 0x19

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;-><init>(Ljava/lang/String;I)V

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    const/16 v0, 0x19

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/mail/MailMessage;-><init>(Ljava/lang/String;I)V

    .line 157
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const/16 v0, 0x19

    iput v0, p0, Lorg/apache/tools/mail/MailMessage;->port:I

    .line 168
    iput p2, p0, Lorg/apache/tools/mail/MailMessage;->port:I

    .line 169
    iput-object p1, p0, Lorg/apache/tools/mail/MailMessage;->host:Ljava/lang/String;

    .line 170
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->replyto:Ljava/util/Vector;

    .line 171
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->to:Ljava/util/Vector;

    .line 172
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->cc:Ljava/util/Vector;

    .line 173
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->headersKeys:Ljava/util/Vector;

    .line 174
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->headersValues:Ljava/util/Vector;

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->connect()V

    .line 176
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->sendHelo()V

    .line 177
    return-void
.end method

.method static sanitizeAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 359
    const/4 v4, 0x0

    .line 360
    .local v4, "paramDepth":I
    const/4 v5, 0x0

    .line 361
    .local v5, "start":I
    const/4 v1, 0x0

    .line 362
    .local v1, "end":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 364
    .local v3, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_4

    .line 365
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 366
    .local v0, "c":C
    const/16 v6, 0x28

    if-ne v0, v6, :cond_1

    .line 367
    add-int/lit8 v4, v4, 0x1

    .line 368
    if-nez v5, :cond_0

    .line 369
    move v1, v2

    .line 364
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 371
    :cond_1
    const/16 v6, 0x29

    if-ne v0, v6, :cond_2

    .line 372
    add-int/lit8 v4, v4, -0x1

    .line 373
    if-nez v1, :cond_0

    .line 374
    add-int/lit8 v5, v2, 0x1

    goto :goto_1

    .line 376
    :cond_2
    if-nez v4, :cond_3

    const/16 v6, 0x3c

    if-ne v0, v6, :cond_3

    .line 377
    add-int/lit8 v5, v2, 0x1

    goto :goto_1

    .line 378
    :cond_3
    if-nez v4, :cond_0

    const/16 v6, 0x3e

    if-ne v0, v6, :cond_0

    .line 379
    move v1, v2

    goto :goto_1

    .line 383
    .end local v0    # "c":C
    :cond_4
    if-nez v1, :cond_5

    .line 384
    move v1, v3

    .line 387
    :cond_5
    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method


# virtual methods
.method public bcc(Ljava/lang/String;)V
    .locals 0
    .param p1, "bcc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailMessage;->sendRcpt(Ljava/lang/String;)V

    .line 244
    return-void
.end method

.method public cc(Ljava/lang/String;)V
    .locals 1
    .param p1, "cc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailMessage;->sendRcpt(Ljava/lang/String;)V

    .line 231
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->cc:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 232
    return-void
.end method

.method connect()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    new-instance v0, Ljava/net/Socket;

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->host:Ljava/lang/String;

    iget v2, p0, Lorg/apache/tools/mail/MailMessage;->port:I

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->socket:Ljava/net/Socket;

    .line 394
    new-instance v0, Lorg/apache/tools/mail/MailPrintStream;

    new-instance v1, Ljava/io/BufferedOutputStream;

    iget-object v2, p0, Lorg/apache/tools/mail/MailMessage;->socket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v0, v1}, Lorg/apache/tools/mail/MailPrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    .line 397
    new-instance v0, Lorg/apache/tools/mail/SmtpResponseReader;

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/mail/SmtpResponseReader;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/tools/mail/MailMessage;->in:Lorg/apache/tools/mail/SmtpResponseReader;

    .line 398
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->getReady()V

    .line 399
    return-void
.end method

.method disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 462
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    if-eqz v0, :cond_0

    .line 463
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    invoke-virtual {v0}, Lorg/apache/tools/mail/MailPrintStream;->close()V

    .line 465
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->in:Lorg/apache/tools/mail/SmtpResponseReader;

    if-eqz v0, :cond_1

    .line 467
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->in:Lorg/apache/tools/mail/SmtpResponseReader;

    invoke-virtual {v0}, Lorg/apache/tools/mail/SmtpResponseReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 472
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_2

    .line 474
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 479
    :cond_2
    :goto_1
    return-void

    .line 475
    :catch_0
    move-exception v0

    goto :goto_1

    .line 468
    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method flushHeaders()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->headersKeys:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v2

    .line 332
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 333
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->headersKeys:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 334
    .local v1, "name":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->headersValues:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 335
    .local v3, "value":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/mail/MailPrintStream;->println(Ljava/lang/String;)V

    .line 332
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 337
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    invoke-virtual {v4}, Lorg/apache/tools/mail/MailPrintStream;->println()V

    .line 338
    iget-object v4, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    invoke-virtual {v4}, Lorg/apache/tools/mail/MailPrintStream;->flush()V

    .line 339
    return-void
.end method

.method public from(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailMessage;->sendFrom(Ljava/lang/String;)V

    .line 196
    iput-object p1, p0, Lorg/apache/tools/mail/MailMessage;->from:Ljava/lang/String;

    .line 197
    return-void
.end method

.method public getPrintStream()Ljava/io/PrintStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->setFromHeader()V

    .line 279
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->setReplyToHeader()V

    .line 280
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->setToHeader()V

    .line 281
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->setCcHeader()V

    .line 282
    const-string/jumbo v0, "X-Mailer"

    const-string/jumbo v1, "org.apache.tools.mail.MailMessage (ant.apache.org)"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->sendData()V

    .line 284
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->flushHeaders()V

    .line 285
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    return-object v0
.end method

.method getReady()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    iget-object v2, p0, Lorg/apache/tools/mail/MailMessage;->in:Lorg/apache/tools/mail/SmtpResponseReader;

    invoke-virtual {v2}, Lorg/apache/tools/mail/SmtpResponseReader;->getResponse()Ljava/lang/String;

    move-result-object v1

    .line 403
    .local v1, "response":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v0, v2, [I

    const/4 v2, 0x0

    const/16 v3, 0xdc

    aput v3, v0, v2

    .line 404
    .local v0, "ok":[I
    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/mail/MailMessage;->isResponseOK(Ljava/lang/String;[I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 405
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Didn\'t get introduction from server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 408
    :cond_0
    return-void
.end method

.method isResponseOK(Ljava/lang/String;[I)Z
    .locals 3
    .param p1, "response"    # Ljava/lang/String;
    .param p2, "ok"    # [I

    .prologue
    .line 453
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 454
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    aget v2, p2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 455
    const/4 v1, 0x1

    .line 458
    :goto_1
    return v1

    .line 453
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 458
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public replyto(Ljava/lang/String;)V
    .locals 1
    .param p1, "rto"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->replyto:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 208
    return-void
.end method

.method send(Ljava/lang/String;[I)V
    .locals 4
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ok"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->out:Lorg/apache/tools/mail/MailPrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/mail/MailPrintStream;->rawPrint(Ljava/lang/String;)V

    .line 444
    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->in:Lorg/apache/tools/mail/SmtpResponseReader;

    invoke-virtual {v1}, Lorg/apache/tools/mail/SmtpResponseReader;->getResponse()Ljava/lang/String;

    move-result-object v0

    .line 445
    .local v0, "response":Ljava/lang/String;
    invoke-virtual {p0, v0, p2}, Lorg/apache/tools/mail/MailMessage;->isResponseOK(Ljava/lang/String;[I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 446
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unexpected reply to command: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 449
    :cond_0
    return-void
.end method

.method public sendAndClose()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->sendDot()V

    .line 350
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->sendQuit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->disconnect()V

    .line 354
    return-void

    .line 352
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lorg/apache/tools/mail/MailMessage;->disconnect()V

    throw v0
.end method

.method sendData()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 424
    const/4 v1, 0x1

    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0x162

    aput v2, v0, v1

    .line 425
    .local v0, "ok":[I
    const-string/jumbo v1, "DATA"

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V

    .line 426
    return-void
.end method

.method sendDot()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    const/4 v1, 0x1

    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0xfa

    aput v2, v0, v1

    .line 430
    .local v0, "ok":[I
    const-string/jumbo v1, "\r\n."

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V

    .line 431
    return-void
.end method

.method sendFrom(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 415
    const/4 v1, 0x1

    new-array v0, v1, [I

    const/4 v1, 0x0

    const/16 v2, 0xfa

    aput v2, v0, v1

    .line 416
    .local v0, "ok":[I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "MAIL FROM: <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lorg/apache/tools/mail/MailMessage;->sanitizeAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V

    .line 417
    return-void
.end method

.method sendHelo()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v0

    .line 411
    .local v0, "local":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v1, v2, [I

    const/4 v2, 0x0

    const/16 v3, 0xfa

    aput v3, v1, v2

    .line 412
    .local v1, "ok":[I
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "HELO "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V

    .line 413
    return-void
.end method

.method sendQuit()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    const/4 v2, 0x1

    new-array v1, v2, [I

    const/4 v2, 0x0

    const/16 v3, 0xdd

    aput v3, v1, v2

    .line 436
    .local v1, "ok":[I
    :try_start_0
    const-string/jumbo v2, "QUIT"

    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 440
    return-void

    .line 437
    :catch_0
    move-exception v0

    .line 438
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/mail/ErrorInQuitException;

    invoke-direct {v2, v0}, Lorg/apache/tools/mail/ErrorInQuitException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method

.method sendRcpt(Ljava/lang/String;)V
    .locals 3
    .param p1, "rcpt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 419
    const/4 v1, 0x2

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 420
    .local v0, "ok":[I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "RCPT TO: <"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lorg/apache/tools/mail/MailMessage;->sanitizeAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/mail/MailMessage;->send(Ljava/lang/String;[I)V

    .line 421
    return-void

    .line 419
    nop

    :array_0
    .array-data 4
        0xfa
        0xfb
    .end array-data
.end method

.method setCcHeader()V
    .locals 2

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->cc:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 310
    const-string/jumbo v0, "Cc"

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->cc:Ljava/util/Vector;

    invoke-virtual {p0, v1}, Lorg/apache/tools/mail/MailMessage;->vectorToList(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    :cond_0
    return-void
.end method

.method setFromHeader()V
    .locals 2

    .prologue
    .line 292
    const-string/jumbo v0, "From"

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->from:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 263
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->headersKeys:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 264
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->headersValues:Ljava/util/Vector;

    invoke-virtual {v0, p2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 265
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 185
    iput p1, p0, Lorg/apache/tools/mail/MailMessage;->port:I

    .line 186
    return-void
.end method

.method setReplyToHeader()V
    .locals 2

    .prologue
    .line 297
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->replyto:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 298
    const-string/jumbo v0, "Reply-To"

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->replyto:Ljava/util/Vector;

    invoke-virtual {p0, v1}, Lorg/apache/tools/mail/MailMessage;->vectorToList(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    :cond_0
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 1
    .param p1, "subj"    # Ljava/lang/String;

    .prologue
    .line 252
    const-string/jumbo v0, "Subject"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method setToHeader()V
    .locals 2

    .prologue
    .line 303
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->to:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 304
    const-string/jumbo v0, "To"

    iget-object v1, p0, Lorg/apache/tools/mail/MailMessage;->to:Ljava/util/Vector;

    invoke-virtual {p0, v1}, Lorg/apache/tools/mail/MailMessage;->vectorToList(Ljava/util/Vector;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/mail/MailMessage;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    :cond_0
    return-void
.end method

.method public to(Ljava/lang/String;)V
    .locals 1
    .param p1, "to"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailMessage;->sendRcpt(Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Lorg/apache/tools/mail/MailMessage;->to:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 220
    return-void
.end method

.method vectorToList(Ljava/util/Vector;)Ljava/lang/String;
    .locals 3
    .param p1, "v"    # Ljava/util/Vector;

    .prologue
    .line 315
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 316
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 317
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 318
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 319
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 320
    const-string/jumbo v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 323
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
