.class public Lorg/apache/commons/net/ftp/FTPSClient;
.super Lorg/apache/commons/net/ftp/FTPClient;
.source "FTPSClient.java"


# static fields
.field private static final CMD_ADAT:Ljava/lang/String; = "ADAT"

.field private static final CMD_AUTH:Ljava/lang/String; = "AUTH"

.field private static final CMD_CCC:Ljava/lang/String; = "CCC"

.field private static final CMD_CONF:Ljava/lang/String; = "CONF"

.field private static final CMD_ENC:Ljava/lang/String; = "ENC"

.field private static final CMD_MIC:Ljava/lang/String; = "MIC"

.field private static final CMD_PBSZ:Ljava/lang/String; = "PBSZ"

.field private static final CMD_PROT:Ljava/lang/String; = "PROT"

.field public static final DEFAULT_FTPS_DATA_PORT:I = 0x3dd

.field public static final DEFAULT_FTPS_PORT:I = 0x3de

.field private static final DEFAULT_PROT:Ljava/lang/String; = "C"

.field private static final DEFAULT_PROTOCOL:Ljava/lang/String; = "TLS"

.field public static KEYSTORE_ALGORITHM:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final PROT_COMMAND_VALUE:[Ljava/lang/String;

.field public static PROVIDER:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static STORE_TYPE:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static TRUSTSTORE_ALGORITHM:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field private auth:Ljava/lang/String;

.field private context:Ljavax/net/ssl/SSLContext;

.field private isClientMode:Z

.field private isCreation:Z

.field private final isImplicit:Z

.field private isNeedClientAuth:Z

.field private isWantClientAuth:Z

.field private keyManager:Ljavax/net/ssl/KeyManager;

.field private plainSocket:Ljava/net/Socket;

.field private final protocol:Ljava/lang/String;

.field private protocols:[Ljava/lang/String;

.field private suites:[Ljava/lang/String;

.field private trustManager:Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 57
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "C"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "E"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "S"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "P"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/net/ftp/FTPSClient;->PROT_COMMAND_VALUE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 114
    const-string/jumbo v0, "TLS"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(Ljava/lang/String;Z)V

    .line 115
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(Ljava/lang/String;Z)V

    .line 131
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 4
    .param p1, "protocol"    # Ljava/lang/String;
    .param p2, "isImplicit"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 142
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPClient;-><init>()V

    .line 85
    const-string/jumbo v0, "TLS"

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->auth:Ljava/lang/String;

    .line 91
    iput-boolean v3, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isCreation:Z

    .line 93
    iput-boolean v3, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    .line 95
    iput-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isNeedClientAuth:Z

    .line 97
    iput-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isWantClientAuth:Z

    .line 99
    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    .line 101
    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    .line 104
    invoke-static {}, Lorg/apache/commons/net/util/TrustManagerUtils;->getValidateServerCertificateTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->trustManager:Ljavax/net/ssl/TrustManager;

    .line 107
    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->keyManager:Ljavax/net/ssl/KeyManager;

    .line 143
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocol:Ljava/lang/String;

    .line 144
    iput-boolean p2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isImplicit:Z

    .line 145
    if-eqz p2, :cond_0

    .line 146
    const/16 v0, 0x3de

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->setDefaultPort(I)V

    .line 148
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLContext;)V
    .locals 1
    .param p1, "context"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 167
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(ZLjavax/net/ssl/SSLContext;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "isImplicit"    # Z

    .prologue
    .line 122
    const-string/jumbo v0, "TLS"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(Ljava/lang/String;Z)V

    .line 123
    return-void
.end method

.method public constructor <init>(ZLjavax/net/ssl/SSLContext;)V
    .locals 1
    .param p1, "isImplicit"    # Z
    .param p2, "context"    # Ljavax/net/ssl/SSLContext;

    .prologue
    .line 156
    const-string/jumbo v0, "TLS"

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;-><init>(Ljava/lang/String;Z)V

    .line 157
    iput-object p2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    .line 158
    return-void
.end method

.method private checkPROTValue(Ljava/lang/String;)Z
    .locals 2
    .param p1, "prot"    # Ljava/lang/String;

    .prologue
    .line 514
    const/4 v0, 0x0

    .local v0, "p":I
    :goto_0
    sget-object v1, Lorg/apache/commons/net/ftp/FTPSClient;->PROT_COMMAND_VALUE:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 515
    sget-object v1, Lorg/apache/commons/net/ftp/FTPSClient;->PROT_COMMAND_VALUE:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 516
    const/4 v1, 0x1

    .line 519
    :goto_1
    return v1

    .line 514
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 519
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private extractPrefixedData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "reply"    # Ljava/lang/String;

    .prologue
    .line 785
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 786
    .local v0, "idx":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 787
    const/4 v1, 0x0

    .line 790
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getKeyManager()Ljavax/net/ssl/KeyManager;
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->keyManager:Ljavax/net/ssl/KeyManager;

    return-object v0
.end method

.method private initSslContext()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    if-nez v0, :cond_0

    .line 233
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocol:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getKeyManager()Ljavax/net/ssl/KeyManager;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getTrustManager()Ljavax/net/ssl/TrustManager;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/apache/commons/net/util/SSLContextUtils;->createSSLContext(Ljava/lang/String;Ljavax/net/ssl/KeyManager;Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    .line 235
    :cond_0
    return-void
.end method


# virtual methods
.method protected _connectAction_()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 200
    iget-boolean v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isImplicit:Z

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->sslNegotiation()V

    .line 203
    :cond_0
    invoke-super {p0}, Lorg/apache/commons/net/ftp/FTPClient;->_connectAction_()V

    .line 205
    iget-boolean v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isImplicit:Z

    if-nez v0, :cond_1

    .line 206
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->execAUTH()V

    .line 207
    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->sslNegotiation()V

    .line 209
    :cond_1
    return-void
.end method

.method protected _openDataConnection_(ILjava/lang/String;)Ljava/net/Socket;
    .locals 3
    .param p1, "command"    # I
    .param p2, "arg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 570
    invoke-super {p0, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->_openDataConnection_(ILjava/lang/String;)Ljava/net/Socket;

    move-result-object v0

    .line 571
    .local v0, "socket":Ljava/net/Socket;
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->_prepareDataSocket_(Ljava/net/Socket;)V

    .line 572
    instance-of v2, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v2, :cond_3

    move-object v1, v0

    .line 573
    check-cast v1, Ljavax/net/ssl/SSLSocket;

    .line 575
    .local v1, "sslSocket":Ljavax/net/ssl/SSLSocket;
    iget-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setUseClientMode(Z)V

    .line 576
    iget-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isCreation:Z

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnableSessionCreation(Z)V

    .line 579
    iget-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    if-nez v2, :cond_0

    .line 580
    iget-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isNeedClientAuth:Z

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setNeedClientAuth(Z)V

    .line 581
    iget-boolean v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isWantClientAuth:Z

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setWantClientAuth(Z)V

    .line 583
    :cond_0
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 584
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 586
    :cond_1
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 587
    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 589
    :cond_2
    invoke-virtual {v1}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 592
    .end local v1    # "sslSocket":Ljavax/net/ssl/SSLSocket;
    :cond_3
    return-object v0
.end method

.method protected _prepareDataSocket_(Ljava/net/Socket;)V
    .locals 0
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 605
    return-void
.end method

.method public disconnect()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 639
    invoke-super {p0}, Lorg/apache/commons/net/ftp/FTPClient;->disconnect()V

    .line 640
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->setSocketFactory(Ljavax/net/SocketFactory;)V

    .line 641
    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->setServerSocketFactory(Ljavax/net/ServerSocketFactory;)V

    .line 642
    return-void
.end method

.method public execADAT([B)I
    .locals 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 667
    if-eqz p1, :cond_0

    .line 669
    const-string/jumbo v0, "ADAT"

    new-instance v1, Ljava/lang/String;

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 673
    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "ADAT"

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public execAUTH(Ljava/lang/String;)I
    .locals 1
    .param p1, "mechanism"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 654
    const-string/jumbo v0, "AUTH"

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method protected execAUTH()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    const-string/jumbo v1, "AUTH"

    iget-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->auth:Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 219
    .local v0, "replyCode":I
    const/16 v1, 0x14e

    if-ne v1, v0, :cond_1

    .line 225
    :cond_0
    return-void

    .line 222
    :cond_1
    const/16 v1, 0xea

    if-eq v1, v0, :cond_0

    .line 223
    new-instance v1, Ljavax/net/ssl/SSLException;

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public execCCC()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 688
    const-string/jumbo v1, "CCC"

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;)I

    move-result v0

    .line 700
    .local v0, "repCode":I
    return v0
.end method

.method public execCONF([B)I
    .locals 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 733
    if-eqz p1, :cond_0

    .line 735
    const-string/jumbo v0, "CONF"

    new-instance v1, Ljava/lang/String;

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 739
    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "CONF"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public execENC([B)I
    .locals 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 753
    if-eqz p1, :cond_0

    .line 755
    const-string/jumbo v0, "ENC"

    new-instance v1, Ljava/lang/String;

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 759
    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "ENC"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public execMIC([B)I
    .locals 3
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 713
    if-eqz p1, :cond_0

    .line 715
    const-string/jumbo v0, "MIC"

    new-instance v1, Ljava/lang/String;

    invoke-static {p1}, Lorg/apache/commons/net/util/Base64;->encodeBase64([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 719
    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "MIC"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public execPBSZ(J)V
    .locals 5
    .param p1, "pbsz"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 438
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    const-wide v2, 0xffffffffL

    cmp-long v1, v2, p1

    if-gez v1, :cond_1

    .line 439
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 441
    :cond_1
    const-string/jumbo v1, "PBSZ"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 442
    .local v0, "status":I
    const/16 v1, 0xc8

    if-eq v1, v0, :cond_2

    .line 443
    new-instance v1, Ljavax/net/ssl/SSLException;

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 445
    :cond_2
    return-void
.end method

.method public execPROT(Ljava/lang/String;)V
    .locals 3
    .param p1, "prot"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 489
    if-nez p1, :cond_0

    .line 490
    const-string/jumbo p1, "C"

    .line 492
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;->checkPROTValue(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 493
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 495
    :cond_1
    const/16 v0, 0xc8

    const-string/jumbo v1, "PROT"

    invoke-virtual {p0, v1, p1}, Lorg/apache/commons/net/ftp/FTPSClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 496
    new-instance v0, Ljavax/net/ssl/SSLException;

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getReplyString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 498
    :cond_2
    const-string/jumbo v0, "C"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 499
    invoke-virtual {p0, v2}, Lorg/apache/commons/net/ftp/FTPSClient;->setSocketFactory(Ljavax/net/SocketFactory;)V

    .line 500
    invoke-virtual {p0, v2}, Lorg/apache/commons/net/ftp/FTPSClient;->setServerSocketFactory(Ljavax/net/ServerSocketFactory;)V

    .line 506
    :goto_0
    return-void

    .line 502
    :cond_3
    new-instance v0, Lorg/apache/commons/net/ftp/FTPSSocketFactory;

    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/ftp/FTPSSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->setSocketFactory(Ljavax/net/SocketFactory;)V

    .line 503
    new-instance v0, Lorg/apache/commons/net/ftp/FTPSServerSocketFactory;

    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/ftp/FTPSServerSocketFactory;-><init>(Ljavax/net/ssl/SSLContext;)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/ftp/FTPSClient;->setServerSocketFactory(Ljavax/net/ServerSocketFactory;)V

    .line 504
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->initSslContext()V

    goto :goto_0
.end method

.method public getAuthValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->auth:Ljava/lang/String;

    return-object v0
.end method

.method public getEnableSessionCreation()Z
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnableSessionCreation()Z

    move-result v0

    .line 313
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEnabledCipherSuites()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 400
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 401
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v0

    .line 403
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getEnabledProtocols()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v0

    .line 426
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNeedClientAuth()Z
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 332
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getNeedClientAuth()Z

    move-result v0

    .line 334
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTrustManager()Ljavax/net/ssl/TrustManager;
    .locals 1

    .prologue
    .line 613
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->trustManager:Ljavax/net/ssl/TrustManager;

    return-object v0
.end method

.method public getUseClientMode()Z
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 378
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getUseClientMode()Z

    move-result v0

    .line 380
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getWantClientAuth()Z
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    instance-of v0, v0, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_0

    .line 355
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocket;->getWantClientAuth()Z

    move-result v0

    .line 357
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public parseADATReply(Ljava/lang/String;)[B
    .locals 1
    .param p1, "reply"    # Ljava/lang/String;

    .prologue
    .line 771
    if-nez p1, :cond_0

    .line 772
    const/4 v0, 0x0

    .line 774
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "ADAT="

    invoke-direct {p0, v0, p1}, Lorg/apache/commons/net/ftp/FTPSClient;->extractPrefixedData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/util/Base64;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    goto :goto_0
.end method

.method public parsePBSZ(J)J
    .locals 7
    .param p1, "pbsz"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 460
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/net/ftp/FTPSClient;->execPBSZ(J)V

    .line 461
    move-wide v0, p1

    .line 462
    .local v0, "minvalue":J
    const-string/jumbo v3, "PBSZ="

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getReplyString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v3, v6}, Lorg/apache/commons/net/ftp/FTPSClient;->extractPrefixedData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 463
    .local v2, "remainder":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 464
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 465
    .local v4, "replysz":J
    cmp-long v3, v4, v0

    if-gez v3, :cond_0

    .line 466
    move-wide v0, v4

    .line 469
    .end local v4    # "replysz":J
    :cond_0
    return-wide v0
.end method

.method public sendCommand(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5
    .param p1, "command"    # Ljava/lang/String;
    .param p2, "args"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 535
    invoke-super {p0, p1, p2}, Lorg/apache/commons/net/ftp/FTPClient;->sendCommand(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 537
    .local v0, "repCode":I
    const-string/jumbo v1, "CCC"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 538
    const/16 v1, 0xc8

    if-ne v1, v0, :cond_1

    .line 539
    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 540
    iget-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->plainSocket:Ljava/net/Socket;

    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    .line 541
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getControlEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_controlInput_:Ljava/io/BufferedReader;

    .line 544
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/OutputStreamWriter;

    iget-object v3, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getControlEncoding()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_controlOutput_:Ljava/io/BufferedWriter;

    .line 551
    :cond_0
    return v0

    .line 548
    :cond_1
    new-instance v1, Ljavax/net/ssl/SSLException;

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getReplyString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/net/ssl/SSLException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setAuthValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "auth"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->auth:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setEnabledCipherSuites([Ljava/lang/String;)V
    .locals 3
    .param p1, "cipherSuites"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 389
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    .line 390
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 391
    return-void
.end method

.method public setEnabledProtocols([Ljava/lang/String;)V
    .locals 3
    .param p1, "protocolVersions"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 412
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    .line 413
    iget-object v0, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 414
    return-void
.end method

.method public setEnabledSessionCreation(Z)V
    .locals 0
    .param p1, "isCreation"    # Z

    .prologue
    .line 297
    iput-boolean p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isCreation:Z

    .line 298
    return-void
.end method

.method public setKeyManager(Ljavax/net/ssl/KeyManager;)V
    .locals 0
    .param p1, "keyManager"    # Ljavax/net/ssl/KeyManager;

    .prologue
    .line 289
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->keyManager:Ljavax/net/ssl/KeyManager;

    .line 290
    return-void
.end method

.method public setNeedClientAuth(Z)V
    .locals 0
    .param p1, "isNeedClientAuth"    # Z

    .prologue
    .line 321
    iput-boolean p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isNeedClientAuth:Z

    .line 322
    return-void
.end method

.method public setTrustManager(Ljavax/net/ssl/TrustManager;)V
    .locals 0
    .param p1, "trustManager"    # Ljavax/net/ssl/TrustManager;

    .prologue
    .line 623
    iput-object p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->trustManager:Ljavax/net/ssl/TrustManager;

    .line 624
    return-void
.end method

.method public setUseClientMode(Z)V
    .locals 0
    .param p1, "isClientMode"    # Z

    .prologue
    .line 366
    iput-boolean p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    .line 367
    return-void
.end method

.method public setWantClientAuth(Z)V
    .locals 0
    .param p1, "isWantClientAuth"    # Z

    .prologue
    .line 344
    iput-boolean p1, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isWantClientAuth:Z

    .line 345
    return-void
.end method

.method protected sslNegotiation()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 243
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    iput-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->plainSocket:Ljava/net/Socket;

    .line 244
    invoke-direct {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->initSslContext()V

    .line 246
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->context:Ljavax/net/ssl/SSLContext;

    invoke-virtual {v4}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    .line 247
    .local v3, "ssf":Ljavax/net/ssl/SSLSocketFactory;
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    .line 248
    .local v0, "ip":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    invoke-virtual {v4}, Ljava/net/Socket;->getPort()I

    move-result v1

    .line 249
    .local v1, "port":I
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v0, v1, v5}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    .line 251
    .local v2, "socket":Ljavax/net/ssl/SSLSocket;
    iget-boolean v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isCreation:Z

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setEnableSessionCreation(Z)V

    .line 252
    iget-boolean v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setUseClientMode(Z)V

    .line 254
    iget-boolean v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isClientMode:Z

    if-nez v4, :cond_0

    .line 255
    iget-boolean v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isNeedClientAuth:Z

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setNeedClientAuth(Z)V

    .line 256
    iget-boolean v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->isWantClientAuth:Z

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setWantClientAuth(Z)V

    .line 259
    :cond_0
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 260
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->protocols:[Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 262
    :cond_1
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 263
    iget-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->suites:[Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljavax/net/ssl/SSLSocket;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 265
    :cond_2
    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->startHandshake()V

    .line 267
    iput-object v2, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_socket_:Ljava/net/Socket;

    .line 268
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getControlEncoding()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    iput-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_controlInput_:Ljava/io/BufferedReader;

    .line 270
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    invoke-virtual {v2}, Ljavax/net/ssl/SSLSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/commons/net/ftp/FTPSClient;->getControlEncoding()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v4, p0, Lorg/apache/commons/net/ftp/FTPSClient;->_controlOutput_:Ljava/io/BufferedWriter;

    .line 272
    return-void
.end method
