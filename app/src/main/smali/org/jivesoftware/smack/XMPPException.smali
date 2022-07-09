.class public Lorg/jivesoftware/smack/XMPPException;
.super Ljava/lang/Exception;
.source "XMPPException.java"


# static fields
.field private static final serialVersionUID:J = 0x5f8089b3520ec431L


# instance fields
.field private error:Lorg/jivesoftware/smack/packet/XMPPError;

.field private smackError:Lorg/jivesoftware/smack/SmackError;

.field private streamError:Lorg/jivesoftware/smack/packet/StreamError;

.field private wrappedThrowable:Ljava/lang/Throwable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "wrappedThrowable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x0

    .line 119
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 120
    iput-object p2, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    const/4 v0, 0x0

    .line 145
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 146
    iput-object p2, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 147
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;
    .param p3, "wrappedThrowable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x0

    .line 132
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 133
    iput-object p2, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 134
    iput-object p3, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "wrappedThrowable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 85
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 86
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/SmackError;)V
    .locals 2
    .param p1, "code"    # Lorg/jivesoftware/smack/SmackError;

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-virtual {p1}, Lorg/jivesoftware/smack/SmackError;->getErrorMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 74
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 75
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/StreamError;)V
    .locals 1
    .param p1, "streamError"    # Lorg/jivesoftware/smack/packet/StreamError;

    .prologue
    const/4 v0, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 97
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 98
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/XMPPError;)V
    .locals 1
    .param p1, "error"    # Lorg/jivesoftware/smack/packet/XMPPError;

    .prologue
    const/4 v0, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 46
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    .line 47
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 48
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    .line 49
    iput-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    .line 108
    iput-object p1, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    .line 109
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 211
    invoke-super {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 214
    .local v0, "msg":Ljava/lang/String;
    if-nez v0, :cond_1

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    if-eqz v1, :cond_1

    .line 215
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/XMPPError;->toString()Ljava/lang/String;

    move-result-object v0

    .line 220
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .line 217
    .restart local v0    # "msg":Ljava/lang/String;
    :cond_1
    if-nez v0, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    if-eqz v1, :cond_0

    .line 218
    iget-object v1, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/StreamError;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSmackError()Lorg/jivesoftware/smack/SmackError;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->smackError:Lorg/jivesoftware/smack/SmackError;

    return-object v0
.end method

.method public getStreamError()Lorg/jivesoftware/smack/packet/StreamError;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    return-object v0
.end method

.method public getWrappedThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    return-object v0
.end method

.method public printStackTrace()V
    .locals 1

    .prologue
    .line 191
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 192
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 195
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 196
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 197
    const-string/jumbo v0, "Nested Exception: "

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 200
    :cond_0
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "out"    # Ljava/io/PrintWriter;

    .prologue
    .line 203
    invoke-super {p0, p1}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 204
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 205
    const-string/jumbo v0, "Nested Exception: "

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 208
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 225
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-super {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, "message":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 227
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    if-eqz v2, :cond_1

    .line 230
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPException;->error:Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 232
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    if-eqz v2, :cond_2

    .line 233
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPException;->streamError:Lorg/jivesoftware/smack/packet/StreamError;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 235
    :cond_2
    iget-object v2, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    if-eqz v2, :cond_3

    .line 236
    const-string/jumbo v2, "\n  -- caused by: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/XMPPException;->wrappedThrowable:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 239
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
