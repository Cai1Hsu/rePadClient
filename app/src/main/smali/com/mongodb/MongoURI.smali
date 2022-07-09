.class public Lcom/mongodb/MongoURI;
.super Ljava/lang/Object;
.source "MongoURI.java"


# static fields
.field public static final MONGODB_PREFIX:Ljava/lang/String; = "mongodb://"


# instance fields
.field private final mongoClientURI:Lcom/mongodb/MongoClientURI;

.field private final mongoOptions:Lcom/mongodb/MongoOptions;


# direct methods
.method public constructor <init>(Lcom/mongodb/MongoClientURI;)V
    .locals 2
    .param p1, "mongoClientURI"    # Lcom/mongodb/MongoClientURI;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    .line 148
    new-instance v0, Lcom/mongodb/MongoOptions;

    invoke-virtual {p1}, Lcom/mongodb/MongoClientURI;->getOptions()Lcom/mongodb/MongoClientOptions;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/MongoOptions;-><init>(Lcom/mongodb/MongoClientOptions;)V

    iput-object v0, p0, Lcom/mongodb/MongoURI;->mongoOptions:Lcom/mongodb/MongoOptions;

    .line 149
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v0, Lcom/mongodb/MongoClientURI;

    new-instance v1, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v1}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/mongodb/MongoClientOptions$Builder;->legacyDefaults()Lcom/mongodb/MongoClientOptions$Builder;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/mongodb/MongoClientURI;-><init>(Ljava/lang/String;Lcom/mongodb/MongoClientOptions$Builder;)V

    iput-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    .line 142
    new-instance v0, Lcom/mongodb/MongoOptions;

    iget-object v1, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v1}, Lcom/mongodb/MongoClientURI;->getOptions()Lcom/mongodb/MongoClientOptions;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/MongoOptions;-><init>(Lcom/mongodb/MongoClientOptions;)V

    iput-object v0, p0, Lcom/mongodb/MongoURI;->mongoOptions:Lcom/mongodb/MongoOptions;

    .line 143
    return-void
.end method


# virtual methods
.method public connect()Lcom/mongodb/Mongo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 223
    new-instance v0, Lcom/mongodb/Mongo;

    invoke-direct {v0, p0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoURI;)V

    return-object v0
.end method

.method public connectCollection(Lcom/mongodb/DB;)Lcom/mongodb/DBCollection;
    .locals 1
    .param p1, "db"    # Lcom/mongodb/DB;

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getCollection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    return-object v0
.end method

.method public connectCollection(Lcom/mongodb/Mongo;)Lcom/mongodb/DBCollection;
    .locals 2
    .param p1, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lcom/mongodb/MongoURI;->connectDB(Lcom/mongodb/Mongo;)Lcom/mongodb/DB;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getCollection()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    return-object v0
.end method

.method public connectDB()Lcom/mongodb/DB;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->connect()Lcom/mongodb/Mongo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getDatabase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public connectDB(Lcom/mongodb/Mongo;)Lcom/mongodb/DB;
    .locals 1
    .param p1, "mongo"    # Lcom/mongodb/Mongo;

    .prologue
    .line 243
    invoke-virtual {p0}, Lcom/mongodb/MongoURI;->getDatabase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public getCollection()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getCollection()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCredentials()Lcom/mongodb/MongoCredential;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getCredentials()Lcom/mongodb/MongoCredential;

    move-result-object v0

    return-object v0
.end method

.method public getDatabase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getDatabase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHosts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getHosts()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOptions()Lcom/mongodb/MongoOptions;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoOptions:Lcom/mongodb/MongoOptions;

    return-object v0
.end method

.method public getPassword()[C
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getPassword()[C

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->getUsername()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toClientURI()Lcom/mongodb/MongoClientURI;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/mongodb/MongoURI;->mongoClientURI:Lcom/mongodb/MongoClientURI;

    invoke-virtual {v0}, Lcom/mongodb/MongoClientURI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
