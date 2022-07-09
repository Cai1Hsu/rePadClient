.class public Lcom/mongodb/MongoClientOptions;
.super Ljava/lang/Object;
.source "MongoClientOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MongoClientOptions$1;,
        Lcom/mongodb/MongoClientOptions$Builder;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field private final acceptableLatencyDifference:I

.field private final alwaysUseMBeans:Z

.field private final autoConnectRetry:Z

.field private final connectTimeout:I

.field private final connectionsPerHost:I

.field private final cursorFinalizerEnabled:Z

.field private final dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

.field private final dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

.field private final description:Ljava/lang/String;

.field private final heartbeatConnectRetryFrequency:I

.field private final heartbeatConnectTimeout:I

.field private final heartbeatFrequency:I

.field private final heartbeatSocketTimeout:I

.field private final heartbeatThreadCount:I

.field private final maxAutoConnectRetryTime:J

.field private final maxConnectionIdleTime:I

.field private final maxConnectionLifeTime:I

.field private final maxWaitTime:I

.field private final minConnectionsPerHost:I

.field private final readPreference:Lcom/mongodb/ReadPreference;

.field private final requiredReplicaSetName:Ljava/lang/String;

.field private final socketFactory:Ljavax/net/SocketFactory;

.field private final socketKeepAlive:Z

.field private final socketTimeout:I

.field private final threadsAllowedToBlockForConnectionMultiplier:I

.field private final writeConcern:Lcom/mongodb/WriteConcern;


