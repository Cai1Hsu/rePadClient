.class public Lorg/jivesoftware/smack/AccountManager;
.super Ljava/lang/Object;
.source "AccountManager.java"


# instance fields
.field private accountCreationSupported:Z

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private info:Lorg/jivesoftware/smack/packet/Registration;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/AccountManager;->accountCreationSupported:Z

    .line 61
    iput-object p1, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 62
    return-void
.end method

.method private declared-synchronized getRegistrationInfo()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 315
    monitor-enter p0

    :try_start_0
    new-instance v2, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 316
    .local v2, "reg":Lorg/jivesoftware/smack/packet/Registration;
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 317
    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    invoke-direct {v1, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 319
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 320
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 321
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 323
    .local v3, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 324
    if-nez v3, :cond_0

    .line 325
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    .end local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v1    # "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    .end local v2    # "reg":Lorg/jivesoftware/smack/packet/Registration;
    .end local v3    # "result":Lorg/jivesoftware/smack/packet/IQ;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 327
    .restart local v0    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v1    # "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    .restart local v2    # "reg":Lorg/jivesoftware/smack/packet/Registration;
    .restart local v3    # "result":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_1

    .line 328
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 331
    :cond_1
    check-cast v3, Lorg/jivesoftware/smack/packet/Registration;

    .end local v3    # "result":Lorg/jivesoftware/smack/packet/IQ;
    iput-object v3, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 333
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public changePassword(Ljava/lang/String;)V
    .locals 9
    .param p1, "newPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 253
    new-instance v3, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 254
    .local v3, "reg":Lorg/jivesoftware/smack/packet/Registration;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Registration;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 255
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 256
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 257
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v5, "username"

    iget-object v6, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/jivesoftware/smack/util/StringUtils;->parseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const-string/jumbo v5, "password"

    invoke-interface {v2, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 260
    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v5, 0x2

    new-array v5, v5, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v6, 0x0

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v8, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v7, v5, v6

    invoke-direct {v1, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 262
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 263
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 264
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v0, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 266
    .local v4, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 267
    if-nez v4, :cond_0

    .line 268
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 270
    :cond_0
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v5

    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v5, v6, :cond_1

    .line 271
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 273
    :cond_1
    return-void
.end method

.method public createAccount(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 195
    invoke-virtual {p0}, Lorg/jivesoftware/smack/AccountManager;->supportsAccountCreation()Z

    move-result v3

    if-nez v3, :cond_0

    .line 196
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "Server does not support account creation."

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 199
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 200
    .local v1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/AccountManager;->getAccountAttributes()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 201
    .local v0, "attributeName":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 203
    .end local v0    # "attributeName":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1, p2, v1}, Lorg/jivesoftware/smack/AccountManager;->createAccount(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 204
    return-void
.end method

.method public createAccount(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 8
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 220
    .local p3, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smack/AccountManager;->supportsAccountCreation()Z

    move-result v4

    if-nez v4, :cond_0

    .line 221
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "Server does not support account creation."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 223
    :cond_0
    new-instance v2, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v2}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 224
    .local v2, "reg":Lorg/jivesoftware/smack/packet/Registration;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 225
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 226
    const-string/jumbo v4, "username"

    invoke-interface {p3, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    const-string/jumbo v4, "password"

    invoke-interface {p3, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    invoke-virtual {v2, p3}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 229
    new-instance v1, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v5, 0x0

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v7, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v6, v4, v5

    invoke-direct {v1, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 231
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v0

    .line 232
    .local v0, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v4, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 233
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 235
    .local v3, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 236
    if-nez v3, :cond_1

    .line 237
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v5, "No response from server."

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 239
    :cond_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v4, v5, :cond_2

    .line 240
    new-instance v4, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v4

    .line 242
    :cond_2
    return-void
.end method

.method public deleteAccount()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 284
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v5

    if-nez v5, :cond_0

    .line 285
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string/jumbo v6, "Must be logged in to delete a account."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 287
    :cond_0
    new-instance v3, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v3}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 288
    .local v3, "reg":Lorg/jivesoftware/smack/packet/Registration;
    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Registration;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 289
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/jivesoftware/smack/packet/Registration;->setTo(Ljava/lang/String;)V

    .line 290
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 292
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v5, "remove"

    const-string/jumbo v6, ""

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 294
    new-instance v2, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v5, 0x2

    new-array v5, v5, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v6, 0x0

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Registration;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v8, Lorg/jivesoftware/smack/packet/IQ;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v7, v5, v6

    invoke-direct {v2, v5}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 296
    .local v2, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v2}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v1

    .line 297
    .local v1, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v5, p0, Lorg/jivesoftware/smack/AccountManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v5, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 298
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v1, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/IQ;

    .line 300
    .local v4, "result":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 301
    if-nez v4, :cond_1

    .line 302
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v6, "No response from server."

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 304
    :cond_1
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v5

    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v5, v6, :cond_2

    .line 305
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 307
    :cond_2
    return-void
.end method

.method public getAccountAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 152
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    if-nez v1, :cond_0

    .line 153
    invoke-direct {p0}, Lorg/jivesoftware/smack/AccountManager;->getRegistrationInfo()V

    .line 155
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Registration;->getAttributes()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 160
    :goto_0
    return-object v1

    .line 157
    :catch_0
    move-exception v0

    .line 158
    .local v0, "xe":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    .line 160
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getAccountAttributes()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    if-nez v2, :cond_0

    .line 129
    invoke-direct {p0}, Lorg/jivesoftware/smack/AccountManager;->getRegistrationInfo()V

    .line 131
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Registration;->getAttributes()Ljava/util/Map;

    move-result-object v0

    .line 132
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v0, :cond_1

    .line 133
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 139
    .end local v0    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return-object v2

    .line 136
    :catch_0
    move-exception v1

    .line 137
    .local v1, "xe":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    .line 139
    .end local v1    # "xe":Lorg/jivesoftware/smack/XMPPException;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    goto :goto_0
.end method

.method public getAccountInstructions()Ljava/lang/String;
    .locals 2

    .prologue
    .line 172
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    if-nez v1, :cond_0

    .line 173
    invoke-direct {p0}, Lorg/jivesoftware/smack/AccountManager;->getRegistrationInfo()V

    .line 175
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Registration;->getInstructions()Ljava/lang/String;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 178
    :goto_0
    return-object v1

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "xe":Lorg/jivesoftware/smack/XMPPException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method setSupportsAccountCreation(Z)V
    .locals 0
    .param p1, "accountCreationSupported"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lorg/jivesoftware/smack/AccountManager;->accountCreationSupported:Z

    .line 73
    return-void
.end method

.method public supportsAccountCreation()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 84
    iget-boolean v3, p0, Lorg/jivesoftware/smack/AccountManager;->accountCreationSupported:Z

    if-eqz v3, :cond_0

    .line 98
    :goto_0
    return v1

    .line 91
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    if-nez v3, :cond_1

    .line 92
    invoke-direct {p0}, Lorg/jivesoftware/smack/AccountManager;->getRegistrationInfo()V

    .line 93
    iget-object v3, p0, Lorg/jivesoftware/smack/AccountManager;->info:Lorg/jivesoftware/smack/packet/Registration;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Registration;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v3, v4, :cond_2

    :goto_1
    iput-boolean v1, p0, Lorg/jivesoftware/smack/AccountManager;->accountCreationSupported:Z

    .line 95
    :cond_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/AccountManager;->accountCreationSupported:Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    move v1, v2

    .line 93
    goto :goto_1

    .line 97
    :catch_0
    move-exception v0

    .local v0, "xe":Lorg/jivesoftware/smack/XMPPException;
    move v1, v2

    .line 98
    goto :goto_0
.end method
