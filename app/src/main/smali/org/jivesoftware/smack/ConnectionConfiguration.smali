.class public Lorg/jivesoftware/smack/ConnectionConfiguration;
.super Ljava/lang/Object;
.source "ConnectionConfiguration.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;
    }
.end annotation


# instance fields
.field private callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

.field private compressionEnabled:Z

.field private customSSLContext:Ljavax/net/ssl/SSLContext;

.field private debuggerEnabled:Z

.field private expiredCertificatesCheckEnabled:Z

.field private host:Ljava/lang/String;

.field protected hostAddresses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation
.end field

.field private keystorePath:Ljava/lang/String;

.field private keystoreType:Ljava/lang/String;

.field private notMatchingDomainCheckEnabled:Z

.field private password:Ljava/lang/String;

.field private pkcs11Library:Ljava/lang/String;

.field private port:I

.field protected proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

.field private reconnectionAllowed:Z

.field private resource:Ljava/lang/String;

.field private rosterLoadedAtLogin:Z

.field private saslAuthenticationEnabled:Z

.field private securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

.field private selfSignedCertificateEnabled:Z

.field private sendPresence:Z

.field private serviceName:Ljava/lang/String;

.field private socketFactory:Ljavax/net/SocketFactory;

.field private truststorePassword:Ljava/lang/String;

.field private truststorePath:Ljava/lang/String;

.field private truststoreType:Ljava/lang/String;

.field private username:Ljava/lang/String;

.field private verifyChainEnabled:Z

