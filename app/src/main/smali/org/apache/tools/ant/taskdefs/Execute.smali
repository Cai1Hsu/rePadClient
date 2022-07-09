.class public Lorg/apache/tools/ant/taskdefs/Execute;
.super Ljava/lang/Object;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$PerlScriptCommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;,
        Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;,
        Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final INVALID:I = 0x7fffffff

.field private static final ONE_SECOND:I = 0x3e8

.field private static antWorkingDirectory:Ljava/lang/String;

.field static class$java$lang$System:Ljava/lang/Class;

.field private static environmentCaseInSensitive:Z

.field private static procEnvironment:Ljava/util/Map;

.field private static processDestroyer:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

.field private static shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

.field private static vmLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;


# instance fields
.field private cmdl:[Ljava/lang/String;

.field private env:[Ljava/lang/String;

.field private exitValue:I

.field private newEnvironment:Z

.field private project:Lorg/apache/tools/ant/Project;

.field private streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

.field private useVMLauncher:Z

.field private watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

.field private workingDirectory:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 61
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 75
    const-string/jumbo v1, "user.dir"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->antWorkingDirectory:Ljava/lang/String;

    .line 76
    sput-object v4, Lorg/apache/tools/ant/taskdefs/Execute;->vmLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .line 77
    sput-object v4, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .line 78
    sput-object v4, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    .line 81
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->processDestroyer:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    .line 84
    const/4 v1, 0x0

    sput-boolean v1, Lorg/apache/tools/ant/taskdefs/Execute;->environmentCaseInSensitive:Z

    .line 92
    :try_start_0
    const-string/jumbo v1, "os/2"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 93
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->vmLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    :cond_0
    :goto_0
    const-string/jumbo v1, "mac"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "unix"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 100
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .line 134
    :goto_1
    return-void

    .line 101
    :cond_1
    const-string/jumbo v1, "os/2"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 103
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_1

    .line 104
    :cond_2
    const-string/jumbo v1, "windows"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 105
    const/4 v1, 0x1

    sput-boolean v1, Lorg/apache/tools/ant/taskdefs/Execute;->environmentCaseInSensitive:Z

    .line 106
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    .line 108
    .local v0, "baseLauncher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    const-string/jumbo v1, "win9x"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 110
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_1

    .line 113
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;

    const-string/jumbo v2, "bin/antRun.bat"

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_1

    .line 116
    .end local v0    # "baseLauncher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :cond_4
    const-string/jumbo v1, "netware"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 118
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    .line 120
    .restart local v0    # "baseLauncher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$PerlScriptCommandLauncher;

    const-string/jumbo v2, "bin/antRun.pl"

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/taskdefs/Execute$PerlScriptCommandLauncher;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_1

    .line 122
    .end local v0    # "baseLauncher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :cond_5
    const-string/jumbo v1, "openvms"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 125
    :try_start_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 126
    :catch_0
    move-exception v1

    goto :goto_1

    .line 131
    :cond_6
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;

    const-string/jumbo v2, "bin/antRun"

    new-instance v3, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_1

    .line 95
    :catch_1
    move-exception v1

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 320
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 321
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V
    .locals 1
    .param p1, "streamHandler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 330
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 331
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V
    .locals 3
    .param p1, "streamHandler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    .param p2, "watchdog"    # Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 342
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->cmdl:[Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    .line 65
    const v0, 0x7fffffff

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->exitValue:I

    .line 68
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    .line 69
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    .line 70
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Execute;->newEnvironment:Z

    .line 73
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->useVMLauncher:Z

    .line 343
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Execute;->setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 344
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    .line 347
    const-string/jumbo v0, "openvms"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Execute;->useVMLauncher:Z

    .line 350
    :cond_0
    return-void
.end method

.method static access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Execute;->antWorkingDirectory:Ljava/lang/String;

    return-object v0
.end method

.method static access$200()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Execute;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 165
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

.method public static closeStreams(Ljava/lang/Process;)V
    .locals 1
    .param p0, "process"    # Ljava/lang/Process;

    .prologue
    .line 732
    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 733
    invoke-virtual {p0}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 734
    invoke-virtual {p0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 735
    return-void
.end method

.method public static declared-synchronized getEnvironmentVariables()Ljava/util/Map;
    .locals 14

    .prologue
    .line 159
    const-class v11, Lorg/apache/tools/ant/taskdefs/Execute;

    monitor-enter v11

    :try_start_0
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    if-eqz v10, :cond_0

    .line 160
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    :goto_0
    monitor-exit v11

    return-object v10

    .line 162
    :cond_0
    :try_start_1
    const-string/jumbo v10, "1.5"

    invoke-static {v10}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isAtLeastJavaVersion(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string/jumbo v10, "openvms"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v10

    if-nez v10, :cond_2

    .line 165
    :try_start_2
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->class$java$lang$System:Ljava/lang/Class;

    if-nez v10, :cond_1

    const-string/jumbo v10, "java.lang.System"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/Execute;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->class$java$lang$System:Ljava/lang/Class;

    :goto_1
    const-string/jumbo v12, "getenv"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Class;

    invoke-virtual {v10, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    const/4 v12, 0x0

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Object;

    invoke-virtual {v10, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map;

    sput-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    .line 168
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    goto :goto_0

    .line 165
    :cond_1
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->class$java$lang$System:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 169
    :catch_0
    move-exception v9

    .line 170
    .local v9, "x":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 174
    :cond_2
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 176
    :try_start_4
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 177
    .local v6, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute;

    .end local v9    # "x":Ljava/lang/Exception;
    new-instance v10, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-direct {v10, v6}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v2, v10}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 178
    .local v2, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getProcEnvCommand()[Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 180
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Lorg/apache/tools/ant/taskdefs/Execute;->setNewenvironment(Z)V

    .line 181
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v7

    .line 182
    .local v7, "retval":I
    if-eqz v7, :cond_3

    .line 185
    :cond_3
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/StringReader;

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/Execute;->toString(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v10, v12}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 188
    .local v3, "in":Ljava/io/BufferedReader;
    const-string/jumbo v10, "openvms"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 189
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->getVMSLogicals(Ljava/io/BufferedReader;)Ljava/util/Map;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    .line 190
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    goto/16 :goto_0

    .line 192
    :cond_4
    const/4 v8, 0x0

    .line 193
    .local v8, "var":Ljava/lang/String;
    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    .line 194
    .local v5, "lineSep":Ljava/lang/String;
    :goto_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_8

    .line 195
    const/16 v10, 0x3d

    invoke-virtual {v4, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/4 v12, -0x1

    if-ne v10, v12, :cond_6

    .line 198
    if-nez v8, :cond_5

    .line 199
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 201
    :cond_5
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 205
    :cond_6
    if-eqz v8, :cond_7

    .line 206
    const-string/jumbo v10, "="

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 207
    .local v0, "eq":I
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    const/4 v12, 0x0

    invoke-virtual {v8, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    add-int/lit8 v13, v0, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    .end local v0    # "eq":I
    :cond_7
    move-object v8, v4

    goto :goto_2

    .line 214
    :cond_8
    if-eqz v8, :cond_9

    .line 215
    const-string/jumbo v10, "="

    invoke-virtual {v8, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 216
    .restart local v0    # "eq":I
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    const/4 v12, 0x0

    invoke-virtual {v8, v12, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    add-int/lit8 v13, v0, 0x1

    invoke-virtual {v8, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 222
    .end local v0    # "eq":I
    .end local v2    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "lineSep":Ljava/lang/String;
    .end local v6    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "retval":I
    .end local v8    # "var":Ljava/lang/String;
    :cond_9
    :goto_3
    :try_start_5
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Execute;->procEnvironment:Ljava/util/Map;

    goto/16 :goto_0

    .line 218
    .restart local v9    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 219
    .end local v9    # "x":Ljava/lang/Exception;
    .local v1, "exc":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 159
    .end local v1    # "exc":Ljava/io/IOException;
    :catchall_0
    move-exception v10

    monitor-exit v11

    throw v10
.end method

.method private static getProcEnvCommand()[Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 249
    const-string/jumbo v1, "os/2"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 251
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "cmd"

    aput-object v1, v0, v3

    const-string/jumbo v1, "/c"

    aput-object v1, v0, v2

    const-string/jumbo v1, "set"

    aput-object v1, v0, v4

    .line 283
    :goto_0
    return-object v0

    .line 252
    :cond_0
    const-string/jumbo v1, "windows"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 254
    const-string/jumbo v1, "win9x"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 256
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "command.com"

    aput-object v1, v0, v3

    const-string/jumbo v1, "/c"

    aput-object v1, v0, v2

    const-string/jumbo v1, "set"

    aput-object v1, v0, v4

    goto :goto_0

    .line 259
    :cond_1
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "cmd"

    aput-object v1, v0, v3

    const-string/jumbo v1, "/c"

    aput-object v1, v0, v2

    const-string/jumbo v1, "set"

    aput-object v1, v0, v4

    goto :goto_0

    .line 261
    :cond_2
    const-string/jumbo v1, "z/os"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "unix"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 265
    :cond_3
    new-array v0, v2, [Ljava/lang/String;

    .line 266
    .local v0, "cmd":[Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "/bin/env"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 267
    const-string/jumbo v1, "/bin/env"

    aput-object v1, v0, v3

    goto :goto_0

    .line 268
    :cond_4
    new-instance v1, Ljava/io/File;

    const-string/jumbo v2, "/usr/bin/env"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 269
    const-string/jumbo v1, "/usr/bin/env"

    aput-object v1, v0, v3

    goto :goto_0

    .line 272
    :cond_5
    const-string/jumbo v1, "env"

    aput-object v1, v0, v3

    goto :goto_0

    .line 275
    .end local v0    # "cmd":[Ljava/lang/String;
    :cond_6
    const-string/jumbo v1, "netware"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string/jumbo v1, "os/400"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 277
    :cond_7
    new-array v0, v2, [Ljava/lang/String;

    const-string/jumbo v1, "env"

    aput-object v1, v0, v3

    goto/16 :goto_0

    .line 278
    :cond_8
    const-string/jumbo v1, "openvms"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 279
    new-array v0, v4, [Ljava/lang/String;

    const-string/jumbo v1, "show"

    aput-object v1, v0, v3

    const-string/jumbo v1, "logical"

    aput-object v1, v0, v2

    goto/16 :goto_0

    .line 283
    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public static declared-synchronized getProcEnvironment()Ljava/util/Vector;
    .locals 6

    .prologue
    .line 233
    const-class v4, Lorg/apache/tools/ant/taskdefs/Execute;

    monitor-enter v4

    :try_start_0
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 234
    .local v2, "v":Ljava/util/Vector;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironmentVariables()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 235
    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 236
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 237
    .local v0, "entry":Ljava/util/Map$Entry;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, "="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 233
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v1    # "it":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 239
    .restart local v1    # "it":Ljava/util/Iterator;
    :cond_0
    monitor-exit v4

    return-object v2
.end method

.method private static getVMSLogicals(Ljava/io/BufferedReader;)Ljava/util/Map;
    .locals 9
    .param p0, "in"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 750
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 751
    .local v4, "logicals":Ljava/util/HashMap;
    const/4 v2, 0x0

    .local v2, "logName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 752
    .local v3, "logValue":Ljava/lang/String;
    const/4 v1, 0x0

    .line 754
    .local v1, "line":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 756
    const-string/jumbo v6, "\t="

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 758
    if-eqz v2, :cond_0

    .line 759
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 761
    :cond_1
    const-string/jumbo v6, "  \""

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 763
    if-eqz v2, :cond_2

    .line 764
    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 766
    :cond_2
    const/16 v6, 0x3d

    invoke-virtual {v1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 767
    .local v0, "eqIndex":I
    const/4 v6, 0x3

    add-int/lit8 v7, v0, -0x2

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 768
    .local v5, "newLogName":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 770
    const/4 v2, 0x0

    goto :goto_0

    .line 772
    :cond_3
    move-object v2, v5

    .line 773
    add-int/lit8 v6, v0, 0x3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 779
    .end local v0    # "eqIndex":I
    .end local v5    # "newLogName":Ljava/lang/String;
    :cond_4
    if-eqz v2, :cond_5

    .line 780
    invoke-virtual {v4, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 782
    :cond_5
    return-object v4
.end method

.method public static isFailure(I)Z
    .locals 3
    .param p0, "exitValue"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 629
    const-string/jumbo v2, "openvms"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    rem-int/lit8 v2, p0, 0x2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    if-nez p0, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public static launch(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Z)Ljava/lang/Process;
    .locals 4
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "command"    # [Ljava/lang/String;
    .param p2, "env"    # [Ljava/lang/String;
    .param p3, "dir"    # Ljava/io/File;
    .param p4, "useVM"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 476
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 477
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 479
    :cond_0
    if-eqz p4, :cond_1

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->vmLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    if-eqz v1, :cond_1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/Execute;->vmLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .line 481
    .local v0, "launcher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :goto_0
    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v1

    return-object v1

    .line 479
    .end local v0    # "launcher":Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Execute;->shellLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    goto :goto_0
.end method

.method private patchEnvironment()[Ljava/lang/String;
    .locals 10

    .prologue
    .line 660
    const-string/jumbo v8, "openvms"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 661
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    .line 695
    :goto_0
    return-object v8

    .line 663
    :cond_0
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironmentVariables()Ljava/util/Map;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 665
    .local v6, "osEnv":Ljava/util/Map;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    array-length v8, v8

    if-ge v1, v8, :cond_3

    .line 666
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    aget-object v4, v8, v1

    .line 667
    .local v4, "keyValue":Ljava/lang/String;
    const/4 v8, 0x0

    const/16 v9, 0x3d

    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 672
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v6, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_2

    sget-boolean v8, Lorg/apache/tools/ant/taskdefs/Execute;->environmentCaseInSensitive:Z

    if-eqz v8, :cond_2

    .line 675
    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 676
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 678
    .local v7, "osEnvItem":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 680
    move-object v3, v7

    .line 687
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v7    # "osEnvItem":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 665
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 690
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keyValue":Ljava/lang/String;
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 691
    .local v5, "l":Ljava/util/ArrayList;
    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "it":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 692
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 693
    .local v0, "entry":Ljava/util/Map$Entry;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 695
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_4
    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public static runCommand(Lorg/apache/tools/ant/Task;[Ljava/lang/String;)V
    .locals 7
    .param p0, "task"    # Lorg/apache/tools/ant/Task;
    .param p1, "cmdline"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 710
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 712
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v3, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-direct {v3, p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 714
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 715
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 716
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v2

    .line 717
    .local v2, "retval":I
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 718
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " failed with return code "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 721
    .end local v1    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v2    # "retval":I
    :catch_0
    move-exception v0

    .line 722
    .local v0, "exc":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not launch "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    aget-object v5, p1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 725
    .end local v0    # "exc":Ljava/io/IOException;
    .restart local v1    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .restart local v2    # "retval":I
    :cond_0
    return-void
.end method

.method public static toString(Ljava/io/ByteArrayOutputStream;)Ljava/lang/String;
    .locals 1
    .param p0, "bos"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 299
    const-string/jumbo v0, "z/os"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    :try_start_0
    const-string/jumbo v0, "Cp1047"

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 312
    :goto_0
    return-object v0

    .line 305
    :cond_0
    const-string/jumbo v0, "os/400"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 307
    :try_start_1
    const-string/jumbo v0, "Cp500"

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_0

    .line 308
    :catch_0
    move-exception v0

    .line 312
    :cond_1
    :goto_1
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 302
    :catch_1
    move-exception v0

    goto :goto_1
.end method


# virtual methods
.method public execute()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 492
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 493
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " doesn\'t exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 495
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getCommandline()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironment()[Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Execute;->useVMLauncher:Z

    invoke-static {v3, v4, v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/Execute;->launch(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Z)Ljava/lang/Process;

    move-result-object v1

    .line 499
    .local v1, "process":Ljava/lang/Process;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    invoke-virtual {v1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->setProcessInputStream(Ljava/io/OutputStream;)V

    .line 500
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->setProcessOutputStream(Ljava/io/InputStream;)V

    .line 501
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    invoke-virtual {v1}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->setProcessErrorStream(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    invoke-interface {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->start()V

    .line 511
    :try_start_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Execute;->processDestroyer:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->add(Ljava/lang/Process;)Z

    .line 513
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    if-eqz v3, :cond_1

    .line 514
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->start(Ljava/lang/Process;)V

    .line 516
    :cond_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->waitFor(Ljava/lang/Process;)V

    .line 518
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    if-eqz v3, :cond_2

    .line 519
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->stop()V

    .line 521
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    invoke-interface {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->stop()V

    .line 522
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->closeStreams(Ljava/lang/Process;)V

    .line 524
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    if-eqz v3, :cond_3

    .line 525
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->checkException()V

    .line 527
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getExitValue()I
    :try_end_1
    .catch Ljava/lang/ThreadDeath; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    .line 536
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Execute;->processDestroyer:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->remove(Ljava/lang/Process;)Z

    return v3

    .line 502
    :catch_0
    move-exception v0

    .line 503
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 504
    throw v0

    .line 528
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 530
    .local v2, "t":Ljava/lang/ThreadDeath;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V

    .line 531
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 536
    .end local v2    # "t":Ljava/lang/ThreadDeath;
    :catchall_0
    move-exception v3

    sget-object v4, Lorg/apache/tools/ant/taskdefs/Execute;->processDestroyer:Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/taskdefs/ProcessDestroyer;->remove(Ljava/lang/Process;)Z

    throw v3
.end method

.method public getCommandline()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 367
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->cmdl:[Ljava/lang/String;

    return-object v0
.end method

.method public getEnvironment()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->newEnvironment:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->patchEnvironment()[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getExitValue()I
    .locals 1

    .prologue
    .line 608
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->exitValue:I

    return v0
.end method

.method public getWorkingDirectory()Ljava/io/File;
    .locals 2

    .prologue
    .line 430
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->antWorkingDirectory:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    goto :goto_0
.end method

.method public isFailure()Z
    .locals 1

    .prologue
    .line 640
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getExitValue()I

    move-result v0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v0

    return v0
.end method

.method public killedProcess()Z
    .locals 1

    .prologue
    .line 649
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute;->watchdog:Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;->killedProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAntRun(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 443
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    .line 444
    return-void
.end method

.method public setCommandline([Ljava/lang/String;)V
    .locals 0
    .param p1, "commandline"    # [Ljava/lang/String;

    .prologue
    .line 376
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->cmdl:[Ljava/lang/String;

    .line 377
    return-void
.end method

.method public setEnvironment([Ljava/lang/String;)V
    .locals 0
    .param p1, "env"    # [Ljava/lang/String;

    .prologue
    .line 405
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->env:[Ljava/lang/String;

    .line 406
    return-void
.end method

.method protected setExitValue(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 599
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->exitValue:I

    .line 600
    return-void
.end method

.method public setNewenvironment(Z)V
    .locals 0
    .param p1, "newenv"    # Z

    .prologue
    .line 385
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->newEnvironment:Z

    .line 386
    return-void
.end method

.method public setSpawn(Z)V
    .locals 0
    .param p1, "spawn"    # Z

    .prologue
    .line 150
    return-void
.end method

.method public setStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V
    .locals 0
    .param p1, "streamHandler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 358
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->streamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .line 359
    return-void
.end method

.method public setVMLauncher(Z)V
    .locals 0
    .param p1, "useVMLauncher"    # Z

    .prologue
    .line 457
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->useVMLauncher:Z

    .line 458
    return-void
.end method

.method public setWorkingDirectory(Ljava/io/File;)V
    .locals 2
    .param p1, "wd"    # Ljava/io/File;

    .prologue
    .line 419
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/apache/tools/ant/taskdefs/Execute;->antWorkingDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 p1, 0x0

    .end local p1    # "wd":Ljava/io/File;
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    .line 422
    return-void
.end method

.method public spawn()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    .line 549
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 550
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " doesn\'t exist."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 552
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getCommandline()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironment()[Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Execute;->workingDirectory:Ljava/io/File;

    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/Execute;->useVMLauncher:Z

    invoke-static {v4, v5, v6, v7, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->launch(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Z)Ljava/lang/Process;

    move-result-object v3

    .line 555
    .local v3, "process":Ljava/lang/Process;
    const-string/jumbo v4, "windows"

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 557
    const-wide/16 v4, 0x3e8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 563
    :cond_1
    :goto_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Execute$1;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Execute$1;-><init>(Lorg/apache/tools/ant/taskdefs/Execute;)V

    .line 569
    .local v0, "dummyOut":Ljava/io/OutputStream;
    new-instance v2, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;)V

    .line 570
    .local v2, "handler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    invoke-virtual {v3}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->setProcessErrorStream(Ljava/io/InputStream;)V

    .line 571
    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->setProcessOutputStream(Ljava/io/InputStream;)V

    .line 572
    invoke-interface {v2}, Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;->start()V

    .line 573
    invoke-virtual {v3}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 575
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "spawned process "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v9}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 577
    return-void

    .line 558
    .end local v0    # "dummyOut":Ljava/io/OutputStream;
    .end local v2    # "handler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    :catch_0
    move-exception v1

    .line 559
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Execute;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v5, "interruption in the sleep after having spawned a process"

    invoke-virtual {v4, v5, v9}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method protected waitFor(Ljava/lang/Process;)V
    .locals 2
    .param p1, "process"    # Ljava/lang/Process;

    .prologue
    .line 586
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Process;->waitFor()I

    .line 587
    invoke-virtual {p1}, Ljava/lang/Process;->exitValue()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setExitValue(I)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 591
    :goto_0
    return-void

    .line 588
    :catch_0
    move-exception v0

    .line 589
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {p1}, Ljava/lang/Process;->destroy()V

    goto :goto_0
.end method
