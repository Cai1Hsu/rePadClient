.class public Lcom/mongodb/AggregationOptions;
.super Ljava/lang/Object;
.source "AggregationOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/AggregationOptions$1;,
        Lcom/mongodb/AggregationOptions$Builder;,
        Lcom/mongodb/AggregationOptions$OutputMode;
    }
.end annotation


# instance fields
.field private final allowDiskUse:Ljava/lang/Boolean;

.field private final batchSize:Ljava/lang/Integer;

.field private final maxTimeMS:J

.field private final outputMode:Lcom/mongodb/AggregationOptions$OutputMode;


# direct methods
.method constructor <init>(Lcom/mongodb/AggregationOptions$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/mongodb/AggregationOptions$Builder;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-static {p1}, Lcom/mongodb/AggregationOptions$Builder;->access$000(Lcom/mongodb/AggregationOptions$Builder;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/AggregationOptions;->batchSize:Ljava/lang/Integer;

    .line 50
    invoke-static {p1}, Lcom/mongodb/AggregationOptions$Builder;->access$100(Lcom/mongodb/AggregationOptions$Builder;)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/AggregationOptions;->allowDiskUse:Ljava/lang/Boolean;

    .line 51
    invoke-static {p1}, Lcom/mongodb/AggregationOptions$Builder;->access$200(Lcom/mongodb/AggregationOptions$Builder;)Lcom/mongodb/AggregationOptions$OutputMode;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/AggregationOptions;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    .line 52
    invoke-static {p1}, Lcom/mongodb/AggregationOptions$Builder;->access$300(Lcom/mongodb/AggregationOptions$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/AggregationOptions;->maxTimeMS:J

    .line 53
    return-void
.end method

.method public static builder()Lcom/mongodb/AggregationOptions$Builder;
    .locals 2

    .prologue
    .line 106
    new-instance v0, Lcom/mongodb/AggregationOptions$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mongodb/AggregationOptions$Builder;-><init>(Lcom/mongodb/AggregationOptions$1;)V

    return-object v0
.end method


# virtual methods
.method public getAllowDiskUse()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/mongodb/AggregationOptions;->allowDiskUse:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getBatchSize()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/AggregationOptions;->batchSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMaxTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 92
    iget-wide v0, p0, Lcom/mongodb/AggregationOptions;->maxTimeMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOutputMode()Lcom/mongodb/AggregationOptions$OutputMode;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mongodb/AggregationOptions;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "AggregationOptions{batchSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/AggregationOptions;->batchSize:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", allowDiskUse="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/AggregationOptions;->allowDiskUse:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", outputMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/AggregationOptions;->outputMode:Lcom/mongodb/AggregationOptions$OutputMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxTimeMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/AggregationOptions;->maxTimeMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
