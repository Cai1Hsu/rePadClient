.class Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;
.super Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
.source "BorlandDeploymentTool.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;

.field private final val$srcDir:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;Lorg/apache/tools/ant/Task;Ljava/io/File;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;
    .param p2, "x0"    # Lorg/apache/tools/ant/Task;
    .param p3, "x1"    # Ljava/io/File;
    .param p4, "val$srcDir"    # Ljava/io/File;

    .prologue
    .line 211
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool;

    iput-object p4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->val$srcDir:Ljava/io/File;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;-><init>(Lorg/apache/tools/ant/Task;Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method protected processElement()V
    .locals 5

    .prologue
    .line 212
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->currentElement:Ljava/lang/String;

    const-string/jumbo v4, "type-storage"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 214
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->currentText:Ljava/lang/String;

    .line 216
    .local v2, "fileNameWithMETA":Ljava/lang/String;
    const-string/jumbo v3, "META-INF/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 219
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->val$srcDir:Ljava/io/File;

    invoke-direct {v0, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 221
    .local v0, "descriptorFile":Ljava/io/File;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandDeploymentTool$1;->ejbFiles:Ljava/util/Hashtable;

    invoke-virtual {v3, v2, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .end local v0    # "descriptorFile":Ljava/io/File;
    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "fileNameWithMETA":Ljava/lang/String;
    :cond_0
    return-void
.end method
