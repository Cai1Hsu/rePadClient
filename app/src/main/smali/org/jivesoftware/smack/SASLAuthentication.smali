.class public Lorg/jivesoftware/smack/SASLAuthentication;
.super Ljava/lang/Object;
.source "SASLAuthentication.java"

# interfaces
.implements Lorg/jivesoftware/smack/UserAuthentication;


# static fields
.field private static implementedMechanisms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jivesoftware/smack/sasl/SASLMechanism;",
            ">;>;"
        }
    .end annotation
.end field

.field private static mechanismsPreferences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

.field private errorCondition:Ljava/lang/String;

.field private resourceBinded:Z

.field private saslFailed:Z

.field private saslNegotiated:Z

.field private serverMechanisms:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private sessionSupported:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    .line 91
    const-string/jumbo v0, "EXTERNAL"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLExternalMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 92
    const-string/jumbo v0, "GSSAPI"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLGSSAPIMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 93
    const-string/jumbo v0, "DIGEST-MD5"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLDigestMD5Mechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 94
    const-string/jumbo v0, "CRAM-MD5"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLCramMD5Mechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 95
    const-string/jumbo v0, "PLAIN"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLPlainMechanism;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 96
    const-string/jumbo v0, "ANONYMOUS"

    const-class v1, Lorg/jivesoftware/smack/sasl/SASLAnonymous;

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V

    .line 98
    const-string/jumbo v0, "GSSAPI"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 99
    const-string/jumbo v0, "DIGEST-MD5"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 100
    const-string/jumbo v0, "CRAM-MD5"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 101
    const-string/jumbo v0, "PLAIN"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 102
    const-string/jumbo v0, "ANONYMOUS"

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->supportSASLMechanism(Ljava/lang/String;I)V

    .line 104
    return-void
.end method

.method constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 180
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    .line 181
    invoke-virtual {p0}, Lorg/jivesoftware/smack/SASLAuthentication;->init()V

    .line 182
    return-void
.end method

.method private bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 430
    monitor-enter p0

    .line 431
    :try_start_0
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v6, :cond_0

    .line 433
    const-wide/16 v6, 0x7530

    :try_start_1
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 439
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 441
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    if-nez v6, :cond_1

    .line 443
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "Resource binding not offered by server"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 439
    :catchall_0
    move-exception v6

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v6

    .line 446
    :cond_1
    new-instance v1, Lorg/jivesoftware/smack/packet/Bind;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/Bind;-><init>()V

    .line 447
    .local v1, "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    invoke-virtual {v1, p1}, Lorg/jivesoftware/smack/packet/Bind;->setResource(Ljava/lang/String;)V

    .line 449
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/Bind;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 452
    .local v2, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 454
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Bind;

    .line 455
    .local v3, "response":Lorg/jivesoftware/smack/packet/Bind;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 456
    if-nez v3, :cond_2

    .line 457
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "No response from the server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 460
    :cond_2
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_3

    .line 461
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 463
    :cond_3
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Bind;->getJid()Ljava/lang/String;

    move-result-object v5

    .line 465
    .local v5, "userJID":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    if-eqz v6, :cond_5

    .line 466
    new-instance v4, Lorg/jivesoftware/smack/packet/Session;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Session;-><init>()V

    .line 467
    .local v4, "session":Lorg/jivesoftware/smack/packet/Session;
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v7, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/Session;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 469
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 471
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->getPacketReplyTimeout()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v2, v6, v7}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/IQ;

    .line 472
    .local v0, "ack":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 473
    if-nez v0, :cond_4

    .line 474
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "No response from the server."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 477
    :cond_4
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v6

    sget-object v7, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v6, v7, :cond_5

    .line 478
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v6

    .line 435
    .end local v0    # "ack":Lorg/jivesoftware/smack/packet/IQ;
    .end local v1    # "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    .end local v2    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .end local v3    # "response":Lorg/jivesoftware/smack/packet/Bind;
    .end local v4    # "session":Lorg/jivesoftware/smack/packet/Session;
    .end local v5    # "userJID":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto/16 :goto_0

    .line 481
    .restart local v1    # "bindResource":Lorg/jivesoftware/smack/packet/Bind;
    .restart local v2    # "collector":Lorg/jivesoftware/smack/PacketCollector;
    .restart local v3    # "response":Lorg/jivesoftware/smack/packet/Bind;
    .restart local v5    # "userJID":Ljava/lang/String;
    :cond_5
    return-object v5
.end method

