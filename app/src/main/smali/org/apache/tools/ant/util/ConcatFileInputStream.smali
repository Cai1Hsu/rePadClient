.class public Lorg/apache/tools/ant/util/ConcatFileInputStream;
.super Ljava/io/InputStream;
.source "ConcatFileInputStream.java"


# static fields
.field private static final EOF:I = -0x1


# instance fields
.field private currentIndex:I

.field private currentStream:Ljava/io/InputStream;

.field private eof:Z

.field private file:[Ljava/io/File;

.field private managingPc:Lorg/apache/tools/ant/ProjectComponent;


# direct methods
.method public constructor <init>([Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 38
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentIndex:I

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->eof:Z

    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    .line 52
    return-void
.end method

.method private closeCurrent()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentStream:Ljava/io/InputStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentStream:Ljava/io/InputStream;

    .line 135
    return-void
.end method

.method private openFile(I)V
    .locals 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->closeCurrent()V

    .line 118
    iget-object v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    array-length v1, v1

    if-ge p1, v1, :cond_0

    .line 119
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Opening "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->log(Ljava/lang/String;I)V

    .line 121
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    aget-object v3, v3, p1

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentStream:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, "eyeOhEx":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Failed to open "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->file:[Ljava/io/File;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->log(Ljava/lang/String;I)V

    .line 125
    throw v0

    .line 128
    .end local v0    # "eyeOhEx":Ljava/io/IOException;
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->eof:Z

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
    .line 113
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->eof:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentStream:Ljava/io/InputStream;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentStream:Ljava/io/InputStream;

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
    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->closeCurrent()V

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->eof:Z

    .line 61
    return-void
.end method

.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "loglevel"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 110
    :goto_0
    return-void

    .line 104
    :cond_0
    const/4 v0, 0x1

    if-le p2, v0, :cond_1

    .line 105
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 107
    :cond_1
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->readCurrent()I

    move-result v0

    .line 70
    .local v0, "result":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->eof:Z

    if-nez v1, :cond_0

    .line 71
    iget v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->currentIndex:I

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->openFile(I)V

    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->readCurrent()I

    move-result v0

    .line 74
    :cond_0
    return v0
.end method

.method public setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 0
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 92
    iput-object p1, p0, Lorg/apache/tools/ant/util/ConcatFileInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    .line 93
    return-void
.end method

.method public setManagingTask(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 83
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/ConcatFileInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 84
    return-void
.end method
