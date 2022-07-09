.class Lcom/mongodb/ServerSettings;
.super Ljava/lang/Object;
.source "ServerSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ServerSettings$Builder;
    }
.end annotation


# instance fields
.field private final heartbeatConnectRetryFrequencyMS:J

.field private final heartbeatFrequencyMS:J

.field private final heartbeatSocketSettings:Lcom/mongodb/SocketSettings;


# direct methods
.method constructor <init>(Lcom/mongodb/ServerSettings$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/mongodb/ServerSettings$Builder;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-static {p1}, Lcom/mongodb/ServerSettings$Builder;->access$000(Lcom/mongodb/ServerSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerSettings;->heartbeatFrequencyMS:J

    .line 71
    invoke-static {p1}, Lcom/mongodb/ServerSettings$Builder;->access$100(Lcom/mongodb/ServerSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ServerSettings;->heartbeatConnectRetryFrequencyMS:J

    .line 72
    invoke-static {p1}, Lcom/mongodb/ServerSettings$Builder;->access$200(Lcom/mongodb/ServerSettings$Builder;)Lcom/mongodb/SocketSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ServerSettings;->heartbeatSocketSettings:Lcom/mongodb/SocketSettings;

    .line 73
    return-void
.end method

.method public static builder()Lcom/mongodb/ServerSettings$Builder;
    .locals 1

    .prologue
    .line 29
    new-instance v0, Lcom/mongodb/ServerSettings$Builder;

    invoke-direct {v0}, Lcom/mongodb/ServerSettings$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getHeartbeatConnectRetryFrequency(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/mongodb/ServerSettings;->heartbeatConnectRetryFrequencyMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeartbeatFrequency(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 58
    iget-wide v0, p0, Lcom/mongodb/ServerSettings;->heartbeatFrequencyMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeartbeatSocketSettings()Lcom/mongodb/SocketSettings;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mongodb/ServerSettings;->heartbeatSocketSettings:Lcom/mongodb/SocketSettings;

    return-object v0
.end method
