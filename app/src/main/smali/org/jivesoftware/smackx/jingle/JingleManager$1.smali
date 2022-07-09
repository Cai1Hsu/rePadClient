.class Lorg/jivesoftware/smackx/jingle/JingleManager$1;
.super Ljava/lang/Object;
.source "JingleManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/RosterListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/JingleManager;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/JingleManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleManager;)V
    .locals 0

    .prologue
    .line 216
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleManager$1;->this$0:Lorg/jivesoftware/smackx/jingle/JingleManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public entriesAdded(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 219
    .local p1, "addresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    return-void
.end method

.method public entriesDeleted(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "addresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    return-void
.end method

.method public entriesUpdated(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 222
    .local p1, "addresses":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    return-void
.end method

.method public presenceChanged(Lorg/jivesoftware/smack/packet/Presence;)V
    .locals 6
    .param p1, "presence"    # Lorg/jivesoftware/smack/packet/Presence;

    .prologue
    .line 228
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->isAvailable()Z

    move-result v5

    if-nez v5, :cond_3

    .line 229
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v4

    .line 230
    .local v4, "xmppAddress":Ljava/lang/String;
    const/4 v0, 0x0

    .line 231
    .local v0, "aux":Lorg/jivesoftware/smackx/jingle/JingleSession;
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/JingleManager$1;->this$0:Lorg/jivesoftware/smackx/jingle/JingleManager;

    iget-object v5, v5, Lorg/jivesoftware/smackx/jingle/JingleManager;->jingleSessions:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 232
    .local v3, "jingleSession":Lorg/jivesoftware/smackx/jingle/JingleSession;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 233
    :cond_1
    move-object v0, v3

    goto :goto_0

    .line 236
    .end local v3    # "jingleSession":Lorg/jivesoftware/smackx/jingle/JingleSession;
    :cond_2
    if-eqz v0, :cond_3

    .line 238
    :try_start_0
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .end local v0    # "aux":Lorg/jivesoftware/smackx/jingle/JingleSession;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "xmppAddress":Ljava/lang/String;
    :cond_3
    :goto_1
    return-void

    .line 239
    .restart local v0    # "aux":Lorg/jivesoftware/smackx/jingle/JingleSession;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "xmppAddress":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 240
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_1
.end method
