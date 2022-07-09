.class Lorg/apache/tools/ant/taskdefs/Execute$2;
.super Ljava/lang/Thread;
.source "Execute.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;

.field private final val$f:Ljava/io/File;

.field private final val$p:Ljava/lang/Process;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;Ljava/lang/Process;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;
    .param p2, "val$p"    # Ljava/lang/Process;
    .param p3, "val$f"    # Ljava/io/File;

    .prologue
    .line 1248
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Execute$2;->this$0:Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Execute$2;->val$p:Ljava/lang/Process;

    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Execute$2;->val$f:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1250
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute$2;->val$p:Ljava/lang/Process;

    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1254
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Execute$2;->val$f:Ljava/io/File;

    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->delete(Ljava/io/File;)V

    .line 1255
    return-void

    .line 1251
    :catch_0
    move-exception v0

    goto :goto_0
.end method
