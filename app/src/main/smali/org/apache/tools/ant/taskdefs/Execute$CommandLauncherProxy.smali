.class Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CommandLauncherProxy"
.end annotation


# instance fields
.field private myLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;)V
    .locals 1
    .param p1, "launcher"    # Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .prologue
    .line 880
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    .line 881
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;->myLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    .line 882
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "cmd"    # [Ljava/lang/String;
    .param p3, "env"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 896
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncherProxy;->myLauncher:Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    return-object v0
.end method
