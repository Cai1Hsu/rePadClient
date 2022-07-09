.class Lcom/mongodb/ReadPreference$PrimaryReadPreference;
.super Lcom/mongodb/ReadPreference;
.source "ReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PrimaryReadPreference"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/mongodb/ReadPreference;-><init>()V

    .line 61
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/ReadPreference$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/ReadPreference$1;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/mongodb/ReadPreference$PrimaryReadPreference;-><init>()V

    return-void
.end method


# virtual methods
.method choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
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
    .line 85
    invoke-virtual {p1}, Lcom/mongodb/ClusterDescription;->getPrimaries()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 75
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    const-string/jumbo v0, "primary"

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/mongodb/ReadPreference$PrimaryReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public isSlaveOk()Z
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public toDBObject()Lcom/mongodb/DBObject;
    .locals 3

    .prologue
    .line 90
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "mode"

    invoke-virtual {p0}, Lcom/mongodb/ReadPreference$PrimaryReadPreference;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/mongodb/ReadPreference$PrimaryReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
