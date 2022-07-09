.class Lorg/apache/tools/mail/MailPrintStream;
.super Ljava/io/PrintStream;
.source "MailMessage.java"


# instance fields
.field private lastChar:I


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 491
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    .line 492
    return-void
.end method


# virtual methods
.method rawPrint(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 520
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 521
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 522
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    .line 521
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 524
    :cond_0
    return-void
.end method

.method rawWrite(I)V
    .locals 0
    .param p1, "b"    # I

    .prologue
    .line 516
    invoke-super {p0, p1}, Ljava/io/PrintStream;->write(I)V

    .line 517
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "b"    # I

    .prologue
    const/16 v3, 0x2e

    const/16 v2, 0xd

    const/16 v1, 0xa

    .line 497
    if-ne p1, v1, :cond_0

    iget v0, p0, Lorg/apache/tools/mail/MailPrintStream;->lastChar:I

    if-eq v0, v2, :cond_0

    .line 498
    invoke-virtual {p0, v2}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    .line 499
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    .line 506
    :goto_0
    iput p1, p0, Lorg/apache/tools/mail/MailPrintStream;->lastChar:I

    .line 507
    return-void

    .line 500
    :cond_0
    if-ne p1, v3, :cond_1

    iget v0, p0, Lorg/apache/tools/mail/MailPrintStream;->lastChar:I

    if-ne v0, v1, :cond_1

    .line 501
    invoke-virtual {p0, v3}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    .line 502
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    goto :goto_0

    .line 504
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/mail/MailPrintStream;->rawWrite(I)V

    goto :goto_0
.end method

.method public write([BII)V
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 510
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 511
    add-int v1, p2, v0

    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/mail/MailPrintStream;->write(I)V

    .line 510
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 513
    :cond_0
    return-void
.end method
