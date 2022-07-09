.class public Lcom/mongodb/MongoOptions;
.super Ljava/lang/Object;
.source "MongoOptions.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field acceptableLatencyDifferenceMS:I

.field public alwaysUseMBeans:Z

.field public autoConnectRetry:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public connectTimeout:I

.field public connectionsPerHost:I

.field public cursorFinalizerEnabled:Z

.field public dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

.field public dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

.field public description:Ljava/lang/String;

.field public fsync:Z

.field heartbeatConnectRetryFrequencyMS:I

.field heartbeatConnectTimeoutMS:I

.field heartbeatFrequencyMS:I

.field heartbeatReadTimeoutMS:I

.field heartbeatThreadCount:I

.field public j:Z

.field public maxAutoConnectRetryTime:J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field maxConnectionIdleTime:I

.field maxConnectionLifeTime:I

.field public maxWaitTime:I

.field minConnectionsPerHost:I

.field public readPreference:Lcom/mongodb/ReadPreference;

.field requiredReplicaSetName:Ljava/lang/String;

.field public safe:Z

.field public slaveOk:Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public socketFactory:Ljavax/net/SocketFactory;

.field public socketKeepAlive:Z

.field public socketTimeout:I

.field public threadsAllowedToBlockForConnectionMultiplier:I

.field public w:I

.field public writeConcern:Lcom/mongodb/WriteConcern;

.field public wtimeout:I


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p0}, Lcom/mongodb/MongoOptions;->reset()V

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/MongoClientOptions;)V
    .locals 2
    .param p1, "options"    # Lcom/mongodb/MongoClientOptions;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    .line 46
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getThreadsAllowedToBlockForConnectionMultiplier()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 47
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getMaxWaitTime()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    .line 48
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    .line 49
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getSocketTimeout()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    .line 50
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->isSocketKeepAlive()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    .line 51
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->isAutoConnectRetry()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    .line 52
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getMaxAutoConnectRetryTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    .line 53
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 54
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getDbDecoderFactory()Lcom/mongodb/DBDecoderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 55
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getDbEncoderFactory()Lcom/mongodb/DBEncoderFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 56
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    .line 57
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    .line 58
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->isCursorFinalizerEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    .line 59
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    .line 61
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->isAlwaysUseMBeans()Z

    move-result v0

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    .line 62
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getMinConnectionsPerHost()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->minConnectionsPerHost:I

    .line 63
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getMaxConnectionIdleTime()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->maxConnectionIdleTime:I

    .line 64
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getMaxConnectionLifeTime()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->maxConnectionLifeTime:I

    .line 65
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getHeartbeatFrequency()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    .line 66
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getHeartbeatConnectRetryFrequency()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    .line 67
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getHeartbeatConnectTimeout()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    .line 68
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getHeartbeatSocketTimeout()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    .line 69
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getHeartbeatThreadCount()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    .line 70
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getAcceptableLatencyDifference()I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    .line 71
    invoke-virtual {p1}, Lcom/mongodb/MongoClientOptions;->getRequiredReplicaSetName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    .line 72
    return-void
.end method