.method public static getRegisterSASLMechanisms()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jivesoftware/smack/sasl/SASLMechanism;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v0, "answer":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;>;"
    sget-object v3, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 173
    .local v2, "mechanismsPreference":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 175
    .end local v2    # "mechanismsPreference":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static registerSASLMechanism(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jivesoftware/smack/sasl/SASLMechanism;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 113
    .local p1, "mClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-void
.end method

.method public static supportSASLMechanism(Ljava/lang/String;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 137
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 138
    return-void
.end method

.method public static supportSASLMechanism(Ljava/lang/String;I)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "index"    # I

    .prologue
    .line 151
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 152
    return-void
.end method

.method public static unregisterSASLMechanism(Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 124
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method

.method public static unsupportSASLMechanism(Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 162
    sget-object v0, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 163
    return-void
.end method


# virtual methods
.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 301
    const/4 v5, 0x0

    .line 302
    .local v5, "selectedMechanism":Ljava/lang/String;
    sget-object v7, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 303
    .local v3, "mechanism":Ljava/lang/String;
    sget-object v7, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v7, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v7, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 305
    move-object v5, v3

    .line 309
    .end local v3    # "mechanism":Ljava/lang/String;
    :cond_1
    if-eqz v5, :cond_6

    .line 313
    :try_start_0
    sget-object v7, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 314
    .local v4, "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Lorg/jivesoftware/smack/SASLAuthentication;

    aput-object v9, v7, v8

    invoke-virtual {v4, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 315
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p0, v7, v8

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iput-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 323
    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v6

    .line 324
    .local v6, "serviceName":Ljava/lang/String;
    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v8}, Lorg/jivesoftware/smack/Connection;->getHost()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, p1, v8, v6, p2}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    monitor-enter p0
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 328
    :try_start_1
    iget-boolean v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v7, :cond_2

    iget-boolean v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v7, :cond_2

    .line 330
    const-wide/16 v8, 0x7530

    :try_start_2
    invoke-virtual {p0, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 336
    :cond_2
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 338
    :try_start_4
    iget-boolean v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v7, :cond_4

    .line 341
    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v7, :cond_3

    .line 342
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "SASL authentication "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " failed: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_4
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 361
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v6    # "serviceName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 362
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    throw v1

    .line 336
    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v6    # "serviceName":Ljava/lang/String;
    :catchall_0
    move-exception v7

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v7
    :try_end_6
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 364
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v6    # "serviceName":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 365
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 367
    new-instance v7, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v7, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 373
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-object v7

    .line 346
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v6    # "serviceName":Ljava/lang/String;
    :cond_3
    :try_start_7
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "SASL authentication failed using mechanism "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 351
    :cond_4
    iget-boolean v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v7, :cond_5

    .line 353
    invoke-direct {p0, p3}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 357
    :cond_5
    new-instance v7, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v7, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    move-result-object v7

    goto :goto_1

    .line 373
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v6    # "serviceName":Ljava/lang/String;
    :cond_6
    new-instance v7, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v7, v8}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v7, p1, p2, p3}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 332
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v6    # "serviceName":Ljava/lang/String;
    :catch_2
    move-exception v7

    goto/16 :goto_0
.end method

.method public authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)Ljava/lang/String;
    .locals 9
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "resource"    # Ljava/lang/String;
    .param p3, "cbh"    # Ljavax/security/auth/callback/CallbackHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 219
    const/4 v5, 0x0

    .line 220
    .local v5, "selectedMechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->mechanismsPreferences:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 221
    .local v3, "mechanism":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v6, v3}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 223
    move-object v5, v3

    .line 227
    .end local v3    # "mechanism":Ljava/lang/String;
    :cond_1
    if-eqz v5, :cond_6

    .line 231
    :try_start_0
    sget-object v6, Lorg/jivesoftware/smack/SASLAuthentication;->implementedMechanisms:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    .line 232
    .local v4, "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Lorg/jivesoftware/smack/SASLAuthentication;

    aput-object v8, v6, v7

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 233
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-virtual {v0, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iput-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 237
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    iget-object v7, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, p1, v7, p3}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljavax/security/auth/callback/CallbackHandler;)V

    .line 240
    monitor-enter p0
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 241
    :try_start_1
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v6, :cond_2

    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v6, :cond_2

    .line 243
    const-wide/16 v6, 0x7530

    :try_start_2
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    :cond_2
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 251
    :try_start_4
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v6, :cond_5

    .line 254
    iget-object v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v6, :cond_4

    .line 255
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "SASL authentication "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " failed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_4
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 271
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :catch_0
    move-exception v1

    .line 272
    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    throw v1

    .line 249
    .end local v1    # "e":Lorg/jivesoftware/smack/XMPPException;
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :catchall_0
    move-exception v6

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v6
    :try_end_6
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    .line 274
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :catch_1
    move-exception v1

    .line 275
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 281
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_3
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "SASL authentication failed"

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 259
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :cond_4
    :try_start_7
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "SASL authentication failed using mechanism "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 264
    :cond_5
    iget-boolean v6, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v6, :cond_3

    .line 266
    invoke-direct {p0, p2}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    move-result-object v6

    return-object v6

    .line 279
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .end local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :cond_6
    new-instance v6, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v7, "SASL Authentication failed. No known authentication mechanisims."

    invoke-direct {v6, v7}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    .restart local v4    # "mechanismClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jivesoftware/smack/sasl/SASLMechanism;>;"
    :catch_2
    move-exception v6

    goto :goto_0
