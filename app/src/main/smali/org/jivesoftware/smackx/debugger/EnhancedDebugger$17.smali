.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addAdhocPacketPanel()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

.field final synthetic val$adhocMessages:Ljavax/swing/JTextArea;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V
    .locals 0

    .prologue
    .line 542
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->val$adhocMessages:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 544
    const-string/jumbo v1, ""

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->val$adhocMessages:Ljavax/swing/JTextArea;

    invoke-virtual {v2}, Ljavax/swing/JTextArea;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 545
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->val$adhocMessages:Ljavax/swing/JTextArea;

    invoke-virtual {v2}, Ljavax/swing/JTextArea;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)V

    .line 546
    .local v0, "packetToSend":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$17;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$500(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 548
    .end local v0    # "packetToSend":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;
    :cond_0
    return-void
.end method
