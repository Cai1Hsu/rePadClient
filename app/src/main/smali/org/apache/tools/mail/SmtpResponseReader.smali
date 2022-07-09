.class public Lorg/apache/tools/mail/SmtpResponseReader;
.super Ljava/lang/Object;
.source "SmtpResponseReader.java"


# instance fields
.field protected reader:Ljava/io/BufferedReader;

.field private result:Ljava/lang/StringBuffer;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->reader:Ljava/io/BufferedReader;

    .line 38
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    .line 45
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->reader:Ljava/io/BufferedReader;

    .line 46
    return-void
.end method

.method private append(Ljava/lang/String;)V
    .locals 2
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x4

    .line 100
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 101
    iget-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    iget-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 105
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/mail/SmtpResponseReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 82
    return-void
.end method

.method public getResponse()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 57
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 58
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v3, :cond_0

    .line 61
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 66
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 67
    invoke-direct {p0, v0}, Lorg/apache/tools/mail/SmtpResponseReader;->append(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0, v0}, Lorg/apache/tools/mail/SmtpResponseReader;->hasMoreLines(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 73
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->result:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 71
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/mail/SmtpResponseReader;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected hasMoreLines(Ljava/lang/String;)Z
    .locals 2
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x3

    .line 91
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2d

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