.field private verifyRootCAEnabled:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 106
    invoke-static {p1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveXMPPDomain(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->hostAddresses:Ljava/util/List;

    .line 107
    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 108
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 172
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->initHostAddresses(Ljava/lang/String;I)V

    .line 173
    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 174
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 140
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->initHostAddresses(Ljava/lang/String;I)V

    .line 141
    invoke-static {}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->forDefaultProxy()Lorg/jivesoftware/smack/proxy/ProxyInfo;

    move-result-object v0

    invoke-virtual {p0, p3, v0}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "serviceName"    # Ljava/lang/String;
    .param p4, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 160
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->initHostAddresses(Ljava/lang/String;I)V

    .line 161
    invoke-virtual {p0, p3, p4}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 162
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 185
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->initHostAddresses(Ljava/lang/String;I)V

    .line 186
    invoke-virtual {p0, p1, p3}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 187
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .locals 2
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 64
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 65
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 66
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 67
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 70
    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 72
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 78
    sget-boolean v0, Lorg/jivesoftware/smack/Connection;->DEBUG_ENABLED:Z

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 81
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 90
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 91
    iput-boolean v1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 92
    sget-object v0, Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;->enabled:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 121
    invoke-static {p1}, Lorg/jivesoftware/smack/util/DNSUtil;->resolveXMPPDomain(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->hostAddresses:Ljava/util/List;

    .line 122
    invoke-virtual {p0, p1, p2}, Lorg/jivesoftware/smack/ConnectionConfiguration;->init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V

    .line 123
    return-void
.end method

.method private initHostAddresses(Ljava/lang/String;I)V
    .locals 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 762
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->hostAddresses:Ljava/util/List;

    .line 765
    :try_start_0
    new-instance v1, Lorg/jivesoftware/smack/util/dns/HostAddress;

    invoke-direct {v1, p1, p2}, Lorg/jivesoftware/smack/util/dns/HostAddress;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 769
    .local v1, "hostAddress":Lorg/jivesoftware/smack/util/dns/HostAddress;
    iget-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->hostAddresses:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 770
    return-void

    .line 766
    .end local v1    # "hostAddress":Lorg/jivesoftware/smack/util/dns/HostAddress;
    :catch_0
    move-exception v0

    .line 767
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public getCallbackHandler()Ljavax/security/auth/callback/CallbackHandler;
    .locals 1

    .prologue
    .line 662
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

    return-object v0
.end method

.method public getCustomSSLContext()Ljavax/net/ssl/SSLContext;
    .locals 1

    .prologue
    .line 508
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->customSSLContext:Ljavax/net/ssl/SSLContext;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getHostAddresses()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/util/dns/HostAddress;",
            ">;"
        }
    .end annotation

    .prologue
    .line 689
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->hostAddresses:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getKeystorePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 345
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    return-object v0
.end method

.method public getKeystoreType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    return-object v0
.end method

.method public getPKCS11Library()Ljava/lang/String;
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    return-object v0
.end method

.method getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 734
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 249
    iget v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->port:I

    return v0
.end method

.method getResource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 743
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->resource:Ljava/lang/String;

    return-object v0
.end method

.method public getSecurityMode()Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;
    .locals 1

    .prologue
    .line 264
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    return-object v0
.end method

.method public getSocketFactory()Ljavax/net/SocketFactory;
    .locals 1

    .prologue
    .line 685
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    return-object v0
.end method

.method public getTruststorePassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    return-object v0
.end method

.method public getTruststorePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    return-object v0
.end method

.method public getTruststoreType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 305
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    return-object v0
.end method

.method getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 725
    iget-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->username:Ljava/lang/String;

    return-object v0
.end method

.method protected init(Ljava/lang/String;Lorg/jivesoftware/smack/proxy/ProxyInfo;)V
    .locals 4
    .param p1, "serviceName"    # Ljava/lang/String;
    .param p2, "proxy"    # Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    .line 191
    iput-object p2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->proxy:Lorg/jivesoftware/smack/proxy/ProxyInfo;

    .line 195
    const-string/jumbo v2, "java.home"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "javaHome":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "lib"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "security"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "cacerts"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    .line 202
    const-string/jumbo v2, "jks"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    .line 204
    const-string/jumbo v2, "changeit"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    .line 205
    const-string/jumbo v2, "javax.net.ssl.keyStore"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    .line 206
    const-string/jumbo v2, "jks"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    .line 207
    const-string/jumbo v2, "pkcs11.config"

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    .line 210
    invoke-virtual {p2}, Lorg/jivesoftware/smack/proxy/ProxyInfo;->getSocketFactory()Ljavax/net/SocketFactory;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    .line 211
    return-void
.end method

.method public isCompressionEnabled()Z
    .locals 1

    .prologue
    .line 530
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    return v0
.end method

.method public isDebuggerEnabled()Z
    .locals 1

    .prologue
    .line 576
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    return v0
.end method

.method public isExpiredCertificatesCheckEnabled()Z
    .locals 1

    .prologue
    .line 466
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    return v0
.end method

.method public isNotMatchingDomainCheckEnabled()Z
    .locals 1

    .prologue
    .line 488
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    return v0
.end method

.method public isReconnectionAllowed()Z
    .locals 1

    .prologue
    .line 605
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    return v0
.end method

.method public isRosterLoadedAtLogin()Z
    .locals 1

    .prologue
    .line 638
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    return v0
.end method

.method public isSASLAuthenticationEnabled()Z
    .locals 1

    .prologue
    .line 554
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    return v0
.end method

.method public isSelfSignedCertificateEnabled()Z
    .locals 1

    .prologue
    .line 445
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    return v0
.end method

.method isSendPresence()Z
    .locals 1

    .prologue
    .line 752
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    return v0
.end method

.method public isVerifyChainEnabled()Z
    .locals 1

    .prologue
    .line 406
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    return v0
.end method

.method public isVerifyRootCAEnabled()Z
    .locals 1

    .prologue
    .line 426
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    return v0
.end method

.method public setCallbackHandler(Ljavax/security/auth/callback/CallbackHandler;)V
    .locals 0
    .param p1, "callbackHandler"    # Ljavax/security/auth/callback/CallbackHandler;

    .prologue
    .line 675
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->callbackHandler:Ljavax/security/auth/callback/CallbackHandler;

    .line 676
    return-void
.end method

.method public setCompressionEnabled(Z)V
    .locals 0
    .param p1, "compressionEnabled"    # Z

    .prologue
    .line 542
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->compressionEnabled:Z

    .line 543
    return-void
.end method

.method public setCustomSSLContext(Ljavax/net/ssl/SSLContext;)V
    .locals 0
    .param p1, "context"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 518
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->customSSLContext:Ljavax/net/ssl/SSLContext;

    .line 519
    return-void
.end method

.method public setDebuggerEnabled(Z)V
    .locals 0
    .param p1, "debuggerEnabled"    # Z

    .prologue
    .line 586
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->debuggerEnabled:Z

    .line 587
    return-void
.end method

.method public setExpiredCertificatesCheckEnabled(Z)V
    .locals 0
    .param p1, "expiredCertificatesCheckEnabled"    # Z

    .prologue
    .line 477
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->expiredCertificatesCheckEnabled:Z

    .line 478
    return-void
.end method

.method public setKeystorePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "keystorePath"    # Ljava/lang/String;

    .prologue
    .line 356
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystorePath:Ljava/lang/String;

    .line 357
    return-void
.end method

.method public setKeystoreType(Ljava/lang/String;)V
    .locals 0
    .param p1, "keystoreType"    # Ljava/lang/String;

    .prologue
    .line 374
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->keystoreType:Ljava/lang/String;

    .line 375
    return-void
.end method

.method setLoginInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "resource"    # Ljava/lang/String;

    .prologue
    .line 756
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->username:Ljava/lang/String;

    .line 757
    iput-object p2, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->password:Ljava/lang/String;

    .line 758
    iput-object p3, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->resource:Ljava/lang/String;

    .line 759
    return-void
.end method

.method public setNotMatchingDomainCheckEnabled(Z)V
    .locals 0
    .param p1, "notMatchingDomainCheckEnabled"    # Z

    .prologue
    .line 499
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->notMatchingDomainCheckEnabled:Z

    .line 500
    return-void
.end method

.method public setPKCS11Library(Ljava/lang/String;)V
    .locals 0
    .param p1, "pkcs11Library"    # Ljava/lang/String;

    .prologue
    .line 395
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->pkcs11Library:Ljava/lang/String;

    .line 396
    return-void
.end method

.method public setReconnectionAllowed(Z)V
    .locals 0
    .param p1, "isAllowed"    # Z

    .prologue
    .line 596
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->reconnectionAllowed:Z

    .line 597
    return-void
.end method

.method public setRosterLoadedAtLogin(Z)V
    .locals 0
    .param p1, "rosterLoadedAtLogin"    # Z

    .prologue
    .line 649
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->rosterLoadedAtLogin:Z

    .line 650
    return-void
.end method

.method public setSASLAuthenticationEnabled(Z)V
    .locals 0
    .param p1, "saslAuthenticationEnabled"    # Z

    .prologue
    .line 566
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->saslAuthenticationEnabled:Z

    .line 567
    return-void
.end method

.method public setSecurityMode(Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;)V
    .locals 0
    .param p1, "securityMode"    # Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .prologue
    .line 274
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->securityMode:Lorg/jivesoftware/smack/ConnectionConfiguration$SecurityMode;

    .line 275
    return-void
.end method

.method public setSelfSignedCertificateEnabled(Z)V
    .locals 0
    .param p1, "selfSignedCertificateEnabled"    # Z

    .prologue
    .line 455
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->selfSignedCertificateEnabled:Z

    .line 456
    return-void
.end method

.method public setSendPresence(Z)V
    .locals 0
    .param p1, "sendPresence"    # Z

    .prologue
    .line 627
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->sendPresence:Z

    .line 628
    return-void
.end method

.method public setServiceName(Ljava/lang/String;)V
    .locals 0
    .param p1, "serviceName"    # Ljava/lang/String;

    .prologue
    .line 219
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->serviceName:Ljava/lang/String;

    .line 220
    return-void
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)V
    .locals 0
    .param p1, "socketFactory"    # Ljavax/net/SocketFactory;

    .prologue
    .line 615
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->socketFactory:Ljavax/net/SocketFactory;

    .line 616
    return-void
.end method

.method public setTruststorePassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "truststorePassword"    # Ljava/lang/String;

    .prologue
    .line 334
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePassword:Ljava/lang/String;

    .line 335
    return-void
.end method

.method public setTruststorePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "truststorePath"    # Ljava/lang/String;

    .prologue
    .line 296
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststorePath:Ljava/lang/String;

    .line 297
    return-void
.end method

.method public setTruststoreType(Ljava/lang/String;)V
    .locals 0
    .param p1, "truststoreType"    # Ljava/lang/String;

    .prologue
    .line 314
    iput-object p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->truststoreType:Ljava/lang/String;

    .line 315
    return-void
.end method

.method public setUsedHostAddress(Lorg/jivesoftware/smack/util/dns/HostAddress;)V
    .locals 1
    .param p1, "hostAddress"    # Lorg/jivesoftware/smack/util/dns/HostAddress;

    .prologue
    .line 253
    invoke-virtual {p1}, Lorg/jivesoftware/smack/util/dns/HostAddress;->getFQDN()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->host:Ljava/lang/String;

    .line 254
    invoke-virtual {p1}, Lorg/jivesoftware/smack/util/dns/HostAddress;->getPort()I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->port:I

    .line 255
    return-void
.end method

.method public setVerifyChainEnabled(Z)V
    .locals 0
    .param p1, "verifyChainEnabled"    # Z

    .prologue
    .line 417
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyChainEnabled:Z

    .line 418
    return-void
.end method

.method public setVerifyRootCAEnabled(Z)V
    .locals 0
    .param p1, "verifyRootCAEnabled"    # Z

    .prologue
    .line 435
    iput-boolean p1, p0, Lorg/jivesoftware/smack/ConnectionConfiguration;->verifyRootCAEnabled:Z

    .line 436
    return-void
.end method
