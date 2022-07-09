.class public Lorg/apache/tools/ant/taskdefs/ExecuteJava;
.super Ljava/lang/Object;
.source "ExecuteJava.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lorg/apache/tools/ant/util/TimeoutObserver;


# static fields
.field static array$Ljava$lang$String:Ljava/lang/Class;


# instance fields
.field private volatile caught:Ljava/lang/Throwable;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private javaCommand:Lorg/apache/tools/ant/types/Commandline;

.field private main:Ljava/lang/reflect/Method;

.field private perm:Lorg/apache/tools/ant/types/Permissions;

.field private sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

.field private thread:Ljava/lang/Thread;

.field private volatile timedOut:Z

.field private timeout:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 48
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 50
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 51
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->main:Ljava/lang/reflect/Method;

    .line 52
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    .line 53
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->caught:Ljava/lang/Throwable;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z

    .line 55
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 142
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

.method public static setupCommandLineForVMS(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V
    .locals 7
    .param p0, "exe"    # Lorg/apache/tools/ant/taskdefs/Execute;
    .param p1, "command"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 312
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setVMLauncher(Z)V

    .line 313
    const/4 v3, 0x0

    .line 315
    .local v3, "vmsJavaOptionFile":Ljava/io/File;
    :try_start_0
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    new-array v0, v4, [Ljava/lang/String;

    .line 316
    .local v0, "args":[Ljava/lang/String;
    const/4 v4, 0x1

    const/4 v5, 0x0

    array-length v6, p1

    add-int/lit8 v6, v6, -0x1

    invoke-static {p1, v4, v0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 317
    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->createVmsJavaOptionFile([Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 322
    invoke-virtual {v3}, Ljava/io/File;->deleteOnExit()V

    .line 323
    const/4 v4, 0x3

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    aget-object v5, p1, v5

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "-V"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 324
    .local v2, "vmsCmd":[Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 328
    return-void

    .line 325
    .end local v0    # "args":[Ljava/lang/String;
    .end local v2    # "vmsCmd":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 326
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Failed to create a temporary file for \"-V\" switch"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public execute(Lorg/apache/tools/ant/Project;)V
    .locals 10
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 116
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "classname":Ljava/lang/String;
    const/4 v3, 0x0

    .line 120
    .local v3, "loader":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    if-eqz v6, :cond_0

    .line 121
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->setSystem()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    :cond_0
    const/4 v4, 0x0

    .line 125
    .local v4, "target":Ljava/lang/Class;
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v6, :cond_3

    .line 126
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 142
    :goto_0
    :try_start_2
    const-string/jumbo v7, "main"

    const/4 v6, 0x1

    new-array v8, v6, [Ljava/lang/Class;

    const/4 v9, 0x0

    sget-object v6, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v6, :cond_4

    const-string/jumbo v6, "[Ljava.lang.String;"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v6, v8, v9

    invoke-virtual {v4, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->main:Ljava/lang/reflect/Method;

    .line 143
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->main:Ljava/lang/reflect/Method;

    if-nez v6, :cond_5

    .line 144
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Could not find main() method in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 186
    .end local v4    # "target":Ljava/lang/Class;
    :catch_0
    move-exception v2

    .line 187
    .local v2, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    .end local v2    # "e":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v6

    if-eqz v3, :cond_1

    .line 197
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 198
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 199
    const/4 v3, 0x0

    .line 201
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    if-eqz v7, :cond_2

    .line 202
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 196
    :cond_2
    throw v6

    .line 128
    .restart local v4    # "target":Ljava/lang/Class;
    :cond_3
    :try_start_4
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1, v6}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v3

    .line 129
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getCoreLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 130
    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/AntClassLoader;->setParentFirst(Z)V

    .line 131
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->addJavaLibraries()V

    .line 132
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/AntClassLoader;->setIsolated(Z)V

    .line 133
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->setThreadContextLoader()V

    .line 134
    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/AntClassLoader;->forceLoadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 135
    const/4 v6, 0x1

    invoke-static {v0, v6, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v4

    goto :goto_0

    .line 137
    :catch_1
    move-exception v2

    .line 138
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :try_start_5
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Could not find "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " Make sure you have it in your"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " classpath"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_5
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 188
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .end local v4    # "target":Ljava/lang/Class;
    :catch_2
    move-exception v2

    .line 189
    .local v2, "e":Ljava/lang/SecurityException;
    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 142
    .end local v2    # "e":Ljava/lang/SecurityException;
    .restart local v4    # "target":Ljava/lang/Class;
    :cond_4
    :try_start_7
    sget-object v6, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->array$Ljava$lang$String:Ljava/lang/Class;

    goto/16 :goto_1

    .line 147
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->main:Ljava/lang/reflect/Method;

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v6

    and-int/lit8 v6, v6, 0x8

    if-nez v6, :cond_6

    .line 148
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "main() method in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " is not declared static"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_7
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_4
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 190
    .end local v4    # "target":Ljava/lang/Class;
    :catch_3
    move-exception v2

    .line 192
    .local v2, "e":Ljava/lang/ThreadDeath;
    :try_start_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 151
    .end local v2    # "e":Ljava/lang/ThreadDeath;
    .restart local v4    # "target":Ljava/lang/Class;
    :cond_6
    :try_start_9
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    if-nez v6, :cond_7

    .line 152
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->run()V

    .line 183
    :goto_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->caught:Ljava/lang/Throwable;

    if-eqz v6, :cond_9

    .line 184
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->caught:Ljava/lang/Throwable;

    throw v6
    :try_end_9
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_9 .. :try_end_9} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_9} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_4
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 193
    .end local v4    # "target":Ljava/lang/Class;
    :catch_4
    move-exception v2

    .line 194
    .local v2, "e":Ljava/lang/Throwable;
    :try_start_a
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 154
    .end local v2    # "e":Ljava/lang/Throwable;
    .restart local v4    # "target":Ljava/lang/Class;
    :cond_7
    :try_start_b
    new-instance v6, Ljava/lang/Thread;

    const-string/jumbo v7, "ExecuteJava"

    invoke-direct {v6, p0, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    .line 155
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {p1, v6}, Lorg/apache/tools/ant/Project;->getThreadTask(Ljava/lang/Thread;)Lorg/apache/tools/ant/Task;

    move-result-object v1

    .line 158
    .local v1, "currentThreadTask":Lorg/apache/tools/ant/Task;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    invoke-virtual {p1, v6, v1}, Lorg/apache/tools/ant/Project;->registerThreadTask(Ljava/lang/Thread;Lorg/apache/tools/ant/Task;)V

    .line 163
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 164
    new-instance v5, Lorg/apache/tools/ant/util/Watchdog;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/util/Watchdog;-><init>(J)V

    .line 165
    .local v5, "w":Lorg/apache/tools/ant/util/Watchdog;
    invoke-virtual {v5, p0}, Lorg/apache/tools/ant/util/Watchdog;->addTimeoutObserver(Lorg/apache/tools/ant/util/TimeoutObserver;)V

    .line 166
    monitor-enter p0
    :try_end_b
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_b .. :try_end_b} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_b .. :try_end_b} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_b .. :try_end_b} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 167
    :try_start_c
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 168
    invoke-virtual {v5}, Lorg/apache/tools/ant/util/Watchdog;->start()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 170
    :try_start_d
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_d
    .catch Ljava/lang/InterruptedException; {:try_start_d .. :try_end_d} :catch_5
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 174
    :goto_3
    :try_start_e
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z

    if-eqz v6, :cond_8

    .line 175
    const-string/jumbo v6, "Timeout: sub-process interrupted"

    const/4 v7, 0x1

    invoke-virtual {p1, v6, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 181
    :goto_4
    monitor-exit p0

    goto :goto_2

    :catchall_1
    move-exception v6

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    :try_start_f
    throw v6
    :try_end_f
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_f .. :try_end_f} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_f .. :try_end_f} :catch_2
    .catch Ljava/lang/ThreadDeath; {:try_start_f .. :try_end_f} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 178
    :cond_8
    const/4 v6, 0x0

    :try_start_10
    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    .line 179
    invoke-virtual {v5}, Lorg/apache/tools/ant/util/Watchdog;->stop()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_1

    goto :goto_4

    .line 171
    :catch_5
    move-exception v6

    goto :goto_3

    .line 196
    .end local v1    # "currentThreadTask":Lorg/apache/tools/ant/Task;
    .end local v5    # "w":Lorg/apache/tools/ant/util/Watchdog;
    :cond_9
    if-eqz v3, :cond_a

    .line 197
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 198
    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 199
    const/4 v3, 0x0

    .line 201
    :cond_a
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    if-eqz v6, :cond_b

    .line 202
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 205
    :cond_b
    return-void
.end method

.method public fork(Lorg/apache/tools/ant/ProjectComponent;)I
    .locals 12
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 267
    new-instance v1, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    .line 268
    .local v1, "cmdl":Lorg/apache/tools/ant/types/CommandlineJava;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/CommandlineJava;->setClassname(Ljava/lang/String;)V

    .line 269
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "args":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v7, v0

    if-ge v4, v7, :cond_0

    .line 271
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    aget-object v8, v0, v4

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 270
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 273
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v7, :cond_1

    .line 274
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/CommandlineJava;->createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 276
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    if-eqz v7, :cond_2

    .line 277
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/CommandlineJava;->addSysproperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V

    .line 279
    :cond_2
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-direct {v6, p1}, Lorg/apache/tools/ant/taskdefs/Redirector;-><init>(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 280
    .local v6, "redirector":Lorg/apache/tools/ant/taskdefs/Redirector;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Redirector;->createHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v8

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    if-nez v7, :cond_3

    const/4 v7, 0x0

    :goto_1
    invoke-direct {v3, v8, v7}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 285
    .local v3, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 286
    const-string/jumbo v7, "openvms"

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 287
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setupCommandLineForVMS(Lorg/apache/tools/ant/taskdefs/Execute;[Ljava/lang/String;)V

    .line 292
    :goto_2
    :try_start_0
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v5

    .line 293
    .local v5, "rc":I
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Redirector;->complete()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->killedProcess()Z

    move-result v7

    iput-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z

    return v5

    .line 280
    .end local v3    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v5    # "rc":I
    :cond_3
    new-instance v7, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    invoke-direct {v7, v10, v11}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;-><init>(J)V

    goto :goto_1

    .line 289
    .restart local v3    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :cond_4
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    goto :goto_2

    .line 295
    :catch_0
    move-exception v2

    .line 296
    .local v2, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 298
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->killedProcess()Z

    move-result v8

    iput-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z

    throw v7
.end method

.method public declared-synchronized killedProcess()Z
    .locals 1

    .prologue
    .line 254
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 5

    .prologue
    .line 212
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v3

    .line 214
    .local v0, "argument":[Ljava/lang/Object;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v3, :cond_0

    .line 215
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Permissions;->setSecurityManager()V

    .line 217
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->main:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 226
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v3, :cond_1

    .line 227
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Permissions;->restoreSecurityManager()V

    .line 229
    :cond_1
    monitor-enter p0

    .line 230
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 233
    :goto_0
    return-void

    .line 218
    :catch_0
    move-exception v1

    .line 219
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    .line 220
    .local v2, "t":Ljava/lang/Throwable;
    instance-of v3, v2, Ljava/lang/InterruptedException;

    if-nez v3, :cond_2

    .line 221
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->caught:Ljava/lang/Throwable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 226
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v3, :cond_3

    .line 227
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Permissions;->restoreSecurityManager()V

    .line 229
    :cond_3
    monitor-enter p0

    .line 230
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .line 223
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "t":Ljava/lang/Throwable;
    :catch_1
    move-exception v2

    .line 224
    .restart local v2    # "t":Ljava/lang/Throwable;
    :try_start_4
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->caught:Ljava/lang/Throwable;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 226
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v3, :cond_4

    .line 227
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Permissions;->restoreSecurityManager()V

    .line 229
    :cond_4
    monitor-enter p0

    .line 230
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit p0

    goto :goto_0

    :catchall_1
    move-exception v3

    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v3

    .line 226
    .end local v2    # "t":Ljava/lang/Throwable;
    :catchall_2
    move-exception v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    if-eqz v4, :cond_5

    .line 227
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Permissions;->restoreSecurityManager()V

    .line 229
    :cond_5
    monitor-enter p0

    .line 230
    :try_start_6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 231
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 226
    throw v3

    .line 231
    :catchall_3
    move-exception v3

    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v3

    :catchall_4
    move-exception v3

    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    throw v3
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 71
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 72
    return-void
.end method

.method public setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 0
    .param p1, "javaCommand"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 63
    return-void
.end method

.method public setOutput(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/PrintStream;

    .prologue
    .line 99
    return-void
.end method

.method public setPermissions(Lorg/apache/tools/ant/types/Permissions;)V
    .locals 0
    .param p1, "permissions"    # Lorg/apache/tools/ant/types/Permissions;

    .prologue
    .line 88
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->perm:Lorg/apache/tools/ant/types/Permissions;

    .line 89
    return-void
.end method

.method public setSystemProperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V
    .locals 0
    .param p1, "s"    # Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 80
    return-void
.end method

.method public setTimeout(Ljava/lang/Long;)V
    .locals 0
    .param p1, "timeout"    # Ljava/lang/Long;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timeout:Ljava/lang/Long;

    .line 108
    return-void
.end method

.method public declared-synchronized timeoutOccured(Lorg/apache/tools/ant/util/Watchdog;)V
    .locals 1
    .param p1, "w"    # Lorg/apache/tools/ant/util/Watchdog;

    .prologue
    .line 241
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 242
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->timedOut:Z

    .line 243
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 245
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    monitor-exit p0

    return-void

    .line 241
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
