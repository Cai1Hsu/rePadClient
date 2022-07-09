.class Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;
.super Ljava/lang/Object;
.source "ChatStateManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ChatManagerListener;
.implements Lorg/jivesoftware/smack/MessageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/ChatStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IncomingMessageInterceptor"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ChatStateManager;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smackx/ChatStateManager;)V
    .locals 0

    .prologue
    .line 186
    iput-object p1, p0, Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;->this$0:Lorg/jivesoftware/smackx/ChatStateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smackx/ChatStateManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smackx/ChatStateManager;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/ChatStateManager$1;

    .prologue
    .line 186
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;-><init>(Lorg/jivesoftware/smackx/ChatStateManager;)V

    return-void
.end method


# virtual methods
.method public chatCreated(Lorg/jivesoftware/smack/Chat;Z)V
    .locals 0
    .param p1, "chat"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "createdLocally"    # Z

    .prologue
    .line 189
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smack/Chat;->addMessageListener(Lorg/jivesoftware/smack/MessageListener;)V

    .line 190
    return-void
.end method

.method public processMessage(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smack/packet/Message;)V
    .locals 4
    .param p1, "chat"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "message"    # Lorg/jivesoftware/smack/packet/Message;

    .prologue
    .line 193
    const-string/jumbo v3, "http://jabber.org/protocol/chatstates"

    invoke-virtual {p2, v3}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .line 195
    .local v1, "extension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-nez v1, :cond_0

    .line 208
    :goto_0
    return-void

    .line 201
    :cond_0
    :try_start_0
    invoke-interface {v1}, Lorg/jivesoftware/smack/packet/PacketExtension;->getElementName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smackx/ChatState;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/ChatState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 207
    .local v2, "state":Lorg/jivesoftware/smackx/ChatState;
    iget-object v3, p0, Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;->this$0:Lorg/jivesoftware/smackx/ChatStateManager;

    invoke-static {v3, p1, v2}, Lorg/jivesoftware/smackx/ChatStateManager;->access$400(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)V

    goto :goto_0

    .line 203
    .end local v2    # "state":Lorg/jivesoftware/smackx/ChatState;
    :catch_0
    move-exception v0

    .line 204
    .local v0, "ex":Ljava/lang/Exception;
    goto :goto_0
.end method
