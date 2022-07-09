.class Lorg/jivesoftware/smackx/muc/MultiUserChat$5;
.super Ljava/lang/Object;
.source "MultiUserChat.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/muc/MultiUserChat;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/muc/MultiUserChat;)V
    .locals 0

    .prologue
    .line 2156
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 15
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 2158
    move-object/from16 v11, p1

    check-cast v11, Lorg/jivesoftware/smack/packet/Presence;

    .line 2159
    .local v11, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v11}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v0

    .line 2160
    .local v0, "from":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v13}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$300(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v13}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$400(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2161
    .local v4, "myRoomJID":Ljava/lang/String;
    invoke-virtual {v11}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 2162
    .local v1, "isUserStatusModification":Z
    invoke-virtual {v11}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v12

    sget-object v13, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v12, v13, :cond_2

    .line 2163
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$500(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/util/Map;

    move-result-object v12

    invoke-interface {v12, v0, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/jivesoftware/smack/packet/Presence;

    .line 2164
    .local v8, "oldPresence":Lorg/jivesoftware/smack/packet/Presence;
    if-eqz v8, :cond_1

    .line 2166
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12, v8}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$600(Lorg/jivesoftware/smackx/muc/MultiUserChat;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;

    move-result-object v2

    .line 2167
    .local v2, "mucExtension":Lorg/jivesoftware/smackx/packet/MUCUser;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v12

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v7

    .line 2168
    .local v7, "oldAffiliation":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v12

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getRole()Ljava/lang/String;

    move-result-object v9

    .line 2170
    .local v9, "oldRole":Ljava/lang/String;
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12, v11}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$600(Lorg/jivesoftware/smackx/muc/MultiUserChat;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;

    move-result-object v2

    .line 2171
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v12

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getAffiliation()Ljava/lang/String;

    move-result-object v5

    .line 2172
    .local v5, "newAffiliation":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/MUCUser;->getItem()Lorg/jivesoftware/smackx/packet/MUCUser$Item;

    move-result-object v12

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/MUCUser$Item;->getRole()Ljava/lang/String;

    move-result-object v6

    .line 2174
    .local v6, "newRole":Ljava/lang/String;
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12, v9, v6, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$700(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 2176
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12, v7, v5, v1, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$800(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 2210
    .end local v2    # "mucExtension":Lorg/jivesoftware/smackx/packet/MUCUser;
    .end local v5    # "newAffiliation":Ljava/lang/String;
    .end local v6    # "newRole":Ljava/lang/String;
    .end local v7    # "oldAffiliation":Ljava/lang/String;
    .end local v8    # "oldPresence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v9    # "oldRole":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 2184
    .restart local v8    # "oldPresence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_1
    if-nez v1, :cond_0

    .line 2185
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 2186
    .local v10, "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2187
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    const-string/jumbo v13, "joined"

    invoke-static {v12, v13, v10}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$900(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 2191
    .end local v8    # "oldPresence":Lorg/jivesoftware/smack/packet/Presence;
    .end local v10    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    invoke-virtual {v11}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v12

    sget-object v13, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v12, v13, :cond_0

    .line 2192
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$500(Lorg/jivesoftware/smackx/muc/MultiUserChat;)Ljava/util/Map;

    move-result-object v12

    invoke-interface {v12, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2193
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-static {v12, v11}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$600(Lorg/jivesoftware/smackx/muc/MultiUserChat;Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/packet/MUCUser;

    move-result-object v3

    .line 2194
    .local v3, "mucUser":Lorg/jivesoftware/smackx/packet/MUCUser;
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v12

    if-eqz v12, :cond_3

    .line 2196
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/MUCUser;->getStatus()Lorg/jivesoftware/smackx/packet/MUCUser$Status;

    move-result-object v13

    invoke-virtual {v13}, Lorg/jivesoftware/smackx/packet/MUCUser$Status;->getCode()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    invoke-static {v12, v13, v14, v3, v0}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$1000(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;ZLorg/jivesoftware/smackx/packet/MUCUser;Ljava/lang/String;)V

    goto :goto_0

    .line 2203
    :cond_3
    if-nez v1, :cond_0

    .line 2204
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 2205
    .restart local v10    # "params":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2206
    iget-object v12, p0, Lorg/jivesoftware/smackx/muc/MultiUserChat$5;->this$0:Lorg/jivesoftware/smackx/muc/MultiUserChat;

    const-string/jumbo v13, "left"

    invoke-static {v12, v13, v10}, Lorg/jivesoftware/smackx/muc/MultiUserChat;->access$900(Lorg/jivesoftware/smackx/muc/MultiUserChat;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0
.end method
