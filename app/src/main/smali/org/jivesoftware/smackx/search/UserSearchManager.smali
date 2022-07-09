.class public Lorg/jivesoftware/smackx/search/UserSearchManager;
.super Ljava/lang/Object;
.source "UserSearchManager.java"


# instance fields
.field private con:Lorg/jivesoftware/smack/Connection;

.field private userSearch:Lorg/jivesoftware/smackx/search/UserSearch;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->con:Lorg/jivesoftware/smack/Connection;

    .line 62
    new-instance v0, Lorg/jivesoftware/smackx/search/UserSearch;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/search/UserSearch;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->userSearch:Lorg/jivesoftware/smackx/search/UserSearch;

    .line 63
    return-void
.end method


# virtual methods
.method public getSearchForm(Ljava/lang/String;)Lorg/jivesoftware/smackx/Form;
    .locals 2
    .param p1, "searchService"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->userSearch:Lorg/jivesoftware/smackx/search/UserSearch;

    iget-object v1, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, v1, p1}, Lorg/jivesoftware/smackx/search/UserSearch;->getSearchForm(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)Lorg/jivesoftware/smackx/Form;

    move-result-object v0

    return-object v0
.end method

.method public getSearchResults(Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 2
    .param p1, "searchForm"    # Lorg/jivesoftware/smackx/Form;
    .param p2, "searchService"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->userSearch:Lorg/jivesoftware/smackx/search/UserSearch;

    iget-object v1, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, v1, p1, p2}, Lorg/jivesoftware/smackx/search/UserSearch;->sendSearchForm(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/Form;Ljava/lang/String;)Lorg/jivesoftware/smackx/ReportedData;

    move-result-object v0

    return-object v0
.end method

.method public getSearchServices()Ljava/util/Collection;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .local v6, "searchServices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v7, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-static {v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    .line 99
    .local v0, "discoManager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    iget-object v7, p0, Lorg/jivesoftware/smackx/search/UserSearchManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverItems(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverItems;

    move-result-object v4

    .line 100
    .local v4, "items":Lorg/jivesoftware/smackx/packet/DiscoverItems;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DiscoverItems;->getItems()Ljava/util/Iterator;

    move-result-object v5

    .line 101
    .local v5, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;>;"
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 102
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;

    .line 106
    .local v3, "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :try_start_0
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 113
    .local v2, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :try_start_1
    const-string/jumbo v7, "jabber:iq:search"

    invoke-virtual {v2, v7}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 114
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;->getEntityID()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 117
    .end local v2    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :catch_0
    move-exception v1

    .line 122
    .end local v3    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :cond_1
    return-object v6

    .line 108
    .restart local v3    # "item":Lorg/jivesoftware/smackx/packet/DiscoverItems$Item;
    :catch_1
    move-exception v1

    .local v1, "e":Lorg/jivesoftware/smack/XMPPException;
    goto :goto_0
.end method
