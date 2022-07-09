.class final Lcom/mongodb/ClusterSettings;
.super Ljava/lang/Object;
.source "ClusterSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ClusterSettings$1;,
        Lcom/mongodb/ClusterSettings$Builder;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field private final hosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation
.end field

.field private final mode:Lcom/mongodb/ClusterConnectionMode;

.field private final requiredClusterType:Lcom/mongodb/ClusterType;

.field private final requiredReplicaSetName:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/mongodb/ClusterSettings$Builder;)V
    .locals 3
    .param p1, "builder"    # Lcom/mongodb/ClusterSettings$Builder;

    .prologue
    const/4 v1, 0x1

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 208
    const-string/jumbo v0, "hosts"

    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    const-string/jumbo v2, "hosts size > 0"

    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v2, v0}, Lorg/bson/util/Assertions;->isTrueArgument(Ljava/lang/String;Z)V

    .line 211
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_1

    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$300(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v2, Lcom/mongodb/ClusterType;->StandAlone:Lcom/mongodb/ClusterType;

    if-ne v0, v2, :cond_1

    .line 212
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Multiple hosts cannot be specified when using ClusterType.StandAlone."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 215
    :cond_1
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$400(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterConnectionMode;

    move-result-object v0

    sget-object v2, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    if-ne v0, v2, :cond_2

    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v1, :cond_2

    .line 216
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can not directly connect to more than one server"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_2
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$500(Lcom/mongodb/ClusterSettings$Builder;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 220
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$300(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    if-ne v0, v1, :cond_4

    .line 221
    sget-object v0, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    invoke-static {p1, v0}, Lcom/mongodb/ClusterSettings$Builder;->access$302(Lcom/mongodb/ClusterSettings$Builder;Lcom/mongodb/ClusterType;)Lcom/mongodb/ClusterType;

    .line 229
    :cond_3
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    .line 230
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$400(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterConnectionMode;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    .line 231
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$500(Lcom/mongodb/ClusterSettings$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    .line 232
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$300(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterType;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    .line 233
    return-void

    .line 223
    :cond_4
    invoke-static {p1}, Lcom/mongodb/ClusterSettings$Builder;->access$300(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterType;

    move-result-object v0

    sget-object v1, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    if-eq v0, v1, :cond_3

    .line 224
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "When specifying a replica set name, only ClusterType.Unknown and ClusterType.ReplicaSet are valid."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method synthetic constructor <init>(Lcom/mongodb/ClusterSettings$Builder;Lcom/mongodb/ClusterSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/ClusterSettings$Builder;
    .param p2, "x1"    # Lcom/mongodb/ClusterSettings$1;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/mongodb/ClusterSettings;-><init>(Lcom/mongodb/ClusterSettings$Builder;)V

    return-void
.end method

.method public static builder()Lcom/mongodb/ClusterSettings$Builder;
    .locals 2

    .prologue
    .line 40
    new-instance v0, Lcom/mongodb/ClusterSettings$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/mongodb/ClusterSettings$Builder;-><init>(Lcom/mongodb/ClusterSettings$1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 154
    if-ne p0, p1, :cond_1

    .line 176
    :cond_0
    :goto_0
    return v1

    .line 157
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 158
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 161
    check-cast v0, Lcom/mongodb/ClusterSettings;

    .line 163
    .local v0, "that":Lcom/mongodb/ClusterSettings;
    iget-object v3, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    iget-object v4, v0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 164
    goto :goto_0

    .line 166
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    iget-object v4, v0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 167
    goto :goto_0

    .line 169
    :cond_5
    iget-object v3, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    iget-object v4, v0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 170
    goto :goto_0

    .line 172
    :cond_6
    iget-object v3, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 174
    goto :goto_0

    .line 172
    :cond_7
    iget-object v3, v0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getHosts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    return-object v0
.end method

.method public getMode()Lcom/mongodb/ClusterConnectionMode;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    return-object v0
.end method

.method public getRequiredClusterType()Lcom/mongodb/ClusterType;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    return-object v0
.end method

.method public getRequiredReplicaSetName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    return-object v0
.end method

.method public getShortDescription()Ljava/lang/String;
    .locals 3

    .prologue
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{hosts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requiredClusterType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, ", requiredReplicaSetName=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v2, 0x27

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 181
    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v0

    .line 182
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v2}, Lcom/mongodb/ClusterConnectionMode;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 183
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    invoke-virtual {v2}, Lcom/mongodb/ClusterType;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 184
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 185
    return v0

    .line 184
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{hosts="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->hosts:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", mode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->mode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requiredClusterType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->requiredClusterType:Lcom/mongodb/ClusterType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", requiredReplicaSetName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterSettings;->requiredReplicaSetName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
