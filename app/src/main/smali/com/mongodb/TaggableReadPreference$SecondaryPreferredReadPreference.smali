.class Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;
.super Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;
.source "TaggableReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/TaggableReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SecondaryPreferredReadPreference"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>()V

    .line 162
    return-void
.end method

.method varargs constructor <init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 165
    invoke-direct {p0, p1, p2}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    .line 166
    return-void
.end method


# virtual methods
.method choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 2
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    invoke-super {p0, p1}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v0

    .line 176
    .local v0, "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .end local v0    # "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    :goto_0
    return-object v0

    .restart local v0    # "servers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    :cond_0
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 170
    const-string/jumbo v0, "secondaryPreferred"

    return-object v0
.end method
