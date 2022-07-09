.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljavax/swing/event/ListSelectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SelectionListener"
.end annotation


# instance fields
.field table:Ljavax/swing/JTable;

.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTable;)V
    .locals 0
    .param p2, "table"    # Ljavax/swing/JTable;

    .prologue
    .line 1004
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1005
    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->table:Ljavax/swing/JTable;

    .line 1006
    return-void
.end method


# virtual methods
.method public valueChanged(Ljavax/swing/event/ListSelectionEvent;)V
    .locals 4
    .param p1, "e"    # Ljavax/swing/event/ListSelectionEvent;

    .prologue
    const/4 v3, 0x0

    .line 1009
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->table:Ljavax/swing/JTable;

    invoke-virtual {v0}, Ljavax/swing/JTable;->getSelectedRow()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 1011
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$300(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JTextArea;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 1020
    :goto_0
    return-void

    .line 1015
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$300(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JTextArea;

    move-result-object v1

    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->table:Ljavax/swing/JTable;

    invoke-virtual {v0}, Ljavax/swing/JTable;->getModel()Ljavax/swing/table/TableModel;

    move-result-object v0

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->table:Ljavax/swing/JTable;

    invoke-virtual {v2}, Ljavax/swing/JTable;->getSelectedRow()I

    move-result v2

    invoke-interface {v0, v2, v3}, Ljavax/swing/table/TableModel;->getValueAt(II)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 1018
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$SelectionListener;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$300(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/JTextArea;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljavax/swing/JTextArea;->setCaretPosition(I)V

    goto :goto_0
.end method
