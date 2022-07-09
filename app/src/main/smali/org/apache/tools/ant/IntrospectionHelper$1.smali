.class Lorg/apache/tools/ant/IntrospectionHelper$1;
.super Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;
.source "IntrospectionHelper.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/IntrospectionHelper;

.field private final val$nestedElement:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/IntrospectionHelper;Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/IntrospectionHelper;
    .param p2, "x0"    # Ljava/lang/reflect/Method;
    .param p3, "val$nestedElement"    # Ljava/lang/Object;

    .prologue
    .line 548
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$1;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-object p3, p0, Lorg/apache/tools/ant/IntrospectionHelper$1;->val$nestedElement:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lorg/apache/tools/ant/IntrospectionHelper$NestedCreator;-><init>(Ljava/lang/reflect/Method;)V

    return-void
.end method


# virtual methods
.method create(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "parent"    # Ljava/lang/Object;
    .param p3, "ignore"    # Ljava/lang/Object;

    .prologue
    .line 549
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$1;->val$nestedElement:Ljava/lang/Object;

    return-object v0
.end method