# virtual methods
.method public copy()Lcom/mongodb/MongoOptions;
    .locals 4

    .prologue
    .line 110
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-direct {v0}, Lcom/mongodb/MongoOptions;-><init>()V

    .line 111
    .local v0, "m":Lcom/mongodb/MongoOptions;
    iget v1, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    .line 112
    iget v1, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 113
    iget v1, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    .line 114
    iget v1, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    .line 115
    iget v1, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    .line 116
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    .line 117
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    .line 118
    iget-wide v2, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    iput-wide v2, v0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    .line 119
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    .line 120
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 121
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 122
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->safe:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->safe:Z

    .line 123
    iget v1, p0, Lcom/mongodb/MongoOptions;->w:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->w:I

    .line 124
    iget v1, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->wtimeout:I

    .line 125
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->fsync:Z

    .line 126
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->j:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->j:Z

    .line 127
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 128
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 129
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    .line 130
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    .line 131
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    .line 132
    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    iput-boolean v1, v0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    .line 133
    iget v1, p0, Lcom/mongodb/MongoOptions;->minConnectionsPerHost:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->minConnectionsPerHost:I

    .line 134
    iget v1, p0, Lcom/mongodb/MongoOptions;->maxConnectionIdleTime:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->maxConnectionIdleTime:I

    .line 135
    iget v1, p0, Lcom/mongodb/MongoOptions;->maxConnectionLifeTime:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->maxConnectionLifeTime:I

    .line 136
    iget v1, p0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    .line 137
    iget v1, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    .line 138
    iget v1, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    .line 139
    iget v1, p0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    .line 140
    iget v1, p0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    .line 141
    iget v1, p0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    iput v1, v0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    .line 142
    iget-object v1, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    iput-object v1, v0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    .line 143
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 163
    if-ne p0, p1, :cond_1

    .line 261
    :cond_0
    :goto_0
    return v1

    .line 166
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 167
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 170
    check-cast v0, Lcom/mongodb/MongoOptions;

    .line 172
    .local v0, "options":Lcom/mongodb/MongoOptions;
    iget v3, p0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 173
    goto :goto_0

    .line 175
    :cond_4
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 176
    goto :goto_0

    .line 178
    :cond_5
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 179
    goto :goto_0

    .line 181
    :cond_6
    iget v3, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 182
    goto :goto_0

    .line 184
    :cond_7
    iget v3, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 185
    goto :goto_0

    .line 187
    :cond_8
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    if-eq v3, v4, :cond_9

    move v1, v2

    .line 188
    goto :goto_0

    .line 190
    :cond_9
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->fsync:Z

    if-eq v3, v4, :cond_a

    move v1, v2

    .line 191
    goto :goto_0

    .line 193
    :cond_a
    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    if-eq v3, v4, :cond_b

    move v1, v2

    .line 194
    goto :goto_0

    .line 196
    :cond_b
    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    if-eq v3, v4, :cond_c

    move v1, v2

    .line 197
    goto :goto_0

    .line 199
    :cond_c
    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    if-eq v3, v4, :cond_d

    move v1, v2

    .line 200
    goto :goto_0

    .line 202
    :cond_d
    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    if-eq v3, v4, :cond_e

    move v1, v2

    .line 203
    goto :goto_0

    .line 205
    :cond_e
    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    if-eq v3, v4, :cond_f

    move v1, v2

    .line 206
    goto :goto_0

    .line 208
    :cond_f
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->j:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->j:Z

    if-eq v3, v4, :cond_10

    move v1, v2

    .line 209
    goto :goto_0

    .line 211
    :cond_10
    iget-wide v4, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    iget-wide v6, v0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_11

    move v1, v2

    .line 212
    goto/16 :goto_0

    .line 214
    :cond_11
    iget v3, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    if-eq v3, v4, :cond_12

    move v1, v2

    .line 215
    goto/16 :goto_0

    .line 217
    :cond_12
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->safe:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->safe:Z

    if-eq v3, v4, :cond_13

    move v1, v2

    .line 218
    goto/16 :goto_0

    .line 220
    :cond_13
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    if-eq v3, v4, :cond_14

    move v1, v2

    .line 221
    goto/16 :goto_0

    .line 223
    :cond_14
    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    iget-boolean v4, v0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 224
    goto/16 :goto_0

    .line 226
    :cond_15
    iget v3, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    if-eq v3, v4, :cond_16

    move v1, v2

    .line 227
    goto/16 :goto_0

    .line 229
    :cond_16
    iget v3, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    if-eq v3, v4, :cond_17

    move v1, v2

    .line 230
    goto/16 :goto_0

    .line 232
    :cond_17
    iget v3, p0, Lcom/mongodb/MongoOptions;->w:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->w:I

    if-eq v3, v4, :cond_18

    move v1, v2

    .line 233
    goto/16 :goto_0

    .line 235
    :cond_18
    iget v3, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    iget v4, v0, Lcom/mongodb/MongoOptions;->wtimeout:I

    if-eq v3, v4, :cond_19

    move v1, v2

    .line 236
    goto/16 :goto_0

    .line 238
    :cond_19
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    move v1, v2

    .line 239
    goto/16 :goto_0

    .line 241
    :cond_1a
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    move v1, v2

    .line 242
    goto/16 :goto_0

    .line 244
    :cond_1b
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    if-eqz v3, :cond_1d

    iget-object v3, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1e

    :cond_1c
    move v1, v2

    .line 245
    goto/16 :goto_0

    .line 244
    :cond_1d
    iget-object v3, v0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    if-nez v3, :cond_1c

    .line 247
    :cond_1e
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    if-eqz v3, :cond_20

    iget-object v3, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_21

    :cond_1f
    move v1, v2

    .line 248
    goto/16 :goto_0

    .line 247
    :cond_20
    iget-object v3, v0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    if-nez v3, :cond_1f

    .line 250
    :cond_21
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    move v1, v2

    .line 251
    goto/16 :goto_0

    .line 253
    :cond_22
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    if-eqz v3, :cond_24

    iget-object v3, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v3, v4}, Lcom/mongodb/WriteConcern;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    :cond_23
    move v1, v2

    .line 254
    goto/16 :goto_0

    .line 253
    :cond_24
    iget-object v3, v0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    if-nez v3, :cond_23

    .line 256
    :cond_25
    iget-object v3, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_26

    iget-object v3, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 258
    goto/16 :goto_0

    .line 256
    :cond_26
    iget-object v3, v0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public declared-synchronized getConnectTimeout()I
    .locals 1

    .prologue
    .line 552
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConnectionsPerHost()I
    .locals 1

    .prologue
    .line 502
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDbDecoderFactory()Lcom/mongodb/DBDecoderFactory;
    .locals 1

    .prologue
    .line 640
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDbEncoderFactory()Lcom/mongodb/DBEncoderFactory;
    .locals 1

    .prologue
    .line 656
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 486
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMaxAutoConnectRetryTime()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 622
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMaxWaitTime()I
    .locals 1

    .prologue
    .line 536
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 776
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public getRequiredReplicaSetName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 828
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getSocketFactory()Ljavax/net/SocketFactory;
    .locals 1

    .prologue
    .line 760
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSocketTimeout()I
    .locals 1

    .prologue
    .line 568
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getThreadsAllowedToBlockForConnectionMultiplier()I
    .locals 1

    .prologue
    .line 519
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getW()I
    .locals 1

    .prologue
    .line 688
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->w:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .locals 5

    .prologue
    .line 150
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 157
    :goto_0
    return-object v0

    .line 152
    :cond_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->w:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->j:Z

    or-int/2addr v0, v1

    if-eqz v0, :cond_2

    .line 153
    :cond_1
    new-instance v0, Lcom/mongodb/WriteConcern;

    iget v1, p0, Lcom/mongodb/MongoOptions;->w:I

    iget v2, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    iget-boolean v3, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    iget-boolean v4, p0, Lcom/mongodb/MongoOptions;->j:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mongodb/WriteConcern;-><init>(IIZZ)V

    goto :goto_0

    .line 154
    :cond_2
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->safe:Z

    if-eqz v0, :cond_3

    .line 155
    sget-object v0, Lcom/mongodb/WriteConcern;->SAFE:Lcom/mongodb/WriteConcern;

    goto :goto_0

    .line 157
    :cond_3
    sget-object v0, Lcom/mongodb/WriteConcern;->NORMAL:Lcom/mongodb/WriteConcern;

    goto :goto_0
