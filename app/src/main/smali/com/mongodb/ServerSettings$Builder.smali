.class Lcom/mongodb/ServerSettings$Builder;
.super Ljava/lang/Object;
.source "ServerSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ServerSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private heartbeatConnectRetryFrequencyMS:J

.field private heartbeatFrequencyMS:J

.field private heartbeatSocketSettings:Lcom/mongodb/SocketSettings;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-wide/16 v0, 0x1388

    iput-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatFrequencyMS:J

    .line 34
    const-wide/16 v0, 0xa

    iput-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatConnectRetryFrequencyMS:J

    .line 35
    invoke-static {}, Lcom/mongodb/SocketSettings;->builder()Lcom/mongodb/SocketSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/SocketSettings$Builder;->build()Lcom/mongodb/SocketSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatSocketSettings:Lcom/mongodb/SocketSettings;

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/ServerSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ServerSettings$Builder;

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatFrequencyMS:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/mongodb/ServerSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ServerSettings$Builder;

    .prologue
    .line 32
    iget-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatConnectRetryFrequencyMS:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/mongodb/ServerSettings$Builder;)Lcom/mongodb/SocketSettings;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ServerSettings$Builder;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatSocketSettings:Lcom/mongodb/SocketSettings;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/mongodb/ServerSettings;
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/mongodb/ServerSettings;

    invoke-direct {v0, p0}, Lcom/mongodb/ServerSettings;-><init>(Lcom/mongodb/ServerSettings$Builder;)V

    return-object v0
.end method

.method public heartbeatConnectRetryFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;
    .locals 3
    .param p1, "heartbeatConnectRetryFrequency"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 43
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatConnectRetryFrequencyMS:J

    .line 44
    return-object p0
.end method

.method public heartbeatFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ServerSettings$Builder;
    .locals 3
    .param p1, "heartbeatFrequency"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 38
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatFrequencyMS:J

    .line 39
    return-object p0
.end method

.method public heartbeatSocketSettings(Lcom/mongodb/SocketSettings;)Lcom/mongodb/ServerSettings$Builder;
    .locals 1
    .param p1, "heartbeatSocketSettings"    # Lcom/mongodb/SocketSettings;

    .prologue
    .line 48
    const-string/jumbo v0, "heartbeatSocketSettings"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/SocketSettings;

    iput-object v0, p0, Lcom/mongodb/ServerSettings$Builder;->heartbeatSocketSettings:Lcom/mongodb/SocketSettings;

    .line 49
    return-object p0
.end method
