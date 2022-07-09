.class Lcom/mongodb/DBPort$X509Authenticator;
.super Lcom/mongodb/DBPort$Authenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "X509Authenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 0
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credential"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 615
    iput-object p1, p0, Lcom/mongodb/DBPort$X509Authenticator;->this$0:Lcom/mongodb/DBPort;

    .line 616
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$Authenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 617
    return-void
.end method

.method private getAuthCommand()Lcom/mongodb/DBObject;
    .locals 3

    .prologue
    .line 632
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "authenticate"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "user"

    iget-object v2, p0, Lcom/mongodb/DBPort$X509Authenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v2}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    const-string/jumbo v1, "mechanism"

    const-string/jumbo v2, "MONGODB-X509"

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method authenticate()Lcom/mongodb/CommandResult;
    .locals 5

    .prologue
    .line 622
    :try_start_0
    iget-object v3, p0, Lcom/mongodb/DBPort$X509Authenticator;->mongo:Lcom/mongodb/Mongo;

    iget-object v4, p0, Lcom/mongodb/DBPort$X509Authenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v4}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    .line 623
    .local v0, "db":Lcom/mongodb/DB;
    iget-object v3, p0, Lcom/mongodb/DBPort$X509Authenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-direct {p0}, Lcom/mongodb/DBPort$X509Authenticator;->getAuthCommand()Lcom/mongodb/DBObject;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 624
    .local v2, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 625
    return-object v2

    .line 626
    .end local v0    # "db":Lcom/mongodb/DB;
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    :catch_0
    move-exception v1

    .line 627
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/mongodb/MongoException$Network;

    const-string/jumbo v4, "IOException authenticating the connection"

    invoke-direct {v3, v4, v1}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v3
.end method
