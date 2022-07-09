.class public Lorg/apache/tools/ant/taskdefs/optional/javah/Kaffeh;
.super Ljava/lang/Object;
.source "Kaffeh.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;


# static fields
.field public static final IMPLEMENTATION_NAME:Ljava/lang/String; = "kaffeh"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private setupKaffehCommand(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Lorg/apache/tools/ant/types/Commandline;
    .locals 4
    .param p1, "javah"    # Lorg/apache/tools/ant/taskdefs/optional/Javah;

    .prologue
    .line 58
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 59
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    const-string/jumbo v2, "kaffeh"

    invoke-static {v2}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getDestdir()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 62
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-d"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getDestdir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 66
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOutputfile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 67
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-o"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOutputfile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 71
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 72
    .local v1, "cp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 73
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 75
    :cond_2
    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 76
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 77
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 79
    :cond_3
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v2

    if-lez v2, :cond_4

    .line 80
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-classpath"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 84
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOld()Z

    move-result v2

    if-nez v2, :cond_5

    .line 85
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-jni"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 88
    :cond_5
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getCurrentArgs()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->addArguments([Ljava/lang/String;)V

    .line 90
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->logAndAddFiles(Lorg/apache/tools/ant/types/Commandline;)V

    .line 91
    return-object v0
.end method


# virtual methods
.method public compile(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Z
    .locals 4
    .param p1, "javah"    # Lorg/apache/tools/ant/taskdefs/optional/Javah;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/javah/Kaffeh;->setupKaffehCommand(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 47
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->runCommand(Lorg/apache/tools/ant/Task;[Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    const/4 v2, 0x1

    .line 54
    :goto_0
    return v2

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "failed with return code"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 51
    throw v1

    .line 54
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
