.class Lcom/mongodb/ReadPreferenceServerSelector;
.super Ljava/lang/Object;
.source "ReadPreferenceServerSelector.java"

# interfaces
.implements Lcom/mongodb/ServerSelector;


# instance fields
.field private final readPreference:Lcom/mongodb/ReadPreference;


# direct methods
.method public constructor <init>(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "readPreference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/mongodb/ReadPreferenceServerSelector;->readPreference:Lcom/mongodb/ReadPreference;

    .line 26
    return-void
.end method


# virtual methods
.method public choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
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
    .line 35
    iget-object v0, p0, Lcom/mongodb/ReadPreferenceServerSelector;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0, p1}, Lcom/mongodb/ReadPreference;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mongodb/ReadPreferenceServerSelector;->readPreference:Lcom/mongodb/ReadPreference;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ReadPreferenceServerSelector{readPreference="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ReadPreferenceServerSelector;->readPreference:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
