.class abstract Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
.super Ljava/lang/Object;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/IntrospectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "NestedCreator"
.end annotation


# instance fields
.field private method:Ljava/lang/reflect/Method;


# direct methods
.method protected constructor <init>(Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 1393
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1394
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->method:Ljava/lang/reflect/Method;

    .line 1395
    return-void
.end method

.method static access$200(Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;)Ljava/lang/reflect/Method;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;

    .prologue
    .line 1390
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method


# virtual methods
.method abstract create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation
.end method

.method getMethod()Ljava/lang/reflect/Method;
    .locals 1

    .prologue
    .line 1397
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method getRealObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1403
    const/4 v0, 0x0

    return-object v0
.end method

.method isPolyMorphic()Z
    .locals 1

    .prologue
    .line 1400
    const/4 v0, 0x0

    return v0
.end method

.method store(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
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
    .line 1411
    return-void
.end method
