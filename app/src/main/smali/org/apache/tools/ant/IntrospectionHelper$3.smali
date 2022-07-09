.class Lorg/apache/tools/ant/IntrospectionHelper$3;
.super Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
.source "IntrospectionHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/IntrospectionHelper;

.field private final val$m:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p2, "x0"    # Ljava/lang/reflect/Method;
    .param p3, "x1"    # Ljava/lang/Class;
    .param p4, "val$m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1054
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$3;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-object p4, p0, Lorg/apache/tools/ant/IntrospectionHelper$3;->val$m:Ljava/lang/reflect/Method;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1056
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$3;->val$m:Ljava/lang/reflect/Method;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p3, v0, v2

    check-cast v0, [Ljava/lang/Object;

    invoke-virtual {v1, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1057
    return-void
.end method
