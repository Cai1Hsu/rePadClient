.class Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool$1;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
.source "WebsphereDeploymentTool.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;Lorg/apache/tools/ant/Task;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;
    .param p2, "x0"    # Lorg/apache/tools/ant/Task;
    .param p3, "x1"    # Ljava/io/File;

    .prologue
    .line 391
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool$1;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/WebsphereDeploymentTool;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;-><init>(Lorg/apache/tools/ant/Task;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method protected processElement()V
    .locals 0

    .prologue
    .line 392
    return-void
.end method
