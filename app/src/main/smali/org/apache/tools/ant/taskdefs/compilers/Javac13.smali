.class public Lorg/apache/tools/ant/taskdefs/compilers/Javac13;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Javac13.java"


# static fields
.field private static final MODERN_COMPILER_SUCCESS:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 47
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac13;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v9, "Using modern compiler"

    const/4 v10, 0x3

    invoke-virtual {v6, v9, v10}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 48
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Javac13;->setupModernJavacCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 52
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    :try_start_0
    const-string/jumbo v6, "com.sun.tools.javac.Main"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 53
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 54
    .local v3, "compiler":Ljava/lang/Object;
    const-string/jumbo v6, "compile"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v0, v6, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 56
    .local v2, "compile":Ljava/lang/reflect/Method;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v9

    invoke-virtual {v2, v3, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 59
    .local v5, "result":I
    if-nez v5, :cond_0

    move v6, v7

    :goto_0
    return v6

    :cond_0
    move v6, v8

    goto :goto_0

    .line 60
    .end local v0    # "c":Ljava/lang/Class;
    .end local v2    # "compile":Ljava/lang/reflect/Method;
    .end local v3    # "compiler":Ljava/lang/Object;
    .end local v5    # "result":I
    :catch_0
    move-exception v4

    .line 61
    .local v4, "ex":Ljava/lang/Exception;
    instance-of v6, v4, Lorg/apache/tools/ant/BuildException;

    if-eqz v6, :cond_1

    .line 62
    check-cast v4, Lorg/apache/tools/ant/BuildException;

    .end local v4    # "ex":Ljava/lang/Exception;
    throw v4

    .line 64
    .restart local v4    # "ex":Ljava/lang/Exception;
    :cond_1
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Error starting modern compiler"

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac13;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v6, v7, v4, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v6
.end method
