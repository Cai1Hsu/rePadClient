.class public Lorg/apache/tools/ant/util/RetryHandler;
.super Ljava/lang/Object;
.source "RetryHandler.java"


# instance fields
.field private retriesAllowed:I

.field private task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>(ILorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "retriesAllowed"    # I
    .param p2, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/util/RetryHandler;->retriesAllowed:I

    .line 42
    iput p1, p0, Lorg/apache/tools/ant/util/RetryHandler;->retriesAllowed:I

    .line 43
    iput-object p2, p0, Lorg/apache/tools/ant/util/RetryHandler;->task:Lorg/apache/tools/ant/Task;

    .line 44
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/tools/ant/util/Retryable;Ljava/lang/String;)V
    .locals 6
    .param p1, "exe"    # Lorg/apache/tools/ant/util/Retryable;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 54
    const/4 v1, 0x0

    .line 57
    .local v1, "retries":I
    :goto_0
    :try_start_0
    invoke-interface {p1}, Lorg/apache/tools/ant/util/Retryable;->execute()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    .local v0, "e":Ljava/io/IOException;
    add-int/lit8 v1, v1, 0x1

    .line 61
    iget v2, p0, Lorg/apache/tools/ant/util/RetryHandler;->retriesAllowed:I

    if-le v1, v2, :cond_0

    iget v2, p0, Lorg/apache/tools/ant/util/RetryHandler;->retriesAllowed:I

    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    .line 62
    iget-object v2, p0, Lorg/apache/tools/ant/util/RetryHandler;->task:Lorg/apache/tools/ant/Task;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "try #"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ": IO error ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "), number of maximum retries reached ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/util/RetryHandler;->retriesAllowed:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "), giving up"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 65
    throw v0

    .line 67
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/RetryHandler;->task:Lorg/apache/tools/ant/Task;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "try #"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ": IO error ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "), retrying"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v5}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method
