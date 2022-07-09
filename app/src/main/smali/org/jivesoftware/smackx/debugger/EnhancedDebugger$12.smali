.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/WriterListener;


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
    .line 450
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;->val$sentText:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public write(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 452
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12$1;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$12;Ljava/lang/String;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 477
    return-void
.end method
