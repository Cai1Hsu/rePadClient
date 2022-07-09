.class public final Lorg/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii;
.super Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;
.source "SunNative2Ascii.java"


# static fields
.field public static final IMPLEMENTATION_NAME:Ljava/lang/String; = "sun"

.field static array$Ljava$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 52
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


# virtual methods
.method protected run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;)Z
    .locals 8
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "log"    # Lorg/apache/tools/ant/ProjectComponent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 51
    :try_start_0
    const-string/jumbo v5, "sun.tools.native2ascii.Main"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 52
    .local v2, "n2aMain":Ljava/lang/Class;
    const/4 v5, 0x1

    new-array v4, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v5, :cond_0

    const-string/jumbo v5, "[Ljava.lang.String;"

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_0
    aput-object v5, v4, v6

    .line 53
    .local v4, "param":[Ljava/lang/Class;
    const-string/jumbo v5, "convert"

    invoke-virtual {v2, v5, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 54
    .local v0, "convert":Ljava/lang/reflect/Method;
    if-nez v0, :cond_1

    .line 55
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Could not find convert() method in sun.tools.native2ascii.Main"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 62
    .end local v0    # "convert":Ljava/lang/reflect/Method;
    .end local v2    # "n2aMain":Ljava/lang/Class;
    .end local v4    # "param":[Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 64
    .local v1, "ex":Lorg/apache/tools/ant/BuildException;
    throw v1

    .line 52
    .end local v1    # "ex":Lorg/apache/tools/ant/BuildException;
    .restart local v2    # "n2aMain":Ljava/lang/Class;
    :cond_0
    :try_start_1
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/SunNative2Ascii;->array$Ljava$lang$String:Ljava/lang/Class;

    goto :goto_0

    .line 58
    .restart local v0    # "convert":Ljava/lang/reflect/Method;
    .restart local v4    # "param":[Ljava/lang/Class;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 59
    .local v3, "o":Ljava/lang/Object;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v0, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    return v5

    .line 65
    .end local v0    # "convert":Ljava/lang/reflect/Method;
    .end local v2    # "n2aMain":Ljava/lang/Class;
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "param":[Ljava/lang/Class;
    :catch_1
    move-exception v1

    .line 67
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Error starting Sun\'s native2ascii: "

    invoke-direct {v5, v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method protected setup(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "args"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getReverse()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 42
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-reverse"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 44
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;->setup(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V

    .line 45
    return-void
.end method
