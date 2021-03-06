.class public Lorg/jivesoftware/smack/util/ObservableWriter;
.super Ljava/io/Writer;
.source "ObservableWriter.java"


# instance fields
.field listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/WriterListener;",
            ">;"
        }
    .end annotation
.end field

.field wrappedWriter:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 1
    .param p1, "wrappedWriter"    # Ljava/io/Writer;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    .line 38
    iput-object p1, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    .line 39
    return-void
.end method

.method private notifyListeners(Ljava/lang/String;)V
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 82
    const/4 v1, 0x0

    .line 83
    .local v1, "writerListeners":[Lorg/jivesoftware/smack/util/WriterListener;
    iget-object v3, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    monitor-enter v3

    .line 84
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/jivesoftware/smack/util/WriterListener;

    .line 85
    iget-object v2, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 86
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 88
    aget-object v2, v1, v0

    invoke-interface {v2, p1}, Lorg/jivesoftware/smack/util/WriterListener;->write(Ljava/lang/String;)V

    .line 87
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 86
    .end local v0    # "i":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 90
    .restart local v0    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V
    .locals 2
    .param p1, "writerListener"    # Lorg/jivesoftware/smack/util/WriterListener;

    .prologue
    .line 99
    if-nez p1, :cond_0

    .line 107
    :goto_0
    return-void

    .line 102
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 103
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 104
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 53
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 49
    return-void
.end method

.method public removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V
    .locals 2
    .param p1, "writerListener"    # Lorg/jivesoftware/smack/util/WriterListener;

    .prologue
    .line 115
    iget-object v1, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 116
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    monitor-exit v1

    .line 118
    return-void

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write(I)V
    .locals 1
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 57
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 67
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;->notifyListeners(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write(Ljava/lang/String;II)V

    .line 72
    add-int v0, p2, p3

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 73
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;->notifyListeners(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public write([C)V
    .locals 2
    .param p1, "cbuf"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v1, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->write([C)V

    .line 61
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([C)V

    .line 62
    .local v0, "str":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/util/ObservableWriter;->notifyListeners(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public write([CII)V
    .locals 2
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v1, p0, Lorg/jivesoftware/smack/util/ObservableWriter;->wrappedWriter:Ljava/io/Writer;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 43
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    .line 44
    .local v0, "str":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smack/util/ObservableWriter;->notifyListeners(Ljava/lang/String;)V

    .line 45
    return-void
.end method
