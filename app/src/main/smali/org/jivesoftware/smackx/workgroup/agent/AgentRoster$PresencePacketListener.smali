.class Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;
.super Ljava/lang/Object;
.source "AgentRoster.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PresencePacketListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;


# direct methods
.method private constructor <init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)V
    .locals 0

    .prologue
    .line 281
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$1;

    .prologue
    .line 281
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 10
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 283
    move-object v5, p1

    check-cast v5, Lorg/jivesoftware/smack/packet/Presence;

    .line 284
    .local v5, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getFrom()Ljava/lang/String;

    move-result-object v2

    .line 285
    .local v2, "from":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 287
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Presence with no FROM: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->toXML()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 350
    :cond_0
    :goto_0
    return-void

    .line 290
    :cond_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7, v2}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$200(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 294
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v7, v8, :cond_5

    .line 296
    const-string/jumbo v7, "agent-status"

    const-string/jumbo v8, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v5, v7, v8}, Lorg/jivesoftware/smack/packet/Presence;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;

    .line 298
    .local v0, "agentStatus":Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
    if-eqz v0, :cond_0

    .line 303
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$300(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 308
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3

    .line 309
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 310
    .local v6, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    :goto_1
    monitor-enter v6

    .line 317
    :try_start_0
    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 320
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$500(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/List;

    move-result-object v8

    monitor-enter v8

    .line 321
    :try_start_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$500(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 322
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 323
    .local v1, "entry":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 324
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    const/4 v9, 0x2

    invoke-static {v7, v9, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$600(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;ILjava/lang/Object;)V

    goto :goto_2

    .line 327
    .end local v1    # "entry":Ljava/lang/String;
    .end local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    .line 313
    .end local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_3
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    .restart local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    goto :goto_1

    .line 318
    :catchall_1
    move-exception v7

    :try_start_2
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v7

    .line 327
    .restart local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 330
    .end local v0    # "agentStatus":Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
    .end local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_5
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/Presence;->getType()Lorg/jivesoftware/smack/packet/Presence$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    if-ne v7, v8, :cond_0

    .line 331
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_6

    .line 332
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    .line 333
    .restart local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    monitor-enter v6

    .line 334
    :try_start_4
    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->parseResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 336
    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 337
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .end local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :cond_6
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$500(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/List;

    move-result-object v8

    monitor-enter v8

    .line 342
    :try_start_5
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    invoke-static {v7}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$500(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_7
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 343
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 344
    .restart local v1    # "entry":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 345
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;->this$0:Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    const/4 v9, 0x2

    invoke-static {v7, v9, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->access$600(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;ILjava/lang/Object;)V

    goto :goto_3

    .line 348
    .end local v1    # "entry":Ljava/lang/String;
    .end local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_2
    move-exception v7

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v7

    .line 335
    .restart local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :catchall_3
    move-exception v7

    :try_start_6
    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    throw v7

    .line 348
    .end local v6    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    .restart local v3    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_8
    :try_start_7
    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto/16 :goto_0
.end method
