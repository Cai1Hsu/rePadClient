.class Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;
.super Ljava/lang/ThreadLocal;
.source "Definer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Definer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResourceStack"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Definer$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/Definer$1;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;-><init>()V

    return-void
.end method


# virtual methods
.method getStack()Ljava/util/Map;
    .locals 1

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Definer$ResourceStack;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method
