.class public Lorg/apache/tools/ant/BuildEvent;
.super Ljava/util/EventObject;
.source "BuildEvent.java"


# static fields
.field private static final serialVersionUID:J = 0x3efa64801e1212e6L


# instance fields
.field private exception:Ljava/lang/Throwable;

.field private message:Ljava/lang/String;

.field private priority:I

.field private final project:Lorg/apache/tools/ant/Project;

.field private final target:Lorg/apache/tools/ant/Target;

.field private final task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 48
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/BuildEvent;->priority:I

    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/BuildEvent;->project:Lorg/apache/tools/ant/Project;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/BuildEvent;->target:Lorg/apache/tools/ant/Target;

    .line 66
    iput-object v1, p0, Lorg/apache/tools/ant/BuildEvent;->task:Lorg/apache/tools/ant/Task;

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 78
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 48
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/BuildEvent;->priority:I

    .line 79
    invoke-virtual {p1}, Lorg/apache/tools/ant/Target;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->project:Lorg/apache/tools/ant/Project;

    .line 80
    iput-object p1, p0, Lorg/apache/tools/ant/BuildEvent;->target:Lorg/apache/tools/ant/Target;

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->task:Lorg/apache/tools/ant/Task;

    .line 82
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Ljava/util/EventObject;-><init>(Ljava/lang/Object;)V

    .line 48
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/BuildEvent;->priority:I

    .line 94
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->project:Lorg/apache/tools/ant/Project;

    .line 95
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->target:Lorg/apache/tools/ant/Target;

    .line 96
    iput-object p1, p0, Lorg/apache/tools/ant/BuildEvent;->task:Lorg/apache/tools/ant/Task;

    .line 97
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->exception:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lorg/apache/tools/ant/BuildEvent;->priority:I

    return v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getTarget()Lorg/apache/tools/ant/Target;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->target:Lorg/apache/tools/ant/Target;

    return-object v0
.end method

.method public getTask()Lorg/apache/tools/ant/Task;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/BuildEvent;->task:Lorg/apache/tools/ant/Task;

    return-object v0
.end method

.method public setException(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    iput-object p1, p0, Lorg/apache/tools/ant/BuildEvent;->exception:Ljava/lang/Throwable;

    .line 130
    return-void
.end method

.method public setMessage(Ljava/lang/String;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "priority"    # I

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/tools/ant/BuildEvent;->message:Ljava/lang/String;

    .line 112
    iput p2, p0, Lorg/apache/tools/ant/BuildEvent;->priority:I

    .line 113
    return-void
.end method
