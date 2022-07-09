.class Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Java13CommandLauncher"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 840
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Execute$CommandLauncher;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$1;)V

    .line 842
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
    .line 858
    if-eqz p1, :cond_0

    .line 859
    :try_start_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Execute:Java13CommandLauncher: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-static {p2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 862
    :cond_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2, p2, p3, p4}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    return-object v2

    .line 863
    :catch_0
    move-exception v1

    .line 864
    .local v1, "ioex":Ljava/io/IOException;
    throw v1

    .line 865
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 867
    .local v0, "exc":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Unable to execute command"

    invoke-direct {v2, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
