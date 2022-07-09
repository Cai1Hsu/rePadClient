.class public Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;
.super Ljava/lang/Object;
.source "DNSJavaResolver.java"

# interfaces
.implements Lorg/jivesoftware/smack/util/dns/DNSResolver;


# static fields
.field private static instance:Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;

    invoke-direct {v0}, Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;->instance:Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static getInstance()Lorg/jivesoftware/smack/util/dns/DNSResolver;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;->instance:Lorg/jivesoftware/smack/util/dns/DNSJavaResolver;

    return-object v0
.end method


# virtual methods
.method public lookupSRVRecords(Ljava/lang/String;)Ljava/util/List;
    .locals 16
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
    .line 43
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v12, "res":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/util/dns/SRVRecord;>;"
    :try_start_0
    new-instance v6, Lorg/xbill/DNS/Lookup;

    const/16 v15, 0x21

    move-object/from16 v0, p1

    invoke-direct {v6, v0, v15}, Lorg/xbill/DNS/Lookup;-><init>(Ljava/lang/String;I)V

    .line 47
    .local v6, "lookup":Lorg/xbill/DNS/Lookup;
    invoke-virtual {v6}, Lorg/xbill/DNS/Lookup;->run()[Lorg/xbill/DNS/Record;

    move-result-object v11

    .line 48
    .local v11, "recs":[Lorg/xbill/DNS/Record;
    if-nez v11, :cond_1

    .line 71
    .end local v6    # "lookup":Lorg/xbill/DNS/Lookup;
    .end local v11    # "recs":[Lorg/xbill/DNS/Record;
    :cond_0
    :goto_0
    return-object v12

    .line 51
    .restart local v6    # "lookup":Lorg/xbill/DNS/Lookup;
    .restart local v11    # "recs":[Lorg/xbill/DNS/Record;
    :cond_1
    move-object v1, v11

    .local v1, "arr$":[Lorg/xbill/DNS/Record;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_0

    aget-object v10, v1, v4

    .line 52
    .local v10, "record":Lorg/xbill/DNS/Record;
    move-object v0, v10

    check-cast v0, Lorg/xbill/DNS/SRVRecord;

    move-object v13, v0

    .line 53
    .local v13, "srvRecord":Lorg/xbill/DNS/SRVRecord;
    if-eqz v13, :cond_2

    invoke-virtual {v13}, Lorg/xbill/DNS/SRVRecord;->getTarget()Lorg/xbill/DNS/Name;

    move-result-object v15

    if-eqz v15, :cond_2

    .line 54
    invoke-virtual {v13}, Lorg/xbill/DNS/SRVRecord;->getTarget()Lorg/xbill/DNS/Name;

    move-result-object v15

    invoke-virtual {v15}, Lorg/xbill/DNS/Name;->toString()Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "host":Ljava/lang/String;
    invoke-virtual {v13}, Lorg/xbill/DNS/SRVRecord;->getPort()I

    move-result v7

    .line 56
    .local v7, "port":I
    invoke-virtual {v13}, Lorg/xbill/DNS/SRVRecord;->getPriority()I

    move-result v8

    .line 57
    .local v8, "priority":I
    invoke-virtual {v13}, Lorg/xbill/DNS/SRVRecord;->getWeight()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v14

    .line 61
    .local v14, "weight":I
    :try_start_1
    new-instance v9, Lorg/jivesoftware/smack/util/dns/SRVRecord;

    invoke-direct {v9, v3, v7, v8, v14}, Lorg/jivesoftware/smack/util/dns/SRVRecord;-><init>(Ljava/lang/String;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 65
    .local v9, "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    :try_start_2
    invoke-interface {v12, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 51
    .end local v3    # "host":Ljava/lang/String;
    .end local v7    # "port":I
    .end local v8    # "priority":I
    .end local v9    # "r":Lorg/jivesoftware/smack/util/dns/SRVRecord;
    .end local v14    # "weight":I
    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 62
    .restart local v3    # "host":Ljava/lang/String;
    .restart local v7    # "port":I
    .restart local v8    # "priority":I
    .restart local v14    # "weight":I
    :catch_0
    move-exception v2

    .line 63
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_2

    .line 69
    .end local v1    # "arr$":[Lorg/xbill/DNS/Record;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "lookup":Lorg/xbill/DNS/Lookup;
    .end local v7    # "port":I
    .end local v8    # "priority":I
    .end local v10    # "record":Lorg/xbill/DNS/Record;
    .end local v11    # "recs":[Lorg/xbill/DNS/Record;
    .end local v13    # "srvRecord":Lorg/xbill/DNS/SRVRecord;
    .end local v14    # "weight":I
    :catch_1
    move-exception v15

    goto :goto_0
.end method
