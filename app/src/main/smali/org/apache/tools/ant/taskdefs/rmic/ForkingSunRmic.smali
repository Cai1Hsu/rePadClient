.class public Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;
.super Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.source "ForkingSunRmic.java"


# static fields
.field public static final COMPILER_NAME:Ljava/lang/String; = "forking"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    .line 55
    .local v5, "owner":Lorg/apache/tools/ant/taskdefs/Rmic;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;->setupRmicCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 56
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    .line 57
    .local v6, "project":Lorg/apache/tools/ant/Project;
    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getExecutable()Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "executable":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;->getExecutableName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 63
    :cond_0
    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "args":[Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v8, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v9, 0x2

    const/4 v10, 0x1

    invoke-direct {v8, v5, v9, v10}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v3, v8}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 72
    .local v3, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 73
    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v3, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 74
    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 75
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    .line 76
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-nez v8, :cond_1

    :goto_0
    return v7

    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 77
    .end local v3    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v2

    .line 78
    .local v2, "exception":Ljava/io/IOException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Error running "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;->getExecutableName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " -maybe it is not on the path"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method protected getExecutableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    const-string/jumbo v0, "rmic"

    return-object v0
.end method