.end method

.method public authenticateAnonymously()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 390
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/sasl/SASLAnonymous;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smack/sasl/SASLAnonymous;-><init>(Lorg/jivesoftware/smack/SASLAuthentication;)V

    iput-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    .line 391
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    invoke-virtual {v1, v2, v3, v4, v5}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->authenticate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 394
    monitor-enter p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 395
    :try_start_1
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_0

    .line 397
    const-wide/16 v2, 0x1388

    :try_start_2
    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 403
    :cond_0
    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 405
    :try_start_4
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    if-eqz v1, :cond_2

    .line 408
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 409
    new-instance v1, Lorg/jivesoftware/smack/XMPPException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "SASL authentication failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 423
    :catch_0
    move-exception v0

    .line 424
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;

    move-result-object v1

    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    return-object v1

    .line 403
    :catchall_0
    move-exception v1

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v1

    .line 412
    :cond_1
    new-instance v1, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v2, "SASL authentication failed"

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 416
    :cond_2
    iget-boolean v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    if-eqz v1, :cond_3

    .line 418
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lorg/jivesoftware/smack/SASLAuthentication;->bindResourceAndEstablishSession(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 421
    :cond_3
    new-instance v1, Lorg/jivesoftware/smack/NonSASLAuthentication;

    iget-object v2, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/NonSASLAuthentication;-><init>(Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v1}, Lorg/jivesoftware/smack/NonSASLAuthentication;->authenticateAnonymously()Ljava/lang/String;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    move-result-object v1

    goto :goto_1

    .line 399
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method authenticated()V
    .locals 1

    .prologue
    .line 523
    monitor-enter p0

    .line 524
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    .line 526
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 527
    monitor-exit p0

    .line 528
    return-void

    .line 527
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method authenticationFailed()V
    .locals 1

    .prologue
    .line 537
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/SASLAuthentication;->authenticationFailed(Ljava/lang/String;)V

    .line 538
    return-void
.end method

.method authenticationFailed(Ljava/lang/String;)V
    .locals 1
    .param p1, "condition"    # Ljava/lang/String;

    .prologue
    .line 547
    monitor-enter p0

    .line 548
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    .line 549
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->errorCondition:Ljava/lang/String;

    .line 551
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 552
    monitor-exit p0

    .line 553
    return-void

    .line 552
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method bindingRequired()V
    .locals 1

    .prologue
    .line 560
    monitor-enter p0

    .line 561
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    .line 563
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 564
    monitor-exit p0

    .line 565
    return-void

    .line 564
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method challengeReceived(Ljava/lang/String;)V
    .locals 1
    .param p1, "challenge"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 515
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->currentMechanism:Lorg/jivesoftware/smack/sasl/SASLMechanism;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/sasl/SASLMechanism;->challengeReceived(Ljava/lang/String;)V

    .line 516
    return-void
.end method

.method public hasAnonymousAuthentication()Z
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    const-string/jumbo v1, "ANONYMOUS"

    invoke-interface {v0, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasNonAnonymousAuthentication()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 199
    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    if-ne v1, v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smack/SASLAuthentication;->hasAnonymousAuthentication()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected init()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 586
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    .line 587
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslFailed:Z

    .line 588
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->resourceBinded:Z

    .line 589
    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    .line 590
    return-void
.end method

.method public isAuthenticated()Z
    .locals 1

    .prologue
    .line 502
    iget-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->saslNegotiated:Z

    return v0
.end method

.method public send(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "stanza"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 568
    iget-object v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 569
    return-void
.end method

.method sessionsSupported()V
    .locals 1

    .prologue
    .line 577
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/SASLAuthentication;->sessionSupported:Z

    .line 578
    return-void
.end method

.method setAvailableSASLMethods(Ljava/util/Collection;)V
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
    .line 493
    .local p1, "mechanisms":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/jivesoftware/smack/SASLAuthentication;->serverMechanisms:Ljava/util/Collection;

    .line 494
    return-void
.end method
