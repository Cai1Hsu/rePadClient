.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->read(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

.field final synthetic val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 414
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 416
    sget-boolean v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->PERSISTED_DEBUGGER:Z

    if-eqz v2, :cond_1

    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->isVisible()Z

    move-result v2

    if-nez v2, :cond_1

    .line 442
    :cond_0
    :goto_0
    return-void

    .line 422
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    const-string/jumbo v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 423
    .local v1, "index":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 424
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    invoke-virtual {v2}, Ljavax/swing/JTextArea;->getLineCount()I

    move-result v2

    sget v3, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->MAX_TABLE_ROWS:I

    if-lt v2, v3, :cond_2

    .line 427
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    const-string/jumbo v3, ""

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v5, v5, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljavax/swing/JTextArea;->getLineEndOffset(I)I

    move-result v5

    invoke-virtual {v2, v3, v4, v5}, Ljavax/swing/JTextArea;->replaceRange(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 433
    :cond_2
    :goto_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 434
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 435
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 436
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    goto :goto_0

    .line 429
    :catch_0
    move-exception v0

    .line 430
    .local v0, "e":Ljavax/swing/text/BadLocationException;
    invoke-virtual {v0}, Ljavax/swing/text/BadLocationException;->printStackTrace()V

    goto :goto_1

    .line 440
    .end local v0    # "e":Ljavax/swing/text/BadLocationException;
    :cond_3
    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;

    iget-object v2, v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11;->val$receivedText:Ljavax/swing/JTextArea;

    iget-object v3, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$11$1;->val$str:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    goto :goto_0
.end method
