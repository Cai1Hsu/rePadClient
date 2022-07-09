.class Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;
.super Lorg/apache/tools/ant/taskdefs/Length$Handler;
.source "Length.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Length;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AccumHandler"
.end annotation


# instance fields
.field private accum:J

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Length;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Length;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Length;

    .prologue
    .line 308
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    .line 309
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Length$Handler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    .line 306
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->accum:J

    .line 310
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Length;
    .param p2, "ps"    # Ljava/io/PrintStream;

    .prologue
    .line 311
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    .line 312
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Length$Handler;-><init>(Lorg/apache/tools/ant/taskdefs/Length;Ljava/io/PrintStream;)V

    .line 306
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->accum:J

    .line 313
    return-void
.end method


# virtual methods
.method protected getAccum()J
    .locals 2

    .prologue
    .line 315
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->accum:J

    return-wide v0
.end method

.method protected declared-synchronized handle(Lorg/apache/tools/ant/types/Resource;)V
    .locals 5
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 318
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v0

    .line 319
    .local v0, "size":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 320
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->this$0:Lorg/apache/tools/ant/taskdefs/Length;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Size unknown for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/taskdefs/Length;->log(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 324
    :goto_0
    monitor-exit p0

    return-void

    .line 322
    :cond_0
    :try_start_1
    iget-wide v2, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->accum:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/Length$AccumHandler;->accum:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 318
    .end local v0    # "size":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
