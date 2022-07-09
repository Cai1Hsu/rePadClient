.class Lorg/jivesoftware/smack/debugger/LiteDebugger$7;
.super Ljava/lang/Object;
.source "LiteDebugger.java"

# interfaces
.implements Ljava/awt/event/ActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/debugger/LiteDebugger;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

.field final synthetic val$interpretedText1:Ljavax/swing/JTextArea;

.field final synthetic val$interpretedText2:Ljavax/swing/JTextArea;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V
    .locals 0

    .prologue
    .line 181
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;->val$interpretedText1:Ljavax/swing/JTextArea;

    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;->val$interpretedText2:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public actionPerformed(Ljava/awt/event/ActionEvent;)V
    .locals 2
    .param p1, "e"    # Ljava/awt/event/ActionEvent;

    .prologue
    .line 183
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;->val$interpretedText1:Ljavax/swing/JTextArea;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$7;->val$interpretedText2:Ljavax/swing/JTextArea;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->setText(Ljava/lang/String;)V

    .line 185
    return-void
.end method
