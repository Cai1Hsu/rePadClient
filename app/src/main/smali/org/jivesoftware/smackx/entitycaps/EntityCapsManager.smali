.class public Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;
    }
.end annotation


# static fields
.field public static final ELEMENT:Ljava/lang/String; = "c"

.field private static final ENTITY_NODE:Ljava/lang/String; = "http://www.igniterealtime.org/projects/smack"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/caps"

.field private static final SUPPORTED_HASHES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/security/MessageDigest;",
            ">;"
        }
    .end annotation
.end field

.field protected static caps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/packet/DiscoverInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static instances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;",
            ">;"
        }
    .end annotation
.end field

.field protected static jidCaps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;",
            ">;"
        }
    .end annotation
.end field

.field protected static persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;


# instance fields
.field private currentCapsVersion:Ljava/lang/String;

.field private entityCapsEnabled:Z

.field private lastLocalCapsVersions:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private presenceSend:Z

.field private sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

.field private weakRefConnection:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const-wide/16 v4, -0x1

    .line 79
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->SUPPORTED_HASHES:Ljava/util/Map;

    .line 83
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->instances:Ljava/util/Map;

    .line 89
    new-instance v1, Lorg/jivesoftware/smack/util/Cache;

    const/16 v2, 0x3e8

    invoke-direct {v1, v2, v4, v5}, Lorg/jivesoftware/smack/util/Cache;-><init>(IJ)V

    sput-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->caps:Ljava/util/Map;

    .line 97
    new-instance v1, Lorg/jivesoftware/smack/util/Cache;

    const/16 v2, 0x2710

    invoke-direct {v1, v2, v4, v5}, Lorg/jivesoftware/smack/util/Cache;-><init>(IJ)V

    sput-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    .line 100
    new-instance v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;-><init>()V

    invoke-static {v1}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 108
    :try_start_0
    const-string/jumbo v1, "SHA-1"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 109
    .local v0, "sha1MessageDigest":Ljava/security/MessageDigest;
    sget-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->SUPPORTED_HASHES:Ljava/util/Map;

    const-string/jumbo v2, "sha-1"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :goto_0
    return-void

    .line 110
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->presenceSend:Z

    .line 120
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->lastLocalCapsVersions:Ljava/util/Queue;

    .line 226
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->weakRefConnection:Ljava/lang/ref/WeakReference;

    .line 227
    invoke-static {p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    .line 228
    invoke-direct {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->init()V

    .line 229
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$1;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$202(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    .param p1, "x1"    # Z

    .prologue
    .line 73
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->presenceSend:Z

    return p1
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Ljava/lang/ref/WeakReference;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->weakRefConnection:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$400()Ljava/util/Map;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->instances:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$500()Ljava/util/Map;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->SUPPORTED_HASHES:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .prologue
    .line 73
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled:Z

    return v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    return-object v0
.end method

.method public static addDiscoverInfoByNode(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V
    .locals 1
    .param p0, "nodeVer"    # Ljava/lang/String;
    .param p1, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 132
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->caps:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;

    if-eqz v0, :cond_0

    .line 135
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;

    invoke-interface {v0, p0, p1}, Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;->addDiscoverInfoByNodePersistent(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    .line 136
    :cond_0
    return-void
.end method

.method private static formFieldValuesToCaps(Ljava/util/Iterator;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .prologue
    .line 674
    .local p0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    .line 675
    .local v1, "fvs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 676
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 678
    :cond_0
    invoke-interface {v1}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 679
    .local v0, "fv":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 680
    const-string/jumbo v3, "<"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 682
    .end local v0    # "fv":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method protected static generateVerificationString(Lorg/jivesoftware/smackx/packet/DiscoverInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 19
    .param p0, "discoverInfo"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .param p1, "hash"    # Ljava/lang/String;

    .prologue
    .line 569
    sget-object v17, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->SUPPORTED_HASHES:Ljava/util/Map;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/security/MessageDigest;

    .line 570
    .local v14, "md":Ljava/security/MessageDigest;
    if-nez v14, :cond_0

    .line 571
    const/16 v17, 0x0

    .line 670
    :goto_0
    return-object v17

    .line 573
    :cond_0
    const-string/jumbo v17, "x"

    const-string/jumbo v18, "jabber:x:data"

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DataForm;

    .line 576
    .local v4, "extendedInfo":Lorg/jivesoftware/smackx/packet/DataForm;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 585
    .local v15, "sb":Ljava/lang/StringBuilder;
    new-instance v16, Ljava/util/TreeSet;

    invoke-direct/range {v16 .. v16}, Ljava/util/TreeSet;-><init>()V

    .line 587
    .local v16, "sortedIdentities":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getIdentities()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;>;"
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_1

    .line 588
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 592
    :cond_1
    invoke-interface/range {v16 .. v16}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_2
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_4

    .line 593
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 594
    .local v11, "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getCategory()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    const-string/jumbo v17, "/"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 596
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getType()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    const-string/jumbo v17, "/"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getLanguage()Ljava/lang/String;

    move-result-object v17

    if-nez v17, :cond_2

    const-string/jumbo v17, ""

    :goto_3
    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    const-string/jumbo v17, "/"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;

    move-result-object v17

    if-nez v17, :cond_3

    const-string/jumbo v17, ""

    :goto_4
    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 601
    const-string/jumbo v17, "<"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 598
    :cond_2
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getLanguage()Ljava/lang/String;

    move-result-object v17

    goto :goto_3

    .line 600
    :cond_3
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->getName()Ljava/lang/String;

    move-result-object v17

    goto :goto_4

    .line 605
    .end local v11    # "identity":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    :cond_4
    new-instance v6, Ljava/util/TreeSet;

    invoke-direct {v6}, Ljava/util/TreeSet;-><init>()V

    .line 606
    .local v6, "features":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Ljava/lang/String;>;"
    invoke-virtual/range {p0 .. p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getFeatures()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;>;"
    :goto_5
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_5

    .line 607
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;

    invoke-virtual/range {v17 .. v17}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Feature;->getVar()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v6, v0}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 611
    :cond_5
    invoke-interface {v6}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 612
    .local v5, "f":Ljava/lang/String;
    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 613
    const-string/jumbo v17, "<"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 619
    .end local v5    # "f":Ljava/lang/String;
    :cond_6
    if-eqz v4, :cond_b

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DataForm;->hasHiddenFormTypeField()Z

    move-result v17

    if-eqz v17, :cond_b

    .line 620
    monitor-enter v4

    .line 624
    :try_start_0
    new-instance v7, Ljava/util/TreeSet;

    new-instance v17, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$8;

    invoke-direct/range {v17 .. v17}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$8;-><init>()V

    move-object/from16 v0, v17

    invoke-direct {v7, v0}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 630
    .local v7, "fs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/jivesoftware/smackx/FormField;>;"
    const/4 v8, 0x0

    .line 632
    .local v8, "ft":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DataForm;->getFields()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :goto_7
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_8

    .line 633
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/FormField;

    .line 634
    .local v5, "f":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "FORM_TYPE"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_7

    .line 635
    invoke-interface {v7, v5}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 658
    .end local v5    # "f":Lorg/jivesoftware/smackx/FormField;
    .end local v7    # "fs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/jivesoftware/smackx/FormField;>;"
    .end local v8    # "ft":Lorg/jivesoftware/smackx/FormField;
    .end local v9    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :catchall_0
    move-exception v17

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v17

    .line 637
    .restart local v5    # "f":Lorg/jivesoftware/smackx/FormField;
    .restart local v7    # "fs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/jivesoftware/smackx/FormField;>;"
    .restart local v8    # "ft":Lorg/jivesoftware/smackx/FormField;
    .restart local v9    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_7
    move-object v8, v5

    goto :goto_7

    .line 642
    .end local v5    # "f":Lorg/jivesoftware/smackx/FormField;
    :cond_8
    if-eqz v8, :cond_9

    .line 643
    :try_start_1
    invoke-virtual {v8}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v0, v15}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->formFieldValuesToCaps(Ljava/util/Iterator;Ljava/lang/StringBuilder;)V

    .line 653
    :cond_9
    invoke-interface {v7}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_8
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/FormField;

    .line 654
    .restart local v5    # "f":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 655
    const-string/jumbo v17, "<"

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v0, v15}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->formFieldValuesToCaps(Ljava/util/Iterator;Ljava/lang/StringBuilder;)V

    goto :goto_8

    .line 658
    .end local v5    # "f":Lorg/jivesoftware/smackx/FormField;
    :cond_a
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 669
    .end local v7    # "fs":Ljava/util/SortedSet;, "Ljava/util/SortedSet<Lorg/jivesoftware/smackx/FormField;>;"
    .end local v8    # "ft":Lorg/jivesoftware/smackx/FormField;
    .end local v9    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_b
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->getBytes()[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 670
    .local v3, "digest":[B
    invoke-static {v3}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([B)Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_0
.end method

.method public static getDiscoverInfoByUser(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 2
    .param p0, "user"    # Ljava/lang/String;

    .prologue
    .line 169
    sget-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    .line 170
    .local v0, "nvh":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;
    if-nez v0, :cond_0

    .line 171
    const/4 v1, 0x0

    .line 173
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->access$100(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getDiscoveryInfoByNodeVer(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    goto :goto_0
.end method

.method public static getDiscoveryInfoByNodeVer(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .locals 3
    .param p0, "nodeVer"    # Ljava/lang/String;

    .prologue
    .line 185
    sget-object v2, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->caps:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .line 186
    .local v0, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    if-eqz v0, :cond_0

    .line 187
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    .end local v0    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .local v1, "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    move-object v0, v1

    .line 189
    .end local v1    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    .restart local v0    # "info":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :cond_0
    return-object v0
.end method

.method public static declared-synchronized getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v0, 0x0

    .line 333
    const-class v2, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    monitor-enter v2

    :try_start_0
    instance-of v1, p0, Lorg/jivesoftware/smack/XMPPConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    .line 345
    :cond_0
    :goto_0
    monitor-exit v2

    return-object v0

    .line 336
    :cond_1
    :try_start_1
    sget-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->SUPPORTED_HASHES:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 339
    sget-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->instances:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .line 341
    .local v0, "entityCapsManager":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    if-nez v0, :cond_0

    .line 342
    new-instance v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    .end local v0    # "entityCapsManager":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;-><init>(Lorg/jivesoftware/smack/Connection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v0    # "entityCapsManager":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    goto :goto_0

    .line 333
    .end local v0    # "entityCapsManager":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static getNodeVerHashByJid(Ljava/lang/String;)Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;
    .locals 1
    .param p0, "jid"    # Ljava/lang/String;

    .prologue
    .line 156
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    return-object v0
.end method

.method public static getNodeVersionByJid(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "jid"    # Ljava/lang/String;

    .prologue
    .line 147
    sget-object v1, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    .line 148
    .local v0, "nvh":Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;
    if-eqz v0, :cond_0

    .line 149
    invoke-static {v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;->access$100(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;)Ljava/lang/String;

    move-result-object v1

    .line 151
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private init()V
    .locals 11

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 232
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->weakRefConnection:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/Connection;

    .line 233
    .local v1, "connection":Lorg/jivesoftware/smack/Connection;
    sget-object v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->instances:Ljava/util/Map;

    invoke-interface {v4, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    new-instance v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;

    invoke-direct {v4, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 260
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->updateLocalEntityCaps()V

    .line 262
    invoke-static {}, Lorg/jivesoftware/smack/SmackConfiguration;->autoEnableEntityCaps()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 263
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->enableEntityCaps()V

    .line 265
    :cond_0
    new-instance v2, Lorg/jivesoftware/smack/filter/AndFilter;

    new-array v4, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v6, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v5, v4, v8

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v6, "c"

    const-string/jumbo v7, "http://jabber.org/protocol/caps"

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v5, v4, v9

    invoke-direct {v2, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 267
    .local v2, "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$3;

    invoke-direct {v4, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$3;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    invoke-virtual {v1, v4, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 291
    new-instance v2, Lorg/jivesoftware/smack/filter/AndFilter;

    .end local v2    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-array v4, v10, [Lorg/jivesoftware/smack/filter/PacketFilter;

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v6, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v5, v4, v8

    new-instance v5, Lorg/jivesoftware/smack/filter/NotFilter;

    new-instance v6, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v7, "c"

    const-string/jumbo v8, "http://jabber.org/protocol/caps"

    invoke-direct {v6, v7, v8}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/NotFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    aput-object v5, v4, v9

    invoke-direct {v2, v4}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 293
    .restart local v2    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$4;

    invoke-direct {v4, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$4;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    invoke-virtual {v1, v4, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 303
    new-instance v2, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    .end local v2    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    const-class v4, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v2, v4}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 304
    .restart local v2    # "packetFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$5;

    invoke-direct {v4, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$5;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    invoke-virtual {v1, v4, v2}, Lorg/jivesoftware/smack/Connection;->addPacketSendingListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 314
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v4, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v0, v4}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 315
    .local v0, "capsPacketFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v3, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$6;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    .line 324
    .local v3, "packetInterceptor":Lorg/jivesoftware/smack/PacketInterceptor;
    invoke-virtual {v1, v3, v0}, Lorg/jivesoftware/smack/Connection;->addPacketInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 327
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v4, p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setEntityCapsManager(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    .line 328
    return-void
.end method

.method public static setCapsMaxCacheSize(I)V
    .locals 1
    .param p0, "maxCacheSize"    # I

    .prologue
    .line 222
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->caps:Ljava/util/Map;

    check-cast v0, Lorg/jivesoftware/smack/util/Cache;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/util/Cache;->setMaxCacheSize(I)V

    .line 223
    return-void
.end method

.method public static setJidCapsMaxCacheSize(I)V
    .locals 1
    .param p0, "maxCacheSize"    # I

    .prologue
    .line 212
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    check-cast v0, Lorg/jivesoftware/smack/util/Cache;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/util/Cache;->setMaxCacheSize(I)V

    .line 213
    return-void
.end method

.method public static setPersistentCache(Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;)V
    .locals 2
    .param p0, "cache"    # Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;

    if-eqz v0, :cond_0

    .line 200
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Entity Caps Persistent Cache was already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 201
    :cond_0
    sput-object p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;

    .line 202
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->persistentCache:Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;

    invoke-interface {v0}, Lorg/jivesoftware/smackx/entitycaps/cache/EntityCapsPersistentCache;->replay()V

    .line 203
    return-void
.end method

.method public static verifyDiscoverInfoVersion(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z
    .locals 3
    .param p0, "ver"    # Ljava/lang/String;
    .param p1, "hash"    # Ljava/lang/String;
    .param p2, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    const/4 v1, 0x0

    .line 511
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsDuplicateIdentities()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 527
    :cond_0
    :goto_0
    return v1

    .line 515
    :cond_1
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsDuplicateFeatures()Z

    move-result v2

    if-nez v2, :cond_0

    .line 519
    invoke-static {p2}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->verifyPacketExtensions(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 522
    invoke-static {p2, p1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->generateVerificationString(Lorg/jivesoftware/smackx/packet/DiscoverInfo;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 524
    .local v0, "calculatedVer":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 527
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected static verifyPacketExtensions(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)Z
    .locals 10
    .param p0, "info"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    .prologue
    .line 536
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 537
    .local v3, "foundFormTypes":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/FormField;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->getExtensions()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 538
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 539
    .local v7, "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v7}, Lorg/jivesoftware/smack/packet/PacketExtension;->getNamespace()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "jabber:x:data"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v0, v7

    .line 540
    check-cast v0, Lorg/jivesoftware/smackx/packet/DataForm;

    .line 541
    .local v0, "df":Lorg/jivesoftware/smackx/packet/DataForm;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getFields()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 542
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/FormField;

    .line 543
    .local v1, "f":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "FORM_TYPE"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 544
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/FormField;

    .line 545
    .local v2, "fft":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/FormField;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 546
    const/4 v8, 0x1

    .line 553
    .end local v0    # "df":Lorg/jivesoftware/smackx/packet/DataForm;
    .end local v1    # "f":Lorg/jivesoftware/smackx/FormField;
    .end local v2    # "fft":Lorg/jivesoftware/smackx/FormField;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    .end local v7    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    :goto_1
    return v8

    .line 548
    .restart local v0    # "df":Lorg/jivesoftware/smackx/packet/DataForm;
    .restart local v1    # "f":Lorg/jivesoftware/smackx/FormField;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    .restart local v7    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_3
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 553
    .end local v0    # "df":Lorg/jivesoftware/smackx/packet/DataForm;
    .end local v1    # "f":Lorg/jivesoftware/smackx/FormField;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    .end local v7    # "pe":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_4
    const/4 v8, 0x0

    goto :goto_1
.end method


# virtual methods
.method public areEntityCapsSupported(Ljava/lang/String;)Z
    .locals 4
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 402
    if-nez p1, :cond_0

    .line 409
    :goto_0
    return v2

    .line 406
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v3, p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->discoverInfo(Ljava/lang/String;)Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    move-result-object v1

    .line 407
    .local v1, "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    const-string/jumbo v3, "http://jabber.org/protocol/caps"

    invoke-virtual {v1, v3}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->containsFeature(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .line 408
    .end local v1    # "result":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    :catch_0
    move-exception v0

    .line 409
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    goto :goto_0
.end method

.method public areEntityCapsSupportedByServer()Z
    .locals 1

    .prologue
    .line 419
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->weakRefConnection:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getServiceName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->areEntityCapsSupported(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public disableEntityCaps()V
    .locals 2

    .prologue
    .line 356
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled:Z

    .line 357
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    const-string/jumbo v1, "http://jabber.org/protocol/caps"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->removeFeature(Ljava/lang/String;)V

    .line 358
    return-void
.end method

.method public enableEntityCaps()V
    .locals 2

    .prologue
    .line 350
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    const-string/jumbo v1, "http://jabber.org/protocol/caps"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 351
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->updateLocalEntityCaps()V

    .line 352
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled:Z

    .line 353
    return-void
.end method

.method public entityCapsEnabled()Z
    .locals 1

    .prologue
    .line 361
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->entityCapsEnabled:Z

    return v0
.end method

.method public getCapsVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalNodeVer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 392
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://www.igniterealtime.org/projects/smack#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getCapsVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public removeUserCapsNode(Ljava/lang/String;)V
    .locals 1
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 371
    sget-object v0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 372
    return-void
.end method

.method public updateLocalEntityCaps()V
    .locals 10

    .prologue
    .line 439
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->weakRefConnection:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/Connection;

    .line 441
    .local v0, "connection":Lorg/jivesoftware/smack/Connection;
    new-instance v1, Lorg/jivesoftware/smackx/packet/DiscoverInfo;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;-><init>()V

    .line 442
    .local v1, "discoverInfo":Lorg/jivesoftware/smackx/packet/DiscoverInfo;
    sget-object v4, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 443
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->getLocalNodeVer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setNode(Ljava/lang/String;)V

    .line 444
    if-eqz v0, :cond_0

    .line 445
    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DiscoverInfo;->setFrom(Ljava/lang/String;)V

    .line 446
    :cond_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addDiscoverInfoTo(Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    .line 448
    const-string/jumbo v4, "sha-1"

    invoke-static {v1, v4}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->generateVerificationString(Lorg/jivesoftware/smackx/packet/DiscoverInfo;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    .line 449
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "http://www.igniterealtime.org/projects/smack#"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->addDiscoverInfoByNode(Ljava/lang/String;Lorg/jivesoftware/smackx/packet/DiscoverInfo;)V

    .line 450
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->lastLocalCapsVersions:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->size()I

    move-result v4

    const/16 v5, 0xa

    if-le v4, v5, :cond_1

    .line 451
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->lastLocalCapsVersions:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 452
    .local v2, "oldCapsVersion":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "http://www.igniterealtime.org/projects/smack#"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->removeNodeInformationProvider(Ljava/lang/String;)V

    .line 454
    .end local v2    # "oldCapsVersion":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->lastLocalCapsVersions:Ljava/util/Queue;

    iget-object v5, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 456
    sget-object v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->caps:Ljava/util/Map;

    iget-object v5, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    if-eqz v0, :cond_2

    .line 458
    sget-object v4, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->jidCaps:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;

    const-string/jumbo v7, "http://www.igniterealtime.org/projects/smack"

    iget-object v8, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    const-string/jumbo v9, "sha-1"

    invoke-direct {v6, v7, v8, v9}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$NodeVerHash;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 460
    :cond_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->sdm:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "http://www.igniterealtime.org/projects/smack#"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->currentCapsVersion:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;

    invoke-direct {v6, p0}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$7;-><init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V

    invoke-virtual {v4, v5, v6}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V

    .line 491
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isAuthenticated()Z

    move-result v4

    if-eqz v4, :cond_3

    iget-boolean v4, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->presenceSend:Z

    if-eqz v4, :cond_3

    .line 492
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v4, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 493
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 495
    .end local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_3
    return-void
.end method
