.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->write(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

.field final synthetic val$str:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 452
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->val$str:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 454
    sget-boolean v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->PERSISTED_DEBUGGER:Z

    if-eqz v1, :cond_1

    invoke-static {}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->getInstance()Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->isVisible()Z

    move-result v1

    if-nez v1, :cond_1

    .line 473
    :cond_0
    :goto_0
    return-void

    .line 460
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    invoke-virtual {v1}, Ljavax/swing/JTextArea;->getLineCount()I

    move-result v1

    sget v2, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->MAX_TABLE_ROWS:I

    if-lt v1, v2, :cond_2

    .line 462
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iget-object v4, v4, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljavax/swing/JTextArea;->getLineEndOffset(I)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Ljavax/swing/JTextArea;->replaceRange(Ljava/lang/String;II)V
    :try_end_0
    .catch Ljavax/swing/text/BadLocationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    :cond_2
    :goto_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->val$str:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 470
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->val$str:Ljava/lang/String;

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 471
    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    goto :goto_0

    .line 464
    :catch_0
    move-exception v0

    .line 465
    .local v0, "e":Ljavax/swing/text/BadLocationException;
    invoke-virtual {v0}, Ljavax/swing/text/BadLocationException;->printStackTrace()V

    goto :goto_1
.end method
