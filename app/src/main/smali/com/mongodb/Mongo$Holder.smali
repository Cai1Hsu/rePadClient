.class public Lcom/mongodb/Mongo$Holder;
.super Ljava/lang/Object;
.source "Mongo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/Mongo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Holder"
.end annotation


# static fields
.field private static _default:Lcom/mongodb/Mongo$Holder;


# instance fields
.field private final _mongos:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/Mongo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 804
    new-instance v0, Lcom/mongodb/Mongo$Holder;

    invoke-direct {v0}, Lcom/mongodb/Mongo$Holder;-><init>()V

    sput-object v0, Lcom/mongodb/Mongo$Holder;->_default:Lcom/mongodb/Mongo$Holder;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 752
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 805
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/Mongo$Holder;->_mongos:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method public static singleton()Lcom/mongodb/Mongo$Holder;
    .locals 1

    .prologue
    .line 802
    sget-object v0, Lcom/mongodb/Mongo$Holder;->_default:Lcom/mongodb/Mongo$Holder;

    return-object v0
.end method

.method private toKey(Lcom/mongodb/MongoClientURI;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Lcom/mongodb/MongoClientURI;

    .prologue
    .line 799
    invoke-virtual {p1}, Lcom/mongodb/MongoClientURI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public connect(Lcom/mongodb/MongoClientURI;)Lcom/mongodb/Mongo;
    .locals 4
    .param p1, "uri"    # Lcom/mongodb/MongoClientURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 781
    invoke-direct {p0, p1}, Lcom/mongodb/Mongo$Holder;->toKey(Lcom/mongodb/MongoClientURI;)Ljava/lang/String;

    move-result-object v1

    .line 783
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/mongodb/Mongo$Holder;->_mongos:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/Mongo;

    .line 785
    .local v0, "client":Lcom/mongodb/Mongo;
    if-nez v0, :cond_0

    .line 786
    new-instance v2, Lcom/mongodb/MongoClient;

    invoke-direct {v2, p1}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/MongoClientURI;)V

    .line 787
    .local v2, "newbie":Lcom/mongodb/Mongo;
    iget-object v3, p0, Lcom/mongodb/Mongo$Holder;->_mongos:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "client":Lcom/mongodb/Mongo;
    check-cast v0, Lcom/mongodb/Mongo;

    .line 788
    .restart local v0    # "client":Lcom/mongodb/Mongo;
    if-nez v0, :cond_1

    .line 789
    move-object v0, v2

    .line 795
    .end local v2    # "newbie":Lcom/mongodb/Mongo;
    :cond_0
    :goto_0
    return-object v0

    .line 791
    .restart local v2    # "newbie":Lcom/mongodb/Mongo;
    :cond_1
    invoke-virtual {v2}, Lcom/mongodb/Mongo;->close()V

    goto :goto_0
.end method

.method public connect(Lcom/mongodb/MongoURI;)Lcom/mongodb/Mongo;
    .locals 1
    .param p1, "uri"    # Lcom/mongodb/MongoURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 767
    invoke-virtual {p1}, Lcom/mongodb/MongoURI;->toClientURI()Lcom/mongodb/MongoClientURI;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/Mongo$Holder;->connect(Lcom/mongodb/MongoClientURI;)Lcom/mongodb/Mongo;

    move-result-object v0

    return-object v0
.end method
