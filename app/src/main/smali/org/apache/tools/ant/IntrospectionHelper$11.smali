.class Lorg/apache/tools/ant/IntrospectionHelper$11;
.super Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
.source "IntrospectionHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/IntrospectionHelper;

.field private final val$attrName:Ljava/lang/String;

.field private final val$finalConstructor:Ljava/lang/reflect/Constructor;

.field private final val$finalIncludeProject:Z

.field private final val$m:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;ZLjava/lang/reflect/Constructor;Ljava/lang/reflect/Method;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p2, "x0"    # Ljava/lang/reflect/Method;
    .param p3, "x1"    # Ljava/lang/Class;
    .param p4, "val$finalIncludeProject"    # Z
    .param p5, "val$finalConstructor"    # Ljava/lang/reflect/Constructor;
    .param p6, "val$m"    # Ljava/lang/reflect/Method;
    .param p7, "val$attrName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 1180
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-boolean p4, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$finalIncludeProject:Z

    iput-object p5, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$finalConstructor:Ljava/lang/reflect/Constructor;

    iput-object p6, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$m:Ljava/lang/reflect/Method;

    iput-object p7, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$attrName:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 8
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1183
    :try_start_0
    iget-boolean v5, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$finalIncludeProject:Z

    if-eqz v5, :cond_1

    const/4 v5, 0x2

    new-array v0, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v0, v5

    const/4 v5, 0x1

    aput-object p3, v0, v5

    .line 1186
    .local v0, "args":[Ljava/lang/Object;
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$finalConstructor:Ljava/lang/reflect/Constructor;

    invoke-virtual {v5, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1187
    .local v1, "attribute":Ljava/lang/Object;
    if-eqz p1, :cond_0

    .line 1188
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 1190
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$m:Ljava/lang/reflect/Method;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-virtual {v5, p2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1205
    return-void

    .line 1183
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "attribute":Ljava/lang/Object;
    :cond_1
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p3, v0, v5
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 1191
    :catch_0
    move-exception v3

    .line 1192
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 1193
    .local v2, "cause":Ljava/lang/Throwable;
    instance-of v5, v2, Ljava/lang/IllegalArgumentException;

    if-eqz v5, :cond_2

    .line 1194
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Can\'t assign value \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' to attribute "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/IntrospectionHelper$11;->val$attrName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ", reason: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " with message \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1201
    :cond_2
    throw v3

    .line 1202
    .end local v2    # "cause":Ljava/lang/Throwable;
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v4

    .line 1203
    .local v4, "ie":Ljava/lang/InstantiationException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method
