.class abstract Lcom/mongodb/DBPort$SaslAuthenticator;
.super Lcom/mongodb/DBPort$Authenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "SaslAuthenticator"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 0
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    .line 557
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$Authenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 558
    return-void
.end method

.method private sendSaslContinue(I[B)Lcom/mongodb/CommandResult;
    .locals 5
    .param p1, "conversationId"    # I
    .param p2, "outToken"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getDatabase()Lcom/mongodb/DB;

    move-result-object v0

    .line 606
    .local v0, "adminDB":Lcom/mongodb/DB;
    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v3, "saslContinue"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v3, "conversationId"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v2

    const-string/jumbo v3, "payload"

    invoke-virtual {v2, v3, p2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v1

    .line 608
    .local v1, "cmd":Lcom/mongodb/DBObject;
    iget-object v2, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v2, v0, v1}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v2

    return-object v2
.end method

.method private sendSaslStart([B)Lcom/mongodb/CommandResult;
    .locals 4
    .param p1, "outToken"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 598
    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "saslStart"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v2, "mechanism"

    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getMechanismName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v1

    const-string/jumbo v2, "payload"

    if-eqz p1, :cond_0

    .end local p1    # "outToken":[B
    :goto_0
    invoke-virtual {v1, v2, p1}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    move-result-object v0

    .line 601
    .local v0, "cmd":Lcom/mongodb/DBObject;
    iget-object v1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->getDatabase()Lcom/mongodb/DB;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/mongodb/DBPort;->runCommand(Lcom/mongodb/DB;Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    return-object v1

    .line 598
    .end local v0    # "cmd":Lcom/mongodb/DBObject;
    .restart local p1    # "outToken":[B
    :cond_0
    const/4 v3, 0x0

    new-array p1, v3, [B

    goto :goto_0
.end method


# virtual methods
.method public authenticate()Lcom/mongodb/CommandResult;
    .locals 7

    .prologue
    .line 561
    invoke-virtual {p0}, Lcom/mongodb/DBPort$SaslAuthenticator;->createSaslClient()Ljavax/security/sasl/SaslClient;

    move-result-object v4

    .line 563
    .local v4, "saslClient":Ljavax/security/sasl/SaslClient;
    :try_start_0
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->hasInitialResponse()Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x0

    new-array v5, v5, [B

    invoke-interface {v4, v5}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v3

    .line 564
    .local v3, "response":[B
    :goto_0
    invoke-direct {p0, v3}, Lcom/mongodb/DBPort$SaslAuthenticator;->sendSaslStart([B)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 565
    .local v2, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 567
    const-string/jumbo v5, "conversationId"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 569
    .local v0, "conversationId":I
    :goto_1
    const-string/jumbo v5, "done"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_2

    .line 570
    const-string/jumbo v5, "payload"

    invoke-virtual {v2, v5}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    check-cast v5, [B

    invoke-interface {v4, v5}, Ljavax/security/sasl/SaslClient;->evaluateChallenge([B)[B

    move-result-object v3

    .line 572
    if-nez v3, :cond_1

    .line 573
    new-instance v5, Lcom/mongodb/MongoException;

    const-string/jumbo v6, "SASL protocol error: no client response to challenge"

    invoke-direct {v5, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 580
    .end local v0    # "conversationId":I
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    .end local v3    # "response":[B
    :catch_0
    move-exception v1

    .line 581
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v5, Lcom/mongodb/MongoException$Network;

    const-string/jumbo v6, "IOException authenticating the connection"

    invoke-direct {v5, v6, v1}, Lcom/mongodb/MongoException$Network;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 583
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 584
    :try_start_2
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->dispose()V
    :try_end_2
    .catch Ljavax/security/sasl/SaslException; {:try_start_2 .. :try_end_2} :catch_2

    .line 587
    :goto_2
    throw v5

    .line 563
    :cond_0
    const/4 v3, 0x0

    goto :goto_0

    .line 576
    .restart local v0    # "conversationId":I
    .restart local v2    # "res":Lcom/mongodb/CommandResult;
    .restart local v3    # "response":[B
    :cond_1
    :try_start_3
    invoke-direct {p0, v0, v3}, Lcom/mongodb/DBPort$SaslAuthenticator;->sendSaslContinue(I[B)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 577
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 584
    :cond_2
    :try_start_4
    invoke-interface {v4}, Ljavax/security/sasl/SaslClient;->dispose()V
    :try_end_4
    .catch Ljavax/security/sasl/SaslException; {:try_start_4 .. :try_end_4} :catch_1

    .line 587
    :goto_3
    return-object v2

    .line 585
    :catch_1
    move-exception v5

    goto :goto_3

    .end local v0    # "conversationId":I
    .end local v2    # "res":Lcom/mongodb/CommandResult;
    .end local v3    # "response":[B
    :catch_2
    move-exception v6

    goto :goto_2
.end method

.method protected abstract createSaslClient()Ljavax/security/sasl/SaslClient;
.end method

.method protected getDatabase()Lcom/mongodb/DB;
    .locals 2

    .prologue
    .line 594
    iget-object v0, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->mongo:Lcom/mongodb/Mongo;

    iget-object v1, p0, Lcom/mongodb/DBPort$SaslAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredential;->getSource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/Mongo;->getDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v0

    return-object v0
.end method

.method public abstract getMechanismName()Ljava/lang/String;
.end method
