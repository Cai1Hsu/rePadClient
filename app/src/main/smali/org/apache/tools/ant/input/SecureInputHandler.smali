.class public Lorg/apache/tools/ant/input/SecureInputHandler;
.super Lorg/apache/tools/ant/input/DefaultInputHandler;
.source "SecureInputHandler.java"


# static fields
.field static array$Ljava$lang$Object:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/input/DefaultInputHandler;-><init>()V

    .line 35
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 49
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
.method public handleInput(Lorg/apache/tools/ant/input/InputRequest;)V
    .locals 9
    .param p1, "request"    # Lorg/apache/tools/ant/input/InputRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/input/SecureInputHandler;->getPrompt(Lorg/apache/tools/ant/input/InputRequest;)Ljava/lang/String;

    move-result-object v3

    .line 45
    .local v3, "prompt":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v1, "java.lang.System"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 46
    .local v8, "system":Ljava/lang/Class;
    const-string/jumbo v1, "console"

    invoke-static {v8, v1}, Lorg/apache/tools/ant/util/ReflectUtil;->invokeStatic(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 48
    .local v0, "console":Ljava/lang/Object;
    :cond_0
    const-string/jumbo v1, "readPassword"

    sget-object v2, Lorg/apache/tools/ant/input/SecureInputHandler;->class$java$lang$String:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "java.lang.String"

    invoke-static {v2}, Lorg/apache/tools/ant/input/SecureInputHandler;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/input/SecureInputHandler;->class$java$lang$String:Ljava/lang/Class;

    :goto_0
    sget-object v4, Lorg/apache/tools/ant/input/SecureInputHandler;->array$Ljava$lang$Object:Ljava/lang/Class;

    if-nez v4, :cond_2

    const-string/jumbo v4, "[Ljava.lang.Object;"

    invoke-static {v4}, Lorg/apache/tools/ant/input/SecureInputHandler;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/input/SecureInputHandler;->array$Ljava$lang$Object:Ljava/lang/Class;

    :goto_1
    const/4 v5, 0x0

    check-cast v5, [Ljava/lang/Object;

    invoke-static/range {v0 .. v5}, Lorg/apache/tools/ant/util/ReflectUtil;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [C

    .line 51
    .local v7, "input":[C
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v7}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/input/InputRequest;->setInput(Ljava/lang/String;)V

    .line 53
    const/16 v1, 0x20

    invoke-static {v7, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 54
    invoke-virtual {p1}, Lorg/apache/tools/ant/input/InputRequest;->isInputValid()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    .end local v0    # "console":Ljava/lang/Object;
    .end local v7    # "input":[C
    .end local v8    # "system":Ljava/lang/Class;
    :goto_2
    return-void

    .line 48
    .restart local v0    # "console":Ljava/lang/Object;
    .restart local v8    # "system":Ljava/lang/Class;
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/input/SecureInputHandler;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_0

    :cond_2
    sget-object v4, Lorg/apache/tools/ant/input/SecureInputHandler;->array$Ljava$lang$Object:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 55
    .end local v0    # "console":Ljava/lang/Object;
    .end local v8    # "system":Ljava/lang/Class;
    :catch_0
    move-exception v6

    .line 57
    .local v6, "e":Ljava/lang/Exception;
    invoke-super {p0, p1}, Lorg/apache/tools/ant/input/DefaultInputHandler;->handleInput(Lorg/apache/tools/ant/input/InputRequest;)V

    goto :goto_2
.end method
