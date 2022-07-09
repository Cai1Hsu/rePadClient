.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addSentPacketToTable(Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

.field final synthetic val$dateFormatter:Ljava/text/SimpleDateFormat;

.field final synthetic val$packet:Lorg/jivesoftware/smack/packet/Packet;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Lorg/jivesoftware/smack/packet/Packet;Ljava/text/SimpleDateFormat;)V
    .locals 0

    .prologue
    .line 817
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    iput-object p3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$dateFormatter:Ljava/text/SimpleDateFormat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 820
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Packet;->getTo()Ljava/lang/String;

    move-result-object v2

    .line 821
    .local v2, "to":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 823
    .local v3, "type":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2008(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I

    .line 824
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    instance-of v4, v4, Lorg/jivesoftware/smack/packet/IQ;

    if-eqz v4, :cond_1

    .line 825
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$900()Ljavax/swing/ImageIcon;

    move-result-object v1

    .line 826
    .local v1, "packetTypeIcon":Ljavax/swing/Icon;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "IQ Sent (class="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 827
    .local v0, "messageType":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ$Type;->toString()Ljava/lang/String;

    move-result-object v3

    .line 828
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2108(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I

    .line 849
    :goto_0
    sget v4, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->MAX_TABLE_ROWS:I

    if-lez v4, :cond_0

    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$400(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/table/DefaultTableModel;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/swing/table/DefaultTableModel;->getRowCount()I

    move-result v4

    sget v5, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->MAX_TABLE_ROWS:I

    if-lt v4, v5, :cond_0

    .line 851
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$400(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/table/DefaultTableModel;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljavax/swing/table/DefaultTableModel;->removeRow(I)V

    .line 854
    :cond_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$400(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/table/DefaultTableModel;

    move-result-object v4

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/Object;

    iget-object v6, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iget-object v7, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$1700(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    const/4 v6, 0x1

    iget-object v7, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$dateFormatter:Ljava/text/SimpleDateFormat;

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2500()Ljavax/swing/ImageIcon;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x3

    aput-object v1, v5, v6

    const/4 v6, 0x4

    aput-object v0, v5, v6

    const/4 v6, 0x5

    iget-object v7, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x6

    aput-object v3, v5, v6

    const/4 v6, 0x7

    aput-object v2, v5, v6

    const/16 v6, 0x8

    const-string/jumbo v7, ""

    aput-object v7, v5, v6

    invoke-virtual {v4, v5}, Ljavax/swing/table/DefaultTableModel;->addRow([Ljava/lang/Object;)V

    .line 867
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$1900(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V

    .line 868
    return-void

    .line 830
    .end local v0    # "messageType":Ljava/lang/String;
    .end local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    instance-of v4, v4, Lorg/jivesoftware/smack/packet/Message;

    if-eqz v4, :cond_2

    .line 831
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$1100()Ljavax/swing/ImageIcon;

    move-result-object v1

    .line 832
    .restart local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    const-string/jumbo v0, "Message Sent"

    .line 833
    .restart local v0    # "messageType":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    check-cast v4, Lorg/jivesoftware/smack/packet/Message;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Message$Type;->toString()Ljava/lang/String;

    move-result-object v3

    .line 834
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2208(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I

    goto/16 :goto_0

    .line 836
    .end local v0    # "messageType":Ljava/lang/String;
    .end local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    :cond_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    instance-of v4, v4, Lorg/jivesoftware/smack/packet/Presence;

    if-eqz v4, :cond_3

    .line 837
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$1300()Ljavax/swing/ImageIcon;

    move-result-object v1

    .line 838
    .restart local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    const-string/jumbo v0, "Presence Sent"

    .line 839
    .restart local v0    # "messageType":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    check-cast v4, Lorg/jivesoftware/smack/packet/Presence;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Presence$Type;->toString()Ljava/lang/String;

    move-result-object v3

    .line 840
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2308(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I

    goto/16 :goto_0

    .line 843
    .end local v0    # "messageType":Ljava/lang/String;
    .end local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    :cond_3
    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$1500()Ljavax/swing/ImageIcon;

    move-result-object v1

    .line 844
    .restart local v1    # "packetTypeIcon":Ljavax/swing/Icon;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " Sent"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 845
    .restart local v0    # "messageType":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$22;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$2408(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)I

    goto/16 :goto_0
.end method
