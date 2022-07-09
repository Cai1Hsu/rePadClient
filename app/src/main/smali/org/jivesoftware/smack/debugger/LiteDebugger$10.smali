.class Lorg/jivesoftware/smack/debugger/LiteDebugger$10;
.super Ljava/lang/Object;
.source "LiteDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


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
    .line 245
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText1:Ljavax/swing/JTextArea;

    iput-object p3, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText2:Ljavax/swing/JTextArea;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 247
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText1:Ljavax/swing/JTextArea;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText2:Ljavax/swing/JTextArea;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText1:Ljavax/swing/JTextArea;

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$10;->val$interpretedText2:Ljavax/swing/JTextArea;

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljavax/swing/JTextArea;->append(Ljava/lang/String;)V

    .line 251
    return-void
.end method
