.class Lcom/mongodb/DBPortFactory;
.super Ljava/lang/Object;
.source "DBPortFactory.java"

# interfaces
.implements Lcom/mongodb/ConnectionFactory;


# instance fields
.field private final options:Lcom/mongodb/MongoOptions;


# direct methods
.method constructor <init>(Lcom/mongodb/MongoOptions;)V
    .locals 0
    .param p1, "options"    # Lcom/mongodb/MongoOptions;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/mongodb/DBPortFactory;->options:Lcom/mongodb/MongoOptions;

    .line 24
    return-void
.end method


# virtual methods
.method public create(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;I)Lcom/mongodb/Connection;
    .locals 2
    .param p1, "serverAddress"    # Lcom/mongodb/ServerAddress;
    .param p2, "provider"    # Lcom/mongodb/PooledConnectionProvider;
    .param p3, "generation"    # I

    .prologue
    .line 28
    new-instance v0, Lcom/mongodb/DBPort;

    iget-object v1, p0, Lcom/mongodb/DBPortFactory;->options:Lcom/mongodb/MongoOptions;

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/mongodb/DBPort;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/MongoOptions;I)V

    return-object v0
.end method
