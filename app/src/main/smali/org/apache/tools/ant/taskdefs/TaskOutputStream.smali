.class public Lorg/apache/tools/ant/taskdefs/TaskOutputStream;
.super Ljava/io/OutputStream;
.source "TaskOutputStream.java"


# instance fields
.field private line:Ljava/lang/StringBuffer;

.field private msgOutputLevel:I

.field private task:Lorg/apache/tools/ant/Task;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/Task;I)V
    .locals 2
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "msgOutputLevel"    # I

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 53
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "As of Ant 1.2 released in October 2000, the TaskOutputStream class"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "is considered to be dead code by the Ant developers and is unmaintained."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "Don\'t use it!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 59
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->task:Lorg/apache/tools/ant/Task;

    .line 60
    iput p2, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->msgOutputLevel:I

    .line 62
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->line:Ljava/lang/StringBuffer;

    .line 63
    return-void
.end method

.method private processLine()V
    .locals 3

    .prologue
    .line 90
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->task:Lorg/apache/tools/ant/Task;

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->msgOutputLevel:I

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 92
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->line:Ljava/lang/StringBuffer;

    .line 93
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    int-to-char v0, p1

    .line 75
    .local v0, "cc":C
    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_2

    .line 77
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->processLine()V

    .line 83
    :cond_1
    :goto_0
    return-void

    .line 81
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TaskOutputStream;->line:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
