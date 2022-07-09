.class public Lorg/apache/tools/ant/util/ReflectWrapper;
.super Ljava/lang/Object;
.source "ReflectWrapper.java"


# instance fields
.field private obj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .locals 4
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v3, 0x1

    :try_start_0
    invoke-static {p2, v3, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 41
    .local v0, "clazz":Ljava/lang/Class;
    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Class;

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 42
    .local v1, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v1    # "constructor":Ljava/lang/reflect/Constructor;
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v2

    .line 44
    .local v2, "t":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;

    .line 54
    return-void
.end method


# virtual methods
.method public getObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;

    return-object v0
.end method

.method public invoke(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;

    invoke-static {v0, p1}, Lorg/apache/tools/ant/util/ReflectUtil;->invoke(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "argType"    # Ljava/lang/Class;
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;

    invoke-static {v0, p1, p2, p3}, Lorg/apache/tools/ant/util/ReflectUtil;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "argType1"    # Ljava/lang/Class;
    .param p3, "arg1"    # Ljava/lang/Object;
    .param p4, "argType2"    # Ljava/lang/Class;
    .param p5, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReflectWrapper;->obj:Ljava/lang/Object;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lorg/apache/tools/ant/util/ReflectUtil;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
