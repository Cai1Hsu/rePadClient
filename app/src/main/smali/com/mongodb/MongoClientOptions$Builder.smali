.class public Lcom/mongodb/MongoClientOptions$Builder;
.super Ljava/lang/Object;
.source "MongoClientOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MongoClientOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private acceptableLatencyDifference:I

.field private alwaysUseMBeans:Z

.field private autoConnectRetry:Z

.field private connectTimeout:I

.field private connectionsPerHost:I

.field private cursorFinalizerEnabled:Z

.field private dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

.field private dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

.field private description:Ljava/lang/String;

.field private heartbeatConnectRetryFrequency:I

.field private heartbeatConnectTimeout:I

.field private heartbeatFrequency:I

.field private heartbeatSocketTimeout:I

.field private heartbeatThreadCount:I

.field private maxAutoConnectRetryTime:J

.field private maxConnectionIdleTime:I

.field private maxConnectionLifeTime:I

.field private maxWaitTime:I

.field private minConnectionsPerHost:I

.field private readPreference:Lcom/mongodb/ReadPreference;

.field private requiredReplicaSetName:Ljava/lang/String;

.field private socketFactory:Ljavax/net/SocketFactory;

.field private socketKeepAlive:Z

.field private socketTimeout:I

.field private threadsAllowedToBlockForConnectionMultiplier:I

.field private writeConcern:Lcom/mongodb/WriteConcern;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/16 v0, 0x64

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectionsPerHost:I

    .line 45
    const/4 v0, 0x5

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 46
    const v0, 0x1d4c0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxWaitTime:I

    .line 49
    const/16 v0, 0x2710

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectTimeout:I

    .line 50
    iput v2, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketTimeout:I

    .line 51
    iput-boolean v2, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketKeepAlive:Z

    .line 52
    iput-boolean v2, p0, Lcom/mongodb/MongoClientOptions$Builder;->autoConnectRetry:Z

    .line 53
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxAutoConnectRetryTime:J

    .line 54
    invoke-static {}, Lcom/mongodb/ReadPreference;->primary()Lcom/mongodb/ReadPreference;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->readPreference:Lcom/mongodb/ReadPreference;

    .line 55
    sget-object v0, Lcom/mongodb/DefaultDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 56
    sget-object v0, Lcom/mongodb/DefaultDBEncoder;->FACTORY:Lcom/mongodb/DBEncoderFactory;

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 57
    sget-object v0, Lcom/mongodb/WriteConcern;->ACKNOWLEDGED:Lcom/mongodb/WriteConcern;

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 58
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->cursorFinalizerEnabled:Z

    .line 60
    iput-boolean v2, p0, Lcom/mongodb/MongoClientOptions$Builder;->alwaysUseMBeans:Z

    .line 61
    const-string/jumbo v0, "com.mongodb.updaterIntervalMS"

    const-string/jumbo v1, "5000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatFrequency:I

    .line 62
    const-string/jumbo v0, "com.mongodb.updaterIntervalNoMasterMS"

    const-string/jumbo v1, "10"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectRetryFrequency:I

    .line 63
    const-string/jumbo v0, "com.mongodb.updaterConnectTimeoutMS"

    const-string/jumbo v1, "20000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectTimeout:I

    .line 64
    const-string/jumbo v0, "com.mongodb.updaterSocketTimeoutMS"

    const-string/jumbo v1, "20000"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatSocketTimeout:I

    .line 66
    const-string/jumbo v0, "com.mongodb.slaveAcceptableLatencyMS"

    const-string/jumbo v1, "15"

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->acceptableLatencyDifference:I

    return-void
.end method

