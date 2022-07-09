.class Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
.super Ljava/lang/Object;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CommandLauncher"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 790
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/Execute$1;

    .prologue
    .line 790
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>()V

    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "cmd"    # [Ljava/lang/String;
    .param p3, "env"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 804
    if-eqz p1, :cond_0

    .line 805
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Execute:CommandLauncher: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 808
    :cond_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    return-object v0
.end method

.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 2
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
    .line 826
    if-nez p4, :cond_0

    .line 827
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    return-object v0

    .line 829
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Cannot execute a process in different directory under this JVM"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
