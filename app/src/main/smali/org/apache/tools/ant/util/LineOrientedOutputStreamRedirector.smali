.class public Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;
.super Lorg/apache/tools/ant/util/LineOrientedOutputStream;
.source "LineOrientedOutputStreamRedirector.java"


# static fields
.field private static final EOL:[B


# instance fields
.field private stream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->EOL:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    .line 44
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
    .line 56
    invoke-super {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->close()V

    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 58
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
    .line 61
    invoke-super {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->flush()V

    .line 62
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 63
    return-void
.end method

.method protected processLine(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 53
    return-void
.end method

.method protected processLine([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 48
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->stream:Ljava/io/OutputStream;

    sget-object v1, Lorg/apache/tools/ant/util/LineOrientedOutputStreamRedirector;->EOL:[B

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 49
    return-void
.end method
