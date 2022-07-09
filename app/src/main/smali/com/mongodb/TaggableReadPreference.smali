.class public abstract Lcom/mongodb/TaggableReadPreference;
.super Lcom/mongodb/ReadPreference;
.source "TaggableReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/TaggableReadPreference$PrimaryPreferredReadPreference;,
        Lcom/mongodb/TaggableReadPreference$NearestReadPreference;,
        Lcom/mongodb/TaggableReadPreference$SecondaryPreferredReadPreference;,
        Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;
    }
.end annotation


# static fields
.field private static final EMPTY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final _tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mongodb/TaggableReadPreference;->EMPTY:Ljava/util/List;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/mongodb/ReadPreference;-><init>()V

    .line 32
    sget-object v0, Lcom/mongodb/TaggableReadPreference;->EMPTY:Ljava/util/List;

    iput-object v0, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    .line 33
    return-void
.end method

.method varargs constructor <init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V
    .locals 2
    .param p1, "firstTagSet"    # Lcom/mongodb/DBObject;
    .param p2, "remainingTagSets"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/mongodb/ReadPreference;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Must have at least one tag set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    .line 40
    iget-object v0, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    iget-object v0, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-static {v0, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 42
    return-void
.end method

.method private static getTagsFromDBObject(Lcom/mongodb/DBObject;)Lcom/mongodb/Tags;
    .locals 4
    .param p0, "curTagSet"    # Lcom/mongodb/DBObject;

    .prologue
    .line 117
    new-instance v2, Lcom/mongodb/Tags;

    invoke-direct {v2}, Lcom/mongodb/Tags;-><init>()V

    .line 118
    .local v2, "tags":Lcom/mongodb/Tags;
    invoke-interface {p0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 119
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/mongodb/Tags;->append(Ljava/lang/String;Ljava/lang/String;)Lcom/mongodb/Tags;

    goto :goto_0

    .line 121
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
.end method


# virtual methods
.method choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
    .locals 5
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
    .line 94
    iget-object v4, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 95
    invoke-virtual {p0, p1}, Lcom/mongodb/TaggableReadPreference;->getServers(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v2

    .line 104
    :goto_0
    return-object v2

    .line 97
    :cond_0
    iget-object v4, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    .line 98
    .local v0, "curTagSet":Lcom/mongodb/DBObject;
    invoke-static {v0}, Lcom/mongodb/TaggableReadPreference;->getTagsFromDBObject(Lcom/mongodb/DBObject;)Lcom/mongodb/Tags;

    move-result-object v3

    .line 99
    .local v3, "tags":Lcom/mongodb/Tags;
    invoke-virtual {p0, p1, v3}, Lcom/mongodb/TaggableReadPreference;->getServersForTags(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)Ljava/util/List;

    move-result-object v2

    .line 100
    .local v2, "taggedServers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    goto :goto_0

    .line 104
    .end local v0    # "curTagSet":Lcom/mongodb/DBObject;
    .end local v2    # "taggedServers":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerDescription;>;"
    .end local v3    # "tags":Lcom/mongodb/Tags;
    :cond_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 75
    if-ne p0, p1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return v1

    .line 76
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 78
    check-cast v0, Lcom/mongodb/TaggableReadPreference;

    .line 80
    .local v0, "that":Lcom/mongodb/TaggableReadPreference;
    iget-object v3, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    iget-object v4, v0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method abstract getServers(Lcom/mongodb/ClusterDescription;)Ljava/util/List;
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
.end method

.method abstract getServersForTags(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)Ljava/util/List;
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
.end method

.method public getTagSets()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v2, "tags":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    iget-object v3, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    .line 63
    .local v1, "tagSet":Lcom/mongodb/DBObject;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 65
    .end local v1    # "tagSet":Lcom/mongodb/DBObject;
    :cond_0
    return-object v2
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 87
    iget-object v1, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v0

    .line 88
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lcom/mongodb/TaggableReadPreference;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 89
    return v0
.end method

.method public isSlaveOk()Z
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method printTags()Ljava/lang/String;
    .locals 4

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "tags"

    iget-object v3, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public toDBObject()Lcom/mongodb/DBObject;
    .locals 3

    .prologue
    .line 51
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "mode"

    invoke-virtual {p0}, Lcom/mongodb/TaggableReadPreference;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 53
    .local v0, "readPrefObject":Lcom/mongodb/DBObject;
    iget-object v1, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 54
    const-string/jumbo v1, "tags"

    iget-object v2, p0, Lcom/mongodb/TaggableReadPreference;->_tags:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mongodb/TaggableReadPreference;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/TaggableReadPreference;->printTags()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
