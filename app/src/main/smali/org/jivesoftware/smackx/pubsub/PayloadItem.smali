.class public Lorg/jivesoftware/smackx/pubsub/PayloadItem;
.super Lorg/jivesoftware/smackx/pubsub/Item;
.source "PayloadItem.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Lorg/jivesoftware/smack/packet/PacketExtension;",
        ">",
        "Lorg/jivesoftware/smackx/pubsub/Item;"
    }
.end annotation


# instance fields
.field private payload:Lorg/jivesoftware/smack/packet/PacketExtension;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .locals 2
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "nodeId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "TE;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    .local p3, "payloadExt":Lorg/jivesoftware/smack/packet/PacketExtension;, "TE;"
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/pubsub/Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    if-nez p3, :cond_0

    .line 94
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "payload cannot be \'null\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_0
    iput-object p3, p0, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->payload:Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .locals 2
    .param p1, "itemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TE;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    .local p2, "payloadExt":Lorg/jivesoftware/smack/packet/PacketExtension;, "TE;"
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/pubsub/Item;-><init>(Ljava/lang/String;)V

    .line 71
    if-nez p2, :cond_0

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "payload cannot be \'null\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    iput-object p2, p0, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->payload:Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 74
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    .local p1, "payloadExt":Lorg/jivesoftware/smack/packet/PacketExtension;, "TE;"
    invoke-direct {p0}, Lorg/jivesoftware/smackx/pubsub/Item;-><init>()V

    .line 56
    if-nez p1, :cond_0

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "payload cannot be \'null\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->payload:Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 59
    return-void
.end method


# virtual methods
.method public getPayload()Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    iget-object v0, p0, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->payload:Lorg/jivesoftware/smack/packet/PacketExtension;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 136
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " | Content ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 2

    .prologue
    .line 112
    .local p0, "this":Lorg/jivesoftware/smackx/pubsub/PayloadItem;, "Lorg/jivesoftware/smackx/pubsub/PayloadItem<TE;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "<item"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 116
    const-string/jumbo v1, " id=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->getNode()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 122
    const-string/jumbo v1, " node=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->getNode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_1
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    iget-object v1, p0, Lorg/jivesoftware/smackx/pubsub/PayloadItem;->payload:Lorg/jivesoftware/smack/packet/PacketExtension;

    invoke-interface {v1}, Lorg/jivesoftware/smack/packet/PacketExtension;->toXML()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    const-string/jumbo v1, "</item>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
