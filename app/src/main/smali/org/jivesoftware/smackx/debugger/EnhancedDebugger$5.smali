.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$5;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addBasicPanels()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 0

    .prologue
    .line 308
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$5;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 311
    invoke-static {}, Ljava/awt/Toolkit;->getDefaultToolkit()Ljava/awt/Toolkit;

    move-result-object v1

    invoke-virtual {v1}, Ljava/awt/Toolkit;->getSystemClipboard()Ljava/awt/datatransfer/Clipboard;

    move-result-object v0

    .line 313
    .local v0, "clipboard":Ljava/awt/datatransfer/Clipboard;
    new-instance v1, Ljava/awt/datatransfer/StringSelection;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$5;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$300(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JTextArea;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/swing/JTextArea;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/awt/datatransfer/StringSelection;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/awt/datatransfer/Clipboard;->setContents(Ljava/awt/datatransfer/Transferable;Ljava/awt/datatransfer/ClipboardOwner;)V

    .line 314
    return-void
.end method
