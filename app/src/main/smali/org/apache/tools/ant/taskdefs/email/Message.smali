.class public Lorg/apache/tools/ant/taskdefs/email/Message;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Message.java"


# instance fields
.field private buffer:Ljava/lang/StringBuffer;

.field private charset:Ljava/lang/String;

.field private messageSource:Ljava/io/File;

.field private mimeType:Ljava/lang/String;

.field private specified:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 36
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    .line 37
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->buffer:Ljava/lang/StringBuffer;

    .line 38
    const-string/jumbo v0, "text/plain"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->mimeType:Ljava/lang/String;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->specified:Z

    .line 40
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 36
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    .line 37
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->buffer:Ljava/lang/StringBuffer;

    .line 38
    const-string/jumbo v0, "text/plain"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->mimeType:Ljava/lang/String;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->specified:Z

    .line 40
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 36
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    .line 37
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->buffer:Ljava/lang/StringBuffer;

    .line 38
    const-string/jumbo v0, "text/plain"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->mimeType:Ljava/lang/String;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->specified:Z

    .line 40
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/email/Message;->addText(Ljava/lang/String;)V

    .line 54
    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->buffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    return-void
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public isMimeTypeSpecified()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->specified:Z

    return v0
.end method

.method public print(Ljava/io/PrintStream;)V
    .locals 7
    .param p1, "ps"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    const/4 v3, 0x0

    .line 120
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    if-eqz v4, :cond_0

    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    invoke-direct {v5, p1, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    move-object v3, v4

    .line 123
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    if-eqz v4, :cond_2

    .line 125
    new-instance v0, Ljava/io/FileReader;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 128
    .local v0, "freader":Ljava/io/FileReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 129
    .local v1, "in":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 130
    .local v2, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/Message;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 132
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 135
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v2    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v4

    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileReader;->close()V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 142
    .end local v0    # "freader":Ljava/io/FileReader;
    :catchall_1
    move-exception v4

    throw v4

    .line 120
    :cond_0
    :try_start_3
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    invoke-direct {v5, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    move-object v3, v4

    goto :goto_0

    .line 135
    .restart local v0    # "freader":Ljava/io/FileReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "line":Ljava/lang/String;
    :cond_1
    invoke-virtual {v0}, Ljava/io/FileReader;->close()V

    .line 141
    .end local v0    # "freader":Ljava/io/FileReader;
    .end local v1    # "in":Ljava/io/BufferedReader;
    .end local v2    # "line":Ljava/lang/String;
    :goto_2
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->flush()V

    .line 145
    return-void

    .line 138
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/email/Message;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->buffer:Ljava/lang/StringBuffer;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 139
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2
.end method

.method public setCharset(Ljava/lang/String;)V
    .locals 0
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 164
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->charset:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->mimeType:Ljava/lang/String;

    .line 94
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->specified:Z

    .line 95
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Message;->messageSource:Ljava/io/File;

    .line 84
    return-void
.end method
