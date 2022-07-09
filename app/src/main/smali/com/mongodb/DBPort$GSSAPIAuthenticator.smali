.class Lcom/mongodb/DBPort$GSSAPIAuthenticator;
.super Lcom/mongodb/DBPort$SaslAuthenticator;
.source "DBPort.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPort;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GSSAPIAuthenticator"
.end annotation


# static fields
.field public static final CANONICALIZE_HOST_NAME_KEY:Ljava/lang/String; = "CANONICALIZE_HOST_NAME"

.field public static final GSSAPI_MECHANISM:Ljava/lang/String; = "GSSAPI"

.field public static final GSSAPI_OID:Ljava/lang/String; = "1.2.840.113554.1.2.2"

.field public static final SERVICE_NAME_DEFAULT_VALUE:Ljava/lang/String; = "mongodb"

.field public static final SERVICE_NAME_KEY:Ljava/lang/String; = "SERVICE_NAME"


# instance fields
.field final synthetic this$0:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V
    .locals 3
    .param p2, "mongo"    # Lcom/mongodb/Mongo;
    .param p3, "credentials"    # Lcom/mongodb/MongoCredential;

    .prologue
    .line 508
    iput-object p1, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->this$0:Lcom/mongodb/DBPort;

    .line 509
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/DBPort$SaslAuthenticator;-><init>(Lcom/mongodb/DBPort;Lcom/mongodb/Mongo;Lcom/mongodb/MongoCredential;)V

    .line 511
    iget-object v0, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v0}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "GSSAPI"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 512
    new-instance v0, Lcom/mongodb/MongoException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Incorrect mechanism: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v2}, Lcom/mongodb/MongoCredential;->getMechanism()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 514
    :cond_0
    return-void
.end method

.method private getGSSCredential(Ljava/lang/String;)Lorg/ietf/jgss/GSSCredential;
    .locals 5
    .param p1, "userName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ietf/jgss/GSSException;
        }
    .end annotation

    .prologue
    .line 546
    new-instance v0, Lorg/ietf/jgss/Oid;

    const-string/jumbo v3, "1.2.840.113554.1.2.2"

    invoke-direct {v0, v3}, Lorg/ietf/jgss/Oid;-><init>(Ljava/lang/String;)V

    .line 547
    .local v0, "krb5Mechanism":Lorg/ietf/jgss/Oid;
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;

    move-result-object v1

    .line 548
    .local v1, "manager":Lorg/ietf/jgss/GSSManager;
    sget-object v3, Lorg/ietf/jgss/GSSName;->NT_USER_NAME:Lorg/ietf/jgss/Oid;

    invoke-virtual {v1, p1, v3}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v2

    .line 549
    .local v2, "name":Lorg/ietf/jgss/GSSName;
    const v3, 0x7fffffff

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v0, v4}, Lorg/ietf/jgss/GSSManager;->createCredential(Lorg/ietf/jgss/GSSName;ILorg/ietf/jgss/Oid;I)Lorg/ietf/jgss/GSSCredential;

    move-result-object v3

    return-object v3
.end method

.method private getHostName()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 540
    iget-object v0, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    const-string/jumbo v1, "CANONICALIZE_HOST_NAME"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/mongodb/MongoCredential;->getMechanismProperty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v0}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getCanonicalHostName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v0}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected createSaslClient()Ljavax/security/sasl/SaslClient;
    .locals 7

    .prologue
    .line 519
    :try_start_0
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 520
    .local v4, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v0, "javax.security.sasl.credentials"

    iget-object v1, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->getGSSCredential(Ljava/lang/String;)Lorg/ietf/jgss/GSSCredential;

    move-result-object v1

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 522
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "GSSAPI"

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    invoke-virtual {v1}, Lcom/mongodb/MongoCredential;->getUserName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->credential:Lcom/mongodb/MongoCredential;

    const-string/jumbo v3, "SERVICE_NAME"

    const-string/jumbo v5, "mongodb"

    invoke-virtual {v2, v3, v5}, Lcom/mongodb/MongoCredential;->getMechanismProperty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0}, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->getHostName()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Ljavax/security/sasl/Sasl;->createSaslClient([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljavax/security/auth/callback/CallbackHandler;)Ljavax/security/sasl/SaslClient;
    :try_end_0
    .catch Ljavax/security/sasl/SaslException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v0

    return-object v0

    .line 525
    .end local v4    # "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_0
    move-exception v6

    .line 526
    .local v6, "e":Ljavax/security/sasl/SaslException;
    new-instance v0, Lcom/mongodb/MongoException;

    const-string/jumbo v1, "Exception initializing SASL client"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 527
    .end local v6    # "e":Ljavax/security/sasl/SaslException;
    :catch_1
    move-exception v6

    .line 528
    .local v6, "e":Lorg/ietf/jgss/GSSException;
    new-instance v0, Lcom/mongodb/MongoException;

    const-string/jumbo v1, "Exception initializing GSSAPI credentials"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 529
    .end local v6    # "e":Lorg/ietf/jgss/GSSException;
    :catch_2
    move-exception v6

    .line 530
    .local v6, "e":Ljava/net/UnknownHostException;
    new-instance v0, Lcom/mongodb/MongoException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown host "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/DBPort$GSSAPIAuthenticator;->this$0:Lcom/mongodb/DBPort;

    invoke-virtual {v2}, Lcom/mongodb/DBPort;->serverAddress()Lcom/mongodb/ServerAddress;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/ServerAddress;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, v6}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public getMechanismName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 536
    const-string/jumbo v0, "GSSAPI"

    return-object v0
.end method
