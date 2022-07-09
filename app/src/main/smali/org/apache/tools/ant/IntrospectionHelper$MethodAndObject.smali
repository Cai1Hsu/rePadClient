.class Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;
.super Ljava/lang/Object;
.source "IntrospectionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/IntrospectionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MethodAndObject"
.end annotation


# instance fields
.field private method:Ljava/lang/reflect/Method;

.field private object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 1649
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1650
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->method:Ljava/lang/reflect/Method;

    .line 1651
    iput-object p2, p0, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->object:Ljava/lang/Object;

    .line 1652
    return-void
.end method

.method static access$700(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    .prologue
    .line 1646
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->object:Ljava/lang/Object;

    return-object v0
.end method

.method static access$800(Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;)Ljava/lang/reflect/Method;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;

    .prologue
    .line 1646
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$MethodAndObject;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method
