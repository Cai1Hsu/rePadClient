.class Lorg/jivesoftware/smack/ServerTrustManager;
.super Ljava/lang/Object;
.source "ServerTrustManager.java"

# interfaces
.implements Ljavax/net/ssl/X509TrustManager;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;
    }
.end annotation


# static fields
.field private static cnPattern:Ljava/util/regex/Pattern;

.field private static stores:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;",
            "Ljava/security/KeyStore;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

.field private server:Ljava/lang/String;

.field private trustStore:Ljava/security/KeyStore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    const-string/jumbo v0, "(?i)(cn=)([^,]*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smack/ServerTrustManager;->cnPattern:Ljava/util/regex/Pattern;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smack/ServerTrustManager;->stores:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/ConnectionConfiguration;)V
    .locals 8
    .param p1, "server"    # Ljava/lang/String;
    .param p2, "configuration"    # Lorg/jivesoftware/smack/ConnectionConfiguration;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p2, p0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    .line 59
    iput-object p1, p0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    .line 61
    const/4 v1, 0x0

    .line 62
    .local v1, "in":Ljava/io/InputStream;
    sget-object v5, Lorg/jivesoftware/smack/ServerTrustManager;->stores:Ljava/util/Map;

    monitor-enter v5

    .line 63
    :try_start_0
    new-instance v3, Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststoreType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->getTruststorePassword()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v4, v6, v7}, Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v3, "options":Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;
    sget-object v4, Lorg/jivesoftware/smack/ServerTrustManager;->stores:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 66
    sget-object v4, Lorg/jivesoftware/smack/ServerTrustManager;->stores:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/KeyStore;

    iput-object v4, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    .line 86
    :goto_0
    iget-object v4, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    if-nez v4, :cond_0

    .line 88
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->setVerifyRootCAEnabled(Z)V

    .line 89
    :cond_0
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    return-void

    .line 69
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    .line 70
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    .end local v1    # "in":Ljava/io/InputStream;
    .local v2, "in":Ljava/io/InputStream;
    :try_start_2
    iget-object v4, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;->getPassword()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 76
    if-eqz v2, :cond_4

    .line 78
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v1, v2

    .line 84
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :cond_2
    :goto_1
    :try_start_4
    sget-object v4, Lorg/jivesoftware/smack/ServerTrustManager;->stores:Ljava/util/Map;

    iget-object v6, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 89
    .end local v3    # "options":Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;
    :catchall_0
    move-exception v4

    :goto_2
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .line 79
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    .restart local v3    # "options":Lorg/jivesoftware/smack/ServerTrustManager$KeyStoreOptions;
    :catch_0
    move-exception v4

    move-object v1, v2

    .line 81
    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_1

    .line 72
    :catch_1
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    :goto_3
    const/4 v4, 0x0

    :try_start_5
    iput-object v4, p0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    .line 74
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 76
    if-eqz v1, :cond_2

    .line 78
    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 79
    :catch_2
    move-exception v4

    goto :goto_1

    .line 76
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_1
    move-exception v4

    :goto_4
    if-eqz v1, :cond_3

    .line 78
    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 81
    :cond_3
    :goto_5
    :try_start_8
    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 79
    :catch_3
    move-exception v6

    goto :goto_5

    .line 89
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_2
    move-exception v4

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_2

    .line 76
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_3
    move-exception v4

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_4

    .line 72
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_3

    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v2    # "in":Ljava/io/InputStream;
    :cond_4
    move-object v1, v2

    .end local v2    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    goto :goto_1
.end method

.method public static getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/util/List;
    .locals 4
    .param p0, "x509Certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    invoke-static {p0}, Lorg/jivesoftware/smack/ServerTrustManager;->getSubjectAlternativeNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v2

    .line 204
    .local v2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 205
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "name":Ljava/lang/String;
    sget-object v3, Lorg/jivesoftware/smack/ServerTrustManager;->cnPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 207
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 211
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 212
    .restart local v2    # "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 214
    .end local v0    # "matcher":Ljava/util/regex/Matcher;
    .end local v1    # "name":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method private static getSubjectAlternativeNames(Ljava/security/cert/X509Certificate;)Ljava/util/List;
    .locals 3
    .param p0, "certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/cert/X509Certificate;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v2, "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSubjectAlternativeNames()Ljava/util/Collection;

    move-result-object v0

    .line 230
    .local v0, "altNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    if-nez v0, :cond_0

    .line 231
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_0
    .catch Ljava/security/cert/CertificateParsingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 266
    .end local v0    # "altNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/util/List<*>;>;"
    .end local v2    # "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    return-object v2

    .line 263
    .restart local v2    # "identities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 264
    .local v1, "e":Ljava/security/cert/CertificateParsingException;
    invoke-virtual {v1}, Ljava/security/cert/CertificateParsingException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public checkClientTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 0
    .param p1, "arg0"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 98
    return-void
.end method

