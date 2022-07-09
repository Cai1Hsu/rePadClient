.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$5;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;->reconnectionFailed(Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;)V
    .locals 0

    .prologue
    .line 239
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$5;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 241
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$5;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JFormattedTextField;

    move-result-object v0

    const-string/jumbo v1, "Reconnection failed"

    invoke-virtual {v0, v1}, Ljavax/swing/JFormattedTextField;->setValue(Ljava/lang/Object;)V

    .line 242
    return-void
.end method
