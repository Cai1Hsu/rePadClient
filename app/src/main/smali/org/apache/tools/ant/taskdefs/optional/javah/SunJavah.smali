.class public Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;
.super Ljava/lang/Object;
.source "SunJavah.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;


# static fields
.field public static final IMPLEMENTATION_NAME:Ljava/lang/String; = "sun"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private setupJavahCommand(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Lorg/apache/tools/ant/types/Commandline;
    .locals 5
    .param p1, "javah"    # Lorg/apache/tools/ant/taskdefs/optional/Javah;

    .prologue
    .line 73
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 75
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getDestdir()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 76
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-d"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 77
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getDestdir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 80
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOutputfile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 81
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-o"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOutputfile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 85
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 86
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-classpath"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 87
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 90
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getVerbose()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 91
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-verbose"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 93
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOld()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 94
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-old"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 96
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getForce()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 97
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-force"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 99
    :cond_5
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getStubs()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getOld()Z

    move-result v2

    if-nez v2, :cond_6

    .line 100
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "stubs only available in old mode."

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 104
    :cond_6
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getStubs()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 105
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-stubs"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 107
    :cond_7
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 108
    .local v0, "bcp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 109
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 111
    :cond_8
    const-string/jumbo v2, "ignore"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 112
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v2

    if-lez v2, :cond_9

    .line 113
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-bootclasspath"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 114
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 117
    :cond_9
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getCurrentArgs()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline;->addArguments([Ljava/lang/String;)V

    .line 119
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->logAndAddFiles(Lorg/apache/tools/ant/types/Commandline;)V

    .line 120
    return-object v1
.end method


# virtual methods
.method public compile(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Z
    .locals 9
    .param p1, "javah"    # Lorg/apache/tools/ant/taskdefs/optional/Javah;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;->setupJavahCommand(Lorg/apache/tools/ant/taskdefs/optional/Javah;)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 49
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/ExecuteJava;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;-><init>()V

    .line 50
    .local v3, "ej":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    const/4 v0, 0x0

    .line 54
    .local v0, "c":Ljava/lang/Class;
    :try_start_0
    const-string/jumbo v6, "com.sun.tools.javah.oldjavah.Main"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 63
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 64
    invoke-virtual {v3, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 65
    invoke-static {v0}, Lorg/apache/tools/ant/launch/Locator;->getClassSource(Ljava/lang/Class;)Ljava/io/File;

    move-result-object v5

    .line 66
    .local v5, "f":Ljava/io/File;
    if-eqz v5, :cond_0

    .line 67
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 69
    :cond_0
    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->fork(Lorg/apache/tools/ant/ProjectComponent;)I

    move-result v6

    if-nez v6, :cond_1

    const/4 v6, 0x1

    :goto_1
    return v6

    .line 55
    .end local v5    # "f":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 57
    .local v2, "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_1
    const-string/jumbo v6, "com.sun.tools.javah.Main"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    .line 59
    :catch_1
    move-exception v4

    .line 60
    .local v4, "ex":Ljava/lang/ClassNotFoundException;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Can\'t load javah"

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/Javah;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v4, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 69
    .end local v2    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v4    # "ex":Ljava/lang/ClassNotFoundException;
    .restart local v5    # "f":Ljava/io/File;
    :cond_1
    const/4 v6, 0x0

    goto :goto_1
.end method
