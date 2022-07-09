.class public Lorg/jivesoftware/smack/filter/MessageTypeFilter;
.super Ljava/lang/Object;
.source "MessageTypeFilter.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# instance fields
.field private final type:Lorg/jivesoftware/smack/packet/Message$Type;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/packet/Message$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Message$Type;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/jivesoftware/smack/filter/MessageTypeFilter;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 43
    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .locals 2
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 46
    instance-of v0, p1, Lorg/jivesoftware/smack/packet/Message;

    if-nez v0, :cond_0

    .line 47
    const/4 v0, 0x0

    .line 50
    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :goto_0
    return v0

    .restart local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    :cond_0
    check-cast p1, Lorg/jivesoftware/smack/packet/Message;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getType()Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smack/filter/MessageTypeFilter;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method
