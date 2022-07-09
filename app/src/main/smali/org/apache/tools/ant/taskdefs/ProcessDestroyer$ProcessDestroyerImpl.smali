.class Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;
.super Ljava/lang/Thread;
.source "ProcessDestroyer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProcessDestroyerImpl"
.end annotation


# instance fields
.field private shouldDestroy:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->this$0:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    .line 50
    const-string/jumbo v0, "ProcessDestroyer Shutdown Hook"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->shouldDestroy:Z

    .line 51
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->shouldDestroy:Z

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->this$0:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->run()V

    .line 56
    :cond_0
    return-void
.end method

.method public setShouldDestroy(Z)V
    .locals 0
    .param p1, "shouldDestroy"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->shouldDestroy:Z

    .line 60
    return-void
.end method
