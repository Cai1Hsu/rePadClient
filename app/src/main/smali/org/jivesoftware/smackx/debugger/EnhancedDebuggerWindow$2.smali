.class Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;
.super Ljava/lang/Object;
.source "EnhancedDebuggerWindow.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)V
    .locals 0

    .prologue
    .line 266
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 5
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 269
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/swing/JTabbedPane;->getSelectedIndex()I

    move-result v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v3}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v3

    invoke-virtual {v3}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_0

    .line 270
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/swing/JTabbedPane;->getSelectedIndex()I

    move-result v1

    .line 272
    .local v1, "index":I
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .line 273
    .local v0, "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->cancel()V

    .line 275
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v2

    iget-object v3, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v2, v3}, Ljavax/swing/JTabbedPane;->remove(Ljava/awt/Component;)V

    .line 276
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 278
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JFrame;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Smack Debug Window -- Total connections: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/swing/JFrame;->setTitle(Ljava/lang/String;)V

    .line 282
    .end local v0    # "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    .end local v1    # "index":I
    :cond_0
    return-void
.end method
