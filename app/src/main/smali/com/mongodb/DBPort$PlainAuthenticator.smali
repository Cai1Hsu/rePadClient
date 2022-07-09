.class Lcom/mongodb/DBPort$PlainAuthenticator;
.super Lcom/mongodb/DBPort$SaslAuthenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PlainAuthenticator"
.end annotation


# static fields
.field private static final DEFAULT_PROTOCOL:Ljava/lang/String; = "mongodb"

.field private static final MECHANISM:Ljava/lang/String; = "PLAIN"


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 0
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/mongodb/DBPort$PlainAuthenticator;->this$0:Lcom/mongodb/DBPort;

    .line 470
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$SaslAuthenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 471
    return-void
.end method


# virtual methods
.method protected createSaslClient()Ljavax/security/sasl/SaslClient;
    .locals 7

    .prologue
    .line 476
    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "PLAIN"

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/mongodb/DBPort$PlainAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "mongodb"

    iget-object v3, p0, Lcom/mongodb/DBPort$PlainAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v3}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    new-instance v5, Lcom/mongodb/DBPort$PlainAuthenticator$1;

    invoke-direct {v5, p0}, Lcom/mongodb/DBPort$PlainAuthenticator$1;-><init>(Lcom/mongodb/DBPort$PlainAuthenticator;)V

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;
    :try_end_0
    .catch Ljavax/security/sasl/SaslException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    .line 490
    :catch_0
    move-exception v6

    .line 491
    .local v6, "e":Ljavax/security/sasl/SaslException;
    new-instance v0, Lcom/mongodb/MongoException;

    const-string/jumbo v1, "Exception initializing SASL client"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getMechanismName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 497
    const-string/jumbo v0, "PLAIN"

    return-object v0
.end method
