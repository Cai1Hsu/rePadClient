.class Lcom/mongodb/DBPort$NativeAuthenticator;
.super Lcom/mongodb/DBPort$Authenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NativeAuthenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 0
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 639
    iput-object p1, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->this$0:Lcom/mongodb/DBPort;

    .line 640
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$Authenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 641
    return-void
.end method


# virtual methods
.method public authenticate()Lcom/mongodb/CommandResult;
    .locals 7

    .prologue
    .line 646
    :try_start_0
    iget-object v3, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->mongo:Lcom/mongodb/Mongo;

    iget-object v4, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v4}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    .line 647
    .local v0, "db":Lcom/mongodb/DB;
    iget-object v3, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-static {}, Lcom/mongodb/NativeAuthenticationHelper;->getNonceCommand()Lcom/mongodb/BasicDBObject;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 648
    .local v2, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 650
    iget-object v3, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->this$0:Lcom/mongodb/DBPort;

    iget-object v4, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v4}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/mongodb/DBPort$NativeAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v5}, Lcom/mongodb/MongoCredential;->getPassword()[C

    move-result-object v5

    const-string/jumbo v6, "nonce"

    invoke-virtual {v2, v6}, Lcom/mongodb/CommandResult;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/mongodb/NativeAuthenticationHelper;->getAuthCommand(Ljava/lang/String;[CLjava/lang/String;)Lcom/mongodb/DBObject;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 652
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 653
    return-object v2

    .line 654
    .end local v0    # "db":Lcom/mongodb/DB;
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    :catch_0
    move-exception v1

    .line 655
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lcom/mongodb/MongoException$Network;

    const-string/jumbo v4, "IOException authenticating the connection"

    invoke-direct {v3, v4, v1}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v3
.end method