.method static synthetic access$100(Lcom/mongodb/MongoClientOptions$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->description:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mongodb/MongoClientOptions$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->autoConnectRetry:Z

    return v0
.end method

.method static synthetic access$1100(Lcom/mongodb/MongoClientOptions$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketKeepAlive:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/mongodb/MongoClientOptions$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-wide v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxAutoConnectRetryTime:J

    return-wide v0
.end method

.method static synthetic access$1300(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/ReadPreference;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/DBDecoderFactory;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/DBEncoderFactory;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/mongodb/MongoClientOptions$Builder;)Lcom/mongodb/WriteConcern;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->writeConcern:Lcom/mongodb/WriteConcern;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/mongodb/MongoClientOptions$Builder;)Ljavax/net/SocketFactory;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mongodb/MongoClientOptions$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->cursorFinalizerEnabled:Z

    return v0
.end method

.method static synthetic access$1900(Lcom/mongodb/MongoClientOptions$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->alwaysUseMBeans:Z

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->minConnectionsPerHost:I

    return v0
.end method

.method static synthetic access$2000(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatFrequency:I

    return v0
.end method

.method static synthetic access$2100(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectRetryFrequency:I

    return v0
.end method

.method static synthetic access$2200(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectTimeout:I

    return v0
.end method

.method static synthetic access$2300(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatSocketTimeout:I

    return v0
.end method

.method static synthetic access$2400(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatThreadCount:I

    return v0
.end method

.method static synthetic access$2500(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->acceptableLatencyDifference:I

    return v0
.end method

.method static synthetic access$2600(Lcom/mongodb/MongoClientOptions$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->requiredReplicaSetName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectionsPerHost:I

    return v0
.end method

.method static synthetic access$400(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->threadsAllowedToBlockForConnectionMultiplier:I

    return v0
.end method

.method static synthetic access$500(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxWaitTime:I

    return v0
.end method

.method static synthetic access$600(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionIdleTime:I

    return v0
.end method

.method static synthetic access$700(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionLifeTime:I

    return v0
.end method

.method static synthetic access$800(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectTimeout:I

    return v0
.end method

.method static synthetic access$900(Lcom/mongodb/MongoClientOptions$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MongoClientOptions$Builder;

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketTimeout:I

    return v0
.end method


# virtual methods
.method public acceptableLatencyDifference(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "acceptableLatencyDifference"    # I

    .prologue
    .line 164
    if-gez p1, :cond_0

    .line 165
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "acceptableLatencyDifference must be greater than or equal to 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->acceptableLatencyDifference:I

    .line 168
    return-object p0
.end method

.method public alwaysUseMBeans(Z)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "alwaysUseMBeans"    # Z

    .prologue
    .line 453
    iput-boolean p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->alwaysUseMBeans:Z

    .line 454
    return-object p0
.end method

.method public autoConnectRetry(Z)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "autoConnectRetry"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 335
    iput-boolean p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->autoConnectRetry:Z

    .line 336
    return-object p0
.end method

.method public build()Lcom/mongodb/MongoClientOptions;
    .locals 2

    .prologue
    .line 489
    new-instance v0, Lcom/mongodb/MongoClientOptions;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mongodb/MongoClientOptions;-><init>(Lcom/mongodb/MongoClientOptions$Builder;Lcom/mongodb/MongoClientOptions$1;)V

    return-object v0
.end method

.method public connectTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "connectTimeout"    # I

    .prologue
    .line 291
    if-gez p1, :cond_0

    .line 292
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 294
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectTimeout:I

    .line 295
    return-object p0
.end method

.method public connectionsPerHost(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "connectionsPerHost"    # I

    .prologue
    .line 209
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 210
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectionsPerHost:I

    .line 213
    return-object p0
.end method

.method public cursorFinalizerEnabled(Z)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "cursorFinalizerEnabled"    # Z

    .prologue
    .line 439
    iput-boolean p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->cursorFinalizerEnabled:Z

    .line 440
    return-object p0
.end method

.method public dbDecoderFactory(Lcom/mongodb/DBDecoderFactory;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "dbDecoderFactory"    # Lcom/mongodb/DBDecoderFactory;

    .prologue
    .line 379
    if-nez p1, :cond_0

    .line 380
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null is not a legal value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 382
    :cond_0
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbDecoderFactory:Lcom/mongodb/DBDecoderFactory;

    .line 383
    return-object p0
.end method

.method public dbEncoderFactory(Lcom/mongodb/DBEncoderFactory;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "dbEncoderFactory"    # Lcom/mongodb/DBEncoderFactory;

    .prologue
    .line 394
    if-nez p1, :cond_0

    .line 395
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null is not a legal value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 397
    :cond_0
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->dbEncoderFactory:Lcom/mongodb/DBEncoderFactory;

    .line 398
    return-object p0
.end method

.method public description(Ljava/lang/String;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 179
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->description:Ljava/lang/String;

    .line 180
    return-object p0
.end method

.method public heartbeatConnectRetryFrequency(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "heartbeatConnectRetryFrequency"    # I

    .prologue
    .line 96
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "heartbeatConnectRetryFrequency must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectRetryFrequency:I

    .line 100
    return-object p0
.end method

.method public heartbeatConnectTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "heartbeatConnectTimeout"    # I

    .prologue
    .line 113
    if-gez p1, :cond_0

    .line 114
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "heartbeatConnectTimeout must be greater than or equal to 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatConnectTimeout:I

    .line 117
    return-object p0
.end method

.method public heartbeatFrequency(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "heartbeatFrequency"    # I

    .prologue
    .line 79
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "heartbeatFrequency must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatFrequency:I

    .line 83
    return-object p0
.end method

.method public heartbeatSocketTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "heartbeatSocketTimeout"    # I

    .prologue
    .line 130
    if-gez p1, :cond_0

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "heartbeatSocketTimeout must be greater than or equal to 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatSocketTimeout:I

    .line 134
    return-object p0
.end method

.method public heartbeatThreadCount(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "heartbeatThreadCount"    # I

    .prologue
    .line 147
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 148
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "heartbeatThreadCount must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->heartbeatThreadCount:I

    .line 151
    return-object p0
.end method

.method public legacyDefaults()Lcom/mongodb/MongoClientOptions$Builder;
    .locals 1

    .prologue
    .line 478
    const/16 v0, 0xa

    iput v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->connectionsPerHost:I

    .line 479
    sget-object v0, Lcom/mongodb/WriteConcern;->NORMAL:Lcom/mongodb/WriteConcern;

    iput-object v0, p0, Lcom/mongodb/MongoClientOptions$Builder;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 480
    return-object p0
.end method

.method public maxAutoConnectRetryTime(J)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 3
    .param p1, "maxAutoConnectRetryTime"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 349
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 350
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 352
    :cond_0
    iput-wide p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxAutoConnectRetryTime:J

    .line 353
    return-object p0
.end method

.method public maxConnectionIdleTime(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "maxConnectionIdleTime"    # I

    .prologue
    .line 259
    if-gez p1, :cond_0

    .line 260
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 262
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionIdleTime:I

    .line 263
    return-object p0
.end method

.method public maxConnectionLifeTime(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "maxConnectionLifeTime"    # I

    .prologue
    .line 276
    if-gez p1, :cond_0

    .line 277
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxConnectionLifeTime:I

    .line 280
    return-object p0
.end method

.method public maxWaitTime(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "maxWaitTime"    # I

    .prologue
    .line 242
    if-gez p1, :cond_0

    .line 243
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 245
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->maxWaitTime:I

    .line 246
    return-object p0
.end method

.method public minConnectionsPerHost(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "minConnectionsPerHost"    # I

    .prologue
    .line 193
    if-gez p1, :cond_0

    .line 194
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->minConnectionsPerHost:I

    .line 197
    return-object p0
.end method

.method public readPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 364
    if-nez p1, :cond_0

    .line 365
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null is not a legal value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 367
    :cond_0
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->readPreference:Lcom/mongodb/ReadPreference;

    .line 368
    return-object p0
.end method

.method public requiredReplicaSetName(Ljava/lang/String;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "requiredReplicaSetName"    # Ljava/lang/String;

    .prologue
    .line 467
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->requiredReplicaSetName:Ljava/lang/String;

    .line 468
    return-object p0
.end method

.method public socketFactory(Ljavax/net/SocketFactory;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "socketFactory"    # Ljavax/net/SocketFactory;

    .prologue
    .line 424
    if-nez p1, :cond_0

    .line 425
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null is not a legal value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 427
    :cond_0
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketFactory:Ljavax/net/SocketFactory;

    .line 428
    return-object p0
.end method

.method public socketKeepAlive(Z)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 0
    .param p1, "socketKeepAlive"    # Z

    .prologue
    .line 321
    iput-boolean p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketKeepAlive:Z

    .line 322
    return-object p0
.end method

.method public socketTimeout(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "socketTimeout"    # I

    .prologue
    .line 306
    if-gez p1, :cond_0

    .line 307
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 309
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->socketTimeout:I

    .line 310
    return-object p0
.end method

.method public threadsAllowedToBlockForConnectionMultiplier(I)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "threadsAllowedToBlockForConnectionMultiplier"    # I

    .prologue
    .line 226
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 227
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum value is 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_0
    iput p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->threadsAllowedToBlockForConnectionMultiplier:I

    .line 230
    return-object p0
.end method

.method public writeConcern(Lcom/mongodb/WriteConcern;)Lcom/mongodb/MongoClientOptions$Builder;
    .locals 2
    .param p1, "writeConcern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 409
    if-nez p1, :cond_0

    .line 410
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null is not a legal value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 412
    :cond_0
    iput-object p1, p0, Lcom/mongodb/MongoClientOptions$Builder;->writeConcern:Lcom/mongodb/WriteConcern;

    .line 413
    return-object p0
.end method
