.class public Lde/javawi/jstun/test/demo/ice/ICENegociator;
.super Ljava/lang/Object;
.source "ICENegociator.java"


# static fields
.field private static final LOCAL_PREFERENCE:I = 0x0

.field private static final PEER_REFLEXIVE_PREFERENCE:I = 0x54

.field private static final RELAYED_PREFERENCE:I = 0x7e

.field private static final SERVER_REFLEXIVE_PREFERENCE:I = 0x2a

.field private static logger:Lorg/apache/commons/logging/Log;


# instance fields
.field candidates:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lde/javawi/jstun/test/demo/ice/Candidate;",
            ">;"
        }
    .end annotation
.end field

.field private componentId:S

.field private stunPort:I

.field private stunServer:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IS)V
    .locals 1
    .param p1, "stunServer"    # Ljava/lang/String;
    .param p2, "stunPort"    # I
    .param p3, "componentId"    # S

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-string/jumbo v0, "iphone-stun.freenet.de"

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunServer:Ljava/lang/String;

    .line 51
    const/16 v0, 0xd96

    iput v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunPort:I

    .line 62
    iput-object p1, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunServer:Ljava/lang/String;

    .line 63
    iput p2, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunPort:I

    .line 64
    iput-short p3, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->componentId:S

    .line 65
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    .line 66
    return-void
.end method

.method public constructor <init>(S)V
    .locals 1
    .param p1, "componentId"    # S

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-string/jumbo v0, "iphone-stun.freenet.de"

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunServer:Ljava/lang/String;

    .line 51
    const/16 v0, 0xd96

    iput v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunPort:I

    .line 57
    iput-short p1, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->componentId:S

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lde/javawi/jstun/test/demo/ice/ICENegociator;Ljava/net/NetworkInterface;)V
    .locals 0
    .param p0, "x0"    # Lde/javawi/jstun/test/demo/ice/ICENegociator;
    .param p1, "x1"    # Ljava/net/NetworkInterface;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->testInterface(Ljava/net/NetworkInterface;)V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 5
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 212
    new-instance v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;

    const-string/jumbo v2, "iphone-stun.freenet.de"

    const/16 v3, 0xd96

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Lde/javawi/jstun/test/demo/ice/ICENegociator;-><init>(Ljava/lang/String;IS)V

    .line 214
    .local v0, "cc":Lde/javawi/jstun/test/demo/ice/ICENegociator;
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->gatherCandidateAddresses()V

    .line 216
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->prioritizeCandidates()V

    .line 218
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->getSortedCandidates()Ljava/util/List;

    move-result-object v1

    .line 222
    .local v1, "sortedCandidates":Ljava/util/List;, "Ljava/util/List<Lde/javawi/jstun/test/demo/ice/Candidate;>;"
    return-void
.end method

