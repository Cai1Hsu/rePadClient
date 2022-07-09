.class public Lorg/apache/tools/ant/taskdefs/rmic/XNewRmic;
.super Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;
.source "XNewRmic.java"


# static fields
.field public static final COMPILER_NAME:Ljava/lang/String; = "xnew"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;-><init>()V

    .line 38
    return-void
.end method


# virtual methods
.method protected setupRmicCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 45
    const/4 v2, 0x1

    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "-Xnew"

    aput-object v3, v1, v2

    .line 48
    .local v1, "options":[Ljava/lang/String;
    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;->setupRmicCommand([Ljava/lang/String;)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 49
    .local v0, "commandline":Lorg/apache/tools/ant/types/Commandline;
    return-object v0
.end method
