.class abstract Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;
.super Ljava/lang/Object;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/IntrospectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "AttributeSetter"
.end annotation


# instance fields
.field private method:Ljava/lang/reflect/Method;

.field private type:Ljava/lang/Class;


# direct methods
.method protected constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/Class;)V
    .locals 0
    .param p1, "m"    # Ljava/lang/reflect/Method;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 1480
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1481
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->method:Ljava/lang/reflect/Method;

    .line 1482
    iput-object p2, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    .line 1483
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;)Ljava/lang/Class;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    .prologue
    .line 1477
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;)Ljava/lang/reflect/Method;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;

    .prologue
    .line 1477
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method


# virtual methods
.method abstract set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method setObject(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1486
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    if-eqz v1, :cond_3

    .line 1487
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    .line 1488
    .local v0, "useType":Ljava/lang/Class;
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1489
    if-nez p3, :cond_0

    .line 1490
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Attempt to set primitive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "set"

    invoke-static {v3, v4}, Lorg/apache/tools/ant/IntrospectionHelper;->access$500(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to null on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1495
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/IntrospectionHelper;->access$600()Ljava/util/Map;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->type:Ljava/lang/Class;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "useType":Ljava/lang/Class;
    check-cast v0, Ljava/lang/Class;

    .line 1497
    .restart local v0    # "useType":Ljava/lang/Class;
    :cond_1
    if-eqz p3, :cond_2

    invoke-virtual {v0, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1498
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->method:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-virtual {v1, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1503
    .end local v0    # "useType":Ljava/lang/Class;
    :goto_0
    return-void

    .line 1502
    :cond_3
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v1}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;->set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0
.end method
