.class Lorg/apache/tools/ant/ProjectHelper$2;
.super Ljava/lang/ThreadLocal;
.source "ProjectHelper.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 202
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 203
    const-string/jumbo v0, "."

    return-object v0
.end method
