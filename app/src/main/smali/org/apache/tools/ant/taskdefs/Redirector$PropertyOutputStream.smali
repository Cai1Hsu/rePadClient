.class Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "Redirector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Redirector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PropertyOutputStream"
.end annotation


# instance fields
.field private closed:Z

.field private property:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/Redirector;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Redirector;
    .param p2, "property"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Redirector;

    .line 69
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->closed:Z

    .line 70
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->property:Ljava/lang/String;

    .line 71
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->access$000(Lorg/apache/tools/ant/taskdefs/Redirector;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 75
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->closed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->access$100(Lorg/apache/tools/ant/taskdefs/Redirector;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Redirector;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Redirector;->access$200(Lorg/apache/tools/ant/taskdefs/Redirector;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 76
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->this$0:Lorg/apache/tools/ant/taskdefs/Redirector;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->property:Ljava/lang/String;

    invoke-static {v0, p0, v2}, Lorg/apache/tools/ant/taskdefs/Redirector;->access$300(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/io/ByteArrayOutputStream;Ljava/lang/String;)V

    .line 77
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream;->closed:Z

    .line 79
    :cond_1
    monitor-exit v1

    .line 80
    return-void

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
