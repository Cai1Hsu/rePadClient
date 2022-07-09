.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;
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
    .line 532
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;->val$adhocMessages:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 3
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 534
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$16;->val$adhocMessages:Ljavax/swing/JTextArea;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "<presence to=\"\" id=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x5

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->randomString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "-X\"/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 536
    return-void
.end method
