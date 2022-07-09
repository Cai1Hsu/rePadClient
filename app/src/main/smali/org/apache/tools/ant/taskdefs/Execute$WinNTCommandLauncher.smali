.class Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WinNTCommandLauncher"
.end annotation


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V
    .locals 0
    .param p1, "launcher"    # Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .prologue
    .line 961
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    .line 962
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 6
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
    const/4 v5, 0x0

    .line 977
    move-object v0, p4

    .line 978
    .local v0, "commandDir":Ljava/io/File;
    if-nez p4, :cond_0

    .line 979
    if-eqz p1, :cond_1

    .line 980
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 987
    :cond_0
    const/4 v2, 0x6

    .line 988
    .local v2, "preCmdLength":I
    array-length v3, p2

    add-int/lit8 v3, v3, 0x6

    new-array v1, v3, [Ljava/lang/String;

    .line 990
    .local v1, "newcmd":[Ljava/lang/String;
    const-string/jumbo v3, "cmd"

    aput-object v3, v1, v5

    .line 991
    const/4 v3, 0x1

    const-string/jumbo v4, "/c"

    aput-object v4, v1, v3

    .line 992
    const/4 v3, 0x2

    const-string/jumbo v4, "cd"

    aput-object v4, v1, v3

    .line 993
    const/4 v3, 0x3

    const-string/jumbo v4, "/d"

    aput-object v4, v1, v3

    .line 994
    const/4 v3, 0x4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 995
    const/4 v3, 0x5

    const-string/jumbo v4, "&&"

    aput-object v4, v1, v3

    .line 997
    const/4 v3, 0x6

    array-length v4, p2

    invoke-static {p2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 999
    invoke-virtual {p0, p1, v1, p3}, Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .end local v1    # "newcmd":[Ljava/lang/String;
    .end local v2    # "preCmdLength":I
    :goto_0
    return-object v3

    .line 982
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$WinNTCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    goto :goto_0
.end method
