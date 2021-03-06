.class public Lorg/apache/commons/net/smtp/SimpleSMTPHeader;
.super Ljava/lang/Object;
.source "SimpleSMTPHeader.java"


# instance fields
.field private __cc:Ljava/lang/StringBuffer;

.field private __from:Ljava/lang/String;

.field private __headerFields:Ljava/lang/StringBuffer;

.field private __subject:Ljava/lang/String;

.field private __to:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;
    .param p3, "subject"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p2, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__to:Ljava/lang/String;

    .line 68
    iput-object p1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__from:Ljava/lang/String;

    .line 69
    iput-object p3, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__subject:Ljava/lang/String;

    .line 70
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    .line 72
    return-void
.end method


# virtual methods
.method public addCC(Ljava/lang/String;)V
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    if-nez v0, :cond_0

    .line 103
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    .line 108
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method public addHeaderField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "headerField"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    iget-object v0, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 92
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0xa

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .local v0, "header":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 126
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__headerFields:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :cond_0
    const-string/jumbo v1, "From: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__from:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    const-string/jumbo v1, "\nTo: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__to:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    if-eqz v1, :cond_1

    .line 136
    const-string/jumbo v1, "\nCc: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__cc:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__subject:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 142
    const-string/jumbo v1, "\nSubject: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    iget-object v1, p0, Lorg/apache/commons/net/smtp/SimpleSMTPHeader;->__subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    :cond_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 147
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
