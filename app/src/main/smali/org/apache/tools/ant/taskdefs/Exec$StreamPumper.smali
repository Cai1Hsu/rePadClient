.class Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
.super Ljava/lang/Thread;
.source "Exec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Exec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StreamPumper"
.end annotation


# static fields
.field private static final SLEEP_TIME:I = 0x5


# instance fields
.field private din:Ljava/io/BufferedReader;

.field private endOfStream:Z

.field private messageLevel:I

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Exec;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Exec;Ljava/io/InputStream;I)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Exec;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "messageLevel"    # I

    .prologue
    .line 248
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->this$0:Lorg/apache/tools/ant/taskdefs/Exec;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 245
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->endOfStream:Z

    .line 249
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->din:Ljava/io/BufferedReader;

    .line 250
    iput p3, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->messageLevel:I

    .line 251
    return-void
.end method


# virtual methods
.method public pumpStream()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 254
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->endOfStream:Z

    if-nez v1, :cond_0

    .line 255
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->din:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 258
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->this$0:Lorg/apache/tools/ant/taskdefs/Exec;

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->messageLevel:I

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/taskdefs/Exec;->outputLog(Ljava/lang/String;I)V

    .line 263
    .end local v0    # "line":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 260
    .restart local v0    # "line":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->endOfStream:Z

    goto :goto_0
.end method

.method public run()V
    .locals 2

    .prologue
    .line 268
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->endOfStream:Z

    if-nez v0, :cond_0

    .line 269
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->pumpStream()V

    .line 270
    const-wide/16 v0, 0x5

    invoke-static {v0, v1}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 272
    :catch_0
    move-exception v0

    .line 275
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->din:Ljava/io/BufferedReader;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 279
    :goto_1
    return-void

    .line 276
    :catch_1
    move-exception v0

    goto :goto_1
.end method