.method public checkServerTrusted([Ljava/security/cert/X509Certificate;Ljava/lang/String;)V
    .locals 17
    .param p1, "x509Certificates"    # [Ljava/security/cert/X509Certificate;
    .param p2, "arg1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .prologue
    .line 103
    move-object/from16 v0, p1

    array-length v5, v0

    .line 105
    .local v5, "nSize":I
    const/4 v14, 0x0

    aget-object v14, p1, v14

    invoke-static {v14}, Lorg/jivesoftware/smack/ServerTrustManager;->getPeerIdentity(Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v6

    .line 107
    .local v6, "peerIdentities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyChainEnabled()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 111
    const/4 v9, 0x0

    .line 112
    .local v9, "principalLast":Ljava/security/Principal;
    add-int/lit8 v4, v5, -0x1

    .local v4, "i":I
    :goto_0
    if-ltz v4, :cond_2

    .line 113
    aget-object v13, p1, v4

    .line 114
    .local v13, "x509certificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v8

    .line 115
    .local v8, "principalIssuer":Ljava/security/Principal;
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v10

    .line 116
    .local v10, "principalSubject":Ljava/security/Principal;
    if-eqz v9, :cond_0

    .line 117
    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 119
    add-int/lit8 v14, v4, 0x1

    :try_start_0
    aget-object v14, p1, v14

    invoke-virtual {v14}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v11

    .line 121
    .local v11, "publickey":Ljava/security/PublicKey;
    aget-object v14, p1, v4

    invoke-virtual {v14, v11}, Ljava/security/cert/X509Certificate;->verify(Ljava/security/PublicKey;)V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    .end local v11    # "publickey":Ljava/security/PublicKey;
    :cond_0
    move-object v9, v10

    .line 112
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 123
    :catch_0
    move-exception v3

    .line 124
    .local v3, "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "signature verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 129
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    :cond_1
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "subject/issuer verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 137
    .end local v4    # "i":I
    .end local v8    # "principalIssuer":Ljava/security/Principal;
    .end local v9    # "principalLast":Ljava/security/Principal;
    .end local v10    # "principalSubject":Ljava/security/Principal;
    .end local v13    # "x509certificate":Ljava/security/cert/X509Certificate;
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isVerifyRootCAEnabled()Z

    move-result v14

    if-eqz v14, :cond_5

    .line 140
    const/4 v12, 0x0

    .line 142
    .local v12, "trusted":Z
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->trustStore:Ljava/security/KeyStore;

    add-int/lit8 v15, v5, -0x1

    aget-object v15, p1, v15

    invoke-virtual {v14, v15}, Ljava/security/KeyStore;->getCertificateAlias(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_4

    const/4 v12, 0x1

    .line 143
    :goto_1
    if-nez v12, :cond_3

    const/4 v14, 0x1

    if-ne v5, v14, :cond_3

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isSelfSignedCertificateEnabled()Z

    move-result v14

    if-eqz v14, :cond_3

    .line 145
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Accepting self-signed certificate of remote server: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_1

    .line 147
    const/4 v12, 0x1

    .line 153
    :cond_3
    :goto_2
    if-nez v12, :cond_5

    .line 154
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "root certificate not trusted of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 142
    :cond_4
    const/4 v12, 0x0

    goto :goto_1

    .line 150
    :catch_1
    move-exception v2

    .line 151
    .local v2, "e":Ljava/security/KeyStoreException;
    invoke-virtual {v2}, Ljava/security/KeyStoreException;->printStackTrace()V

    goto :goto_2

    .line 158
    .end local v2    # "e":Ljava/security/KeyStoreException;
    .end local v12    # "trusted":Z
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isNotMatchingDomainCheckEnabled()Z

    move-result v14

    if-eqz v14, :cond_7

    .line 162
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v14

    const/4 v15, 0x1

    if-ne v14, v15, :cond_6

    const/4 v14, 0x0

    invoke-interface {v6, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string/jumbo v15, "*."

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 164
    const/4 v14, 0x0

    invoke-interface {v6, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    const-string/jumbo v15, "*."

    const-string/jumbo v16, ""

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    .line 166
    .local v7, "peerIdentity":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    invoke-virtual {v14, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 167
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "target verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 170
    .end local v7    # "peerIdentity":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    invoke-interface {v6, v14}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 171
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "target verification failed of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 175
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jivesoftware/smack/ServerTrustManager;->configuration:Lorg/jivesoftware/smack/ConnectionConfiguration;

    invoke-virtual {v14}, Lorg/jivesoftware/smack/ConnectionConfiguration;->isExpiredCertificatesCheckEnabled()Z

    move-result v14

    if-eqz v14, :cond_8

    .line 178
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 179
    .local v1, "date":Ljava/util/Date;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_3
    if-ge v4, v5, :cond_8

    .line 181
    :try_start_2
    aget-object v14, p1, v4

    invoke-virtual {v14, v1}, Ljava/security/cert/X509Certificate;->checkValidity(Ljava/util/Date;)V
    :try_end_2
    .catch Ljava/security/GeneralSecurityException; {:try_start_2 .. :try_end_2} :catch_2

    .line 179
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 183
    :catch_2
    move-exception v3

    .line 184
    .restart local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    new-instance v14, Ljava/security/cert/CertificateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "invalid date of "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smack/ServerTrustManager;->server:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 189
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "generalsecurityexception":Ljava/security/GeneralSecurityException;
    .end local v4    # "i":I
    :cond_8
    return-void
.end method

.method public getAcceptedIssuers()[Ljava/security/cert/X509Certificate;
    .locals 1

    .prologue
    .line 93
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/security/cert/X509Certificate;

    return-object v0
.end method
