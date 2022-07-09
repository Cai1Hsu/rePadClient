.class public Lorg/jivesoftware/smackx/packet/DiscoverInfo;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "DiscoverInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;,
        Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    }
.end annotation


# static fields
.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/disco#info"


# instance fields
.field private final features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;",
            ">;"
        }
    .end annotation
.end field

.field private final identities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation
.end field

.field private node:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 46
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    .line 47
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    .locals 5
    .param p1, "d"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/IQ;-><init>(Lorg/jivesoftware/smack/packet/IQ;)V

    .line 46
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    .line 47
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v3, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    .line 63
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 66
    iget-object v4, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    monitor-enter v4

    .line 67
    :try_start_0
    iget-object v3, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    .line 68
    .local v0, "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;)V

    goto :goto_0

    .line 70
    .end local v0    # "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    iget-object v4, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    monitor-enter v4

    .line 74
    :try_start_2
    iget-object v3, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 75
    .local v1, "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addIdentity(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)V

    goto :goto_1

    .line 77
    .end local v1    # "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v3

    :cond_1
    :try_start_3
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 78
    return-void
.end method

.method private addFeature(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;)V
    .locals 2
    .param p1, "feature"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    .prologue
    .line 102
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    monitor-enter v1

    .line 103
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    monitor-exit v1

    .line 105
    return-void

    .line 104
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public addFeature(Ljava/lang/String;)V
    .locals 1
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 86
    new-instance v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;)V

    .line 87
    return-void
.end method

.method public addFeatures(Ljava/util/Collection;)V
    .locals 3
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
    .line 95
    .local p1, "featuresToAdd":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-nez p1, :cond_1

    .line 99
    :cond_0
    return-void

    .line 96
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 97
    .local v0, "feature":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->addFeature(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public addIdentities(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "identitiesToAdd":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    if-nez p1, :cond_0

    .line 139
    :goto_0
    return-void

    .line 136
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    monitor-enter v1

    .line 137
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 138
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addIdentity(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)V
    .locals 2
    .param p1, "identity"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .prologue
    .line 124
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    monitor-enter v1

    .line 125
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    monitor-exit v1

    .line 127
    return-void

    .line 126
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public containsDuplicateFeatures()Z
    .locals 6

    .prologue
    .line 240
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 241
    .local v0, "checkedFeatures":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;>;"
    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    .line 242
    .local v1, "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    .line 243
    .local v2, "f2":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 244
    const/4 v5, 0x1

    .line 248
    .end local v1    # "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    .end local v2    # "f2":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    .end local v4    # "i$":Ljava/util/Iterator;
    :goto_1
    return v5

    .line 246
    .restart local v1    # "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 248
    .end local v1    # "f":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public containsDuplicateIdentities()Z
    .locals 6

    .prologue
    .line 223
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 224
    .local v0, "checkedIdentities":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 225
    .local v1, "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 226
    .local v4, "i2":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 227
    const/4 v5, 0x1

    .line 231
    .end local v1    # "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "i2":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    :goto_1
    return v5

    .line 229
    .restart local v1    # "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 231
    .end local v1    # "i":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public containsFeature(Ljava/lang/String;)Z
    .locals 2
    .param p1, "feature"    # Ljava/lang/String;

    .prologue
    .line 185
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getFeatures()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 186
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;->getVar()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    const/4 v1, 0x1

    .line 189
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v4, "<query xmlns=\"http://jabber.org/protocol/disco#info\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 196
    const-string/jumbo v4, " node=\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getNode()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    const-string/jumbo v4, "\""

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    :cond_0
    const-string/jumbo v4, ">"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    monitor-enter v5

    .line 202
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 203
    .local v3, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 205
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    monitor-enter v5

    .line 207
    :try_start_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    .line 208
    .local v1, "feature":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;->toXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 210
    .end local v1    # "feature":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v4

    :cond_2
    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 212
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getExtensionsXML()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    const-string/jumbo v4, "</query>"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getFeatures()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    monitor-enter v1

    .line 114
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->features:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 115
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getIdentities()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    monitor-enter v1

    .line 148
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->identities:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getNode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->node:Ljava/lang/String;

    return-object v0
.end method

.method public setNode(Ljava/lang/String;)V
    .locals 0
    .param p1, "node"    # Ljava/lang/String;

    .prologue
    .line 175
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->node:Ljava/lang/String;

    .line 176
    return-void
.end method
