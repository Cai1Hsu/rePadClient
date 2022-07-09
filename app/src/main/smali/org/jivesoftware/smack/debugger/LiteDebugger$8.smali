.class Lorg/jivesoftware/smack/debugger/LiteDebugger$8;
.super Ljava/lang/Object;
.source "LiteDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/ReaderListener;


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

.field final synthetic val$receivedText1:Ljavax/swing/JTextArea;

.field final synthetic val$receivedText2:Ljavax/swing/JTextArea;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JTextArea;Ljavax/swing/JTextArea;)V
    .locals 0

    .prologue
    .line 202
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText1:Ljavax/swing/JTextArea;

    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText2:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Ljava/lang/String;)V
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 204
    const-string/jumbo v1, ">"

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 205
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 206
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText1:Ljavax/swing/JTextArea;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 207
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText2:Ljavax/swing/JTextArea;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 208
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText1:Ljavax/swing/JTextArea;

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 209
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText2:Ljavax/swing/JTextArea;

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 211
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText1:Ljavax/swing/JTextArea;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 212
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText2:Ljavax/swing/JTextArea;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 219
    :cond_0
    :goto_0
    return-void

    .line 216
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText1:Ljavax/swing/JTextArea;

    invoke-virtual {v1, p1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 217
    iget-object v1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$8;->val$receivedText2:Ljavax/swing/JTextArea;

    invoke-virtual {v1, p1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    goto :goto_0
.end method
