.class Lorg/apache/tools/ant/IntrospectionHelper$9;
.super Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
.source "IntrospectionHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/IntrospectionHelper;

.field private final val$m:Ljava/lang/reflect/Method;

.field private final val$reflectedArg:Ljava/lang/Class;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p2, "x0"    # Ljava/lang/reflect/Method;
    .param p3, "x1"    # Ljava/lang/Class;
    .param p4, "val$reflectedArg"    # Ljava/lang/Class;
    .param p5, "val$m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 1117
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$9;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-object p4, p0, Lorg/apache/tools/ant/IntrospectionHelper$9;->val$reflectedArg:Ljava/lang/Class;

    iput-object p5, p0, Lorg/apache/tools/ant/IntrospectionHelper$9;->val$m:Ljava/lang/reflect/Method;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 5
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
    .line 1120
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$9;->val$reflectedArg:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/EnumeratedAttribute;

    .line 1121
    .local v0, "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/EnumeratedAttribute;->setValue(Ljava/lang/String;)V

    .line 1122
    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$9;->val$m:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v2, p2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1126
    return-void

    .line 1123
    .end local v0    # "ea":Lorg/apache/tools/ant/types/EnumeratedAttribute;
    :catch_0
    move-exception v1

    .line 1124
    .local v1, "ie":Ljava/lang/InstantiationException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
