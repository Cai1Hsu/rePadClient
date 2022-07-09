.class Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScriptCommandLauncher"
.end annotation


# instance fields
.field private myScript:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V
    .locals 0
    .param p1, "script"    # Ljava/lang/String;
    .param p2, "launcher"    # Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .prologue
    .line 1043
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    .line 1044
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;->myScript:Ljava/lang/String;

    .line 1045
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 9
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "cmd"    # [Ljava/lang/String;
    .param p3, "env"    # [Ljava/lang/String;
    .param p4, "workingDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 1060
    if-nez p1, :cond_1

    .line 1061
    if-nez p4, :cond_0

    .line 1062
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .line 1087
    :goto_0
    return-object v4

    .line 1064
    :cond_0
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "Cannot locate antRun script: No project provided"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1068
    :cond_1
    const-string/jumbo v4, "ant.home"

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1069
    .local v0, "antHome":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 1070
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "Cannot locate antRun script: Property \'ant.home\' not found"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1073
    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->access$200()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;->myScript:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1078
    .local v1, "antRun":Ljava/lang/String;
    move-object v2, p4

    .line 1079
    .local v2, "commandDir":Ljava/io/File;
    if-nez p4, :cond_3

    .line 1080
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v2

    .line 1082
    :cond_3
    array-length v4, p2

    add-int/lit8 v4, v4, 0x2

    new-array v3, v4, [Ljava/lang/String;

    .line 1083
    .local v3, "newcmd":[Ljava/lang/String;
    aput-object v1, v3, v8

    .line 1084
    const/4 v4, 0x1

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1085
    const/4 v4, 0x2

    array-length v5, p2

    invoke-static {p2, v8, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1087
    invoke-virtual {p0, p1, v3, p3}, Lorg/apache/tools/ant/taskdefs/Execute$ScriptCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    goto :goto_0
.end method
