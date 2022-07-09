.class Lcom/mongodb/ConnectionPoolSettings$Builder;
.super Ljava/lang/Object;
.source "ConnectionPoolSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ConnectionPoolSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private maintenanceFrequencyMS:J

.field private maintenanceInitialDelayMS:J

.field private maxConnectionIdleTimeMS:J

.field private maxConnectionLifeTimeMS:J

.field private maxSize:I

.field private maxWaitQueueSize:I

.field private maxWaitTimeMS:J

.field private minSize:I


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x3c

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maintenanceFrequencyMS:J

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/ConnectionPoolSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxSize:I

    return v0
.end method

.method static synthetic access$100(Lcom/mongodb/ConnectionPoolSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->minSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/ConnectionPoolSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitQueueSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/mongodb/ConnectionPoolSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionLifeTimeMS:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/mongodb/ConnectionPoolSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionIdleTimeMS:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/mongodb/ConnectionPoolSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maintenanceFrequencyMS:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/mongodb/ConnectionPoolSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitTimeMS:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/mongodb/ConnectionPoolSettings$Builder;)J
    .locals 2
    .param p0, "x0"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    .line 39
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maintenanceInitialDelayMS:J

    return-wide v0
.end method


# virtual methods
.method public build()Lcom/mongodb/ConnectionPoolSettings;
    .locals 1

    .prologue
    .line 92
    new-instance v0, Lcom/mongodb/ConnectionPoolSettings;

    invoke-direct {v0, p0}, Lcom/mongodb/ConnectionPoolSettings;-><init>(Lcom/mongodb/ConnectionPoolSettings$Builder;)V

    return-object v0
.end method

.method public maintenanceFrequency(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 3
    .param p1, "maintenanceFrequency"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 86
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maintenanceFrequencyMS:J

    .line 87
    return-object p0
.end method

.method public maintenanceInitialDelay(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 3
    .param p1, "maintenanceInitialDelay"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 81
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maintenanceInitialDelayMS:J

    .line 82
    return-object p0
.end method

.method public maxConnectionIdleTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 3
    .param p1, "maxConnectionIdleTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 76
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionIdleTimeMS:J

    .line 77
    return-object p0
.end method

.method public maxConnectionLifeTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 3
    .param p1, "maxConnectionLifeTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 71
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxConnectionLifeTimeMS:J

    .line 72
    return-object p0
.end method

.method public maxSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 0
    .param p1, "maxSize"    # I

    .prologue
    .line 51
    iput p1, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxSize:I

    .line 52
    return-object p0
.end method

.method public maxWaitQueueSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 0
    .param p1, "maxWaitQueueSize"    # I

    .prologue
    .line 61
    iput p1, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitQueueSize:I

    .line 62
    return-object p0
.end method

.method public maxWaitTime(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 3
    .param p1, "maxWaitTime"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 66
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->maxWaitTimeMS:J

    .line 67
    return-object p0
.end method

.method public minSize(I)Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 0
    .param p1, "minSize"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/mongodb/ConnectionPoolSettings$Builder;->minSize:I

    .line 57
    return-object p0
.end method
