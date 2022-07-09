.class public Lorg/jivesoftware/smack/util/dns/JavaxResolver;
.super Ljava/lang/Object;
.source "JavaxResolver.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/dns/DNSResolver;


# static fields
.field private static dirContext:Ljavax/naming/directory/DirContext;

.field private static instance:Lorg/jivesoftware/smack/util/dns/JavaxResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 43
    :try_start_0
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 44
    .local v0, "env":Ljava/util/Hashtable;, "Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, "java.naming.factory.initial"

    const-string/jumbo v2, "com.sun.jndi.dns.DnsContextFactory"

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    new-instance v1, Ljavax/naming/directory/InitialDirContext;

    invoke-direct {v1, v0}, Ljavax/naming/directory/InitialDirContext;-><init>(Ljava/util/Hashtable;)V

    sput-object v1, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->dirContext:Ljavax/naming/directory/DirContext;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    :goto_0
    invoke-static {}, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->getInstance()Lorg/jivesoftware/smack/util/dns/DNSResolver;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/util/DNSUtil;->setDNSResolver(Lorg/jivesoftware/smack/util/dns/DNSResolver;)V

    .line 52
    return-void

    .line 46
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method public static getInstance()Lorg/jivesoftware/smack/util/dns/DNSResolver;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->instance:Lorg/jivesoftware/smack/util/dns/JavaxResolver;

    if-nez v0, :cond_0

    invoke-static {}, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Lorg/jivesoftware/smack/util/dns/JavaxResolver;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/dns/JavaxResolver;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->instance:Lorg/jivesoftware/smack/util/dns/JavaxResolver;

    .line 62
    :cond_0
    sget-object v0, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->instance:Lorg/jivesoftware/smack/util/dns/JavaxResolver;

    return-object v0
.end method

.method public static isSupported()Z
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->dirContext:Ljavax/naming/directory/DirContext;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public lookupSRVRecords(Ljava/lang/String;)Ljava/util/List;
    .locals 17
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/SRVRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v6, "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    :try_start_0
    sget-object v13, Lorg/jivesoftware/smack/util/dns/JavaxResolver;->dirContext:Ljavax/naming/directory/DirContext;

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/String;

    const/4 v15, 0x0

    const-string/jumbo v16, "SRV"

    aput-object v16, v14, v15

    move-object/from16 v0, p1

    invoke-interface {v13, v0, v14}, Ljavax/naming/directory/DirContext;->getAttributes(Ljava/lang/String;[Ljava/lang/String;)Ljavax/naming/directory/Attributes;

    move-result-object v1

    .line 75
    .local v1, "dnsLookup":Ljavax/naming/directory/Attributes;
    const-string/jumbo v13, "SRV"

    invoke-interface {v1, v13}, Ljavax/naming/directory/Attributes;->get(Ljava/lang/String;)Ljavax/naming/directory/Attribute;

    move-result-object v7

    .line 77
    .local v7, "srvAttribute":Ljavax/naming/directory/Attribute;
    invoke-interface {v7}, Ljavax/naming/directory/Attribute;->getAll()Ljavax/naming/NamingEnumeration;

    move-result-object v11

    .line 78
    .local v11, "srvRecords":Ljavax/naming/NamingEnumeration;, "Ljavax/naming/NamingEnumeration<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v11}, Ljavax/naming/NamingEnumeration;->hasMore()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 79
    invoke-interface {v11}, Ljavax/naming/NamingEnumeration;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 80
    .local v10, "srvRecordString":Ljava/lang/String;
    const-string/jumbo v13, " "

    invoke-virtual {v10, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 81
    .local v9, "srvRecordEntries":[Ljava/lang/String;
    array-length v13, v9

    add-int/lit8 v13, v13, -0x4

    aget-object v13, v9, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 82
    .local v5, "priority":I
    array-length v13, v9

    add-int/lit8 v13, v13, -0x2

    aget-object v13, v9, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 83
    .local v4, "port":I
    array-length v13, v9

    add-int/lit8 v13, v13, -0x3

    aget-object v13, v9, v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 84
    .local v12, "weight":I
    array-length v13, v9

    add-int/lit8 v13, v13, -0x1

    aget-object v3, v9, v13
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .local v3, "host":Ljava/lang/String;
    :try_start_1
    new-instance v8, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    invoke-direct {v8, v3, v4, v5, v12}, Lorg/jivesoftware/smack/util/dns/SRVRecord;-><init>(Ljava/lang/String;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    .local v8, "srvRecord":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    :try_start_2
    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 94
    .end local v1    # "dnsLookup":Ljavax/naming/directory/Attributes;
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "port":I
    .end local v5    # "priority":I
    .end local v7    # "srvAttribute":Ljavax/naming/directory/Attribute;
    .end local v8    # "srvRecord":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    .end local v9    # "srvRecordEntries":[Ljava/lang/String;
    .end local v10    # "srvRecordString":Ljava/lang/String;
    .end local v11    # "srvRecords":Ljavax/naming/NamingEnumeration;, "Ljavax/naming/NamingEnumeration<Ljava/lang/String;>;"
    .end local v12    # "weight":I
    :catch_0
    move-exception v13

    .line 97
    :cond_0
    return-object v6

    .line 89
    .restart local v1    # "dnsLookup":Ljavax/naming/directory/Attributes;
    .restart local v3    # "host":Ljava/lang/String;
    .restart local v4    # "port":I
    .restart local v5    # "priority":I
    .restart local v7    # "srvAttribute":Ljavax/naming/directory/Attribute;
    .restart local v9    # "srvRecordEntries":[Ljava/lang/String;
    .restart local v10    # "srvRecordString":Ljava/lang/String;
    .restart local v11    # "srvRecords":Ljavax/naming/NamingEnumeration;, "Ljavax/naming/NamingEnumeration<Ljava/lang/String;>;"
    .restart local v12    # "weight":I
    :catch_1
    move-exception v2

    .line 90
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_0
.end method
