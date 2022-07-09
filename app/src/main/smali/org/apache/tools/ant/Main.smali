.class public Lorg/apache/tools/ant/Main;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements Lorg/apache/tools/ant/launch/AntMain;


# static fields
.field public static final DEFAULT_BUILD_FILENAME:Ljava/lang/String; = "build.xml"

.field private static final LAUNCH_COMMANDS:Ljava/util/Set;

.field private static antVersion:Ljava/lang/String;

.field static class$org$apache$tools$ant$BuildListener:Ljava/lang/Class;

.field static class$org$apache$tools$ant$BuildLogger:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Main:Ljava/lang/Class;

.field static class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

.field private static err:Ljava/io/PrintStream;

.field private static isLogFileUsed:Z

.field private static out:Ljava/io/PrintStream;


# instance fields
.field private allowInput:Z

.field private buildFile:Ljava/io/File;

.field private definedProps:Ljava/util/Properties;

.field private emacsMode:Z

.field private inputHandlerClassname:Ljava/lang/String;

.field private keepGoingMode:Z

.field private listeners:Ljava/util/Vector;

.field private loggerClassname:Ljava/lang/String;

.field private msgOutputLevel:I

.field private projectHelp:Z

.field private propertyFiles:Ljava/util/Vector;

.field private proxy:Z

.field private readyToRun:Z

.field private targets:Ljava/util/Vector;

.field private threadPriority:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    .line 64
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "-lib"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 65
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "-cp"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 66
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "-noclasspath"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 67
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "--noclasspath"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "-nouserlib"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 69
    sget-object v0, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    const-string/jumbo v1, "-main"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 82
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sput-object v0, Lorg/apache/tools/ant/Main;->out:Ljava/io/PrintStream;

    .line 85
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    sput-object v0, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    .line 139
    const/4 v0, 0x0

    sput-boolean v0, Lorg/apache/tools/ant/Main;->isLogFileUsed:Z

    .line 993
    const/4 v0, 0x0

    sput-object v0, Lorg/apache/tools/ant/Main;->antVersion:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 275
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    .line 88
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    .line 91
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    .line 94
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->listeners:Ljava/util/Vector;

    .line 97
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->propertyFiles:Ljava/util/Vector;

    .line 100
    iput-boolean v2, p0, Lorg/apache/tools/ant/Main;->allowInput:Z

    .line 103
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->keepGoingMode:Z

    .line 110
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    .line 116
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;

    .line 121
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->emacsMode:Z

    .line 127
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->readyToRun:Z

    .line 133
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    .line 144
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    .line 149
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->proxy:Z

    .line 276
    return-void
.end method

.method protected constructor <init>([Ljava/lang/String;)V
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    .line 88
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    .line 91
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    .line 94
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->listeners:Ljava/util/Vector;

    .line 97
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v2}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/Main;->propertyFiles:Ljava/util/Vector;

    .line 100
    iput-boolean v2, p0, Lorg/apache/tools/ant/Main;->allowInput:Z

    .line 103
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->keepGoingMode:Z

    .line 110
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    .line 116
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;

    .line 121
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->emacsMode:Z

    .line 127
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->readyToRun:Z

    .line 133
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    .line 144
    iput-object v3, p0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    .line 149
    iput-boolean v1, p0, Lorg/apache/tools/ant/Main;->proxy:Z

    .line 290
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/Main;->processArgs([Ljava/lang/String;)V

    .line 291
    return-void
.end method

.method private addInputHandler(Lorg/apache/tools/ant/Project;)V
    .locals 4
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 885
    const/4 v0, 0x0

    .line 886
    .local v0, "handler":Lorg/apache/tools/ant/input/InputHandler;
    iget-object v1, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 887
    new-instance v0, Lorg/apache/tools/ant/input/DefaultInputHandler;

    .end local v0    # "handler":Lorg/apache/tools/ant/input/InputHandler;
    invoke-direct {v0}, Lorg/apache/tools/ant/input/DefaultInputHandler;-><init>()V

    .line 894
    .restart local v0    # "handler":Lorg/apache/tools/ant/input/InputHandler;
    :goto_0
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->setInputHandler(Lorg/apache/tools/ant/input/InputHandler;)V

    .line 895
    return-void

    .line 889
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;

    sget-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.Main"

    invoke-static {v1}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    sget-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.tools.ant.input.InputHandler"

    invoke-static {v1}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    :goto_2
    invoke-static {v2, v3, v1}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "handler":Lorg/apache/tools/ant/input/InputHandler;
    check-cast v0, Lorg/apache/tools/ant/input/InputHandler;

    .line 892
    .restart local v0    # "handler":Lorg/apache/tools/ant/input/InputHandler;
    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    goto :goto_0

    .line 889
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto :goto_1

    :cond_2
    sget-object v1, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$input$InputHandler:Ljava/lang/Class;

    goto :goto_2
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 869
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private createLogger()Lorg/apache/tools/ant/BuildLogger;
    .locals 5

    .prologue
    .line 908
    const/4 v1, 0x0

    .line 909
    .local v1, "logger":Lorg/apache/tools/ant/BuildLogger;
    iget-object v2, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 911
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    sget-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "org.apache.tools.ant.Main"

    invoke-static {v2}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    sget-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildLogger:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "org.apache.tools.ant.BuildLogger"

    invoke-static {v2}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildLogger:Ljava/lang/Class;

    :goto_1
    invoke-static {v3, v4, v2}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    check-cast v1, Lorg/apache/tools/ant/BuildLogger;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 924
    .restart local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    :goto_2
    iget v2, p0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    invoke-interface {v1, v2}, Lorg/apache/tools/ant/BuildLogger;->setMessageOutputLevel(I)V

    .line 925
    sget-object v2, Lorg/apache/tools/ant/Main;->out:Ljava/io/PrintStream;

    invoke-interface {v1, v2}, Lorg/apache/tools/ant/BuildLogger;->setOutputPrintStream(Ljava/io/PrintStream;)V

    .line 926
    sget-object v2, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    invoke-interface {v1, v2}, Lorg/apache/tools/ant/BuildLogger;->setErrorPrintStream(Ljava/io/PrintStream;)V

    .line 927
    iget-boolean v2, p0, Lorg/apache/tools/ant/Main;->emacsMode:Z

    invoke-interface {v1, v2}, Lorg/apache/tools/ant/BuildLogger;->setEmacsMode(Z)V

    .line 929
    return-object v1

    .line 911
    :cond_0
    :try_start_1
    sget-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v2, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildLogger:Ljava/lang/Class;
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 914
    .end local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    :catch_0
    move-exception v0

    .line 915
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "The specified logger class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " could not be used because "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 918
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2}, Ljava/lang/RuntimeException;-><init>()V

    throw v2

    .line 921
    .end local v0    # "e":Lorg/apache/tools/ant/BuildException;
    .restart local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    :cond_2
    new-instance v1, Lorg/apache/tools/ant/DefaultLogger;

    .end local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    invoke-direct {v1}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .restart local v1    # "logger":Lorg/apache/tools/ant/BuildLogger;
    goto :goto_2
.end method

