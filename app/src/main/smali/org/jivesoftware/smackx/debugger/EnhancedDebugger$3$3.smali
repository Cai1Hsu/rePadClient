.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;->reconnectingIn(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

.field final synthetic val$seconds:I


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;I)V
    .locals 0

    .prologue
    .line 222
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

    iput p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;->val$seconds:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 224
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JFormattedTextField;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Attempt to reconnect in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;->val$seconds:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " seconds"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JFormattedTextField;->setValue(Ljava/lang/Object;)V

    .line 225
    return-void
.end method
