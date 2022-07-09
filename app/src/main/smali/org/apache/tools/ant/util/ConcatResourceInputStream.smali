.class public Lorg/apache/tools/ant/util/ConcatResourceInputStream;
.super Ljava/io/InputStream;
.source "ConcatResourceInputStream.java"


# static fields
.field private static final EOF:I = -0x1


# instance fields
.field private currentStream:Ljava/io/InputStream;

.field private eof:Z

.field private ignoreErrors:Z

.field private iter:Ljava/util/Iterator;

.field private managingPc:Lorg/apache/tools/ant/ProjectComponent;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->eof:Z

    .line 43
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->ignoreErrors:Z

    .line 51
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->iter:Ljava/util/Iterator;

    .line 52
    return-void
.end method

.method private closeCurrent()V
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->currentStream:Ljava/io/InputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->currentStream:Ljava/io/InputStream;

    .line 146
    return-void
.end method

.method private nextResource()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->closeCurrent()V

    .line 124
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->iter:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 125
    iget-object v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->iter:Ljava/util/Iterator;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 126
    .local v1, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 129
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Concating "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->log(Ljava/lang/String;I)V

    .line 131
    :try_start_0
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->currentStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :goto_0
    return-void

    .line 133
    .restart local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :catch_0
    move-exception v0

    .line 134
    .local v0, "eyeOhEx":Ljava/io/IOException;
    iget-boolean v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->ignoreErrors:Z

    if-nez v2, :cond_0

    .line 135
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to get input stream for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->log(Ljava/lang/String;I)V

    .line 136
    throw v0

    .line 140
    .end local v0    # "eyeOhEx":Ljava/io/IOException;
    .end local v1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->eof:Z

    goto :goto_0
.end method

.method private readCurrent()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->eof:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->currentStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->currentStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    goto :goto_0
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
    .line 75
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->closeCurrent()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->eof:Z

    .line 77
    return-void
.end method

.method public isIgnoreErrors()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->ignoreErrors:Z

    return v0
.end method

.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "loglevel"    # I

    .prologue
    .line 111
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_0
    const/4 v0, 0x1

    if-le p2, v0, :cond_1

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    :goto_1
    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    goto :goto_1
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 85
    iget-boolean v2, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->eof:Z

    if-eqz v2, :cond_1

    move v0, v1

    .line 93
    :cond_0
    :goto_0
    return v0

    .line 88
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->readCurrent()I

    move-result v0

    .line 89
    .local v0, "result":I
    if-ne v0, v1, :cond_0

    .line 90
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->nextResource()V

    .line 91
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->readCurrent()I

    move-result v0

    goto :goto_0
.end method

.method public setIgnoreErrors(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->ignoreErrors:Z

    .line 60
    return-void
.end method

.method public setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 0
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/util/ConcatResourceInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    .line 103
    return-void
.end method
