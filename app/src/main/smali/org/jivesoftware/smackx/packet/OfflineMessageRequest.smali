.class public Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "OfflineMessageRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Provider;,
        Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    }
.end annotation


# instance fields
.field private fetch:Z

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;",
            ">;"
        }
    .end annotation
.end field

.field private purge:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    .line 41
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->purge:Z

    .line 42
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->fetch:Z

    .line 194
    return-void
.end method


# virtual methods
.method public addItem(Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;)V
    .locals 2
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    .prologue
    .line 63
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    monitor-enter v1

    .line 64
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    monitor-exit v1

    .line 66
    return-void

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<offline xmlns=\"http://jabber.org/protocol/offline\">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    monitor-enter v4

    .line 108
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 109
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;

    .line 110
    .local v2, "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v2    # "item":Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->purge:Z

    if-eqz v3, :cond_1

    .line 114
    const-string/jumbo v3, "<purge/>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    :cond_1
    iget-boolean v3, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->fetch:Z

    if-eqz v3, :cond_2

    .line 117
    const-string/jumbo v3, "<fetch/>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->getExtensionsXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    const-string/jumbo v3, "</offline>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 112
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public getItems()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/OfflineMessageRequest$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    monitor-enter v1

    .line 53
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->items:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 54
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public isFetch()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->fetch:Z

    return v0
.end method

.method public isPurge()Z
    .locals 1

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->purge:Z

    return v0
.end method

.method public setFetch(Z)V
    .locals 0
    .param p1, "fetch"    # Z

    .prologue
    .line 101
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->fetch:Z

    .line 102
    return-void
.end method

.method public setPurge(Z)V
    .locals 0
    .param p1, "purge"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/packet/OfflineMessageRequest;->purge:Z

    .line 84
    return-void
.end method