# direct methods
.method private constructor <init>(Lcom/mongodb/MongoClientOptions$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 989
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 990
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$100(Lcom/mongodb/MongoClientOptions$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    .line 991
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$200(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->minConnectionsPerHost:I

    .line 992
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$300(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    .line 993
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$400(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 994
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$500(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    .line 995
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$600(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionIdleTime:I

    .line 996
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$700(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionLifeTime:I

    .line 997
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$800(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    .line 998
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$900(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    .line 999
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1000(Lcom/mongodb/MongoClientOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    .line 1000
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1100(Lcom/mongodb/MongoClientOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    .line 1001
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1200(Lcom/mongodb/MongoClientOptions$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    .line 1002
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1300(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/ReadPreference;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 1003
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1400(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/DBDecoderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 1004
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1500(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/DBEncoderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 1005
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1600(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/WriteConcern;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 1006
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1700(Lcom/mongodb/MongoClientOptions$Builder;)Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    .line 1007
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1800(Lcom/mongodb/MongoClientOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    .line 1008
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$1900(Lcom/mongodb/MongoClientOptions$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    .line 1009
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2000(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    .line 1010
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2100(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    .line 1011
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2200(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    .line 1012
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2300(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    .line 1013
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2400(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    .line 1014
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2500(Lcom/mongodb/MongoClientOptions$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    .line 1015
    invoke-static {p1}, Lcom/mongodb/MongoClientOptions$Builder;->access$2600(Lcom/mongodb/MongoClientOptions$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    .line 1016
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/MongoClientOptions$Builder;Lcom/mongodb/MongoClientOptions$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;
    .param p2, "x1"    # Lcom/mongodb/MongoClientOptions$1;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/mongodb/MongoClientOptions;-><init>(Lcom/mongodb/MongoClientOptions$Builder;)V

    return-void
.end method

.method public static builder()Lcom/mongodb/MongoClientOptions$Builder;
    .locals 1

    .prologue
    .line 499
    new-instance v0, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 837
    if-ne p0, p1, :cond_1

    .line 926
    :cond_0
    :goto_0
    return v1

    .line 840
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 841
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 844
    check-cast v0, Lcom/mongodb/MongoClientOptions;

    .line 846
    .local v0, "that":Lcom/mongodb/MongoClientOptions;
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 847
    goto :goto_0

    .line 849
    :cond_4
    iget-boolean v3, p0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 850
    goto :goto_0

    .line 852
    :cond_5
    iget-boolean v3, p0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 853
    goto :goto_0

    .line 855
    :cond_6
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 856
    goto :goto_0

    .line 858
    :cond_7
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 859
    goto :goto_0

    .line 861
    :cond_8
    iget-boolean v3, p0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    if-eq v3, v4, :cond_9

    move v1, v2

    .line 862
    goto :goto_0

    .line 864
    :cond_9
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    if-eq v3, v4, :cond_a

    move v1, v2

    .line 865
    goto :goto_0

    .line 867
    :cond_a
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    if-eq v3, v4, :cond_b

    move v1, v2

    .line 868
    goto :goto_0

    .line 870
    :cond_b
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    if-eq v3, v4, :cond_c

    move v1, v2

    .line 871
    goto :goto_0

    .line 873
    :cond_c
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    if-eq v3, v4, :cond_d

    move v1, v2

    .line 874
    goto :goto_0

    .line 876
    :cond_d
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    if-eq v3, v4, :cond_e

    move v1, v2

    .line 877
    goto :goto_0

    .line 879
    :cond_e
    iget-wide v4, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    iget-wide v6, v0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_f

    move v1, v2

    .line 880
    goto :goto_0

    .line 882
    :cond_f
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionIdleTime:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->maxConnectionIdleTime:I

    if-eq v3, v4, :cond_10

    move v1, v2

    .line 883
    goto :goto_0

    .line 885
    :cond_10
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionLifeTime:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->maxConnectionLifeTime:I

    if-eq v3, v4, :cond_11

    move v1, v2

    .line 886
    goto/16 :goto_0

    .line 888
    :cond_11
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    if-eq v3, v4, :cond_12

    move v1, v2

    .line 889
    goto/16 :goto_0

    .line 891
    :cond_12
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->minConnectionsPerHost:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->minConnectionsPerHost:I

    if-eq v3, v4, :cond_13

    move v1, v2

    .line 892
    goto/16 :goto_0

    .line 894
    :cond_13
    iget-boolean v3, p0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    if-eq v3, v4, :cond_14

    move v1, v2

    .line 895
    goto/16 :goto_0

    .line 897
    :cond_14
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 898
    goto/16 :goto_0

    .line 900
    :cond_15
    iget v3, p0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    iget v4, v0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    if-eq v3, v4, :cond_16

    move v1, v2

    .line 901
    goto/16 :goto_0

    .line 903
    :cond_16
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    move v1, v2

    .line 904
    goto/16 :goto_0

    .line 906
    :cond_17
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    move v1, v2

    .line 907
    goto/16 :goto_0

    .line 909
    :cond_18
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    :cond_19
    move v1, v2

    .line 910
    goto/16 :goto_0

    .line 909
    :cond_1a
    iget-object v3, v0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    if-nez v3, :cond_19

    .line 912
    :cond_1b
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    move v1, v2

    .line 913
    goto/16 :goto_0

    .line 915
    :cond_1c
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1d

    move v1, v2

    .line 916
    goto/16 :goto_0

    .line 918
    :cond_1d
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v3, v4}, Lcom/mongodb/WriteConcern;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    move v1, v2

    .line 919
    goto/16 :goto_0

    .line 921
    :cond_1e
    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_1f

    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 923
    goto/16 :goto_0

    .line 921
    :cond_1f
    iget-object v3, v0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getAcceptableLatencyDifference()I
    .locals 1

    .prologue
    .line 816
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    return v0
.end method

.method public getConnectTimeout()I
    .locals 1

    .prologue
    .line 596
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    return v0
.end method

.method public getConnectionsPerHost()I
    .locals 1

    .prologue
    .line 537
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    return v0
.end method

.method public getDbDecoderFactory()Lcom/mongodb/DBDecoderFactory;
    .locals 1

    .prologue
    .line 666
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    return-object v0
.end method

.method public getDbEncoderFactory()Lcom/mongodb/DBEncoderFactory;
    .locals 1

    .prologue
    .line 675
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 510
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getHeartbeatConnectRetryFrequency()I
    .locals 1

    .prologue
    .line 752
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    return v0
.end method

.method public getHeartbeatConnectTimeout()I
    .locals 1

    .prologue
    .line 766
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    return v0
.end method

.method public getHeartbeatFrequency()I
    .locals 1

    .prologue
    .line 738
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    return v0
.end method

.method public getHeartbeatSocketTimeout()I
    .locals 1

    .prologue
    .line 780
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    return v0
.end method

.method public getHeartbeatThreadCount()I
    .locals 1

    .prologue
    .line 794
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    return v0
.end method

.method public getMaxAutoConnectRetryTime()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 645
    iget-wide v0, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    return-wide v0
.end method

.method public getMaxConnectionIdleTime()I
    .locals 1

    .prologue
    .line 573
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionIdleTime:I

    return v0
.end method

.method public getMaxConnectionLifeTime()I
    .locals 1

    .prologue
    .line 584
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionLifeTime:I

    return v0
.end method

.method public getMaxWaitTime()I
    .locals 1

    .prologue
    .line 562
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    return v0
.end method

.method public getMinConnectionsPerHost()I
    .locals 1

    .prologue
    .line 523
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->minConnectionsPerHost:I

    return v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public getRequiredReplicaSetName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 832
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    return-object v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .locals 1

    .prologue
    .line 698
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public getSocketTimeout()I
    .locals 1

    .prologue
    .line 608
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    return v0
.end method

.method public getThreadsAllowedToBlockForConnectionMultiplier()I
    .locals 1

    .prologue
    .line 551
    iget v0, p0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    return v0
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .locals 1

    .prologue
    .line 687
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method public hashCode()I
    .locals 9

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 931
    iget-object v2, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 932
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->minConnectionsPerHost:I

    add-int v0, v2, v4

    .line 933
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    add-int v0, v2, v4

    .line 934
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    add-int v0, v2, v4

    .line 935
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    add-int v0, v2, v4

    .line 936
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionIdleTime:I

    add-int v0, v2, v4

    .line 937
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->maxConnectionLifeTime:I

    add-int v0, v2, v4

    .line 938
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    add-int v0, v2, v4

    .line 939
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    add-int v0, v2, v4

    .line 940
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    if-eqz v2, :cond_2

    move v2, v3

    :goto_1
    add-int v0, v4, v2

    .line 941
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    if-eqz v2, :cond_3

    move v2, v3

    :goto_2
    add-int v0, v4, v2

    .line 942
    mul-int/lit8 v2, v0, 0x1f

    iget-wide v4, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    iget-wide v6, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    const/16 v8, 0x20

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v2, v4

    .line 943
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 944
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 945
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 946
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v4}, Lcom/mongodb/WriteConcern;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 947
    mul-int/lit8 v4, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_3
    add-int v0, v4, v2

    .line 948
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    if-eqz v2, :cond_5

    move v2, v3

    :goto_4
    add-int v0, v4, v2

    .line 949
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v4, p0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    if-eqz v4, :cond_6

    :goto_5
    add-int v0, v2, v3

    .line 950
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    add-int v0, v2, v3

    .line 951
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    add-int v0, v2, v3

    .line 952
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    add-int v0, v2, v3

    .line 953
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    add-int v0, v2, v3

    .line 954
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    add-int v0, v2, v3

    .line 955
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    add-int v0, v2, v3

    .line 956
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 957
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 931
    goto/16 :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 940
    goto/16 :goto_1

    :cond_3
    move v2, v1

    .line 941
    goto/16 :goto_2

    :cond_4
    move v2, v1

    .line 947
    goto :goto_3

    :cond_5
    move v2, v1

    .line 948
    goto :goto_4

    :cond_6
    move v3, v1

    .line 949
    goto :goto_5
.end method

.method public isAlwaysUseMBeans()Z
    .locals 1

    .prologue
    .line 724
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    return v0
.end method

.method public isAutoConnectRetry()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 633
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    return v0
.end method

.method public isCursorFinalizerEnabled()Z
    .locals 1

    .prologue
    .line 712
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    return v0
.end method

.method public isSocketKeepAlive()Z
    .locals 1

    .prologue
    .line 619
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 962
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongoClientOptions{description=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connectionsPerHost="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->connectionsPerHost:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", threadsAllowedToBlockForConnectionMultiplier="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxWaitTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->maxWaitTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connectTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->connectTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->socketTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketKeepAlive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoClientOptions;->socketKeepAlive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", autoConnectRetry="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoClientOptions;->autoConnectRetry:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxAutoConnectRetryTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/MongoClientOptions;->maxAutoConnectRetryTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", readPreference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dbDecoderFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dbEncoderFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", writeConcern="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", cursorFinalizerEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoClientOptions;->cursorFinalizerEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", alwaysUseMBeans="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoClientOptions;->alwaysUseMBeans:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", heartbeatFrequency="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->heartbeatFrequency:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", heartbeatConnectRetryFrequency="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectRetryFrequency:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", heartbeatConnectTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->heartbeatConnectTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", heartbeatSocketTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->heartbeatSocketTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", heartbeatThreadCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->heartbeatThreadCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", acceptableLatencyDifference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoClientOptions;->acceptableLatencyDifference:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requiredReplicaSetName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoClientOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
