.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;
.super Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;
.source "JasperC.java"


# instance fields
.field mangler:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;)V
    .locals 0
    .param p1, "mangler"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->mangler:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;

    .line 54
    return-void
.end method

.method private getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 155
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 156
    .local v0, "p":Lorg/apache/tools/ant/types/Path;
    if-nez v0, :cond_0

    .line 157
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    .end local v0    # "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 158
    .restart local v0    # "p":Lorg/apache/tools/ant/types/Path;
    const-string/jumbo v1, "only"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 160
    :goto_0
    return-object v1

    :cond_0
    const-string/jumbo v1, "ignore"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    goto :goto_0
.end method

.method private isTomcat5x()Z
    .locals 4

    .prologue
    .line 168
    const/4 v1, 0x0

    .line 170
    .local v1, "l":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v1

    .line 171
    const-string/jumbo v2, "org.apache.jasper.tagplugins.jstl.If"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    const/4 v2, 0x1

    .line 176
    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_0
    :goto_0
    return v2

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const/4 v2, 0x0

    .line 176
    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 176
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    .line 177
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_1
    throw v2
.end method

.method private setupJasperCommand()Lorg/apache/tools/ant/types/CommandlineJava;
    .locals 5

    .prologue
    .line 112
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava;-><init>()V

    .line 113
    .local v0, "cmd":Lorg/apache/tools/ant/types/CommandlineJava;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v2

    .line 114
    .local v2, "jspc":Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;
    const-string/jumbo v3, "-d"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getDestdir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 115
    const-string/jumbo v3, "-p"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getPackage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->isTomcat5x()Z

    move-result v3

    if-nez v3, :cond_2

    .line 118
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-v"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getVerbose()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    .line 125
    :goto_0
    const-string/jumbo v3, "-uriroot"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getUriroot()Ljava/io/File;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 126
    const-string/jumbo v3, "-uribase"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getUribase()Ljava/io/File;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 127
    const-string/jumbo v3, "-ieplugin"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getIeplugin()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-string/jumbo v3, "-webinc"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getWebinc()Ljava/io/File;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 129
    const-string/jumbo v3, "-webxml"

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getWebxml()Ljava/io/File;

    move-result-object v4

    invoke-virtual {p0, v0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 130
    const-string/jumbo v3, "-die9"

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    .line 132
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->isMapped()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 133
    const-string/jumbo v3, "-mapped"

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    .line 135
    :cond_0
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getWebApp()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 136
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getWebApp()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;->getDirectory()Ljava/io/File;

    move-result-object v1

    .line 137
    .local v1, "dir":Ljava/io/File;
    const-string/jumbo v3, "-webapp"

    invoke-virtual {p0, v0, v3, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V

    .line 139
    .end local v1    # "dir":Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getCompileList()Ljava/util/Vector;

    move-result-object v4

    invoke-virtual {p0, v3, v4, v0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->logAndAddFilesToCompile(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;Ljava/util/Vector;Lorg/apache/tools/ant/types/CommandlineJava;)V

    .line 140
    return-object v0

    .line 120
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    const-string/jumbo v4, "this task doesn\'t support Tomcat 5.x properly, please use the Tomcat provided jspc task instead"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public createMangler()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->mangler:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;

    return-object v0
.end method

.method public execute()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 63
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v6

    const-string/jumbo v7, "Using jasper compiler"

    const/4 v8, 0x3

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 64
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->setupJasperCommand()Lorg/apache/tools/ant/types/CommandlineJava;

    move-result-object v1

    .line 69
    .local v1, "cmd":Lorg/apache/tools/ant/types/CommandlineJava;
    :try_start_0
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Java;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->owner:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    invoke-direct {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 70
    .local v4, "java":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    .line 71
    .local v5, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "using user supplied classpath: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 78
    :goto_0
    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setDir(Ljava/io/File;)V

    .line 80
    const-string/jumbo v6, "org.apache.jasper.JspC"

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 82
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/CommandlineJava;->getJavaCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "args":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v6, v0

    if-ge v3, v6, :cond_1

    .line 84
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    aget-object v7, v0, v3

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 83
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 75
    .end local v0    # "args":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "using system classpath: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 93
    .end local v4    # "java":Lorg/apache/tools/ant/taskdefs/Java;
    .end local v5    # "p":Lorg/apache/tools/ant/types/Path;
    :catch_0
    move-exception v2

    .line 94
    .local v2, "ex":Ljava/lang/Exception;
    :try_start_1
    instance-of v6, v2, Lorg/apache/tools/ant/BuildException;

    if-eqz v6, :cond_2

    .line 95
    check-cast v2, Lorg/apache/tools/ant/BuildException;

    .end local v2    # "ex":Ljava/lang/Exception;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    :catchall_0
    move-exception v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->deleteEmptyJavaFiles()V

    throw v6

    .line 86
    .restart local v0    # "args":[Ljava/lang/String;
    .restart local v3    # "i":I
    .restart local v4    # "java":Lorg/apache/tools/ant/taskdefs/Java;
    .restart local v5    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getFailonerror()Z

    move-result v6

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setFailonerror(Z)V

    .line 89
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 90
    const-string/jumbo v6, "jasperc"

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Java;->setTaskName(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 101
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->deleteEmptyJavaFiles()V

    return v9

    .line 97
    .end local v0    # "args":[Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "java":Lorg/apache/tools/ant/taskdefs/Java;
    .end local v5    # "p":Lorg/apache/tools/ant/types/Path;
    .restart local v2    # "ex":Ljava/lang/Exception;
    :cond_2
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Error running jsp compiler: "

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v2, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
