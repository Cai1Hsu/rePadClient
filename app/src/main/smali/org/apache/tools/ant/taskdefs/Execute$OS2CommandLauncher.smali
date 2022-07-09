.class Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OS2CommandLauncher"
.end annotation


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V
    .locals 0
    .param p1, "launcher"    # Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .prologue
    .line 910
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    .line 911
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 8
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
    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 926
    move-object v1, p4

    .line 927
    .local v1, "commandDir":Ljava/io/File;
    if-nez p4, :cond_0

    .line 928
    if-eqz p1, :cond_1

    .line 929
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    .line 936
    :cond_0
    const/4 v3, 0x7

    .line 937
    .local v3, "preCmdLength":I
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 938
    .local v0, "cmdDir":Ljava/lang/String;
    array-length v4, p2

    add-int/lit8 v4, v4, 0x7

    new-array v2, v4, [Ljava/lang/String;

    .line 940
    .local v2, "newcmd":[Ljava/lang/String;
    const-string/jumbo v4, "cmd"

    aput-object v4, v2, v6

    .line 941
    const/4 v4, 0x1

    const-string/jumbo v5, "/c"

    aput-object v5, v2, v4

    .line 942
    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v7

    .line 943
    const/4 v4, 0x3

    const-string/jumbo v5, "&&"

    aput-object v5, v2, v4

    .line 944
    const/4 v4, 0x4

    const-string/jumbo v5, "cd"

    aput-object v5, v2, v4

    .line 945
    const/4 v4, 0x5

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 946
    const/4 v4, 0x6

    const-string/jumbo v5, "&&"

    aput-object v5, v2, v4

    .line 948
    const/4 v4, 0x7

    array-length v5, p2

    invoke-static {p2, v6, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 950
    invoke-virtual {p0, p1, v2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    .end local v0    # "cmdDir":Ljava/lang/String;
    .end local v2    # "newcmd":[Ljava/lang/String;
    .end local v3    # "preCmdLength":I
    :goto_0
    return-object v4

    .line 931
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$OS2CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v4

    goto :goto_0
.end method
