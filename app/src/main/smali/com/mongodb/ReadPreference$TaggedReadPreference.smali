.class public Lcom/mongodb/ReadPreference$TaggedReadPreference;
.super Lcom/mongodb/ReadPreference;
.source "ReadPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ReadPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaggedReadPreference"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final _pref:Lcom/mongodb/ReadPreference;

.field private final _tags:Lcom/mongodb/DBObject;


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;)V
    .locals 4
    .param p1, "tags"    # Lcom/mongodb/DBObject;

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/mongodb/ReadPreference;-><init>()V

    .line 119
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 120
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "tags can not be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :cond_1
    iput-object p1, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    .line 123
    iget-object v1, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    invoke-static {v1}, Lcom/mongodb/ReadPreference$TaggedReadPreference;->splitMapIntoMultipleMaps(Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    .line 124
    .local v0, "maps":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    new-instance v2, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    invoke-direct {p0, v0}, Lcom/mongodb/ReadPreference$TaggedReadPreference;->getRemainingMaps(Ljava/util/List;)[Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    iput-object v2, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/mongodb/ReadPreference;-><init>()V

    .line 109
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 110
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "tags can not be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_1
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/util/Map;)V

    iput-object v1, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    .line 113
    iget-object v1, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    invoke-static {v1}, Lcom/mongodb/ReadPreference$TaggedReadPreference;->splitMapIntoMultipleMaps(Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    .line 114
    .local v0, "maps":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    new-instance v2, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    invoke-direct {p0, v0}, Lcom/mongodb/ReadPreference$TaggedReadPreference;->getRemainingMaps(Ljava/util/List;)[Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/mongodb/TaggableReadPreference$SecondaryReadPreference;-><init>(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)V

    iput-object v2, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    .line 116
    return-void
.end method

.method private getRemainingMaps(Ljava/util/List;)[Lcom/mongodb/DBObject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)[",
            "Lcom/mongodb/DBObject;"
        }
    .end annotation

    .prologue
    .local p1, "maps":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    const/4 v1, 0x1

    .line 165
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v1, :cond_0

    .line 166
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/mongodb/DBObject;

    .line 168
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p1, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    new-array v1, v1, [Lcom/mongodb/DBObject;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/DBObject;

    goto :goto_0
.end method

.method private static splitMapIntoMultipleMaps(Lcom/mongodb/DBObject;)Ljava/util/List;
    .locals 5
    .param p0, "tags"    # Lcom/mongodb/DBObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/DBObject;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 158
    .local v2, "tagList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
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

    .line 159
    .local v1, "key":Ljava/lang/String;
    new-instance v3, Lcom/mongodb/BasicDBObject;

    invoke-interface {p0, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 161
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
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
    .line 142
    iget-object v0, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0, p1}, Lcom/mongodb/ReadPreference;->choose(Lcom/mongodb/ClusterDescription;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTags()Lcom/mongodb/DBObject;
    .locals 4

    .prologue
    .line 128
    new-instance v2, Lcom/mongodb/BasicDBObject;

    invoke-direct {v2}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 129
    .local v2, "tags":Lcom/mongodb/DBObject;
    iget-object v3, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    invoke-interface {v3}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

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

    .line 130
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_tags:Lcom/mongodb/DBObject;

    invoke-interface {v3, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 132
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method public isSlaveOk()Z
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->isSlaveOk()Z

    move-result v0

    return v0
.end method

.method public toDBObject()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/mongodb/ReadPreference$TaggedReadPreference;->_pref:Lcom/mongodb/ReadPreference;

    invoke-virtual {v0}, Lcom/mongodb/ReadPreference;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method
