.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;
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

.field final synthetic val$sentText:Ljavax/swing/JTextArea;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JTextArea;)V
    .locals 0

    .prologue
    .line 364
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;->val$sentText:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 366
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$8;->val$sentText:Ljavax/swing/JTextArea;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 367
    return-void
.end method
