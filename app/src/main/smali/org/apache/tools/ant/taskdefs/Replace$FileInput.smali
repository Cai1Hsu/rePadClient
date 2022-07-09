.class Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
.super Ljava/lang/Object;
.source "Replace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Replace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FileInput"
.end annotation


# static fields
.field private static final BUFF_SIZE:I = 0x1000


# instance fields
.field private buffer:[C

.field private outputBuffer:Ljava/lang/StringBuffer;

.field private reader:Ljava/io/Reader;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Replace;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Replace;Ljava/io/File;)V
    .locals 4
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Replace;
    .param p2, "source"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 366
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->outputBuffer:Ljava/lang/StringBuffer;

    .line 367
    const/16 v0, 0x1000

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->buffer:[C

    .line 368
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$400(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 369
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->reader:Ljava/io/Reader;

    .line 374
    :goto_0
    return-void

    .line 371
    :cond_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Replace;->access$400(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->reader:Ljava/io/Reader;

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
    .line 405
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 406
    return-void
.end method

.method closeQuietly()V
    .locals 1

    .prologue
    .line 412
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->reader:Ljava/io/Reader;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 413
    return-void
.end method

.method getOutputBuffer()Ljava/lang/StringBuffer;
    .locals 1

    .prologue
    .line 382
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->outputBuffer:Ljava/lang/StringBuffer;

    return-object v0
.end method

.method readChunk()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 391
    const/4 v0, 0x0

    .line 392
    .local v0, "bufferLength":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->reader:Ljava/io/Reader;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->buffer:[C

    invoke-virtual {v2, v3}, Ljava/io/Reader;->read([C)I

    move-result v0

    .line 393
    if-gez v0, :cond_0

    .line 397
    :goto_0
    return v1

    .line 396
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->outputBuffer:Ljava/lang/StringBuffer;

    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->buffer:[C

    invoke-direct {v3, v4, v1, v0}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 397
    const/4 v1, 0x1

    goto :goto_0
.end method
