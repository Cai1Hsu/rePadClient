.class public Lorg/jivesoftware/smackx/packet/MUCOwner;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "MUCOwner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;,
        Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    }
.end annotation


# instance fields
.field private destroy:Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/MUCOwner$Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    .line 281
    return-void
.end method


# virtual methods
.method public addItem(Lorg/jivesoftware/smackx/packet/MUCOwner$Item;)V
    .locals 2
    .param p1, "item"    # Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    .prologue
    .line 82
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    monitor-enter v1

    .line 83
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    monitor-exit v1

    .line 85
    return-void

    .line 84
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
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<query xmlns=\"http://jabber.org/protocol/muc#owner\">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    monitor-enter v4

    .line 91
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 92
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;

    .line 93
    .local v2, "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCOwner$Item;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    .end local v2    # "item":Lorg/jivesoftware/smackx/packet/MUCOwner$Item;
    :cond_0
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getDestroy()Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 97
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getDestroy()Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/MUCOwner;->getExtensionsXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    const-string/jumbo v3, "</query>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 95
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method public getDestroy()Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->destroy:Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    return-object v0
.end method

.method public getItems()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/MUCOwner$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    monitor-enter v1

    .line 50
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->items:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setDestroy(Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;)V
    .locals 0
    .param p1, "destroy"    # Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/MUCOwner;->destroy:Lorg/jivesoftware/smackx/packet/MUCOwner$Destroy;

    .line 74
    return-void
.end method
