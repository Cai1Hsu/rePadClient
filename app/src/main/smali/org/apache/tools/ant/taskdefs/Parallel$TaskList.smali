.class public Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;
.super Ljava/lang/Object;
.source "Parallel.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Parallel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskList"
.end annotation


# instance fields
.field private tasks:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->tasks:Ljava/util/List;

    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->tasks:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->tasks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    return-void
.end method
