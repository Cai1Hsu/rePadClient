.class public Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;
.super Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
.source "ICEResolver.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field static negociatorsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lde/javawi/jstun/test/demo/ice/ICENegociator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field connection:Lorg/jivesoftware/smack/Connection;

.field port:I

.field random:Ljava/util/Random;

.field server:Ljava/lang/String;

.field sid:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->negociatorsMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;I)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "server"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;-><init>()V

    .line 53
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    .line 62
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    .line 63
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->server:Ljava/lang/String;

    .line 64
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->port:I

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->setType(Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;)V

    .line 66
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 92
    return-void
.end method

.method public initialize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->isResolving()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->isResolved()Z

    move-result v1

    if-nez v1, :cond_0

    .line 70
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Initialized"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 76
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->negociatorsMap:Ljava/util/Map;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->server:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 77
    new-instance v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->server:Ljava/lang/String;

    iget v2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->port:I

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lde/javawi/jstun/test/demo/ice/ICENegociator;-><init>(Ljava/lang/String;IS)V

    .line 78
    .local v0, "iceNegociator":Lde/javawi/jstun/test/demo/ice/ICENegociator;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->negociatorsMap:Ljava/util/Map;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->server:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->gatherCandidateAddresses()V

    .line 83
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->prioritizeCandidates()V

    .line 87
    .end local v0    # "iceNegociator":Lde/javawi/jstun/test/demo/ice/ICENegociator;
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->setInitialized()V

    .line 88
    return-void
.end method