.method private findBuildFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 5
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;

    .prologue
    .line 675
    iget v2, p0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    const/4 v3, 0x2

    if-lt v2, v3, :cond_0

    .line 676
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Searching for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " ..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 679
    :cond_0
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 680
    .local v1, "parent":Ljava/io/File;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 683
    .local v0, "file":Ljava/io/File;
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 685
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/Main;->getParentFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 689
    if-nez v1, :cond_2

    .line 690
    const/4 v0, 0x0

    .line 697
    .end local v0    # "file":Ljava/io/File;
    :cond_1
    return-object v0

    .line 694
    .restart local v0    # "file":Ljava/io/File;
    :cond_2
    new-instance v0, Ljava/io/File;

    .end local v0    # "file":Ljava/io/File;
    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v0    # "file":Ljava/io/File;
    goto :goto_0
.end method

.method private static findTargetPosition(Ljava/util/Vector;Ljava/lang/String;)I
    .locals 4
    .param p0, "names"    # Ljava/util/Vector;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1158
    invoke-virtual {p0}, Ljava/util/Vector;->size()I

    move-result v2

    .line 1159
    .local v2, "size":I
    move v1, v2

    .line 1160
    .local v1, "res":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    if-ne v1, v2, :cond_1

    .line 1161
    invoke-virtual {p0, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_0

    .line 1162
    move v1, v0

    .line 1160
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1165
    :cond_1
    return v1
.end method

.method public static declared-synchronized getAntVersion()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1006
    const-class v6, Lorg/apache/tools/ant/Main;

    monitor-enter v6

    :try_start_0
    sget-object v5, Lorg/apache/tools/ant/Main;->antVersion:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v5, :cond_0

    .line 1008
    :try_start_1
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 1009
    .local v4, "props":Ljava/util/Properties;
    sget-object v5, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v5, :cond_1

    const-string/jumbo v5, "org.apache.tools.ant.Main"

    invoke-static {v5}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_0
    const-string/jumbo v7, "/org/apache/tools/ant/version.txt"

    invoke-virtual {v5, v7}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 1011
    .local v0, "in":Ljava/io/InputStream;
    invoke-virtual {v4, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 1012
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1014
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 1015
    .local v2, "msg":Ljava/lang/StringBuffer;
    const-string/jumbo v5, "Apache Ant(TM) version "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1016
    const-string/jumbo v5, "VERSION"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1017
    const-string/jumbo v5, " compiled on "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1018
    const-string/jumbo v5, "DATE"

    invoke-virtual {v4, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1019
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/Main;->antVersion:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1027
    :cond_0
    :try_start_2
    sget-object v5, Lorg/apache/tools/ant/Main;->antVersion:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v6

    return-object v5

    .line 1009
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v2    # "msg":Ljava/lang/StringBuffer;
    :cond_1
    :try_start_3
    sget-object v5, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1020
    :catch_0
    move-exception v1

    .line 1021
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_4
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Could not load the version information:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1006
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5

    .line 1023
    :catch_1
    move-exception v3

    .line 1024
    .local v3, "npe":Ljava/lang/NullPointerException;
    :try_start_5
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Could not load the version information."

    invoke-direct {v5, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method private getParentFile(Ljava/io/File;)Ljava/io/File;
    .locals 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 650
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 652
    .local v0, "parent":Ljava/io/File;
    if-eqz v0, :cond_0

    iget v1, p0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_0

    .line 653
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Searching in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 656
    :cond_0
    return-object v0
.end method

.method private handleArgBuildFile([Ljava/lang/String;I)I
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 491
    :try_start_0
    new-instance v1, Ljava/io/File;

    add-int/lit8 p2, p2, 0x1

    aget-object v2, p1, p2

    const/16 v3, 0x2f

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 497
    return p2

    .line 493
    :catch_0
    move-exception v0

    .line 494
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "You must specify a buildfile when using the -buildfile argument"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private handleArgDefine([Ljava/lang/String;I)I
    .locals 7
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "argPos"    # I

    .prologue
    .line 525
    aget-object v0, p1, p2

    .line 526
    .local v0, "arg":Ljava/lang/String;
    const/4 v4, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 527
    .local v1, "name":Ljava/lang/String;
    const/4 v3, 0x0

    .line 528
    .local v3, "value":Ljava/lang/String;
    const-string/jumbo v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 529
    .local v2, "posEq":I
    if-lez v2, :cond_0

    .line 530
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 531
    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 538
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    invoke-virtual {v4, v1, v3}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    return p2

    .line 532
    :cond_0
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    if-ge p2, v4, :cond_1

    .line 533
    add-int/lit8 p2, p2, 0x1

    aget-object v3, p1, p2

    goto :goto_0

    .line 535
    :cond_1
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Missing value for property "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private handleArgInputHandler([Ljava/lang/String;I)I
    .locals 3
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 559
    iget-object v1, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 560
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Only one input handler class may be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 564
    :cond_0
    add-int/lit8 p2, p2, 0x1

    :try_start_0
    aget-object v1, p1, p2

    iput-object v1, p0, Lorg/apache/tools/ant/Main;->inputHandlerClassname:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 570
    return p2

    .line 565
    :catch_0
    move-exception v0

    .line 566
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "You must specify a classname when using the -inputhandler argument"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private handleArgListener([Ljava/lang/String;I)I
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 503
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/Main;->listeners:Ljava/util/Vector;

    add-int/lit8 v3, p2, 0x1

    aget-object v3, p1, v3

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 504
    add-int/lit8 p2, p2, 0x1

    .line 510
    return p2

    .line 505
    :catch_0
    move-exception v0

    .line 506
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string/jumbo v1, "You must specify a classname when using the -listener argument"

    .line 508
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private handleArgLogger([Ljava/lang/String;I)I
    .locals 3
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 544
    iget-object v1, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 545
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Only one logger class may be specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 549
    :cond_0
    add-int/lit8 p2, p2, 0x1

    :try_start_0
    aget-object v1, p1, p2

    iput-object v1, p0, Lorg/apache/tools/ant/Main;->loggerClassname:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 554
    return p2

    .line 550
    :catch_0
    move-exception v0

    .line 551
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "You must specify a classname when using the -logger argument"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private handleArgNice([Ljava/lang/String;I)I
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 588
    add-int/lit8 p2, p2, 0x1

    :try_start_0
    aget-object v2, p1, p2

    invoke-static {v2}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 598
    iget-object v2, p0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-lt v2, v3, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xa

    if-le v2, v3, :cond_1

    .line 600
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Niceness value is out of the range 1-10"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 589
    :catch_0
    move-exception v0

    .line 590
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "You must supply a niceness value (1-10) after the -nice option"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 593
    .end local v0    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    :catch_1
    move-exception v1

    .line 594
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unrecognized niceness value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v4, p1, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 603
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    return p2
.end method

.method private handleArgPropertyFile([Ljava/lang/String;I)I
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "pos"    # I

    .prologue
    .line 576
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/Main;->propertyFiles:Ljava/util/Vector;

    add-int/lit8 p2, p2, 0x1

    aget-object v3, p1, p2

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 582
    return p2

    .line 577
    :catch_0
    move-exception v0

    .line 578
    .local v0, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    const-string/jumbo v1, "You must specify a property filename when using the -propertyfile argument"

    .line 580
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static handleLogfile()V
    .locals 1

    .prologue
    .line 254
    sget-boolean v0, Lorg/apache/tools/ant/Main;->isLogFileUsed:Z

    if-eqz v0, :cond_0

    .line 255
    sget-object v0, Lorg/apache/tools/ant/Main;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 256
    sget-object v0, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 258
    :cond_0
    return-void
.end method

.method private loadPropertyFiles()V
    .locals 11

    .prologue
    .line 612
    const/4 v5, 0x0

    .line 613
    .local v5, "propertyFileIndex":I
    :goto_0
    iget-object v8, p0, Lorg/apache/tools/ant/Main;->propertyFiles:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v8

    if-ge v5, v8, :cond_2

    .line 615
    iget-object v8, p0, Lorg/apache/tools/ant/Main;->propertyFiles:Ljava/util/Vector;

    invoke-virtual {v8, v5}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 617
    .local v1, "filename":Ljava/lang/String;
    new-instance v7, Ljava/util/Properties;

    invoke-direct {v7}, Ljava/util/Properties;-><init>()V

    .line 618
    .local v7, "props":Ljava/util/Properties;
    const/4 v2, 0x0

    .line 620
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 621
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {v7, v3}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 626
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    move-object v2, v3

    .line 630
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :goto_1
    invoke-virtual {v7}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v6

    .line 631
    .local v6, "propertyNames":Ljava/util/Enumeration;
    :cond_0
    :goto_2
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 632
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 633
    .local v4, "name":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    invoke-virtual {v8, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_0

    .line 634
    iget-object v8, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    invoke-virtual {v7, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v4, v9}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 622
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "propertyNames":Ljava/util/Enumeration;
    :catch_0
    move-exception v0

    .line 623
    .local v0, "e":Ljava/io/IOException;
    :goto_3
    :try_start_2
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Could not load property file "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 626
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_1

    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_4
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v8

    .line 614
    .restart local v6    # "propertyNames":Ljava/util/Enumeration;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 638
    .end local v1    # "filename":Ljava/lang/String;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "propertyNames":Ljava/util/Enumeration;
    .end local v7    # "props":Ljava/util/Properties;
    :cond_2
    return-void

    .line 626
    .restart local v1    # "filename":Ljava/lang/String;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v7    # "props":Ljava/util/Properties;
    :catchall_1
    move-exception v8

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_4

    .line 622
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3
.end method

.method public static main([Ljava/lang/String;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 268
    invoke-static {p0, v0, v0}, Lorg/apache/tools/ant/Main;->start([Ljava/lang/String;Ljava/util/Properties;Ljava/lang/ClassLoader;)V

    .line 269
    return-void
.end method

.method private static printDescription(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 1038
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getDescription()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1039
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    .line 1041
    :cond_0
    return-void
.end method

.method private static printMessage(Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 159
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "message":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 161
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 163
    :cond_0
    return-void
.end method

.method private static printTargets(Lorg/apache/tools/ant/Project;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;Ljava/lang/String;I)V
    .locals 8
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "names"    # Ljava/util/Vector;
    .param p2, "descriptions"    # Ljava/util/Vector;
    .param p3, "dependencies"    # Ljava/util/Vector;
    .param p4, "heading"    # Ljava/lang/String;
    .param p5, "maxlen"    # I

    .prologue
    .line 1196
    const-string/jumbo v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1198
    .local v2, "lSep":Ljava/lang/String;
    const-string/jumbo v5, "    "

    .line 1199
    .local v5, "spaces":Ljava/lang/String;
    :goto_0
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-gt v6, p5, :cond_0

    .line 1200
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 1202
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 1203
    .local v3, "msg":Ljava/lang/StringBuffer;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1204
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v4

    .line 1205
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v4, :cond_5

    .line 1206
    const-string/jumbo v6, " "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1207
    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 1208
    if-eqz p2, :cond_1

    .line 1209
    const/4 v7, 0x0

    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v6, p5, v6

    add-int/lit8 v6, v6, 0x2

    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1211
    invoke-virtual {p2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 1213
    :cond_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1214
    invoke-virtual {p3}, Ljava/util/Vector;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 1215
    invoke-virtual {p3, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Enumeration;

    .line 1216
    .local v0, "deps":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1217
    const-string/jumbo v6, "   depends on: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1218
    :cond_2
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1219
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 1220
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1221
    const-string/jumbo v6, ", "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1224
    :cond_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1205
    .end local v0    # "deps":Ljava/util/Enumeration;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1228
    :cond_5
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 1229
    return-void
.end method

.method private static printTargets(Lorg/apache/tools/ant/Project;ZZ)V
    .locals 21
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "printSubTargets"    # Z
    .param p2, "printDependencies"    # Z

    .prologue
    .line 1089
    const/4 v7, 0x0

    .line 1090
    .local v7, "maxLength":I
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/Main;->removeDuplicateTargets(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v18

    .line 1096
    .local v18, "ptargets":Ljava/util/Map;
    new-instance v3, Ljava/util/Vector;

    invoke-direct {v3}, Ljava/util/Vector;-><init>()V

    .line 1097
    .local v3, "topNames":Ljava/util/Vector;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 1098
    .local v4, "topDescriptions":Ljava/util/Vector;
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 1099
    .local v5, "topDependencies":Ljava/util/Vector;
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    .line 1100
    .local v9, "subNames":Ljava/util/Vector;
    new-instance v11, Ljava/util/Vector;

    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    .line 1102
    .local v11, "subDependencies":Ljava/util/Vector;
    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1103
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/apache/tools/ant/Target;

    .line 1104
    .local v14, "currentTarget":Lorg/apache/tools/ant/Target;
    invoke-virtual {v14}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v20

    .line 1105
    .local v20, "targetName":Ljava/lang/String;
    const-string/jumbo v2, ""

    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1108
    invoke-virtual {v14}, Lorg/apache/tools/ant/Target;->getDescription()Ljava/lang/String;

    move-result-object v19

    .line 1110
    .local v19, "targetDescription":Ljava/lang/String;
    if-nez v19, :cond_1

    .line 1111
    move-object/from16 v0, v20

    invoke-static {v9, v0}, Lorg/apache/tools/ant/Main;->findTargetPosition(Ljava/util/Vector;Ljava/lang/String;)I

    move-result v17

    .line 1112
    .local v17, "pos":I
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 1113
    if-eqz p2, :cond_0

    .line 1114
    invoke-virtual {v14}, Lorg/apache/tools/ant/Target;->getDependencies()Ljava/util/Enumeration;

    move-result-object v2

    move/from16 v0, v17

    invoke-virtual {v11, v2, v0}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    goto :goto_0

    .line 1117
    .end local v17    # "pos":I
    :cond_1
    move-object/from16 v0, v20

    invoke-static {v3, v0}, Lorg/apache/tools/ant/Main;->findTargetPosition(Ljava/util/Vector;Ljava/lang/String;)I

    move-result v17

    .line 1118
    .restart local v17    # "pos":I
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v3, v0, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 1119
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-virtual {v4, v0, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 1120
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v7, :cond_2

    .line 1121
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v7

    .line 1123
    :cond_2
    if-eqz p2, :cond_0

    .line 1124
    invoke-virtual {v14}, Lorg/apache/tools/ant/Target;->getDependencies()Ljava/util/Enumeration;

    move-result-object v2

    move/from16 v0, v17

    invoke-virtual {v5, v2, v0}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    goto :goto_0

    .line 1129
    .end local v14    # "currentTarget":Lorg/apache/tools/ant/Target;
    .end local v17    # "pos":I
    .end local v19    # "targetDescription":Ljava/lang/String;
    .end local v20    # "targetName":Ljava/lang/String;
    :cond_3
    const-string/jumbo v6, "Main targets:"

    move-object/from16 v2, p0

    invoke-static/range {v2 .. v7}, Lorg/apache/tools/ant/Main;->printTargets(Lorg/apache/tools/ant/Project;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;Ljava/lang/String;I)V

    .line 1133
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    if-nez v2, :cond_4

    .line 1134
    const/16 p1, 0x1

    .line 1136
    :cond_4
    if-eqz p1, :cond_5

    .line 1137
    const/4 v10, 0x0

    const-string/jumbo v12, "Other targets:"

    const/4 v13, 0x0

    move-object/from16 v8, p0

    invoke-static/range {v8 .. v13}, Lorg/apache/tools/ant/Main;->printTargets(Lorg/apache/tools/ant/Project;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;Ljava/lang/String;I)V

    .line 1140
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/Project;->getDefaultTarget()Ljava/lang/String;

    move-result-object v15

    .line 1141
    .local v15, "defaultTarget":Ljava/lang/String;
    if-eqz v15, :cond_6

    const-string/jumbo v2, ""

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 1143
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Default target: "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    .line 1145
    :cond_6
    return-void
.end method

.method private static printUsage()V
    .locals 4

    .prologue
    .line 936
    const-string/jumbo v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 937
    .local v0, "lSep":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 938
    .local v1, "msg":Ljava/lang/StringBuffer;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "ant [options] [target [target2 [target3] ...]]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 939
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Options: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 940
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -help, -h              print this message"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 941
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -projecthelp, -p       print project help information"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 942
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -version               print the version information and exit"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 943
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -diagnostics           print information that might be helpful to"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 944
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "                         diagnose or report problems."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 945
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -quiet, -q             be extra quiet"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 946
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -verbose, -v           be extra verbose"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 947
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -debug, -d             print debugging information"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 948
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -emacs, -e             produce logging information without adornments"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 950
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -lib <path>            specifies a path to search for jars and classes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 952
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -logfile <file>        use given file for log"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 953
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "    -l     <file>                \'\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 954
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -logger <classname>    the class which is to perform logging"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 955
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -listener <classname>  add an instance of class as a project listener"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 957
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -noinput               do not allow interactive input"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 958
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -buildfile <file>      use given buildfile"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 959
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "    -file    <file>              \'\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 960
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "    -f       <file>              \'\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 961
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -D<property>=<value>   use value for given property"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 962
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -keep-going, -k        execute all targets that do not depend"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 963
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "                         on failed target(s)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 964
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -propertyfile <name>   load all properties from file with -D"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 965
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "                         properties taking precedence"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 966
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -inputhandler <class>  the class which will handle input requests"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 967
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -find <file>           (s)earch for buildfile towards the root of"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 968
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "    -s  <file>           the filesystem and use it"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 969
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -nice  number          A niceness value for the main thread:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "                         1 (lowest) to 10 (highest); 5 is the default"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 972
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -nouserlib             Run ant without using the jar files from"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "                         ${user.home}/.ant/lib"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 974
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -noclasspath           Run ant without using CLASSPATH"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 975
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  -autoproxy             Java1.5+: use the OS proxy settings"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 977
    const-string/jumbo v2, "  -main <class>          override Ant\'s normal entry point"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 978
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 979
    return-void
.end method

.method private static printVersion(I)V
    .locals 2
    .param p0, "logLevel"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 987
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {}, Lorg/apache/tools/ant/Main;->getAntVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 988
    return-void
.end method

.method private processArgs([Ljava/lang/String;)V
    .locals 22
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 303
    const/16 v17, 0x0

    .line 304
    .local v17, "searchForThis":Ljava/lang/String;
    const/16 v16, 0x0

    .line 305
    .local v16, "searchForFile":Z
    const/4 v13, 0x0

    .line 309
    .local v13, "logTo":Ljava/io/PrintStream;
    const/4 v10, 0x0

    .line 310
    .local v10, "justPrintUsage":Z
    const/4 v11, 0x0

    .line 311
    .local v11, "justPrintVersion":Z
    const/4 v9, 0x0

    .line 313
    .local v9, "justPrintDiagnostics":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v6, v0, :cond_21

    .line 314
    aget-object v4, p1, v6

    .line 316
    .local v4, "arg":Ljava/lang/String;
    const-string/jumbo v19, "-help"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_0

    const-string/jumbo v19, "-h"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 317
    :cond_0
    const/4 v10, 0x1

    .line 313
    :cond_1
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 318
    :cond_2
    const-string/jumbo v19, "-version"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 319
    const/4 v11, 0x1

    goto :goto_1

    .line 320
    :cond_3
    const-string/jumbo v19, "-diagnostics"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 321
    const/4 v9, 0x1

    goto :goto_1

    .line 322
    :cond_4
    const-string/jumbo v19, "-quiet"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_5

    const-string/jumbo v19, "-q"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 323
    :cond_5
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    goto :goto_1

    .line 324
    :cond_6
    const-string/jumbo v19, "-verbose"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_7

    const-string/jumbo v19, "-v"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 325
    :cond_7
    const/16 v19, 0x3

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    goto :goto_1

    .line 326
    :cond_8
    const-string/jumbo v19, "-debug"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_9

    const-string/jumbo v19, "-d"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 327
    :cond_9
    const/16 v19, 0x4

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    goto :goto_1

    .line 328
    :cond_a
    const-string/jumbo v19, "-noinput"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_b

    .line 329
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->allowInput:Z

    goto/16 :goto_1

    .line 330
    :cond_b
    const-string/jumbo v19, "-logfile"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_c

    const-string/jumbo v19, "-l"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_d

    .line 332
    :cond_c
    :try_start_0
    new-instance v12, Ljava/io/File;

    add-int/lit8 v19, v6, 0x1

    aget-object v19, p1, v19

    move-object/from16 v0, v19

    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 333
    .local v12, "logFile":Ljava/io/File;
    add-int/lit8 v6, v6, 0x1

    .line 334
    new-instance v14, Ljava/io/PrintStream;

    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v19

    invoke-direct {v14, v0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1

    .line 335
    .end local v13    # "logTo":Ljava/io/PrintStream;
    .local v14, "logTo":Ljava/io/PrintStream;
    const/16 v19, 0x1

    :try_start_1
    sput-boolean v19, Lorg/apache/tools/ant/Main;->isLogFileUsed:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v13, v14

    .line 345
    .end local v14    # "logTo":Ljava/io/PrintStream;
    .restart local v13    # "logTo":Ljava/io/PrintStream;
    goto/16 :goto_1

    .line 336
    .end local v12    # "logFile":Ljava/io/File;
    :catch_0
    move-exception v7

    .line 337
    .local v7, "ioe":Ljava/io/IOException;
    :goto_2
    const-string/jumbo v15, "Cannot write on the specified log file. Make sure the path exists and you have write permissions."

    .line 340
    .local v15, "msg":Ljava/lang/String;
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 341
    .end local v7    # "ioe":Ljava/io/IOException;
    .end local v15    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 342
    .local v3, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    :goto_3
    const-string/jumbo v15, "You must specify a log file when using the -log argument"

    .line 344
    .restart local v15    # "msg":Ljava/lang/String;
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 346
    .end local v3    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v15    # "msg":Ljava/lang/String;
    :cond_d
    const-string/jumbo v19, "-buildfile"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_e

    const-string/jumbo v19, "-file"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_e

    const-string/jumbo v19, "-f"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_f

    .line 348
    :cond_e
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgBuildFile([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 349
    :cond_f
    const-string/jumbo v19, "-listener"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 350
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgListener([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 351
    :cond_10
    const-string/jumbo v19, "-D"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_11

    .line 352
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgDefine([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 353
    :cond_11
    const-string/jumbo v19, "-logger"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 354
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgLogger([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 355
    :cond_12
    const-string/jumbo v19, "-inputhandler"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_13

    .line 356
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgInputHandler([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 357
    :cond_13
    const-string/jumbo v19, "-emacs"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_14

    const-string/jumbo v19, "-e"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_15

    .line 358
    :cond_14
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->emacsMode:Z

    goto/16 :goto_1

    .line 359
    :cond_15
    const-string/jumbo v19, "-projecthelp"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_16

    const-string/jumbo v19, "-p"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_17

    .line 361
    :cond_16
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->projectHelp:Z

    goto/16 :goto_1

    .line 362
    :cond_17
    const-string/jumbo v19, "-find"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_18

    const-string/jumbo v19, "-s"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_19

    .line 363
    :cond_18
    const/16 v16, 0x1

    .line 365
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v19, v0

    add-int/lit8 v19, v19, -0x1

    move/from16 v0, v19

    if-ge v6, v0, :cond_1

    .line 366
    add-int/lit8 v6, v6, 0x1

    aget-object v17, p1, v6

    goto/16 :goto_1

    .line 368
    :cond_19
    const-string/jumbo v19, "-propertyfile"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_1a

    .line 369
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgPropertyFile([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 370
    :cond_1a
    const-string/jumbo v19, "-k"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_1b

    const-string/jumbo v19, "-keep-going"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1c

    .line 371
    :cond_1b
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->keepGoingMode:Z

    goto/16 :goto_1

    .line 372
    :cond_1c
    const-string/jumbo v19, "-nice"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1d

    .line 373
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lorg/apache/tools/ant/Main;->handleArgNice([Ljava/lang/String;I)I

    move-result v6

    goto/16 :goto_1

    .line 374
    :cond_1d
    sget-object v19, Lorg/apache/tools/ant/Main;->LAUNCH_COMMANDS:Ljava/util/Set;

    move-object/from16 v0, v19

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1e

    .line 378
    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Ant\'s Main method is being handed an option "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " that is only for the launcher class."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, "\nThis can be caused by a version mismatch between "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, "the ant script/.bat file and Ant itself."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 382
    .restart local v15    # "msg":Ljava/lang/String;
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 383
    .end local v15    # "msg":Ljava/lang/String;
    :cond_1e
    const-string/jumbo v19, "-autoproxy"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1f

    .line 384
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->proxy:Z

    goto/16 :goto_1

    .line 385
    :cond_1f
    const-string/jumbo v19, "-"

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_20

    .line 387
    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Unknown argument: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 388
    .restart local v15    # "msg":Ljava/lang/String;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 389
    invoke-static {}, Lorg/apache/tools/ant/Main;->printUsage()V

    .line 390
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v20, ""

    invoke-direct/range {v19 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 393
    .end local v15    # "msg":Ljava/lang/String;
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 397
    .end local v4    # "arg":Ljava/lang/String;
    :cond_21
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_22

    if-eqz v11, :cond_23

    .line 398
    :cond_22
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lorg/apache/tools/ant/Main;->printVersion(I)V

    .line 401
    :cond_23
    if-nez v10, :cond_24

    if-nez v11, :cond_24

    if-eqz v9, :cond_27

    .line 402
    :cond_24
    if-eqz v10, :cond_25

    .line 403
    invoke-static {}, Lorg/apache/tools/ant/Main;->printUsage()V

    .line 405
    :cond_25
    if-eqz v9, :cond_26

    .line 406
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lorg/apache/tools/ant/Diagnostics;->doReport(Ljava/io/PrintStream;I)V

    .line 482
    :cond_26
    :goto_4
    return-void

    .line 412
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_2f

    .line 414
    if-eqz v16, :cond_2c

    .line 415
    if-eqz v17, :cond_28

    .line 416
    const-string/jumbo v19, "user.dir"

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/Main;->findBuildFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_2f

    .line 418
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v20, "Could not locate a build file!"

    invoke-direct/range {v19 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 422
    :cond_28
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelpers()Ljava/util/Iterator;

    move-result-object v8

    .line 424
    .local v8, "it":Ljava/util/Iterator;
    :cond_29
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/ProjectHelper;

    .line 425
    .local v5, "helper":Lorg/apache/tools/ant/ProjectHelper;
    invoke-virtual {v5}, Lorg/apache/tools/ant/ProjectHelper;->getDefaultBuildFile()Ljava/lang/String;

    move-result-object v17

    .line 426
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_2a

    .line 427
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Searching the default build file: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 429
    :cond_2a
    const-string/jumbo v19, "user.dir"

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/Main;->findBuildFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    .line 430
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_2b

    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_29

    .line 431
    :cond_2b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_2f

    .line 432
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v20, "Could not locate a build file!"

    invoke-direct/range {v19 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 437
    .end local v5    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    .end local v8    # "it":Ljava/util/Iterator;
    :cond_2c
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelpers()Ljava/util/Iterator;

    move-result-object v8

    .line 439
    .restart local v8    # "it":Ljava/util/Iterator;
    :cond_2d
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/ProjectHelper;

    .line 440
    .restart local v5    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    new-instance v19, Ljava/io/File;

    invoke-virtual {v5}, Lorg/apache/tools/ant/ProjectHelper;->getDefaultBuildFile()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    .line 441
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_2e

    .line 442
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Trying the default build file: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 444
    :cond_2e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_2f

    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-nez v19, :cond_2d

    .line 449
    .end local v5    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    .end local v8    # "it":Ljava/util/Iterator;
    :cond_2f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_30

    .line 450
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Buildfile: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " does not exist!"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 451
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v20, "Build failed"

    invoke-direct/range {v19 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 454
    :cond_30
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->isDirectory()Z

    move-result v19

    if-eqz v19, :cond_31

    .line 455
    new-instance v18, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    const-string/jumbo v20, "build.xml"

    invoke-direct/range {v18 .. v20}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 456
    .local v18, "whatYouMeant":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->isFile()Z

    move-result v19

    if-eqz v19, :cond_34

    .line 457
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    .line 465
    .end local v18    # "whatYouMeant":Ljava/io/File;
    :cond_31
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    .line 469
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/Main;->loadPropertyFiles()V

    .line 471
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_32

    .line 472
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Buildfile: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 475
    :cond_32
    if-eqz v13, :cond_33

    .line 476
    sput-object v13, Lorg/apache/tools/ant/Main;->out:Ljava/io/PrintStream;

    .line 477
    sput-object v13, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    .line 478
    sget-object v19, Lorg/apache/tools/ant/Main;->out:Ljava/io/PrintStream;

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 479
    sget-object v19, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 481
    :cond_33
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/Main;->readyToRun:Z

    goto/16 :goto_4

    .line 459
    .restart local v18    # "whatYouMeant":Ljava/io/File;
    :cond_34
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "What? Buildfile: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " is a dir!"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 460
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v20, "Build failed"

    invoke-direct/range {v19 .. v20}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 341
    .end local v13    # "logTo":Ljava/io/PrintStream;
    .end local v18    # "whatYouMeant":Ljava/io/File;
    .restart local v4    # "arg":Ljava/lang/String;
    .restart local v12    # "logFile":Ljava/io/File;
    .restart local v14    # "logTo":Ljava/io/PrintStream;
    :catch_2
    move-exception v3

    move-object v13, v14

    .end local v14    # "logTo":Ljava/io/PrintStream;
    .restart local v13    # "logTo":Ljava/io/PrintStream;
    goto/16 :goto_3

    .line 336
    .end local v13    # "logTo":Ljava/io/PrintStream;
    .restart local v14    # "logTo":Ljava/io/PrintStream;
    :catch_3
    move-exception v7

    move-object v13, v14

    .end local v14    # "logTo":Ljava/io/PrintStream;
    .restart local v13    # "logTo":Ljava/io/PrintStream;
    goto/16 :goto_2
.end method

.method private static removeDuplicateTargets(Ljava/util/Map;)Ljava/util/Map;
    .locals 9
    .param p0, "targets"    # Ljava/util/Map;

    .prologue
    .line 1052
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1053
    .local v2, "locationMap":Ljava/util/Map;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1054
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1055
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1056
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/Target;

    .line 1057
    .local v6, "target":Lorg/apache/tools/ant/Target;
    invoke-virtual {v6}, Lorg/apache/tools/ant/Target;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/Target;

    .line 1063
    .local v4, "otherTarget":Lorg/apache/tools/ant/Target;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v8

    if-le v7, v8, :cond_0

    .line 1065
    :cond_1
    invoke-virtual {v6}, Lorg/apache/tools/ant/Target;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-interface {v2, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1069
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "otherTarget":Lorg/apache/tools/ant/Target;
    .end local v6    # "target":Lorg/apache/tools/ant/Target;
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1070
    .local v5, "ret":Ljava/util/Map;
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1071
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/Target;

    .line 1072
    .restart local v6    # "target":Lorg/apache/tools/ant/Target;
    invoke-virtual {v6}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1074
    .end local v6    # "target":Lorg/apache/tools/ant/Target;
    :cond_3
    return-object v5
.end method

.method private runBuild(Ljava/lang/ClassLoader;)V
    .locals 22
    .param p1, "coreLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 713
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->readyToRun:Z

    move/from16 v19, v0

    if-nez v19, :cond_1

    .line 850
    :cond_0
    :goto_0
    return-void

    .line 717
    :cond_1
    new-instance v9, Lorg/apache/tools/ant/Project;

    invoke-direct {v9}, Lorg/apache/tools/ant/Project;-><init>()V

    .line 718
    .local v9, "project":Lorg/apache/tools/ant/Project;
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Project;->setCoreLoader(Ljava/lang/ClassLoader;)V

    .line 720
    const/4 v6, 0x0

    .line 723
    .local v6, "error":Ljava/lang/Throwable;
    :try_start_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/Main;->addBuildListeners(Lorg/apache/tools/ant/Project;)V

    .line 724
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/apache/tools/ant/Main;->addInputHandler(Lorg/apache/tools/ant/Project;)V

    .line 726
    sget-object v13, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 727
    .local v13, "savedErr":Ljava/io/PrintStream;
    sget-object v15, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 728
    .local v15, "savedOut":Ljava/io/PrintStream;
    sget-object v14, Ljava/lang/System;->in:Ljava/io/InputStream;

    .line 731
    .local v14, "savedIn":Ljava/io/InputStream;
    const/4 v8, 0x0

    .line 732
    .local v8, "oldsm":Ljava/lang/SecurityManager;
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v8

    .line 739
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->allowInput:Z

    move/from16 v19, v0

    if-eqz v19, :cond_2

    .line 740
    sget-object v19, Ljava/lang/System;->in:Ljava/io/InputStream;

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Project;->setDefaultInputStream(Ljava/io/InputStream;)V

    .line 742
    :cond_2
    new-instance v19, Lorg/apache/tools/ant/DemuxInputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v9}, Lorg/apache/tools/ant/DemuxInputStream;-><init>(Lorg/apache/tools/ant/Project;)V

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V

    .line 743
    new-instance v19, Ljava/io/PrintStream;

    new-instance v20, Lorg/apache/tools/ant/DemuxOutputStream;

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v0, v9, v1}, Lorg/apache/tools/ant/DemuxOutputStream;-><init>(Lorg/apache/tools/ant/Project;Z)V

    invoke-direct/range {v19 .. v20}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 744
    new-instance v19, Ljava/io/PrintStream;

    new-instance v20, Lorg/apache/tools/ant/DemuxOutputStream;

    const/16 v21, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v0, v9, v1}, Lorg/apache/tools/ant/DemuxOutputStream;-><init>(Lorg/apache/tools/ant/Project;Z)V

    invoke-direct/range {v19 .. v20}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static/range {v19 .. v19}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 747
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    move/from16 v19, v0

    if-nez v19, :cond_3

    .line 748
    invoke-virtual {v9}, Lorg/apache/tools/ant/Project;->fireBuildStarted()V

    .line 752
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    move-object/from16 v19, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v19, :cond_4

    .line 754
    :try_start_2
    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Setting Ant\'s thread priority to "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x3

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 756
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->threadPriority:Ljava/lang/Integer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/Thread;->setPriority(I)V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 765
    :cond_4
    :goto_1
    :try_start_3
    invoke-virtual {v9}, Lorg/apache/tools/ant/Project;->init()V

    .line 768
    invoke-static {v9}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v10

    .line 770
    .local v10, "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    new-instance v11, Ljava/util/HashMap;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 771
    .local v11, "props":Ljava/util/HashMap;
    new-instance v19, Lorg/apache/tools/ant/property/ResolvePropertyMap;

    invoke-virtual {v10}, Lorg/apache/tools/ant/PropertyHelper;->getExpanders()Ljava/util/Collection;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v9, v10, v1}, Lorg/apache/tools/ant/property/ResolvePropertyMap;-><init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/property/GetProperty;Ljava/util/Collection;)V

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v11, v1, v2}, Lorg/apache/tools/ant/property/ResolvePropertyMap;->resolveAllProperties(Ljava/util/Map;Ljava/lang/String;Z)V

    .line 776
    invoke-virtual {v11}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "e":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_7

    .line 777
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 778
    .local v5, "ent":Ljava/util/Map$Entry;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 779
    .local v3, "arg":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    .line 780
    .local v18, "value":Ljava/lang/Object;
    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v3, v0}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 815
    .end local v3    # "arg":Ljava/lang/String;
    .end local v4    # "e":Ljava/util/Iterator;
    .end local v5    # "ent":Ljava/util/Map$Entry;
    .end local v10    # "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    .end local v11    # "props":Ljava/util/HashMap;
    .end local v18    # "value":Ljava/lang/Object;
    :catchall_0
    move-exception v19

    if-eqz v8, :cond_5

    .line 816
    :try_start_4
    invoke-static {v8}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V

    .line 819
    :cond_5
    invoke-static {v15}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 820
    invoke-static {v13}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 821
    invoke-static {v14}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V

    .line 815
    throw v19
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 823
    .end local v8    # "oldsm":Ljava/lang/SecurityManager;
    .end local v13    # "savedErr":Ljava/io/PrintStream;
    .end local v14    # "savedIn":Ljava/io/InputStream;
    .end local v15    # "savedOut":Ljava/io/PrintStream;
    :catch_0
    move-exception v7

    .line 824
    .local v7, "exc":Ljava/lang/RuntimeException;
    move-object v6, v7

    .line 825
    :try_start_5
    throw v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 830
    .end local v7    # "exc":Ljava/lang/RuntimeException;
    :catchall_1
    move-exception v19

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    move/from16 v20, v0

    if-nez v20, :cond_11

    .line 832
    :try_start_6
    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/Project;->fireBuildFinished(Ljava/lang/Throwable;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_5

    .line 830
    :cond_6
    :goto_3
    throw v19

    .line 757
    .restart local v8    # "oldsm":Ljava/lang/SecurityManager;
    .restart local v13    # "savedErr":Ljava/io/PrintStream;
    .restart local v14    # "savedIn":Ljava/io/InputStream;
    .restart local v15    # "savedOut":Ljava/io/PrintStream;
    :catch_1
    move-exception v16

    .line 759
    .local v16, "swallowed":Ljava/lang/SecurityException;
    :try_start_7
    const-string/jumbo v19, "A security manager refused to set the -nice value"

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 783
    .end local v16    # "swallowed":Ljava/lang/SecurityException;
    .restart local v4    # "e":Ljava/util/Iterator;
    .restart local v10    # "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    .restart local v11    # "props":Ljava/util/HashMap;
    :cond_7
    const-string/jumbo v19, "ant.file"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 785
    const-string/jumbo v19, "ant.file.type"

    const-string/jumbo v20, "file"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lorg/apache/tools/ant/Project;->setUserProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->keepGoingMode:Z

    move/from16 v19, v0

    move/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Project;->setKeepGoingMode(Z)V

    .line 789
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->proxy:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    .line 791
    new-instance v12, Lorg/apache/tools/ant/util/ProxySetup;

    invoke-direct {v12, v9}, Lorg/apache/tools/ant/util/ProxySetup;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 792
    .local v12, "proxySetup":Lorg/apache/tools/ant/util/ProxySetup;
    invoke-virtual {v12}, Lorg/apache/tools/ant/util/ProxySetup;->enableProxies()V

    .line 795
    .end local v12    # "proxySetup":Lorg/apache/tools/ant/util/ProxySetup;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->buildFile:Ljava/io/File;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v9, v0}, Lorg/apache/tools/ant/ProjectHelper;->configureProject(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    .line 797
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    move/from16 v19, v0

    if-eqz v19, :cond_d

    .line 798
    invoke-static {v9}, Lorg/apache/tools/ant/Main;->printDescription(Lorg/apache/tools/ant/Project;)V

    .line 799
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_b

    const/16 v19, 0x1

    move/from16 v20, v19

    :goto_4
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/Main;->msgOutputLevel:I

    move/from16 v19, v0

    const/16 v21, 0x3

    move/from16 v0, v19

    move/from16 v1, v21

    if-le v0, v1, :cond_c

    const/16 v19, 0x1

    :goto_5
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v9, v0, v1}, Lorg/apache/tools/ant/Main;->printTargets(Lorg/apache/tools/ant/Project;ZZ)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 815
    if-eqz v8, :cond_9

    .line 816
    :try_start_8
    invoke-static {v8}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V

    .line 819
    :cond_9
    invoke-static {v15}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 820
    invoke-static {v13}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 821
    invoke-static {v14}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/Error; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    move/from16 v19, v0

    if-nez v19, :cond_13

    .line 832
    :try_start_9
    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/Project;->fireBuildFinished(Ljava/lang/Throwable;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_0

    .line 833
    :catch_2
    move-exception v17

    .line 836
    .local v17, "t":Ljava/lang/Throwable;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "Caught an exception while logging the end of the build.  Exception was:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 838
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->printStackTrace()V

    .line 839
    if-eqz v6, :cond_a

    .line 840
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "There has been an error prior to that:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 842
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 844
    :cond_a
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v19

    .line 799
    .end local v17    # "t":Ljava/lang/Throwable;
    :cond_b
    const/16 v19, 0x0

    move/from16 v20, v19

    goto :goto_4

    :cond_c
    const/16 v19, 0x0

    goto :goto_5

    .line 805
    :cond_d
    :try_start_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/Vector;->size()I

    move-result v19

    if-nez v19, :cond_e

    .line 806
    invoke-virtual {v9}, Lorg/apache/tools/ant/Project;->getDefaultTarget()Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_e

    .line 807
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    move-object/from16 v19, v0

    invoke-virtual {v9}, Lorg/apache/tools/ant/Project;->getDefaultTarget()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 811
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/Main;->targets:Ljava/util/Vector;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/Project;->executeTargets(Ljava/util/Vector;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 815
    if-eqz v8, :cond_f

    .line 816
    :try_start_b
    invoke-static {v8}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V

    .line 819
    :cond_f
    invoke-static {v15}, Ljava/lang/System;->setOut(Ljava/io/PrintStream;)V

    .line 820
    invoke-static {v13}, Ljava/lang/System;->setErr(Ljava/io/PrintStream;)V

    .line 821
    invoke-static {v14}, Ljava/lang/System;->setIn(Ljava/io/InputStream;)V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_0
    .catch Ljava/lang/Error; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 830
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/Main;->projectHelp:Z

    move/from16 v19, v0

    if-nez v19, :cond_14

    .line 832
    :try_start_c
    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/Project;->fireBuildFinished(Ljava/lang/Throwable;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3

    goto/16 :goto_0

    .line 833
    :catch_3
    move-exception v17

    .line 836
    .restart local v17    # "t":Ljava/lang/Throwable;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "Caught an exception while logging the end of the build.  Exception was:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 838
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->printStackTrace()V

    .line 839
    if-eqz v6, :cond_10

    .line 840
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "There has been an error prior to that:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 842
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 844
    :cond_10
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v19

    .line 826
    .end local v4    # "e":Ljava/util/Iterator;
    .end local v8    # "oldsm":Ljava/lang/SecurityManager;
    .end local v10    # "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    .end local v11    # "props":Ljava/util/HashMap;
    .end local v13    # "savedErr":Ljava/io/PrintStream;
    .end local v14    # "savedIn":Ljava/io/InputStream;
    .end local v15    # "savedOut":Ljava/io/PrintStream;
    .end local v17    # "t":Ljava/lang/Throwable;
    :catch_4
    move-exception v4

    .line 827
    .local v4, "e":Ljava/lang/Error;
    move-object v6, v4

    .line 828
    :try_start_d
    throw v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 846
    .end local v4    # "e":Ljava/lang/Error;
    :cond_11
    if-eqz v6, :cond_6

    .line 847
    invoke-virtual {v6}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v9, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto/16 :goto_3

    .line 833
    :catch_5
    move-exception v17

    .line 836
    .restart local v17    # "t":Ljava/lang/Throwable;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "Caught an exception while logging the end of the build.  Exception was:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 838
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->printStackTrace()V

    .line 839
    if-eqz v6, :cond_12

    .line 840
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "There has been an error prior to that:"

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 842
    invoke-virtual {v6}, Ljava/lang/Throwable;->printStackTrace()V

    .line 844
    :cond_12
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v19

    .line 846
    .end local v17    # "t":Ljava/lang/Throwable;
    .local v4, "e":Ljava/util/Iterator;
    .restart local v8    # "oldsm":Ljava/lang/SecurityManager;
    .restart local v10    # "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    .restart local v11    # "props":Ljava/util/HashMap;
    .restart local v13    # "savedErr":Ljava/io/PrintStream;
    .restart local v14    # "savedIn":Ljava/io/InputStream;
    .restart local v15    # "savedOut":Ljava/io/PrintStream;
    :cond_13
    if-eqz v6, :cond_0

    .line 847
    invoke-virtual {v6}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v19

    :goto_6
    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v9, v0, v1}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 846
    :cond_14
    if-eqz v6, :cond_0

    .line 847
    invoke-virtual {v6}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v19

    goto :goto_6
.end method

.method public static start([Ljava/lang/String;Ljava/util/Properties;Ljava/lang/ClassLoader;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;
    .param p1, "additionalUserProperties"    # Ljava/util/Properties;
    .param p2, "coreLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 179
    new-instance v0, Lorg/apache/tools/ant/Main;

    invoke-direct {v0}, Lorg/apache/tools/ant/Main;-><init>()V

    .line 180
    .local v0, "m":Lorg/apache/tools/ant/Main;
    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/tools/ant/Main;->startAnt([Ljava/lang/String;Ljava/util/Properties;Ljava/lang/ClassLoader;)V

    .line 181
    return-void
.end method


# virtual methods
.method protected addBuildListeners(Lorg/apache/tools/ant/Project;)V
    .locals 6
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 862
    invoke-direct {p0}, Lorg/apache/tools/ant/Main;->createLogger()Lorg/apache/tools/ant/BuildLogger;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 864
    iget-object v4, p0, Lorg/apache/tools/ant/Main;->listeners:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v1

    .line 865
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 866
    iget-object v4, p0, Lorg/apache/tools/ant/Main;->listeners:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 867
    .local v0, "className":Ljava/lang/String;
    sget-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    if-nez v4, :cond_0

    const-string/jumbo v4, "org.apache.tools.ant.Main"

    invoke-static {v4}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    sget-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildListener:Ljava/lang/Class;

    if-nez v4, :cond_1

    const-string/jumbo v4, "org.apache.tools.ant.BuildListener"

    invoke-static {v4}, Lorg/apache/tools/ant/Main;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildListener:Ljava/lang/Class;

    :goto_2
    invoke-static {v0, v5, v4}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/BuildListener;

    .line 870
    .local v3, "listener":Lorg/apache/tools/ant/BuildListener;
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 872
    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 865
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 867
    .end local v3    # "listener":Lorg/apache/tools/ant/BuildListener;
    :cond_0
    sget-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$Main:Ljava/lang/Class;

    goto :goto_1

    :cond_1
    sget-object v4, Lorg/apache/tools/ant/Main;->class$org$apache$tools$ant$BuildListener:Ljava/lang/Class;

    goto :goto_2

    .line 874
    .end local v0    # "className":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method protected exit(I)V
    .locals 0
    .param p1, "exitCode"    # I

    .prologue
    .line 245
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    .line 246
    return-void
.end method

.method public startAnt([Ljava/lang/String;Ljava/util/Properties;Ljava/lang/ClassLoader;)V
    .locals 9
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "additionalUserProperties"    # Ljava/util/Properties;
    .param p3, "coreLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 196
    :try_start_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/Main;->processArgs([Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    if-eqz p2, :cond_0

    .line 205
    invoke-virtual {p2}, Ljava/util/Properties;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 206
    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 207
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 208
    .local v5, "key":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 209
    .local v6, "property":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/Main;->definedProps:Ljava/util/Properties;

    invoke-virtual {v7, v5, v6}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 197
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v5    # "key":Ljava/lang/String;
    .end local v6    # "property":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 198
    .local v3, "exc":Ljava/lang/Throwable;
    invoke-static {}, Lorg/apache/tools/ant/Main;->handleLogfile()V

    .line 199
    invoke-static {v3}, Lorg/apache/tools/ant/Main;->printMessage(Ljava/lang/Throwable;)V

    .line 200
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/Main;->exit(I)V

    .line 236
    .end local v3    # "exc":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 214
    :cond_0
    const/4 v4, 0x1

    .line 217
    .local v4, "exitCode":I
    :try_start_1
    invoke-direct {p0, p3}, Lorg/apache/tools/ant/Main;->runBuild(Ljava/lang/ClassLoader;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/ExitStatusException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 218
    const/4 v4, 0x0

    .line 233
    :cond_1
    invoke-static {}, Lorg/apache/tools/ant/Main;->handleLogfile()V

    .line 235
    :goto_2
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/Main;->exit(I)V

    goto :goto_1

    .line 219
    :catch_1
    move-exception v2

    .line 220
    .local v2, "ese":Lorg/apache/tools/ant/ExitStatusException;
    :try_start_2
    invoke-virtual {v2}, Lorg/apache/tools/ant/ExitStatusException;->getStatus()I

    move-result v4

    .line 221
    if-eqz v4, :cond_1

    .line 222
    throw v2
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 225
    .end local v2    # "ese":Lorg/apache/tools/ant/ExitStatusException;
    :catch_2
    move-exception v0

    .line 226
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    :try_start_3
    sget-object v7, Lorg/apache/tools/ant/Main;->err:Ljava/io/PrintStream;

    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    if-eq v7, v8, :cond_2

    .line 227
    invoke-static {v0}, Lorg/apache/tools/ant/Main;->printMessage(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 233
    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/Main;->handleLogfile()V

    goto :goto_2

    .line 229
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    :catch_3
    move-exception v3

    .line 230
    .restart local v3    # "exc":Ljava/lang/Throwable;
    :try_start_4
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 231
    invoke-static {v3}, Lorg/apache/tools/ant/Main;->printMessage(Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 233
    invoke-static {}, Lorg/apache/tools/ant/Main;->handleLogfile()V

    goto :goto_2

    .end local v3    # "exc":Ljava/lang/Throwable;
    :catchall_0
    move-exception v7

    invoke-static {}, Lorg/apache/tools/ant/Main;->handleLogfile()V

    throw v7
.end method
