.class Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
.super Ljava/lang/Object;
.source "Replace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Replace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileOutput"
.end annotation


# instance fields
.field private inputBuffer:Ljava/lang/StringBuffer;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Replace;

.field private writer:Ljava/io/Writer;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Replace;Ljava/io/File;)V
    .locals 4
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Replace;
    .param p2, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 431
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 432
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$400(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 433
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    .line 438
    :goto_0
    return-void

    .line 435
    :cond_0
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$400(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    goto :goto_0
.end method


# virtual methods
.method close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 479
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 480
    return-void
.end method

.method closeQuietly()V
    .locals 1

    .prologue
    .line 486
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 487
    return-void
.end method

.method flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->process()Z

    .line 471
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 472
    return-void
.end method

.method process()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 460
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->writer:Ljava/io/Writer;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 461
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->inputBuffer:Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->inputBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 462
    return v2
.end method

.method setInputBuffer(Ljava/lang/StringBuffer;)V
    .locals 0
    .param p1, "input"    # Ljava/lang/StringBuffer;

    .prologue
    .line 449
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->inputBuffer:Ljava/lang/StringBuffer;

    .line 450
    return-void
.end method
