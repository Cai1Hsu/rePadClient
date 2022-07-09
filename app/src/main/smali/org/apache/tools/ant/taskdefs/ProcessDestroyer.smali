.class Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;
.super Ljava/lang/Object;
.source "ProcessDestroyer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;
    }
.end annotation


# static fields
.field private static final THREAD_DIE_TIMEOUT:I = 0x4e20

.field static class$java$lang$IllegalStateException:Ljava/lang/Class;

.field static class$java$lang$Runtime:Ljava/lang/Class;

.field static class$java$lang$Thread:Ljava/lang/Class;


# instance fields
.field private addShutdownHookMethod:Ljava/lang/reflect/Method;

.field private added:Z

.field private destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

.field private processes:Ljava/util/HashSet;

.field private removeShutdownHookMethod:Ljava/lang/reflect/Method;

.field private running:Z


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    .line 37
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    .line 41
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->added:Z

    .line 44
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    .line 77
    const/4 v2, 0x1

    :try_start_0
    new-array v1, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Thread:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "java.lang.Thread"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Thread:Ljava/lang/Class;

    :goto_0
    aput-object v2, v1, v3

    .line 78
    .local v1, "paramTypes":[Ljava/lang/Class;
    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "java.lang.Runtime"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;

    :goto_1
    const-string/jumbo v3, "addShutdownHook"

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->addShutdownHookMethod:Ljava/lang/reflect/Method;

    .line 81
    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;

    if-nez v2, :cond_2

    const-string/jumbo v2, "java.lang.Runtime"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;

    :goto_2
    const-string/jumbo v3, "removeShutdownHook"

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->removeShutdownHookMethod:Ljava/lang/reflect/Method;

    .line 89
    .end local v1    # "paramTypes":[Ljava/lang/Class;
    :goto_3
    return-void

    .line 77
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Thread:Ljava/lang/Class;

    goto :goto_0

    .line 78
    .restart local v1    # "paramTypes":[Ljava/lang/Class;
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;

    goto :goto_1

    .line 81
    :cond_2
    sget-object v2, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$Runtime:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 86
    .end local v1    # "paramTypes":[Ljava/lang/Class;
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 84
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    goto :goto_3
.end method

.method private addShutdownHook()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 96
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->addShutdownHookMethod:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    if-nez v3, :cond_0

    .line 97
    new-instance v3, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    invoke-direct {v3, p0}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;-><init>(Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;)V

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    .line 98
    new-array v0, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    aput-object v4, v0, v3

    .line 100
    .local v0, "args":[Ljava/lang/Object;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->addShutdownHookMethod:Ljava/lang/reflect/Method;

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->added:Z
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    .line 114
    .end local v0    # "args":[Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 102
    .restart local v0    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 103
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 104
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 106
    .local v2, "t":Ljava/lang/Throwable;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v3, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "java.lang.IllegalStateException"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    :goto_1
    if-ne v4, v3, :cond_2

    .line 108
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    goto :goto_0

    .line 106
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    goto :goto_1

    .line 110
    :cond_2
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 77
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

.method private removeShutdownHook()V
    .locals 9

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 121
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->removeShutdownHookMethod:Ljava/lang/reflect/Method;

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->added:Z

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    if-nez v4, :cond_2

    .line 122
    new-array v0, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    aput-object v4, v0, v8

    .line 124
    .local v0, "args":[Ljava/lang/Object;
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->removeShutdownHookMethod:Ljava/lang/reflect/Method;

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    .line 128
    .local v2, "removed":Ljava/lang/Boolean;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 129
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v5, "Could not remove shutdown hook"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1

    .line 145
    .end local v2    # "removed":Ljava/lang/Boolean;
    :cond_0
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->setShouldDestroy(Z)V

    .line 146
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/ThreadGroup;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_1

    .line 149
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->start()V

    .line 153
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    const-wide/16 v6, 0x4e20

    invoke-virtual {v4, v6, v7}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 158
    :goto_1
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->destroyProcessThread:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer$ProcessDestroyerImpl;

    .line 159
    iput-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->added:Z

    .line 161
    .end local v0    # "args":[Ljava/lang/Object;
    :cond_2
    return-void

    .line 131
    .restart local v0    # "args":[Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 132
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 133
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v1

    .line 134
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v3

    .line 135
    .local v3, "t":Ljava/lang/Throwable;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    sget-object v4, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    if-nez v4, :cond_3

    const-string/jumbo v4, "java.lang.IllegalStateException"

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    :goto_2
    if-ne v5, v4, :cond_4

    .line 137
    iput-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    goto :goto_0

    .line 135
    :cond_3
    sget-object v4, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->class$java$lang$IllegalStateException:Ljava/lang/Class;

    goto :goto_2

    .line 139
    :cond_4
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    .line 154
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v3    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v4

    goto :goto_1
.end method


# virtual methods
.method public add(Ljava/lang/Process;)Z
    .locals 2
    .param p1, "process"    # Ljava/lang/Process;

    .prologue
    .line 181
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    monitor-enter v1

    .line 183
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 184
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->addShutdownHook()V

    .line 186
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 187
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isAddedAsShutdownHook()Z
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->added:Z

    return v0
.end method

.method public remove(Ljava/lang/Process;)Z
    .locals 3
    .param p1, "process"    # Ljava/lang/Process;

    .prologue
    .line 199
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    monitor-enter v2

    .line 200
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    invoke-virtual {v1, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 201
    .local v0, "processRemoved":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 202
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->removeShutdownHook()V

    .line 204
    :cond_0
    monitor-exit v2

    return v0

    .line 205
    .end local v0    # "processRemoved":Z
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 3

    .prologue
    .line 212
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    monitor-enter v2

    .line 213
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->running:Z

    .line 214
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->processes:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 215
    .local v0, "e":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Process;

    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    goto :goto_0

    .line 218
    .end local v0    # "e":Ljava/util/Iterator;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .restart local v0    # "e":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 219
    return-void
.end method
