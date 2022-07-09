.class public Lorg/apache/tools/ant/taskdefs/Taskdef;
.super Lorg/apache/tools/ant/taskdefs/Typedef;
.source "Taskdef.java"


# static fields
.field static class$org$apache$tools$ant$Task:Ljava/lang/Class;

.field static class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Typedef;-><init>()V

    .line 49
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.TaskAdapter"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Taskdef;->setAdapterClass(Ljava/lang/Class;)V

    .line 50
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.Task"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Taskdef;->setAdaptToClass(Ljava/lang/Class;)V

    .line 51
    return-void

    .line 49
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$TaskAdapter:Ljava/lang/Class;

    goto :goto_0

    .line 50
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Taskdef;->class$org$apache$tools$ant$Task:Ljava/lang/Class;

    goto :goto_1
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 49
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method