.method public declared-synchronized resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 43
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 98
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->setResolveInit()V

    .line 100
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->getCandidatesList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v31

    .local v31, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 101
    .local v25, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    move-object/from16 v0, v25

    instance-of v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v3, :cond_0

    .line 102
    move-object/from16 v0, v25

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    move-object/from16 v34, v0

    .line 103
    .local v34, "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual/range {v34 .. v34}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->removeCandidateEcho()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 98
    .end local v25    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v31    # "i$":Ljava/util/Iterator;
    .end local v34    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 107
    .restart local v31    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->clear()V

    .line 110
    sget-object v3, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->negociatorsMap:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->server:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Lde/javawi/jstun/test/demo/ice/ICENegociator;

    .line 111
    .local v35, "iceNegociator":Lde/javawi/jstun/test/demo/ice/ICENegociator;
    invoke-virtual/range {v35 .. v35}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->getSortedCandidates()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :goto_1
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lde/javawi/jstun/test/demo/ice/Candidate;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    .local v25, "candidate":Lde/javawi/jstun/test/demo/ice/Candidate;
    :try_start_2
    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getCandidateType()Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-result-object v42

    .line 114
    .local v42, "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    sget-object v10, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->local:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    .line 115
    .local v10, "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    sget-object v3, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->ServerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 116
    sget-object v10, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->srflx:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    :try_end_2
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    :goto_2
    const/4 v5, 0x0

    .line 127
    .local v5, "nicNum":S
    :try_start_3
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v40

    .line 128
    .local v40, "nics":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    const/16 v30, 0x0

    .line 129
    .local v30, "i":S
    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v3

    invoke-virtual {v3}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-static {v3}, Ljava/net/NetworkInterface;->getByInetAddress(Ljava/net/InetAddress;)Ljava/net/NetworkInterface;

    move-result-object v39

    .line 130
    .local v39, "nic":Ljava/net/NetworkInterface;
    :goto_3
    invoke-interface/range {v40 .. v40}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 131
    invoke-interface/range {v40 .. v40}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/net/NetworkInterface;

    .line 132
    .local v26, "checkNIC":Ljava/net/NetworkInterface;
    move-object/from16 v0, v26

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/net/NetworkInterface;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v3

    if-eqz v3, :cond_6

    .line 133
    move/from16 v5, v30

    .line 142
    .end local v26    # "checkNIC":Ljava/net/NetworkInterface;
    .end local v30    # "i":S
    .end local v39    # "nic":Ljava/net/NetworkInterface;
    .end local v40    # "nics":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_2
    :goto_4
    :try_start_4
    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v3

    invoke-virtual {v3}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    invoke-virtual {v6}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getPort()I

    move-result v7

    const-string/jumbo v8, "1"

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getPriority()I

    move-result v9

    invoke-direct/range {v2 .. v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;-><init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V

    .line 143
    .local v2, "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getBase()Lde/javawi/jstun/test/demo/ice/Candidate;

    move-result-object v3

    invoke-virtual {v3}, Lde/javawi/jstun/test/demo/ice/Candidate;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v3

    invoke-virtual {v3}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 144
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->getFreePort()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setPort(I)V
    :try_end_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 146
    :try_start_5
    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->addCandidateEcho(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    :try_end_5
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 151
    :goto_5
    :try_start_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 153
    sget-object v3, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Candidate addr: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v6

    invoke-virtual {v6}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "|"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getBase()Lde/javawi/jstun/test/demo/ice/Candidate;

    move-result-object v6

    invoke-virtual {v6}, Lde/javawi/jstun/test/demo/ice/Candidate;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v6

    invoke-virtual {v6}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, " Priority:"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v25 .. v25}, Lde/javawi/jstun/test/demo/ice/Candidate;->getPriority()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_6
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 156
    .end local v2    # "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v5    # "nicNum":S
    .end local v10    # "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .end local v42    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :catch_0
    move-exception v27

    .line 157
    .local v27, "e":Lde/javawi/jstun/util/UtilityException;
    :try_start_7
    invoke-virtual/range {v27 .. v27}, Lde/javawi/jstun/util/UtilityException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_1

    .line 117
    .end local v27    # "e":Lde/javawi/jstun/util/UtilityException;
    .restart local v10    # "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .restart local v42    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :cond_3
    :try_start_8
    sget-object v3, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->PeerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 118
    sget-object v10, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->prflx:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    goto/16 :goto_2

    .line 119
    :cond_4
    sget-object v3, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Relayed:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v42

    invoke-virtual {v0, v3}, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 120
    sget-object v10, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->relay:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    goto/16 :goto_2

    .line 122
    :cond_5
    sget-object v10, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->host:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    goto/16 :goto_2

    .line 136
    .restart local v5    # "nicNum":S
    .restart local v26    # "checkNIC":Ljava/net/NetworkInterface;
    .restart local v30    # "i":S
    .restart local v39    # "nic":Ljava/net/NetworkInterface;
    .restart local v40    # "nics":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_6
    add-int/lit8 v3, v30, 0x1

    int-to-short v0, v3

    move/from16 v30, v0

    .line 137
    goto/16 :goto_3

    .line 138
    .end local v26    # "checkNIC":Ljava/net/NetworkInterface;
    .end local v30    # "i":S
    .end local v39    # "nic":Ljava/net/NetworkInterface;
    .end local v40    # "nics":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :catch_1
    move-exception v28

    .line 139
    .local v28, "e1":Ljava/net/SocketException;
    invoke-virtual/range {v28 .. v28}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_8
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_4

    .line 159
    .end local v5    # "nicNum":S
    .end local v10    # "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .end local v28    # "e1":Ljava/net/SocketException;
    .end local v42    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :catch_2
    move-exception v27

    .line 160
    .local v27, "e":Ljava/net/UnknownHostException;
    :try_start_9
    invoke-virtual/range {v27 .. v27}, Ljava/net/UnknownHostException;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_1

    .line 148
    .end local v27    # "e":Ljava/net/UnknownHostException;
    .restart local v2    # "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .restart local v5    # "nicNum":S
    .restart local v10    # "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .restart local v42    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :catch_3
    move-exception v27

    .line 149
    .local v27, "e":Ljava/net/SocketException;
    :try_start_a
    invoke-virtual/range {v27 .. v27}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_a
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_5

    .line 165
    .end local v2    # "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v5    # "nicNum":S
    .end local v10    # "iceType":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .end local v25    # "candidate":Lde/javawi/jstun/test/demo/ice/Candidate;
    .end local v27    # "e":Ljava/net/SocketException;
    .end local v42    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :cond_7
    :try_start_b
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->serviceAvailable(Lorg/jivesoftware/smack/Connection;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 179
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/BridgedResolver;->getLocalHost()Ljava/lang/String;

    move-result-object v38

    .line 180
    .local v38, "localIp":Ljava/lang/String;
    const/4 v14, 0x0

    .line 183
    .local v14, "network":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->sid:J

    .line 185
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->sid:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getRTPBridge(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    move-result-object v41

    .line 187
    .local v41, "rtpBridge":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    new-instance v11, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortA()I

    move-result v16

    const-string/jumbo v17, "1"

    const/16 v18, 0x0

    sget-object v19, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->relay:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    invoke-direct/range {v11 .. v19}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;-><init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V

    .line 189
    .local v11, "localCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    move-object/from16 v0, v38

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 191
    new-instance v15, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getIp()Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPortB()I

    move-result v20

    const-string/jumbo v21, "1"

    const/16 v22, 0x0

    sget-object v23, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->relay:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move/from16 v18, v14

    invoke-direct/range {v15 .. v23}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;-><init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V

    .line 193
    .local v15, "remoteCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    move-object/from16 v0, v38

    invoke-virtual {v15, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V

    .line 195
    invoke-virtual {v11, v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setSymmetric(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 196
    invoke-virtual {v15, v11}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setSymmetric(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 198
    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPass()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setPassword(Ljava/lang/String;)V

    .line 199
    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPass()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setPassword(Ljava/lang/String;)V

    .line 201
    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getSid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setSessionId(Ljava/lang/String;)V

    .line 202
    invoke-virtual/range {v41 .. v41}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getSid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setSessionId(Ljava/lang/String;)V

    .line 204
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v11, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setConnection(Lorg/jivesoftware/smack/Connection;)V

    .line 205
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v15, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setConnection(Lorg/jivesoftware/smack/Connection;)V

    .line 207
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->getPublicIP(Lorg/jivesoftware/smack/Connection;)Ljava/lang/String;

    move-result-object v17

    .line 225
    .local v17, "publicIp":Ljava/lang/String;
    if-eqz v17, :cond_b

    const-string/jumbo v3, ""

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    move-result v3

    if-nez v3, :cond_b

    .line 227
    const/16 v37, 0x0

    .line 230
    .local v37, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :try_start_c
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;
    :try_end_c
    .catch Ljava/net/SocketException; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    move-result-object v37

    .line 238
    :goto_6
    const/16 v29, 0x0

    .line 240
    .local v29, "found":Z
    :cond_8
    :goto_7
    :try_start_d
    invoke-interface/range {v37 .. v37}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 242
    invoke-interface/range {v37 .. v37}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljava/net/NetworkInterface;

    .line 243
    .local v36, "iface":Ljava/net/NetworkInterface;
    invoke-virtual/range {v36 .. v36}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v33

    .line 245
    .local v33, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_9
    invoke-interface/range {v33 .. v33}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 246
    invoke-interface/range {v33 .. v33}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/net/InetAddress;

    .line 247
    .local v32, "iaddress":Ljava/net/InetAddress;
    invoke-virtual/range {v32 .. v32}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_9

    .line 248
    const/16 v29, 0x1

    .line 249
    goto :goto_7

    .line 232
    .end local v29    # "found":Z
    .end local v32    # "iaddress":Ljava/net/InetAddress;
    .end local v33    # "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v36    # "iface":Ljava/net/NetworkInterface;
    :catch_4
    move-exception v27

    .line 233
    .restart local v27    # "e":Ljava/net/SocketException;
    invoke-virtual/range {v27 .. v27}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto :goto_6

    .line 254
    .end local v27    # "e":Ljava/net/SocketException;
    .restart local v29    # "found":Z
    :cond_a
    if-nez v29, :cond_b

    .line 256
    :try_start_e
    new-instance v16, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    const/16 v18, 0x1

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->random:Ljava/util/Random;

    invoke-virtual {v3}, Ljava/util/Random;->nextLong()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->getFreePort()I

    move-result v21

    const-string/jumbo v22, "1"

    const/16 v23, 0x0

    sget-object v24, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->srflx:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    invoke-direct/range {v16 .. v24}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;-><init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V

    .line 258
    .local v16, "publicCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->setLocalIp(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/net/UnknownHostException; {:try_start_e .. :try_end_e} :catch_6
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    .line 261
    :try_start_f
    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->addCandidateEcho(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    :try_end_f
    .catch Ljava/net/SocketException; {:try_start_f .. :try_end_f} :catch_5
    .catch Ljava/net/UnknownHostException; {:try_start_f .. :try_end_f} :catch_6
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 267
    :goto_8
    :try_start_10
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    :try_end_10
    .catch Ljava/net/UnknownHostException; {:try_start_10 .. :try_end_10} :catch_6
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    .line 278
    .end local v11    # "localCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v14    # "network":I
    .end local v15    # "remoteCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v16    # "publicCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v17    # "publicIp":Ljava/lang/String;
    .end local v29    # "found":Z
    .end local v37    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v38    # "localIp":Ljava/lang/String;
    .end local v41    # "rtpBridge":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    :cond_b
    :goto_9
    :try_start_11
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->setResolveEnd()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 279
    monitor-exit p0

    return-void

    .line 263
    .restart local v11    # "localCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .restart local v14    # "network":I
    .restart local v15    # "remoteCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .restart local v16    # "publicCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .restart local v17    # "publicIp":Ljava/lang/String;
    .restart local v29    # "found":Z
    .restart local v37    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .restart local v38    # "localIp":Ljava/lang/String;
    .restart local v41    # "rtpBridge":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    :catch_5
    move-exception v27

    .line 264
    .restart local v27    # "e":Ljava/net/SocketException;
    :try_start_12
    invoke-virtual/range {v27 .. v27}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_12
    .catch Ljava/net/UnknownHostException; {:try_start_12 .. :try_end_12} :catch_6
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    goto :goto_8

    .line 269
    .end local v16    # "publicCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v27    # "e":Ljava/net/SocketException;
    :catch_6
    move-exception v27

    .line 270
    .local v27, "e":Ljava/net/UnknownHostException;
    :try_start_13
    invoke-virtual/range {v27 .. v27}, Ljava/net/UnknownHostException;->printStackTrace()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    goto :goto_9
.end method
