.class Lcom/mongodb/ClusterDescription;
.super Ljava/lang/Object;
.source "ClusterDescription.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ClusterDescription$Predicate;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# instance fields
.field private final all:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation
.end field

.field private final connectionMode:Lcom/mongodb/ClusterConnectionMode;

.field private final type:Lcom/mongodb/ClusterType;


# direct methods
.method public constructor <init>(Lcom/mongodb/ClusterConnectionMode;Lcom/mongodb/ClusterType;Ljava/util/List;)V
    .locals 2
    .param p1, "connectionMode"    # Lcom/mongodb/ClusterConnectionMode;
    .param p2, "type"    # Lcom/mongodb/ClusterType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterConnectionMode;",
            "Lcom/mongodb/ClusterType;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p3, "serverDescriptions":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string/jumbo v1, "all"

    invoke-static {v1, p3}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    const-string/jumbo v1, "connectionMode"

    invoke-static {v1, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ClusterConnectionMode;

    iput-object v1, p0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    .line 45
    const-string/jumbo v1, "type"

    invoke-static {v1, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ClusterType;

    iput-object v1, p0, Lcom/mongodb/ClusterDescription;->type:Lcom/mongodb/ClusterType;

    .line 46
    new-instance v0, Ljava/util/TreeSet;

    new-instance v1, Lcom/mongodb/ClusterDescription$1;

    invoke-direct {v1, p0}, Lcom/mongodb/ClusterDescription$1;-><init>(Lcom/mongodb/ClusterDescription;)V

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 51
    .local v0, "serverDescriptionSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0, p3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 52
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    .line 53
    return-void
.end method

.method private getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;
    .locals 4
    .param p1, "predicate"    # Lcom/mongodb/ClusterDescription$Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription$Predicate;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v2, "membersByTag":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    iget-object v3, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 206
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-interface {p1, v0}, Lcom/mongodb/ClusterDescription$Predicate;->apply(Lcom/mongodb/ServerDescription;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 207
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 211
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :cond_1
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 152
    if-ne p0, p1, :cond_1

    .line 168
    :cond_0
    :goto_0
    return v1

    .line 155
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 156
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 159
    check-cast v0, Lcom/mongodb/ClusterDescription;

    .line 161
    .local v0, "that":Lcom/mongodb/ClusterDescription;
    iget-object v3, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    iget-object v4, v0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 162
    goto :goto_0

    .line 164
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    iget-object v4, v0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 165
    goto :goto_0
.end method

.method public getAll()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    return-object v0
.end method

.method public getAny()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lcom/mongodb/ClusterDescription$5;

    invoke-direct {v0, p0}, Lcom/mongodb/ClusterDescription$5;-><init>(Lcom/mongodb/ClusterDescription;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnyPrimaryOrSecondary()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    new-instance v0, Lcom/mongodb/ClusterDescription$6;

    invoke-direct {v0, p0}, Lcom/mongodb/ClusterDescription$6;-><init>(Lcom/mongodb/ClusterDescription;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnyPrimaryOrSecondary(Lcom/mongodb/Tags;)Ljava/util/List;
    .locals 1
    .param p1, "tags"    # Lcom/mongodb/Tags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/Tags;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lcom/mongodb/ClusterDescription$7;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/ClusterDescription$7;-><init>(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getByServerAddress(Lcom/mongodb/ServerAddress;)Lcom/mongodb/ServerDescription;
    .locals 3
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/mongodb/ClusterDescription;->getAll()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 89
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/mongodb/ServerAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 93
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getConnectionMode()Lcom/mongodb/ClusterConnectionMode;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    return-object v0
.end method

.method public getPrimaries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Lcom/mongodb/ClusterDescription$2;

    invoke-direct {v0, p0}, Lcom/mongodb/ClusterDescription$2;-><init>(Lcom/mongodb/ClusterDescription;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSecondaries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Lcom/mongodb/ClusterDescription$3;

    invoke-direct {v0, p0}, Lcom/mongodb/ClusterDescription$3;-><init>(Lcom/mongodb/ClusterDescription;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSecondaries(Lcom/mongodb/Tags;)Ljava/util/List;
    .locals 1
    .param p1, "tags"    # Lcom/mongodb/Tags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/Tags;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Lcom/mongodb/ClusterDescription$4;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/ClusterDescription$4;-><init>(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)V

    invoke-direct {p0, v0}, Lcom/mongodb/ClusterDescription;->getServersByPredicate(Lcom/mongodb/ClusterDescription$Predicate;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getShortDescription()Ljava/lang/String;
    .locals 8

    .prologue
    .line 188
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v3, "serverDescriptions":Ljava/lang/StringBuilder;
    const-string/jumbo v1, ""

    .line 190
    .local v1, "delimiter":Ljava/lang/String;
    iget-object v4, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 191
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->getShortDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    const-string/jumbo v1, ", "

    .line 193
    goto :goto_0

    .line 194
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :cond_0
    const-string/jumbo v4, "{type=%s, servers=[%s]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/mongodb/ClusterDescription;->type:Lcom/mongodb/ClusterType;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getType()Lcom/mongodb/ClusterType;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/mongodb/ClusterDescription;->type:Lcom/mongodb/ClusterType;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 173
    iget-object v1, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->hashCode()I

    move-result v0

    .line 174
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v2}, Lcom/mongodb/ClusterConnectionMode;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 175
    return v0
.end method

.method public isCompatibleWithDriver()Z
    .locals 3

    .prologue
    .line 61
    iget-object v2, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerDescription;

    .line 62
    .local v0, "cur":Lcom/mongodb/ServerDescription;
    invoke-virtual {v0}, Lcom/mongodb/ServerDescription;->isCompatibleWithDriver()Z

    move-result v2

    if-nez v2, :cond_0

    .line 63
    const/4 v2, 0x0

    .line 66
    .end local v0    # "cur":Lcom/mongodb/ServerDescription;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ClusterDescription{type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/ClusterDescription;->getType()Lcom/mongodb/ClusterType;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connectionMode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterDescription;->connectionMode:Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", all="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ClusterDescription;->all:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
