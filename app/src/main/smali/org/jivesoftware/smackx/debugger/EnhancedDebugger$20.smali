.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->userHasLogged(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

.field final synthetic val$debugger:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

.field final synthetic val$user:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 0

    .prologue
    .line 701
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->val$user:Ljava/lang/String;

    iput-object p3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->val$debugger:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 703
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$600(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JFormattedTextField;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->val$user:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/swing/JFormattedTextField;->setText(Ljava/lang/String;)V

    .line 704
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->val$debugger:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->val$user:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->userHasLogged(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)V

    .line 707
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$500(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$20;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$700(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Lorg/jivesoftware/smack/ConnectionListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 708
    return-void
.end method
