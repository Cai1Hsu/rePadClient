.class Lorg/apache/tools/ant/Project$1;
.super Ljava/lang/ThreadLocal;
.source "Project.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/Project;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/tools/ant/Project$1;->this$0:Lorg/apache/tools/ant/Project;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 179
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object v0
.end method
