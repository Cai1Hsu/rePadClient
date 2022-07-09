.class public Lcom/mongodb/MongoClient;
.super Lcom/mongodb/Mongo;
.source "MongoClient.java"


# instance fields
.field private final options:Lcom/mongodb/MongoClientOptions;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0}, Lcom/mongodb/ServerAddress;-><init>()V

    invoke-direct {p0, v0}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/MongoClientURI;)V
    .locals 1
    .param p1, "uri"    # Lcom/mongodb/MongoClientURI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 268
    new-instance v0, Lcom/mongodb/MongoURI;

    invoke-direct {v0, p1}, Lcom/mongodb/MongoURI;-><init>(Lcom/mongodb/MongoClientURI;)V

    invoke-direct {p0, v0}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoURI;)V

    .line 269
    invoke-virtual {p1}, Lcom/mongodb/MongoClientURI;->getOptions()Lcom/mongodb/MongoClientOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/MongoClient;->options:Lcom/mongodb/MongoClientOptions;

    .line 270
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 127
    new-instance v0, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/mongodb/MongoClientOptions$Builder;->build()Lcom/mongodb/MongoClientOptions;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoClientOptions;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoClientOptions;)V
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p2, "options"    # Lcom/mongodb/MongoClientOptions;

    .prologue
    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V

    .line 153
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Ljava/util/List;)V
    .locals 1
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerAddress;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p2, "credentialsList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/MongoCredential;>;"
    new-instance v0, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/mongodb/MongoClientOptions$Builder;->build()Lcom/mongodb/MongoClientOptions;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V

    .line 141
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/ServerAddress;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V
    .locals 2
    .param p1, "addr"    # Lcom/mongodb/ServerAddress;
    .param p3, "options"    # Lcom/mongodb/MongoClientOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ServerAddress;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;",
            "Lcom/mongodb/MongoClientOptions;",
            ")V"
        }
    .end annotation

    .prologue
    .line 167
    .local p2, "credentialsList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/MongoCredential;>;"
    new-instance v0, Lcom/mongodb/MongoCredentialsStore;

    invoke-direct {v0, p2}, Lcom/mongodb/MongoCredentialsStore;-><init>(Ljava/lang/Iterable;)V

    invoke-static {p1, v0}, Lcom/mongodb/MongoAuthority;->direct(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    new-instance v1, Lcom/mongodb/MongoOptions;

    invoke-direct {v1, p3}, Lcom/mongodb/MongoOptions;-><init>(Lcom/mongodb/MongoClientOptions;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 168
    iput-object p3, p0, Lcom/mongodb/MongoClient;->options:Lcom/mongodb/MongoClientOptions;

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1, p2}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {p0, v0}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/mongodb/MongoClientOptions;)V
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "options"    # Lcom/mongodb/MongoClientOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Lcom/mongodb/ServerAddress;

    invoke-direct {v0, p1}, Lcom/mongodb/ServerAddress;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/mongodb/MongoClient;-><init>(Lcom/mongodb/ServerAddress;Lcom/mongodb/MongoClientOptions;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    const/4 v0, 0x0

    new-instance v1, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v1}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-virtual {v1}, Lcom/mongodb/MongoClientOptions$Builder;->build()Lcom/mongodb/MongoClientOptions;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lcom/mongodb/MongoClient;-><init>(Ljava/util/List;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V

    .line 188
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V
    .locals 1
    .param p2, "options"    # Lcom/mongodb/MongoClientOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Lcom/mongodb/MongoClientOptions;",
            ")V"
        }
    .end annotation

    .prologue
    .line 229
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/MongoClient;-><init>(Ljava/util/List;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V

    .line 230
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 208
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    .local p2, "credentialsList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/MongoCredential;>;"
    new-instance v0, Lcom/mongodb/MongoClientOptions$Builder;

    invoke-direct {v0}, Lcom/mongodb/MongoClientOptions$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/mongodb/MongoClientOptions$Builder;->build()Lcom/mongodb/MongoClientOptions;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/MongoClient;-><init>(Ljava/util/List;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V

    .line 209
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;Lcom/mongodb/MongoClientOptions;)V
    .locals 2
    .param p3, "options"    # Lcom/mongodb/MongoClientOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;",
            "Lcom/mongodb/MongoClientOptions;",
            ")V"
        }
    .end annotation

    .prologue
    .line 252
    .local p1, "seeds":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    .local p2, "credentialsList":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/MongoCredential;>;"
    new-instance v0, Lcom/mongodb/MongoCredentialsStore;

    invoke-direct {v0, p2}, Lcom/mongodb/MongoCredentialsStore;-><init>(Ljava/lang/Iterable;)V

    invoke-static {p1, v0}, Lcom/mongodb/MongoAuthority;->dynamicSet(Ljava/util/List;Lcom/mongodb/MongoCredentialsStore;)Lcom/mongodb/MongoAuthority;

    move-result-object v0

    new-instance v1, Lcom/mongodb/MongoOptions;

    invoke-direct {v1, p3}, Lcom/mongodb/MongoOptions;-><init>(Lcom/mongodb/MongoClientOptions;)V

    invoke-direct {p0, v0, v1}, Lcom/mongodb/Mongo;-><init>(Lcom/mongodb/MongoAuthority;Lcom/mongodb/MongoOptions;)V

    .line 253
    iput-object p3, p0, Lcom/mongodb/MongoClient;->options:Lcom/mongodb/MongoClientOptions;

    .line 254
    return-void
.end method


# virtual methods
.method public getCredentialsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/MongoCredential;",
            ">;"
        }
    .end annotation

    .prologue
    .line 279
    invoke-virtual {p0}, Lcom/mongodb/MongoClient;->getAuthority()Lcom/mongodb/MongoAuthority;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoAuthority;->getCredentialsStore()Lcom/mongodb/MongoCredentialsStore;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/MongoCredentialsStore;->asList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMongoClientOptions()Lcom/mongodb/MongoClientOptions;
    .locals 1

    .prologue
    .line 283
    iget-object v0, p0, Lcom/mongodb/MongoClient;->options:Lcom/mongodb/MongoClientOptions;

    return-object v0
.end method
