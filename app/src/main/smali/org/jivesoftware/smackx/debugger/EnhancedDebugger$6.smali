.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$6;
.super Ljavax/swing/AbstractAction;
.source "EnhancedDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->addBasicPanels()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x77043c3ceb5dc9ddL


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 0

    .prologue
    .line 324
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$6;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljavax/swing/AbstractAction;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 329
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$6;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-static {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$400(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)Ljavax/swing/table/DefaultTableModel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/swing/table/DefaultTableModel;->setRowCount(I)V

    .line 331
    return-void
.end method
