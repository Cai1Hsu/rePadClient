.class public final Lorg/apache/tools/ant/util/TaskLogger;
.super Ljava/lang/Object;
.source "TaskLogger.java"


# instance fields
.field private task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    .line 38
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v0, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    const/4 v1, 0x4

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 78
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 54
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 45
    iget-object v0, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 46
    return-void
.end method

.method public verbose(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    const/4 v1, 0x3

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 70
    return-void
.end method

.method public warning(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/util/TaskLogger;->task:Lorg/apache/tools/ant/Task;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 62
    return-void
.end method
