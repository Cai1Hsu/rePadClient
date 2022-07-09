.class Lorg/apache/tools/ant/IntrospectionHelper$8;
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
    .line 1111
    iput-object p1, p0, Lorg/apache/tools/ant/IntrospectionHelper$8;->this$0:Lorg/apache/tools/ant/IntrospectionHelper;

    iput-object p4, p0, Lorg/apache/tools/ant/IntrospectionHelper$8;->val$m:Ljava/lang/reflect/Method;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper$AttributeSetter;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method set(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)V
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
    .line 1110
    iget-object v0, p0, Lorg/apache/tools/ant/IntrospectionHelper$8;->val$m:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p1, p3}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    aput-object v3, v1, v2

    invoke-virtual {v0, p2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    return-void
.end method