.end method

.method public declared-synchronized getWtimeout()I
    .locals 1

    .prologue
    .line 704
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mongodb/MongoOptions;->wtimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public hashCode()I
    .locals 9

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 266
    iget-object v2, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 267
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    add-int v0, v2, v4

    .line 268
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    add-int v0, v2, v4

    .line 269
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    add-int v0, v2, v4

    .line 270
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    add-int v0, v2, v4

    .line 271
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    add-int v0, v2, v4

    .line 272
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    if-eqz v2, :cond_2

    move v2, v3

    :goto_1
    add-int v0, v4, v2

    .line 273
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    if-eqz v2, :cond_3

    move v2, v3

    :goto_2
    add-int v0, v4, v2

    .line 274
    mul-int/lit8 v2, v0, 0x1f

    iget-wide v4, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    iget-wide v6, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    const/16 v8, 0x20

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v2, v4

    .line 275
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    if-eqz v2, :cond_4

    move v2, v3

    :goto_3
    add-int v0, v4, v2

    .line 276
    mul-int/lit8 v4, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_4
    add-int v0, v4, v2

    .line 277
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 278
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 279
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->safe:Z

    if-eqz v2, :cond_6

    move v2, v3

    :goto_5
    add-int v0, v4, v2

    .line 280
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->w:I

    add-int v0, v2, v4

    .line 281
    mul-int/lit8 v2, v0, 0x1f

    iget v4, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    add-int v0, v2, v4

    .line 282
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    if-eqz v2, :cond_7

    move v2, v3

    :goto_6
    add-int v0, v4, v2

    .line 283
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->j:Z

    if-eqz v2, :cond_8

    move v2, v3

    :goto_7
    add-int v0, v4, v2

    .line 284
    mul-int/lit8 v2, v0, 0x1f

    iget-object v4, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    add-int v0, v2, v4

    .line 285
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v2, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    if-eqz v2, :cond_9

    move v2, v3

    :goto_8
    add-int v0, v4, v2

    .line 286
    mul-int/lit8 v4, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v2}, Lcom/mongodb/WriteConcern;->hashCode()I

    move-result v2

    :goto_9
    add-int v0, v4, v2

    .line 287
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v4, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    if-eqz v4, :cond_b

    :goto_a
    add-int v0, v2, v3

    .line 288
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    add-int v0, v2, v3

    .line 289
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    add-int v0, v2, v3

    .line 290
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    add-int v0, v2, v3

    .line 291
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    add-int v0, v2, v3

    .line 292
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    add-int v0, v2, v3

    .line 293
    mul-int/lit8 v2, v0, 0x1f

    iget v3, p0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    add-int v0, v2, v3

    .line 294
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 295
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 266
    goto/16 :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 272
    goto/16 :goto_1

    :cond_3
    move v2, v1

    .line 273
    goto/16 :goto_2

    :cond_4
    move v2, v1

    .line 275
    goto/16 :goto_3

    :cond_5
    move v2, v1

    .line 276
    goto/16 :goto_4

    :cond_6
    move v2, v1

    .line 279
    goto/16 :goto_5

    :cond_7
    move v2, v1

    .line 282
    goto :goto_6

    :cond_8
    move v2, v1

    .line 283
    goto :goto_7

    :cond_9
    move v2, v1

    .line 285
    goto :goto_8

    :cond_a
    move v2, v1

    .line 286
    goto :goto_9

    :cond_b
    move v3, v1

    .line 287
    goto :goto_a
