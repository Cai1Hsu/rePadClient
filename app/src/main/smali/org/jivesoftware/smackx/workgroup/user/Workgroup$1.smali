.class Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;
.super Ljava/lang/Object;
.source "Workgroup.java"

# interfaces
.implements Lorg/jivesoftware/smackx/workgroup/user/QueueListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/workgroup/user/Workgroup;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public departedQueue()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$002(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Z)Z

    .line 97
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-static {v0, v2}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$102(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I

    .line 98
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-static {v0, v2}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$202(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I

    .line 99
    return-void
.end method

.method public joinedQueue()V
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$002(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Z)Z

    .line 93
    return-void
.end method

.method public queuePositionUpdated(I)V
    .locals 1
    .param p1, "currentPosition"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-static {v0, p1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$102(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I

    .line 103
    return-void
.end method

.method public queueWaitTimeUpdated(I)V
    .locals 1
    .param p1, "secondsRemaining"    # I

    .prologue
    .line 106
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$1;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-static {v0, p1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$202(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;I)I

    .line 107
    return-void
.end method