.method private testInterface(Ljava/net/NetworkInterface;)V
    .locals 15
    .param p1, "iface"    # Ljava/net/NetworkInterface;

    .prologue
    .line 116
    invoke-virtual/range {p1 .. p1}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v3

    .line 117
    .local v3, "iaddresses":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 118
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/InetAddress;

    .line 119
    .local v2, "iaddress":Ljava/net/InetAddress;
    invoke-virtual {v2}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v12

    if-nez v12, :cond_0

    invoke-virtual {v2}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v12

    if-nez v12, :cond_0

    .line 122
    :try_start_0
    new-instance v5, Lde/javawi/jstun/test/demo/ice/Candidate;

    new-instance v12, Lde/javawi/jstun/util/Address;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v13

    invoke-direct {v12, v13}, Lde/javawi/jstun/util/Address;-><init>([B)V

    iget-short v13, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->componentId:S

    invoke-direct {v5, v12, v13}, Lde/javawi/jstun/test/demo/ice/Candidate;-><init>(Lde/javawi/jstun/util/Address;S)V

    .line 123
    .local v5, "local":Lde/javawi/jstun/test/demo/ice/Candidate;
    iget-object v12, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    invoke-virtual {v12, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 125
    new-instance v9, Lde/javawi/jstun/test/DiscoveryTest;

    iget-object v12, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunServer:Ljava/lang/String;

    iget v13, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->stunPort:I

    invoke-direct {v9, v2, v12, v13}, Lde/javawi/jstun/test/DiscoveryTest;-><init>(Ljava/net/InetAddress;Ljava/lang/String;I)V

    .line 126
    .local v9, "test":Lde/javawi/jstun/test/DiscoveryTest;
    invoke-virtual {v9}, Lde/javawi/jstun/test/DiscoveryTest;->test()Lde/javawi/jstun/test/DiscoveryInfo;

    move-result-object v1

    .line 127
    .local v1, "di":Lde/javawi/jstun/test/DiscoveryInfo;
    invoke-virtual {v1}, Lde/javawi/jstun/test/DiscoveryInfo;->getPublicIP()Ljava/net/InetAddress;

    move-result-object v12

    if-eqz v12, :cond_0

    .line 128
    new-instance v0, Lde/javawi/jstun/test/demo/ice/Candidate;

    new-instance v12, Lde/javawi/jstun/util/Address;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v13

    invoke-direct {v12, v13}, Lde/javawi/jstun/util/Address;-><init>([B)V

    sget-object v13, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->ServerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    iget-short v14, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->componentId:S

    invoke-direct {v0, v12, v13, v14, v5}, Lde/javawi/jstun/test/demo/ice/Candidate;-><init>(Lde/javawi/jstun/util/Address;Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;SLde/javawi/jstun/test/demo/ice/Candidate;)V

    .line 132
    .local v0, "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    iget-short v12, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->componentId:S

    invoke-virtual {v0, v12}, Lde/javawi/jstun/test/demo/ice/Candidate;->setComponentId(S)V

    .line 133
    iget-object v12, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    invoke-virtual {v12, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    goto :goto_0

    .line 135
    .end local v0    # "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    .end local v1    # "di":Lde/javawi/jstun/test/DiscoveryInfo;
    .end local v5    # "local":Lde/javawi/jstun/test/demo/ice/Candidate;
    .end local v9    # "test":Lde/javawi/jstun/test/DiscoveryTest;
    :catch_0
    move-exception v7

    .line 136
    .local v7, "mhpe":Lde/javawi/jstun/header/MessageHeaderParsingException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "MessageHeaderParsingException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 137
    invoke-virtual {v7}, Lde/javawi/jstun/header/MessageHeaderParsingException;->printStackTrace()V

    goto :goto_0

    .line 138
    .end local v7    # "mhpe":Lde/javawi/jstun/header/MessageHeaderParsingException;
    :catch_1
    move-exception v6

    .line 139
    .local v6, "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "MessageAttributeException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 140
    invoke-virtual {v6}, Lde/javawi/jstun/attribute/MessageAttributeException;->printStackTrace()V

    goto :goto_0

    .line 141
    .end local v6    # "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    :catch_2
    move-exception v10

    .line 142
    .local v10, "ue":Lde/javawi/jstun/util/UtilityException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "UtilityException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 143
    invoke-virtual {v10}, Lde/javawi/jstun/util/UtilityException;->printStackTrace()V

    goto/16 :goto_0

    .line 144
    .end local v10    # "ue":Lde/javawi/jstun/util/UtilityException;
    :catch_3
    move-exception v11

    .line 145
    .local v11, "uhe":Ljava/net/UnknownHostException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "MessageHeaderParsingException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 146
    invoke-virtual {v11}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto/16 :goto_0

    .line 147
    .end local v11    # "uhe":Ljava/net/UnknownHostException;
    :catch_4
    move-exception v8

    .line 148
    .local v8, "se":Ljava/net/SocketException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "SocketException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 149
    invoke-virtual {v8}, Ljava/net/SocketException;->printStackTrace()V

    goto/16 :goto_0

    .line 150
    .end local v8    # "se":Ljava/net/SocketException;
    :catch_5
    move-exception v4

    .line 151
    .local v4, "ioe":Ljava/io/IOException;
    sget-object v12, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v13, "IOException while gathering candidate addresses."

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 152
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 156
    .end local v2    # "iaddress":Ljava/net/InetAddress;
    .end local v4    # "ioe":Ljava/io/IOException;
    :cond_1
    return-void
.end method


# virtual methods
.method public gatherCandidateAddresses()V
    .locals 11

    .prologue
    const/16 v2, 0xa

    .line 75
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/32 v4, 0xc350

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    move v3, v2

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 76
    .local v1, "tpe":Ljava/util/concurrent/ThreadPoolExecutor;
    sget-object v2, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "\nStart gathering interfaces\n"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 78
    :try_start_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    .line 79
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v9

    .line 82
    .local v9, "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :goto_0
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 83
    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/net/NetworkInterface;

    .line 85
    .local v8, "iface":Ljava/net/NetworkInterface;
    new-instance v2, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;

    invoke-direct {v2, p0, v8}, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;-><init>(Lde/javawi/jstun/test/demo/ice/ICENegociator;Ljava/net/NetworkInterface;)V

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 93
    .end local v8    # "iface":Ljava/net/NetworkInterface;
    .end local v9    # "ifaces":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :catch_0
    move-exception v10

    .line 94
    .local v10, "se":Ljava/net/SocketException;
    sget-object v2, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "SocketException while enumatering over the network cards."

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 95
    invoke-virtual {v10}, Ljava/net/SocketException;->printStackTrace()V

    .line 99
    .end local v10    # "se":Ljava/net/SocketException;
    :cond_0
    :goto_1
    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 101
    const-wide/16 v2, 0x32

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 102
    :catch_1
    move-exception v0

    .line 103
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v2, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, ""

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 106
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    invoke-virtual {v1}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    .line 107
    sget-object v2, Lde/javawi/jstun/test/demo/ice/ICENegociator;->logger:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "\nDone gathering interfaces\n"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 108
    return-void
.end method

.method public getSortedCandidates()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lde/javawi/jstun/test/demo/ice/Candidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    new-instance v0, Ljava/util/Vector;

    iget-object v1, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    .line 207
    .local v0, "sortedCandidates":Ljava/util/Vector;, "Ljava/util/Vector<Lde/javawi/jstun/test/demo/ice/Candidate;>;"
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 208
    return-object v0
.end method

.method public prioritizeCandidates()V
    .locals 18

    .prologue
    .line 160
    const/4 v5, 0x0

    .line 161
    .local v5, "numberLocal":I
    const/4 v11, 0x0

    .line 162
    .local v11, "numberServerReflexive":I
    const/4 v7, 0x0

    .line 163
    .local v7, "numberPeerReflexive":I
    const/4 v9, 0x0

    .line 165
    .local v9, "numberRelayed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 166
    .local v3, "iterCandidates":Ljava/util/Iterator;, "Ljava/util/Iterator<Lde/javawi/jstun/test/demo/ice/Candidate;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_4

    .line 167
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 168
    .local v1, "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    invoke-virtual {v1}, Lde/javawi/jstun/test/demo/ice/Candidate;->getCandidateType()Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-result-object v14

    .line 169
    .local v14, "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Local:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_1

    .line 170
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 171
    :cond_1
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->ServerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_2

    .line 172
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 173
    :cond_2
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->PeerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_3

    .line 174
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 175
    :cond_3
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Relayed:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_0

    .line 176
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 179
    .end local v1    # "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    .end local v14    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/ice/ICENegociator;->candidates:Ljava/util/HashSet;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 180
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    .line 181
    const/4 v15, 0x0

    .line 182
    .local v15, "typeValue":I
    const/4 v4, 0x0

    .line 183
    .local v4, "localValue":I
    const/4 v2, 0x0

    .line 184
    .local v2, "componentValue":I
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 185
    .restart local v1    # "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    invoke-virtual {v1}, Lde/javawi/jstun/test/demo/ice/Candidate;->getCandidateType()Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-result-object v14

    .line 186
    .restart local v14    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Local:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_6

    .line 187
    const/4 v15, 0x0

    .line 188
    add-int/lit8 v6, v5, -0x1

    .end local v5    # "numberLocal":I
    .local v6, "numberLocal":I
    move v4, v5

    move v5, v6

    .line 199
    .end local v6    # "numberLocal":I
    .restart local v5    # "numberLocal":I
    :cond_5
    :goto_2
    invoke-virtual {v1}, Lde/javawi/jstun/test/demo/ice/Candidate;->getComponentId()S

    move-result v2

    .line 200
    mul-int/lit8 v16, v15, 0x1a

    mul-int/lit8 v17, v4, 0xa

    add-int v16, v16, v17

    add-int v13, v16, v2

    .line 201
    .local v13, "priority":I
    invoke-virtual {v1, v13}, Lde/javawi/jstun/test/demo/ice/Candidate;->setPriority(I)V

    goto :goto_1

    .line 189
    .end local v13    # "priority":I
    :cond_6
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->ServerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_7

    .line 190
    const/16 v15, 0x2a

    .line 191
    add-int/lit8 v12, v11, -0x1

    .end local v11    # "numberServerReflexive":I
    .local v12, "numberServerReflexive":I
    move v4, v11

    move v11, v12

    .end local v12    # "numberServerReflexive":I
    .restart local v11    # "numberServerReflexive":I
    goto :goto_2

    .line 192
    :cond_7
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->PeerReflexive:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_8

    .line 193
    const/16 v15, 0x54

    .line 194
    add-int/lit8 v8, v7, -0x1

    .end local v7    # "numberPeerReflexive":I
    .local v8, "numberPeerReflexive":I
    move v4, v7

    move v7, v8

    .end local v8    # "numberPeerReflexive":I
    .restart local v7    # "numberPeerReflexive":I
    goto :goto_2

    .line 195
    :cond_8
    sget-object v16, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Relayed:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    move-object/from16 v0, v16

    if-ne v14, v0, :cond_5

    .line 196
    const/16 v15, 0x7e

    .line 197
    add-int/lit8 v10, v9, -0x1

    .end local v9    # "numberRelayed":I
    .local v10, "numberRelayed":I
    move v4, v9

    move v9, v10

    .end local v10    # "numberRelayed":I
    .restart local v9    # "numberRelayed":I
    goto :goto_2

    .line 203
    .end local v1    # "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    .end local v2    # "componentValue":I
    .end local v4    # "localValue":I
    .end local v14    # "type":Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    .end local v15    # "typeValue":I
    :cond_9
    return-void
.end method
