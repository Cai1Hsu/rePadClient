.class public Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
.super Ljava/lang/Object;
.source "Replace.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Replace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NestedString"
.end annotation


# instance fields
.field private buf:Ljava/lang/StringBuffer;

.field private expandProperties:Z

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Replace;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/Replace;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->expandProperties:Z

    .line 92
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->buf:Ljava/lang/StringBuffer;

    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 115
    return-void
.end method

.method public getText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 121
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->buf:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "s":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->expandProperties:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->this$0:Lorg/apache/tools/ant/taskdefs/Replace;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Replace;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public setExpandProperties(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 105
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->expandProperties:Z

    .line 106
    return-void
.end method
