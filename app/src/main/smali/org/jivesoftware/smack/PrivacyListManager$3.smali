.class Lorg/jivesoftware/smack/PrivacyListManager$3;
.super Ljava/lang/Object;
.source "PrivacyListManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/PrivacyListManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/PrivacyListManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/PrivacyListManager;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lorg/jivesoftware/smack/PrivacyListManager$3;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 117
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 153
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v7, p1

    .line 121
    check-cast v7, Lorg/jivesoftware/smack/packet/Privacy;

    .line 124
    .local v7, "privacy":Lorg/jivesoftware/smack/packet/Privacy;
    iget-object v8, p0, Lorg/jivesoftware/smack/PrivacyListManager$3;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-static {v8}, Lorg/jivesoftware/smack/PrivacyListManager;->access$300(Lorg/jivesoftware/smack/PrivacyListManager;)Ljava/util/List;

    move-result-object v9

    monitor-enter v9

    .line 125
    :try_start_0
    iget-object v8, p0, Lorg/jivesoftware/smack/PrivacyListManager$3;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-static {v8}, Lorg/jivesoftware/smack/PrivacyListManager;->access$300(Lorg/jivesoftware/smack/PrivacyListManager;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/PrivacyListListener;

    .line 127
    .local v6, "listener":Lorg/jivesoftware/smack/PrivacyListListener;
    invoke-virtual {v7}, Lorg/jivesoftware/smack/packet/Privacy;->getItemLists()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 128
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 129
    .local v5, "listName":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 130
    .local v4, "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 131
    invoke-interface {v6, v5}, Lorg/jivesoftware/smack/PrivacyListListener;->updatedPrivacyList(Ljava/lang/String;)V

    goto :goto_1

    .line 137
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .end local v5    # "listName":Ljava/lang/String;
    .end local v6    # "listener":Lorg/jivesoftware/smack/PrivacyListListener;
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .line 133
    .restart local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .restart local v5    # "listName":Ljava/lang/String;
    .restart local v6    # "listener":Lorg/jivesoftware/smack/PrivacyListListener;
    :cond_3
    :try_start_1
    invoke-interface {v6, v5, v4}, Lorg/jivesoftware/smack/PrivacyListListener;->setPrivacyList(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 137
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "items":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PrivacyItem;>;"
    .end local v5    # "listName":Ljava/lang/String;
    .end local v6    # "listener":Lorg/jivesoftware/smack/PrivacyListListener;
    :cond_4
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    new-instance v3, Lorg/jivesoftware/smack/PrivacyListManager$3$1;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smack/PrivacyListManager$3$1;-><init>(Lorg/jivesoftware/smack/PrivacyListManager$3;)V

    .line 147
    .local v3, "iq":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v8}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 148
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 149
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Packet;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 152
    iget-object v8, p0, Lorg/jivesoftware/smack/PrivacyListManager$3;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-static {v8}, Lorg/jivesoftware/smack/PrivacyListManager;->access$100(Lorg/jivesoftware/smack/PrivacyListManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v8

    invoke-virtual {v8, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    goto :goto_0
.end method
