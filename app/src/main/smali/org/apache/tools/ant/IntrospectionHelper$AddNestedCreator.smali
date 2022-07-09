.class Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;
.super Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/IntrospectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddNestedCreator"
.end annotation


# static fields
.field static final ADD:I = 0x1

.field static final ADD_CONFIGURED:I = 0x2


# instance fields
.field private behavior:I

.field private constructor:Ljava/lang/reflect/Constructor;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/reflect/Constructor;I)V
    .locals 0
    .param p1, "m"    # Ljava/lang/reflect/Method;
    .param p2, "c"    # Ljava/lang/reflect/Constructor;
    .param p3, "behavior"    # I

    .prologue
    .line 1435
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;-><init>(Ljava/lang/reflect/Method;)V

    .line 1436
    iput-object p2, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->constructor:Ljava/lang/reflect/Constructor;

    .line 1437
    iput p3, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->behavior:I

    .line 1438
    return-void
.end method

.method private istore(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
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
    .line 1469
    invoke-virtual {p0}, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1470
    return-void
.end method


# virtual methods
.method create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "child"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1446
    if-nez p3, :cond_0

    .line 1447
    iget-object v1, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->constructor:Ljava/lang/reflect/Constructor;

    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->constructor:Ljava/lang/reflect/Constructor;

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_3

    new-array v0, v2, [Ljava/lang/Object;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 1451
    :cond_0
    instance-of v0, p3, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    if-eqz v0, :cond_1

    .line 1452
    check-cast p3, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .end local p3    # "child":Ljava/lang/Object;
    invoke-virtual {p3, p1}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->createObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object p3

    .line 1454
    .restart local p3    # "child":Ljava/lang/Object;
    :cond_1
    iget v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->behavior:I

    if-ne v0, v3, :cond_2

    .line 1455
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->istore(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1457
    :cond_2
    return-object p3

    .line 1447
    :cond_3
    new-array v0, v3, [Ljava/lang/Object;

    aput-object p1, v0, v2

    goto :goto_0
.end method

.method isPolyMorphic()Z
    .locals 1

    .prologue
    .line 1441
    const/4 v0, 0x1

    return v0
.end method

.method store(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2
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
    .line 1462
    iget v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->behavior:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 1463
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/IntrospectionHelper$AddNestedCreator;->istore(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1465
    :cond_0
    return-void
.end method
