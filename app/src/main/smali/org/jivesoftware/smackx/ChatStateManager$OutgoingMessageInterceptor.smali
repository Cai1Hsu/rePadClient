.class Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;
.super Ljava/lang/Object;
.source "ChatStateManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketInterceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/ChatStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OutgoingMessageInterceptor"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ChatStateManager;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smackx/ChatStateManager;)V
    .locals 0

    .prologue
    .line 172
    iput-object p1, p0, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;->this$0:Lorg/jivesoftware/smackx/ChatStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smackx/ChatStateManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smackx/ChatStateManager;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/ChatStateManager$1;

    .prologue
    .line 172
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;-><init>(Lorg/jivesoftware/smackx/ChatStateManager;)V

    return-void
.end method


# virtual methods
.method public interceptPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 175
    move-object v1, p1

    check-cast v1, Lorg/jivesoftware/smack/packet/Message;

    .line 176
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    iget-object v2, p0, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;->this$0:Lorg/jivesoftware/smackx/ChatStateManager;

    invoke-static {v2}, Lorg/jivesoftware/smackx/ChatStateManager;->access$200(Lorg/jivesoftware/smackx/ChatStateManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jivesoftware/smack/Connection;->getChatManager()Lorg/jivesoftware/smack/ChatManager;

    move-result-object v2

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Message;->getThread()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smack/ChatManager;->getThreadChat(Ljava/lang/String;)Lorg/jivesoftware/smack/Chat;

    move-result-object v0

    .line 177
    .local v0, "chat":Lorg/jivesoftware/smack/Chat;
    if-nez v0, :cond_1

    .line 183
    :cond_0
    :goto_0
    return-void

    .line 180
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;->this$0:Lorg/jivesoftware/smackx/ChatStateManager;

    sget-object v3, Lorg/jivesoftware/smackx/ChatState;->active:Lorg/jivesoftware/smackx/ChatState;

    invoke-static {v2, v0, v3}, Lorg/jivesoftware/smackx/ChatStateManager;->access$300(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    new-instance v2, Lorg/jivesoftware/smackx/packet/ChatStateExtension;

    sget-object v3, Lorg/jivesoftware/smackx/ChatState;->active:Lorg/jivesoftware/smackx/ChatState;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/packet/ChatStateExtension;-><init>(Lorg/jivesoftware/smackx/ChatState;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0
.end method
