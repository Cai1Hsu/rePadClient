.class public Lorg/apache/tools/ant/taskdefs/LogOutputStream;
.super Lorg/apache/tools/ant/util/LineOrientedOutputStream;
.source "LogOutputStream.java"


# instance fields
.field private level:I

.field private pc:Lorg/apache/tools/ant/ProjectComponent;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 1
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;-><init>()V

    .line 38
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->level:I

    .line 47
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->pc:Lorg/apache/tools/ant/ProjectComponent;

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/ProjectComponent;I)V
    .locals 0
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p2, "level"    # I

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 69
    iput p2, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->level:I

    .line 70
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;I)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "level"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    .line 58
    return-void
.end method


# virtual methods
.method public getMessageLevel()I
    .locals 1

    .prologue
    .line 108
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->level:I

    return v0
.end method

.method protected processBuffer()V
    .locals 4

    .prologue
    .line 77
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->processBuffer()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    return-void

    .line 78
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Impossible IOException caught: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected processLine(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 90
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->level:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->processLine(Ljava/lang/String;I)V

    .line 91
    return-void
.end method

.method protected processLine(Ljava/lang/String;I)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->pc:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 101
    return-void
.end method
