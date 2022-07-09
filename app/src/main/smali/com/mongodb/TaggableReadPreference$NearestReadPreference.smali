.class Lcom/mongodb/TaggableReadPreference$NearestReadPreference;
.super Lcom/mongodb/TaggableReadPreference;
.source "TaggableReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/TaggableReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NearestReadPreference"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 186
    invoke-direct {p0}, Lcom/mongodb/TaggableReadPreference;-><init>()V

    .line 187
    return-void
.end method

.method varargs constructor <init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V
    .locals 0
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 190
    invoke-direct {p0, p1, p2}, Lcom/mongodb/TaggableReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    .line 191
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    const-string/jumbo v0, "nearest"

    return-object v0
.end method

.method getServers(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 1
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
    .line 201
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getAnyPrimaryOrSecondary()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getServersForTags(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)Ljava/util/List;
    .locals 1
    .param p1, "clusterDescription"    # Lcom/mongodb/ClusterDescription;
    .param p2, "tags"    # Lcom/mongodb/Tags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ClusterDescription;",
            "Lcom/mongodb/Tags;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    invoke-virtual {p1, p2}, Lcom/mongodb/ClusterDescription;->getAnyPrimaryOrSecondary(Lcom/mongodb/Tags;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
