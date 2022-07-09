.class Lorg/apache/tools/ant/IntrospectionHelper$13;
.super Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
.source "IntrospectionHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/IntrospectionHelper;

.field private final val$nestedObject:Ljava/lang/Object;

.field private final val$realObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p2, "x0"    # Ljava/lang/reflect/Method;
    .param p3, "val$realObject"    # Ljava/lang/Object;
    .param p4, "val$nestedObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1570
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-object p3, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$realObject:Ljava/lang/Object;

    iput-object p4, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$nestedObject:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;-><init>(Ljava/lang/reflect/Method;)V

    return-void
.end method


# virtual methods
.method create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "ignore"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 1560
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper$13;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Configured"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1561
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper$13;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$realObject:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-virtual {v0, p2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1563
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$nestedObject:Ljava/lang/Object;

    return-object v0
.end method

.method getRealObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1567
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$realObject:Ljava/lang/Object;

    return-object v0
.end method

.method store(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .param p1, "parent"    # Ljava/lang/Object;
    .param p2, "child"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 1572
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper$13;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Configured"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1573
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper$13;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$13;->val$realObject:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1575
    :cond_0
    return-void
.end method
