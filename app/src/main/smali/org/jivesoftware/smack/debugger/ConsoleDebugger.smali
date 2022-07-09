.class public Lorg/jivesoftware/smack/debugger/ConsoleDebugger;
.super Ljava/lang/Object;
.source "ConsoleDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/debugger/SmackDebugger;


# static fields
.field public static printInterpreted:Z


# instance fields
.field private connListener:Lorg/jivesoftware/smack/ConnectionListener;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private dateFormatter:Ljava/text/SimpleDateFormat;

.field private listener:Lorg/jivesoftware/smack/PacketListener;

.field private reader:Ljava/io/Reader;

.field private readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

.field private writer:Ljava/io/Writer;

.field private writerListener:Lorg/jivesoftware/smack/util/WriterListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const/4 v0, 0x0

    sput-boolean v0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->printInterpreted:Z

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/io/Writer;Ljava/io/Reader;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "writer"    # Ljava/io/Writer;
    .param p3, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v2, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "hh:mm:ss aaa"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    .line 47
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 49
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 50
    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 58
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    .line 59
    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 60
    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 61
    invoke-direct {p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->createDebug()V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)Ljava/text/SimpleDateFormat;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/debugger/ConsoleDebugger;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->dateFormatter:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/debugger/ConsoleDebugger;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private createDebug()V
    .locals 3

    .prologue
    .line 69
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    invoke-direct {v0, v2}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 70
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$1;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$1;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    .line 78
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 81
    new-instance v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 82
    .local v1, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$2;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$2;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    .line 90
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 94
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 95
    iput-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 100
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$3;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$3;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    .line 112
    new-instance v2, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$4;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smack/debugger/ConsoleDebugger$4;-><init>(Lorg/jivesoftware/smack/debugger/ConsoleDebugger;)V

    iput-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    .line 149
    return-void
.end method


# virtual methods
.method public getReader()Ljava/io/Reader;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    return-object v0
.end method

.method public getReaderListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->listener:Lorg/jivesoftware/smack/PacketListener;

    return-object v0
.end method

.method public getWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    return-object v0
.end method

.method public getWriterListener()Lorg/jivesoftware/smack/PacketListener;
    .locals 1

    .prologue
    .line 196
    const/4 v0, 0x0

    return-object v0
.end method

.method public newConnectionReader(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 3
    .param p1, "newReader"    # Ljava/io/Reader;

    .prologue
    .line 152
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableReader;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableReader;->removeReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 153
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableReader;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableReader;-><init>(Ljava/io/Reader;)V

    .line 154
    .local v0, "debugReader":Lorg/jivesoftware/smack/util/ObservableReader;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->readerListener:Lorg/jivesoftware/smack/util/ReaderListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableReader;->addReaderListener(Lorg/jivesoftware/smack/util/ReaderListener;)V

    .line 155
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    .line 156
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->reader:Ljava/io/Reader;

    return-object v1
.end method

.method public newConnectionWriter(Ljava/io/Writer;)Ljava/io/Writer;
    .locals 3
    .param p1, "newWriter"    # Ljava/io/Writer;

    .prologue
    .line 160
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    check-cast v1, Lorg/jivesoftware/smack/util/ObservableWriter;

    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/util/ObservableWriter;->removeWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 161
    new-instance v0, Lorg/jivesoftware/smack/util/ObservableWriter;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smack/util/ObservableWriter;-><init>(Ljava/io/Writer;)V

    .line 162
    .local v0, "debugWriter":Lorg/jivesoftware/smack/util/ObservableWriter;
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writerListener:Lorg/jivesoftware/smack/util/WriterListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/ObservableWriter;->addWriterListener(Lorg/jivesoftware/smack/util/WriterListener;)V

    .line 163
    iput-object v0, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    .line 164
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->writer:Ljava/io/Writer;

    return-object v1
.end method

.method public userHasLogged(Ljava/lang/String;)V
    .locals 4
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 168
    const-string/jumbo v2, ""

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 169
    .local v0, "isAnonymous":Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "User logged ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v0, :cond_0

    const-string/jumbo v2, ""

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 176
    .local v1, "title":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 177
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 180
    iget-object v2, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v3, p0, Lorg/jivesoftware/smack/debugger/ConsoleDebugger;->connListener:Lorg/jivesoftware/smack/ConnectionListener;

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 181
    return-void

    .line 169
    .end local v1    # "title":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
