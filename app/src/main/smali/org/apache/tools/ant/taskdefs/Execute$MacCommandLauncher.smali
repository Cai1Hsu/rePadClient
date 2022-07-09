.class Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MacCommandLauncher"
.end annotation


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V
    .locals 0
    .param p1, "launcher"    # Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .prologue
    .line 1009
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V

    .line 1010
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 4
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
    .line 1025
    if-nez p4, :cond_0

    .line 1026
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 1032
    :goto_0
    return-object v0

    .line 1028
    :cond_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    const-string/jumbo v1, "user.dir"

    invoke-virtual {p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1030
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$MacCommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1032
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    const-string/jumbo v2, "user.dir"

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->access$100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    const-string/jumbo v2, "user.dir"

    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->access$100()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    throw v0
.end method
