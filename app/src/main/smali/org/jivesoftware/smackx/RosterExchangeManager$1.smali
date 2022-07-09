.class Lorg/jivesoftware/smackx/RosterExchangeManager$1;
.super Ljava/lang/Object;
.source "RosterExchangeManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/RosterExchangeManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/RosterExchangeManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/RosterExchangeManager;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lorg/jivesoftware/smackx/RosterExchangeManager$1;->this$0:Lorg/jivesoftware/smackx/RosterExchangeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 167
    move-object v0, p1

    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    .line 168
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    const-string/jumbo v2, "x"

    const-string/jumbo v3, "jabber:x:roster"

    invoke-virtual {v0, v2, v3}, Lorg/jivesoftware/smack/packet/Message;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/RosterExchange;

    .line 171
    .local v1, "rosterExchange":Lorg/jivesoftware/smackx/packet/RosterExchange;
    iget-object v2, p0, Lorg/jivesoftware/smackx/RosterExchangeManager$1;->this$0:Lorg/jivesoftware/smackx/RosterExchangeManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/RosterExchange;->getRosterEntries()Ljava/util/Iterator;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lorg/jivesoftware/smackx/RosterExchangeManager;->access$000(Lorg/jivesoftware/smackx/RosterExchangeManager;Ljava/lang/String;Ljava/util/Iterator;)V

    .line 172
    return-void
.end method
