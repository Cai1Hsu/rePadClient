.class public Lorg/apache/tools/ant/util/ReflectUtil;
.super Ljava/lang/Object;
.source "ReflectUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 149
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 150
    .local v0, "field":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 151
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 154
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :goto_0
    return-object v2

    .line 152
    :catch_0
    move-exception v1

    .line 153
    .local v1, "t":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    .line 154
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static invoke(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 65
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v4, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 67
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 70
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v2

    .line 68
    :catch_0
    move-exception v1

    .line 69
    .local v1, "t":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    move-object v2, v3

    .line 70
    goto :goto_0
.end method

.method public static invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "argType"    # Ljava/lang/Class;
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    .line 106
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 108
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 111
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v2

    .line 109
    :catch_0
    move-exception v1

    .line 110
    .local v1, "t":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    .line 111
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "argType1"    # Ljava/lang/Class;
    .param p3, "arg1"    # Ljava/lang/Object;
    .param p4, "argType2"    # Ljava/lang/Class;
    .param p5, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 130
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x1

    aput-object p4, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 132
    .local v0, "method":Ljava/lang/reflect/Method;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    const/4 v3, 0x1

    aput-object p5, v2, v3

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 135
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v2

    .line 133
    :catch_0
    move-exception v1

    .line 134
    .local v1, "t":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    .line 135
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static invokeStatic(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 85
    :try_start_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    move-object v3, v0

    const/4 v4, 0x0

    check-cast v4, [Ljava/lang/Class;

    invoke-virtual {v3, p1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 87
    .local v1, "method":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 90
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v3

    .line 88
    :catch_0
    move-exception v2

    .line 89
    .local v2, "t":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    move-object v3, v5

    .line 90
    goto :goto_0
.end method

.method public static newInstance(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "ofClass"    # Ljava/lang/Class;
    .param p1, "argTypes"    # [Ljava/lang/Class;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 48
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 49
    .local v0, "con":Ljava/lang/reflect/Constructor;
    invoke-virtual {v0, p2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 52
    .end local v0    # "con":Ljava/lang/reflect/Constructor;
    :goto_0
    return-object v2

    .line 50
    :catch_0
    move-exception v1

    .line 51
    .local v1, "t":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->throwBuildException(Ljava/lang/Exception;)V

    .line 52
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static respondsTo(Ljava/lang/Object;Ljava/lang/String;)Z
    .locals 4
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 200
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 201
    .local v1, "methods":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_1

    .line 202
    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 203
    const/4 v3, 0x1

    .line 206
    :goto_1
    return v3

    .line 201
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 206
    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    .line 207
    .end local v0    # "i":I
    .end local v1    # "methods":[Ljava/lang/reflect/Method;
    :catch_0
    move-exception v2

    .line 208
    .local v2, "t":Ljava/lang/Exception;
    invoke-static {v2}, Lorg/apache/tools/ant/util/ReflectUtil;->toBuildException(Ljava/lang/Exception;)Lorg/apache/tools/ant/BuildException;

    move-result-object v3

    throw v3
.end method

.method public static throwBuildException(Ljava/lang/Exception;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Exception;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-static {p0}, Lorg/apache/tools/ant/util/ReflectUtil;->toBuildException(Ljava/lang/Exception;)Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
.end method

.method public static toBuildException(Ljava/lang/Exception;)Lorg/apache/tools/ant/BuildException;
    .locals 2
    .param p0, "t"    # Ljava/lang/Exception;

    .prologue
    .line 177
    instance-of v1, p0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v1, :cond_1

    .line 178
    check-cast p0, Ljava/lang/reflect/InvocationTargetException;

    .end local p0    # "t":Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 180
    .local v0, "t2":Ljava/lang/Throwable;
    instance-of v1, v0, Lorg/apache/tools/ant/BuildException;

    if-eqz v1, :cond_0

    .line 181
    check-cast v0, Lorg/apache/tools/ant/BuildException;

    .line 185
    .end local v0    # "t2":Ljava/lang/Throwable;
    .restart local p0    # "t":Ljava/lang/Exception;
    :goto_0
    return-object v0

    .line 183
    .end local p0    # "t":Ljava/lang/Exception;
    .restart local v0    # "t2":Ljava/lang/Throwable;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    goto :goto_0

    .line 185
    .end local v0    # "t2":Ljava/lang/Throwable;
    .restart local p0    # "t":Ljava/lang/Exception;
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
