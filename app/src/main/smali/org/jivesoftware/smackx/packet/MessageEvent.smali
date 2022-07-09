.class public Lorg/jivesoftware/smackx/packet/MessageEvent;
.super Ljava/lang/Object;
.source "MessageEvent.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# static fields
.field public static final CANCELLED:Ljava/lang/String; = "cancelled"

.field public static final COMPOSING:Ljava/lang/String; = "composing"

.field public static final DELIVERED:Ljava/lang/String; = "delivered"

.field public static final DISPLAYED:Ljava/lang/String; = "displayed"

.field public static final OFFLINE:Ljava/lang/String; = "offline"


# instance fields
.field private cancelled:Z

.field private composing:Z

.field private delivered:Z

.field private displayed:Z

.field private offline:Z

.field private packetID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->offline:Z

    .line 68
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->delivered:Z

    .line 69
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->displayed:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->composing:Z

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->cancelled:Z

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->packetID:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const-string/jumbo v0, "x"

    return-object v0
.end method

.method public getEventTypes()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v0, "allEvents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isDelivered()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 173
    const-string/jumbo v1, "delivered"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isMessageEventRequest()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 176
    const-string/jumbo v1, "cancelled"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isComposing()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 179
    const-string/jumbo v1, "composing"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isDisplayed()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 182
    const-string/jumbo v1, "displayed"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isOffline()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 185
    const-string/jumbo v1, "offline"

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    return-object v1
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    const-string/jumbo v0, "jabber:x:event"

    return-object v0
.end method

.method public getPacketID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->packetID:Ljava/lang/String;

    return-object v0
.end method

.method public isCancelled()Z
    .locals 1

    .prologue
    .line 151
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->cancelled:Z

    return v0
.end method

.method public isComposing()Z
    .locals 1

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->composing:Z

    return v0
.end method

.method public isDelivered()Z
    .locals 1

    .prologue
    .line 117
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->delivered:Z

    return v0
.end method

.method public isDisplayed()Z
    .locals 1

    .prologue
    .line 129
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->displayed:Z

    return v0
.end method

.method public isMessageEventRequest()Z
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->packetID:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOffline()Z
    .locals 1

    .prologue
    .line 141
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->offline:Z

    return v0
.end method

.method public setCancelled(Z)V
    .locals 0
    .param p1, "cancelled"    # Z

    .prologue
    .line 252
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->cancelled:Z

    .line 253
    return-void
.end method

.method public setComposing(Z)V
    .locals 1
    .param p1, "composing"    # Z

    .prologue
    .line 200
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->composing:Z

    .line 201
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setCancelled(Z)V

    .line 202
    return-void
.end method

.method public setDelivered(Z)V
    .locals 1
    .param p1, "delivered"    # Z

    .prologue
    .line 213
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->delivered:Z

    .line 214
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setCancelled(Z)V

    .line 215
    return-void
.end method

.method public setDisplayed(Z)V
    .locals 1
    .param p1, "displayed"    # Z

    .prologue
    .line 226
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->displayed:Z

    .line 227
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setCancelled(Z)V

    .line 228
    return-void
.end method

.method public setOffline(Z)V
    .locals 1
    .param p1, "offline"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->offline:Z

    .line 240
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setCancelled(Z)V

    .line 241
    return-void
.end method

.method public setPacketID(Ljava/lang/String;)V
    .locals 0
    .param p1, "packetID"    # Ljava/lang/String;

    .prologue
    .line 262
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MessageEvent;->packetID:Ljava/lang/String;

    .line 263
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 307
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isOffline()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 315
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "offline"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isDelivered()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 319
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "delivered"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isDisplayed()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 323
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "displayed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->isComposing()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 327
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "composing"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "/>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    :cond_3
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->getPacketID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 330
    const-string/jumbo v1, "<id>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->getPacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</id>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 331
    :cond_4
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MessageEvent;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
