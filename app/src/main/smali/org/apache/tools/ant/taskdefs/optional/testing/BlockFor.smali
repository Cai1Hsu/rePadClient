.class public Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;
.super Lorg/apache/tools/ant/taskdefs/WaitFor;
.source "BlockFor.java"


# instance fields
.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 39
    const-string/jumbo v0, "blockfor"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/WaitFor;-><init>(Ljava/lang/String;)V

    .line 40
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " timed out"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->text:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "taskName"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/WaitFor;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->text:Ljava/lang/String;

    .line 69
    return-void
.end method

.method protected processTimeout()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/optional/testing/BuildTimeoutException;
        }
    .end annotation

    .prologue
    .line 58
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->processTimeout()V

    .line 59
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/testing/BuildTimeoutException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->text:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/testing/BuildTimeoutException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method
