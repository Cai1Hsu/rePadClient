.class public Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "AptCompilerAdapter.java"


# static fields
.field private static final APT_COMPILER_SUCCESS:I = 0x0

.field public static final APT_ENTRY_POINT:Ljava/lang/String; = "com.sun.tools.apt.Main"

.field public static final APT_METHOD_NAME:Ljava/lang/String; = "process"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method

.method static setAptCommandlineSwitches(Lorg/apache/tools/ant/taskdefs/Apt;Lorg/apache/tools/ant/types/Commandline;)V
    .locals 9
    .param p0, "apt"    # Lorg/apache/tools/ant/taskdefs/Apt;
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->isCompile()Z

    move-result v7

    if-nez v7, :cond_0

    .line 108
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    const-string/jumbo v8, "-nocompile"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 112
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getFactory()Ljava/lang/String;

    move-result-object v2

    .line 113
    .local v2, "factory":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 114
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    const-string/jumbo v8, "-factory"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    invoke-virtual {v7, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 119
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getFactoryPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    .line 120
    .local v3, "factoryPath":Lorg/apache/tools/ant/types/Path;
    if-eqz v3, :cond_2

    .line 121
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    const-string/jumbo v8, "-factorypath"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 122
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    invoke-virtual {v7, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 125
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getPreprocessDir()Ljava/io/File;

    move-result-object v6

    .line 126
    .local v6, "preprocessDir":Ljava/io/File;
    if-eqz v6, :cond_3

    .line 127
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    const-string/jumbo v8, "-s"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 128
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    invoke-virtual {v7, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 132
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getOptions()Ljava/util/Vector;

    move-result-object v5

    .line 133
    .local v5, "options":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 135
    .local v1, "elements":Ljava/util/Enumeration;
    const/4 v0, 0x0

    .line 136
    .local v0, "arg":Ljava/lang/StringBuffer;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 137
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/Apt$Option;

    .line 138
    .local v4, "opt":Lorg/apache/tools/ant/taskdefs/Apt$Option;
    new-instance v0, Ljava/lang/StringBuffer;

    .end local v0    # "arg":Ljava/lang/StringBuffer;
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 139
    .restart local v0    # "arg":Ljava/lang/StringBuffer;
    const-string/jumbo v7, "-A"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Apt$Option;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Apt$Option;->getValue()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 141
    const-string/jumbo v7, "="

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Apt$Option;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 145
    .end local v4    # "opt":Lorg/apache/tools/ant/taskdefs/Apt$Option;
    :cond_5
    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 163
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v10, "Using apt compiler"

    const/4 v11, 0x3

    invoke-virtual {v7, v10, v11}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->setupModernJavacCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v2

    .line 167
    .local v2, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->setAptCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)V

    .line 172
    :try_start_0
    const-string/jumbo v7, "com.sun.tools.apt.Main"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 173
    .local v1, "c":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 174
    .local v4, "compiler":Ljava/lang/Object;
    const-string/jumbo v7, "process"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {v1, v7, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 176
    .local v3, "compile":Ljava/lang/reflect/Method;
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v11

    aput-object v11, v7, v10

    invoke-virtual {v3, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v6

    .line 179
    .local v6, "result":I
    if-nez v6, :cond_0

    move v7, v8

    :goto_0
    return v7

    :cond_0
    move v7, v9

    goto :goto_0

    .line 180
    .end local v1    # "c":Ljava/lang/Class;
    .end local v3    # "compile":Ljava/lang/reflect/Method;
    .end local v4    # "compiler":Ljava/lang/Object;
    .end local v6    # "result":I
    :catch_0
    move-exception v0

    .line 182
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    throw v0

    .line 183
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v5

    .line 185
    .local v5, "ex":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Error starting apt compiler"

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v7, v8, v5, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7
.end method

.method protected getApt()Lorg/apache/tools/ant/taskdefs/Apt;
    .locals 1

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Apt;

    return-object v0
.end method

.method protected setAptCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->getApt()Lorg/apache/tools/ant/taskdefs/Apt;

    move-result-object v0

    .line 154
    .local v0, "apt":Lorg/apache/tools/ant/taskdefs/Apt;
    invoke-static {v0, p1}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->setAptCommandlineSwitches(Lorg/apache/tools/ant/taskdefs/Apt;Lorg/apache/tools/ant/types/Commandline;)V

    .line 155
    return-void
.end method
