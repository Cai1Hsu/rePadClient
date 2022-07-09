.class public Lorg/jivesoftware/smack/util/DNSUtil;
.super Ljava/lang/Object;
.source "DNSUtil.java"


# static fields
.field private static cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;>;"
        }
    .end annotation
.end field

.field private static dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 45
    new-instance v0, Lorg/jivesoftware/smack/util/Cache;

    const/16 v1, 0x64

    const-wide/32 v2, 0x927c0

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smack/util/Cache;-><init>(IJ)V

    sput-object v0, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    .line 47
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bisect([ID)I
    .locals 9
    .param p0, "array"    # [I
    .param p1, "value"    # D

    .prologue
    .line 228
    const/4 v4, 0x0

    .line 229
    .local v4, "pos":I
    move-object v0, p0

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget v1, v0, v2

    .line 230
    .local v1, "element":I
    int-to-double v6, v1

    cmpg-double v5, p1, v6

    if-gez v5, :cond_1

    .line 234
    .end local v1    # "element":I
    :cond_0
    return v4

    .line 232
    .restart local v1    # "element":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 229
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static getDNSResolver()Lorg/jivesoftware/smack/util/dns/DNSResolver;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    return-object v0
.end method

.method private static resolveDomain(Ljava/lang/String;C)Ljava/util/List;
    .locals 8
    .param p0, "domain"    # Ljava/lang/String;
    .param p1, "keyPrefix"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "C)",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 123
    .local v2, "key":Ljava/lang/String;
    sget-object v6, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v6, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 124
    sget-object v6, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 125
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 152
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    .local v1, "addresses":Ljava/lang/Object;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    :goto_0
    return-object v1

    .line 130
    .end local v1    # "addresses":Ljava/lang/Object;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .restart local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    const/16 v6, 0x73

    if-ne p1, v6, :cond_2

    .line 135
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "_xmpp-server._tcp."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 141
    .local v4, "srvDomain":Ljava/lang/String;
    :goto_1
    sget-object v6, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    invoke-interface {v6, v4}, Lorg/jivesoftware/smack/util/dns/DNSResolver;->lookupSRVRecords(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 142
    .local v5, "srvRecords":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    invoke-static {v5}, Lorg/jivesoftware/smack/util/DNSUtil;->sortSRVRecords(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 143
    .local v3, "sortedRecords":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    if-eqz v3, :cond_1

    .line 144
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 147
    :cond_1
    new-instance v6, Lorg/jivesoftware/smack/util/dns/HostAddress;

    invoke-direct {v6, p0}, Lorg/jivesoftware/smack/util/dns/HostAddress;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    sget-object v6, Lorg/jivesoftware/smack/util/DNSUtil;->cache:Ljava/util/Map;

    invoke-interface {v6, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 152
    .restart local v1    # "addresses":Ljava/lang/Object;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    goto :goto_0

    .line 136
    .end local v1    # "addresses":Ljava/lang/Object;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    .end local v3    # "sortedRecords":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    .end local v4    # "srvDomain":Ljava/lang/String;
    .end local v5    # "srvRecords":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    :cond_2
    const/16 v6, 0x63

    if-ne p1, v6, :cond_3

    .line 137
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "_xmpp-client._tcp."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "srvDomain":Ljava/lang/String;
    goto :goto_1

    .line 139
    .end local v4    # "srvDomain":Ljava/lang/String;
    :cond_3
    move-object v4, p0

    .restart local v4    # "srvDomain":Ljava/lang/String;
    goto :goto_1
.end method

.method public static resolveXMPPDomain(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "domain"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    sget-object v1, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    if-nez v1, :cond_0

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 87
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    new-instance v1, Lorg/jivesoftware/smack/util/dns/HostAddress;

    const/16 v2, 0x1466

    invoke-direct {v1, p0, v2}, Lorg/jivesoftware/smack/util/dns/HostAddress;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    :goto_0
    return-object v0

    :cond_0
    const/16 v1, 0x63

    invoke-static {p0, v1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveDomain(Ljava/lang/String;C)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public static resolveXMPPServerDomain(Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p0, "domain"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    sget-object v1, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    if-nez v1, :cond_0

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 113
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    new-instance v1, Lorg/jivesoftware/smack/util/dns/HostAddress;

    const/16 v2, 0x1495

    invoke-direct {v1, p0, v2}, Lorg/jivesoftware/smack/util/dns/HostAddress;-><init>(Ljava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    :goto_0
    return-object v0

    :cond_0
    const/16 v1, 0x73

    invoke-static {p0, v1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveDomain(Ljava/lang/String;C)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public static setDNSResolver(Lorg/jivesoftware/smack/util/dns/DNSResolver;)V
    .locals 0
    .param p0, "resolver"    # Lorg/jivesoftware/smack/util/dns/DNSResolver;

    .prologue
    .line 55
    sput-object p0, Lorg/jivesoftware/smack/util/DNSUtil;->dnsResolver:Lorg/jivesoftware/smack/util/dns/DNSResolver;

    .line 56
    return-void
.end method

.method protected static sortSRVRecords(Ljava/util/List;)Ljava/util/List;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/SRVRecord;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "records":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1

    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    invoke-virtual/range {v18 .. v18}, Lorg/jivesoftware/smack/util/dns/SRVRecord;->getFQDN()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 167
    const/4 v11, 0x0

    .line 223
    :cond_0
    return-object v11

    .line 170
    :cond_1
    invoke-static/range {p0 .. p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 173
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 174
    .local v4, "buckets":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Integer;Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    .line 175
    .local v10, "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/dns/SRVRecord;->getPriority()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 176
    .local v9, "priority":Ljava/lang/Integer;
    invoke-interface {v4, v9}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 178
    .local v2, "bucket":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    if-nez v2, :cond_2

    .line 179
    new-instance v2, Ljava/util/LinkedList;

    .end local v2    # "bucket":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 180
    .restart local v2    # "bucket":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    invoke-interface {v4, v9, v2}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_2
    invoke-interface {v2, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 185
    .end local v2    # "bucket":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    .end local v9    # "priority":Ljava/lang/Integer;
    .end local v10    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    :cond_3
    new-instance v11, Ljava/util/ArrayList;

    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 187
    .local v11, "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/HostAddress;>;"
    invoke-interface {v4}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .end local v7    # "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    .line 188
    .restart local v9    # "priority":Ljava/lang/Integer;
    invoke-interface {v4, v9}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 190
    .restart local v2    # "bucket":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .local v3, "bucketSize":I
    if-lez v3, :cond_4

    .line 191
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v18

    move/from16 v0, v18

    new-array v0, v0, [I

    move-object/from16 v16, v0

    .line 192
    .local v16, "totals":[I
    const/4 v14, 0x0

    .line 193
    .local v14, "running_total":I
    const/4 v6, 0x0

    .line 194
    .local v6, "count":I
    const/16 v17, 0x1

    .line 196
    .local v17, "zeroWeight":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_5
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    .line 197
    .restart local v10    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/dns/SRVRecord;->getWeight()I

    move-result v18

    if-lez v18, :cond_5

    .line 198
    const/16 v17, 0x0

    goto :goto_2

    .line 201
    .end local v10    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    :cond_6
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    .line 202
    .restart local v10    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/dns/SRVRecord;->getWeight()I

    move-result v18

    add-int v18, v18, v17

    add-int v14, v14, v18

    .line 203
    aput v14, v16, v6

    .line 204
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 207
    .end local v10    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    :cond_7
    if-nez v14, :cond_8

    .line 211
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v18

    int-to-double v0, v3

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    move-wide/from16 v0, v18

    double-to-int v15, v0

    .line 218
    .local v15, "selectedPos":I
    :goto_4
    invoke-interface {v2, v15}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    .line 219
    .local v5, "chosenSRVRecord":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 213
    .end local v5    # "chosenSRVRecord":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    .end local v15    # "selectedPos":I
    :cond_8
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v18

    int-to-double v0, v14

    move-wide/from16 v20, v0

    mul-double v12, v18, v20

    .line 214
    .local v12, "rnd":D
    move-object/from16 v0, v16

    invoke-static {v0, v12, v13}, Lorg/jivesoftware/smack/util/DNSUtil;->bisect([ID)I

    move-result v15

    .restart local v15    # "selectedPos":I
    goto :goto_4
.end method