.end method

.method public isAlwaysUseMBeans()Z
    .locals 1

    .prologue
    .line 810
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    return v0
.end method

.method public declared-synchronized isAutoConnectRetry()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 602
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isCursorFinalizerEnabled()Z
    .locals 1

    .prologue
    .line 793
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    return v0
.end method

.method public declared-synchronized isFsync()Z
    .locals 1

    .prologue
    .line 720
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->fsync:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isJ()Z
    .locals 1

    .prologue
    .line 736
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSafe()Z
    .locals 1

    .prologue
    .line 672
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->safe:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSocketKeepAlive()Z
    .locals 1

    .prologue
    .line 584
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public reset()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 75
    sget v0, Lcom/mongodb/Bytes;->CONNECTIONS_PER_HOST:I

    iput v0, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    .line 76
    const/4 v0, 0x5

    iput v0, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 77
    const v0, 0x1d4c0

    iput v0, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    .line 78
    const/16 v0, 0x2710

    iput v0, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    .line 79
    iput v2, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    .line 80
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    .line 81
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    .line 82
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    .line 83
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    .line 84
    iput-object v3, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 85
    iput-object v3, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 86
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->safe:Z

    .line 87
    iput v2, p0, Lcom/mongodb/MongoOptions;->w:I

    .line 88
    iput v2, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    .line 89
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    .line 90
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->j:Z

    .line 91
    sget-object v0, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 92
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 93
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    .line 94
    iput-object v3, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    .line 96
    iput-boolean v2, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    .line 97
    iput v2, p0, Lcom/mongodb/MongoOptions;->minConnectionsPerHost:I

    .line 98
    iput v2, p0, Lcom/mongodb/MongoOptions;->maxConnectionIdleTime:I

    .line 99
    iput v2, p0, Lcom/mongodb/MongoOptions;->maxConnectionLifeTime:I

    .line 100
    const-string/jumbo v0, "com.mongodb.updaterIntervalMS"

    const-string/jumbo v1, "5000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatFrequencyMS:I

    .line 101
    const-string/jumbo v0, "com.mongodb.updaterIntervalNoMasterMS"

    const-string/jumbo v1, "10"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectRetryFrequencyMS:I

    .line 102
    const-string/jumbo v0, "com.mongodb.updaterConnectTimeoutMS"

    const-string/jumbo v1, "20000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatConnectTimeoutMS:I

    .line 103
    const-string/jumbo v0, "com.mongodb.updaterSocketTimeoutMS"

    const-string/jumbo v1, "20000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->heartbeatReadTimeoutMS:I

    .line 104
    iput v2, p0, Lcom/mongodb/MongoOptions;->heartbeatThreadCount:I

    .line 105
    const-string/jumbo v0, "com.mongodb.slaveAcceptableLatencyMS"

    const-string/jumbo v1, "15"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoOptions;->acceptableLatencyDifferenceMS:I

    .line 106
    iput-object v3, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setAlwaysUseMBeans(Z)V
    .locals 0
    .param p1, "alwaysUseMBeans"    # Z

    .prologue
    .line 818
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    .line 819
    return-void
.end method

