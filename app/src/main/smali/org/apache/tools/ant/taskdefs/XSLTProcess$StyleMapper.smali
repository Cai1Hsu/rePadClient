.class Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;
.super Ljava/lang/Object;
.source "XSLTProcess.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/XSLTProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StyleMapper"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    .prologue
    .line 1407
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;->this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;Lorg/apache/tools/ant/taskdefs/XSLTProcess$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess;
    .param p2, "x1"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess$1;

    .prologue
    .line 1407
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;-><init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p1, "xmlFile"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1413
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 1414
    .local v0, "dotPos":I
    if-lez v0, :cond_0

    .line 1415
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 1417
    :cond_0
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;->this$0:Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->access$100(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    return-object v1
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 1409
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 1411
    return-void
.end method
