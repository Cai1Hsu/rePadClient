.class Lcom/mongodb/ConnectionPoolSettings;
.super Ljava/lang/Object;
.source "ConnectionPoolSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ConnectionPoolSettings$Builder;
    }
.end annotation


# instance fields
.field private final maintenanceFrequencyMS:J

.field private final maintenanceInitialDelayMS:J

.field private final maxConnectionIdleTimeMS:J

.field private final maxConnectionLifeTimeMS:J

.field private final maxSize:I

.field private final maxWaitQueueSize:I

.field private final maxWaitTimeMS:J

.field private final minSize:I


# direct methods
.method constructor <init>(Lcom/mongodb/ConnectionPoolSettings$Builder;)V
    .locals 8
    .param p1, "builder"    # Lcom/mongodb/ConnectionPoolSettings$Builder;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    const-string/jumbo v3, "maxSize > 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$000(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 196
    const-string/jumbo v3, "minSize >= 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$100(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    if-ltz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 197
    const-string/jumbo v3, "maxWaitQueueSize >= 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$200(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    if-ltz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 198
    const-string/jumbo v3, "maxConnectionLifeTime >= 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$300(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-ltz v0, :cond_3

    move v0, v1

    :goto_3
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 199
    const-string/jumbo v3, "maxConnectionIdleTime >= 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$400(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-ltz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 200
    const-string/jumbo v3, "sizeMaintenanceFrequency >= 0"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$500(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-ltz v0, :cond_5

    move v0, v1

    :goto_5
    invoke-static {v3, v0}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 201
    const-string/jumbo v0, "maxSize >= minSize"

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$000(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v3

    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$100(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v4

    if-lt v3, v4, :cond_6

    :goto_6
    invoke-static {v0, v1}, Lorg/bson/util/Assertions;->isTrue(Ljava/lang/String;Z)V

    .line 203
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$000(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    .line 204
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$100(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    .line 205
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$200(Lcom/mongodb/ConnectionPoolSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    .line 206
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$600(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    .line 207
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$300(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    .line 208
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$400(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    .line 209
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$700(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    .line 210
    invoke-static {p1}, Lcom/mongodb/ConnectionPoolSettings$Builder;->access$500(Lcom/mongodb/ConnectionPoolSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    .line 211
    return-void

    :cond_0
    move v0, v2

    .line 195
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 196
    goto/16 :goto_1

    :cond_2
    move v0, v2

    .line 197
    goto :goto_2

    :cond_3
    move v0, v2

    .line 198
    goto :goto_3

    :cond_4
    move v0, v2

    .line 199
    goto :goto_4

    :cond_5
    move v0, v2

    .line 200
    goto :goto_5

    :cond_6
    move v1, v2

    .line 201
    goto :goto_6
.end method

.method public static builder()Lcom/mongodb/ConnectionPoolSettings$Builder;
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lcom/mongodb/ConnectionPoolSettings$Builder;

    invoke-direct {v0}, Lcom/mongodb/ConnectionPoolSettings$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 130
    if-ne p0, p1, :cond_1

    .line 164
    :cond_0
    :goto_0
    return v1

    .line 133
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 134
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 137
    check-cast v0, Lcom/mongodb/ConnectionPoolSettings;

    .line 139
    .local v0, "that":Lcom/mongodb/ConnectionPoolSettings;
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_4

    move v1, v2

    .line 140
    goto :goto_0

    .line 142
    :cond_4
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_5

    move v1, v2

    .line 143
    goto :goto_0

    .line 145
    :cond_5
    iget v3, p0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    iget v4, v0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 146
    goto :goto_0

    .line 148
    :cond_6
    iget v3, p0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    iget v4, v0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 149
    goto :goto_0

    .line 151
    :cond_7
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_8

    move v1, v2

    .line 152
    goto :goto_0

    .line 154
    :cond_8
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_9

    move v1, v2

    .line 155
    goto :goto_0

    .line 157
    :cond_9
    iget v3, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    iget v4, v0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    if-eq v3, v4, :cond_a

    move v1, v2

    .line 158
    goto :goto_0

    .line 160
    :cond_a
    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    iget-wide v6, v0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    move v1, v2

    .line 161
    goto :goto_0
.end method

.method public getMaintenanceFrequency(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 125
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaintenanceInitialDelay(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 121
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxConnectionIdleTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 117
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxConnectionLifeTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 113
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxSize()I
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    return v0
.end method

.method public getMaxWaitQueueSize()I
    .locals 1

    .prologue
    .line 105
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    return v0
.end method

.method public getMaxWaitTime(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getMinSize()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    return v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    .line 169
    iget v0, p0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    .line 170
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    add-int v0, v1, v2

    .line 171
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    add-int v0, v1, v2

    .line 172
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 173
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 174
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 175
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 176
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    iget-wide v4, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 177
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ConnectionPoolSettings{maxSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ConnectionPoolSettings;->maxSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", minSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ConnectionPoolSettings;->minSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxWaitQueueSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitQueueSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxWaitTimeMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxWaitTimeMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxConnectionLifeTimeMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionLifeTimeMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maxConnectionIdleTimeMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maxConnectionIdleTimeMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maintenanceInitialDelayMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceInitialDelayMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", maintenanceFrequencyMS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/mongodb/ConnectionPoolSettings;->maintenanceFrequencyMS:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