.method public declared-synchronized setAutoConnectRetry(Z)V
    .locals 1
    .param p1, "retry"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 612
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 613
    monitor-exit p0

    return-void

    .line 612
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setConnectTimeout(I)V
    .locals 1
    .param p1, "timeoutMS"    # I

    .prologue
    .line 560
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 561
    monitor-exit p0

    return-void

    .line 560
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setConnectionsPerHost(I)V
    .locals 1
    .param p1, "connections"    # I

    .prologue
    .line 510
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 511
    monitor-exit p0

    return-void

    .line 510
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setCursorFinalizerEnabled(Z)V
    .locals 0
    .param p1, "cursorFinalizerEnabled"    # Z

    .prologue
    .line 801
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    .line 803
    return-void
.end method

.method public declared-synchronized setDbDecoderFactory(Lcom/mongodb/DBDecoderFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/mongodb/DBDecoderFactory;

    .prologue
    .line 648
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 649
    monitor-exit p0

    return-void

    .line 648
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDbEncoderFactory(Lcom/mongodb/DBEncoderFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/mongodb/DBEncoderFactory;

    .prologue
    .line 664
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 665
    monitor-exit p0

    return-void

    .line 664
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDescription(Ljava/lang/String;)V
    .locals 1
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 494
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 495
    monitor-exit p0

    return-void

    .line 494
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setFsync(Z)V
    .locals 1
    .param p1, "sync"    # Z

    .prologue
    .line 728
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->fsync:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 729
    monitor-exit p0

    return-void

    .line 728
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setJ(Z)V
    .locals 1
    .param p1, "safe"    # Z

    .prologue
    .line 744
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 745
    monitor-exit p0

    return-void

    .line 744
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMaxAutoConnectRetryTime(J)V
    .locals 1
    .param p1, "retryTimeMS"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 632
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 633
    monitor-exit p0

    return-void

    .line 632
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMaxWaitTime(I)V
    .locals 1
    .param p1, "timeMS"    # I

    .prologue
    .line 544
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 545
    monitor-exit p0

    return-void

    .line 544
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 784
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    .line 785
    return-void
.end method

.method public declared-synchronized setSafe(Z)V
    .locals 1
    .param p1, "isSafe"    # Z

    .prologue
    .line 680
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->safe:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 681
    monitor-exit p0

    return-void

    .line 680
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSocketFactory(Ljavax/net/SocketFactory;)V
    .locals 1
    .param p1, "factory"    # Ljavax/net/SocketFactory;

    .prologue
    .line 768
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 769
    monitor-exit p0

    return-void

    .line 768
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSocketKeepAlive(Z)V
    .locals 1
    .param p1, "keepAlive"    # Z

    .prologue
    .line 592
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 593
    monitor-exit p0

    return-void

    .line 592
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSocketTimeout(I)V
    .locals 1
    .param p1, "timeoutMS"    # I

    .prologue
    .line 576
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 577
    monitor-exit p0

    return-void

    .line 576
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setThreadsAllowedToBlockForConnectionMultiplier(I)V
    .locals 1
    .param p1, "threads"    # I

    .prologue
    .line 528
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 529
    monitor-exit p0

    return-void

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setW(I)V
    .locals 1
    .param p1, "val"    # I

    .prologue
    .line 696
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->w:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 697
    monitor-exit p0

    return-void

    .line 696
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setWriteConcern(Lcom/mongodb/WriteConcern;)V
    .locals 0
    .param p1, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 752
    iput-object p1, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 753
    return-void
.end method

.method public declared-synchronized setWtimeout(I)V
    .locals 1
    .param p1, "timeoutMS"    # I

    .prologue
    .line 712
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/mongodb/MongoOptions;->wtimeout:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 713
    monitor-exit p0

    return-void

    .line 712
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 833
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "MongoOptions{description=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connectionsPerHost="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->connectionsPerHost:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", threadsAllowedToBlockForConnectionMultiplier="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->threadsAllowedToBlockForConnectionMultiplier:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxWaitTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->maxWaitTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connectTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->connectTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->socketTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketKeepAlive="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->socketKeepAlive:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", autoConnectRetry="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->autoConnectRetry:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxAutoConnectRetryTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/MongoOptions;->maxAutoConnectRetryTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", slaveOk="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->slaveOk:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", readPreference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dbDecoderFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dbEncoderFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", safe="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->safe:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", w="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->w:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", wtimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/MongoOptions;->wtimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", fsync="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->fsync:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", j="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->j:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", socketFactory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->socketFactory:Ljavax/net/SocketFactory;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", cursorFinalizerEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->cursorFinalizerEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", writeConcern="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->writeConcern:Lcom/mongodb/WriteConcern;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", alwaysUseMBeans="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/mongodb/MongoOptions;->alwaysUseMBeans:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requiredReplicaSetName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoOptions;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
