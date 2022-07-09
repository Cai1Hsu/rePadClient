.class Lorg/apache/tools/ant/ProjectHelper$1;
.super Ljava/lang/ThreadLocal;
.source "ProjectHelper.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 174
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
