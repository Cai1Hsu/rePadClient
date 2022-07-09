.class Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;
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
    .line 287
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 7
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 289
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .local v1, "debuggersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;>;"
    const/4 v3, 0x0

    .local v3, "index":I
    :goto_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_1

    .line 292
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .line 293
    .local v0, "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->isConnectionActive()Z

    move-result v4

    if-nez v4, :cond_0

    .line 295
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->cancel()V

    .line 296
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 291
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 299
    .end local v0    # "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    .line 301
    .restart local v0    # "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v4

    iget-object v5, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->tabbedPane:Ljavax/swing/JTabbedPane;

    invoke-virtual {v4, v5}, Ljavax/swing/JTabbedPane;->remove(Ljava/awt/Component;)V

    .line 302
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 305
    .end local v0    # "debugger":Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
    :cond_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v4}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$200(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JFrame;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Smack Debug Window -- Total connections: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-static {v6}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->access$000(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)Ljavax/swing/JTabbedPane;

    move-result-object v6

    invoke-virtual {v6}, Ljavax/swing/JTabbedPane;->getComponentCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljavax/swing/JFrame;->setTitle(Ljava/lang/String;)V

    .line 308
    return-void
.end method
