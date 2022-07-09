.class public Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;
.super Ljava/lang/Object;
.source "FileTransferNegotiator.java"


# static fields
.field public static IBB_ONLY:Z = false

.field private static final NAMESPACE:[Ljava/lang/String;

.field protected static final STREAM_DATA_FIELD_NAME:Ljava/lang/String; = "stream-method"

.field private static final STREAM_INIT_PREFIX:Ljava/lang/String; = "jsi_"

.field private static final randomGenerator:Ljava/util/Random;

.field private static final transferObject:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

.field private final connection:Lorg/jivesoftware/smack/Connection;

.field private final inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 61
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "http://jabber.org/protocol/si/profile/file-transfer"

    aput-object v3, v2, v1

    const-string/jumbo v3, "http://jabber.org/protocol/si"

    aput-object v3, v2, v0

    sput-object v2, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->NAMESPACE:[Ljava/lang/String;

    .line 65
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v2, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->transferObject:Ljava/util/Map;

    .line 72
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    sput-object v2, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->randomGenerator:Ljava/util/Random;

    .line 79
    const-string/jumbo v2, "ibb"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    :goto_0
    sput-boolean v0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 213
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->configureConnection(Lorg/jivesoftware/smack/Connection;)V

    .line 216
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    .line 217
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/Socks5TransferNegotiator;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/filetransfer/Socks5TransferNegotiator;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    .line 218
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/IBBTransferNegotiator;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/filetransfer/IBBTransferNegotiator;-><init>(Lorg/jivesoftware/smack/Connection;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    .line 219
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;
    .param p1, "x1"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->cleanup(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method private cleanup(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 246
    sget-object v0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->transferObject:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;->cleanup()V

    .line 249
    :cond_0
    return-void
.end method

.method private configureConnection(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 222
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator$2;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator$2;-><init>(Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 243
    return-void
.end method

.method private createDefaultInitiationForm()Lorg/jivesoftware/smackx/packet/DataForm;
    .locals 4

    .prologue
    .line 475
    new-instance v1, Lorg/jivesoftware/smackx/packet/DataForm;

    const-string/jumbo v2, "form"

    invoke-direct {v1, v2}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    .line 476
    .local v1, "form":Lorg/jivesoftware/smackx/packet/DataForm;
    new-instance v0, Lorg/jivesoftware/smackx/FormField;

    const-string/jumbo v2, "stream-method"

    invoke-direct {v0, v2}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 477
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    const-string/jumbo v2, "list-single"

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 478
    sget-boolean v2, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v2, :cond_0

    .line 479
    new-instance v2, Lorg/jivesoftware/smackx/FormField$Option;

    const-string/jumbo v3, "http://jabber.org/protocol/bytestreams"

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/FormField$Option;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/FormField;->addOption(Lorg/jivesoftware/smackx/FormField$Option;)V

    .line 481
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/FormField$Option;

    const-string/jumbo v3, "http://jabber.org/protocol/ibb"

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/FormField$Option;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/FormField;->addOption(Lorg/jivesoftware/smackx/FormField$Option;)V

    .line 482
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 483
    return-object v1
.end method

.method public static createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 1
    .param p0, "ID"    # Ljava/lang/String;
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "type"    # Lorg/jivesoftware/smack/packet/IQ$Type;

    .prologue
    .line 178
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator$1;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator$1;-><init>()V

    .line 183
    .local v0, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 185
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 186
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 188
    return-object v0
.end method

.method public static getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;
    .locals 3
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 91
    if-nez p0, :cond_0

    .line 92
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Connection cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 95
    const/4 v1, 0x0

    .line 106
    :goto_0
    return-object v1

    .line 98
    :cond_1
    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->transferObject:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 99
    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->transferObject:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    goto :goto_0

    .line 102
    :cond_2
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;-><init>(Lorg/jivesoftware/smack/Connection;)V

    .line 104
    .local v0, "transfer":Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;
    const/4 v1, 0x1

    invoke-static {p0, v1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->setServiceEnabled(Lorg/jivesoftware/smack/Connection;Z)V

    .line 105
    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->transferObject:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    .line 106
    goto :goto_0
.end method

.method private getNegotiator(Lorg/jivesoftware/smackx/FormField;)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    .locals 9
    .param p1, "field"    # Lorg/jivesoftware/smackx/FormField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 309
    const/4 v1, 0x0

    .line 310
    .local v1, "isByteStream":Z
    const/4 v2, 0x0

    .line 311
    .local v2, "isIBB":Z
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/FormField;->getOptions()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField$Option;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 312
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/FormField$Option;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/FormField$Option;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 313
    .local v4, "variable":Ljava/lang/String;
    const-string/jumbo v5, "http://jabber.org/protocol/bytestreams"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    sget-boolean v5, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v5, :cond_1

    .line 314
    const/4 v1, 0x1

    goto :goto_0

    .line 316
    :cond_1
    const-string/jumbo v5, "http://jabber.org/protocol/ibb"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 317
    const/4 v2, 0x1

    goto :goto_0

    .line 321
    .end local v4    # "variable":Ljava/lang/String;
    :cond_2
    if-nez v1, :cond_3

    if-nez v2, :cond_3

    .line 322
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v5, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    const-string/jumbo v6, "No acceptable transfer mechanism"

    invoke-direct {v0, v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    .line 324
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 328
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    .line 329
    new-instance v5, Lorg/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator;

    iget-object v6, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v7, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    iget-object v8, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    invoke-direct {v5, v6, v7, v8}, Lorg/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;)V

    .line 337
    :goto_1
    return-object v5

    .line 333
    :cond_4
    if-eqz v1, :cond_5

    .line 334
    iget-object v5, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    goto :goto_1

    .line 337
    :cond_5
    iget-object v5, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    goto :goto_1
.end method

.method private getOutgoingNegotiator(Lorg/jivesoftware/smackx/FormField;)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    .locals 9
    .param p1, "field"    # Lorg/jivesoftware/smackx/FormField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 444
    const/4 v1, 0x0

    .line 445
    .local v1, "isByteStream":Z
    const/4 v2, 0x0

    .line 446
    .local v2, "isIBB":Z
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 447
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 448
    .local v4, "variable":Ljava/lang/String;
    const-string/jumbo v5, "http://jabber.org/protocol/bytestreams"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    sget-boolean v5, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v5, :cond_1

    .line 449
    const/4 v1, 0x1

    goto :goto_0

    .line 451
    :cond_1
    const-string/jumbo v5, "http://jabber.org/protocol/ibb"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 452
    const/4 v2, 0x1

    goto :goto_0

    .line 456
    .end local v4    # "variable":Ljava/lang/String;
    :cond_2
    if-nez v1, :cond_3

    if-nez v2, :cond_3

    .line 457
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v5, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    const-string/jumbo v6, "No acceptable transfer mechanism"

    invoke-direct {v0, v5, v6}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    .line 459
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    new-instance v5, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v5

    .line 462
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    .line 463
    new-instance v5, Lorg/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator;

    iget-object v6, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v7, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    iget-object v8, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    invoke-direct {v5, v6, v7, v8}, Lorg/jivesoftware/smackx/filetransfer/FaultTolerantNegotiator;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;)V

    .line 470
    :goto_1
    return-object v5

    .line 466
    :cond_4
    if-eqz v1, :cond_5

    .line 467
    iget-object v5, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->byteStreamTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    goto :goto_1

    .line 470
    :cond_5
    iget-object v5, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->inbandTransferManager:Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    goto :goto_1
.end method

.method private getStreamMethodField(Lorg/jivesoftware/smackx/packet/DataForm;)Lorg/jivesoftware/smackx/FormField;
    .locals 4
    .param p1, "form"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 295
    const/4 v0, 0x0

    .line 296
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DataForm;->getFields()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 297
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    check-cast v0, Lorg/jivesoftware/smackx/FormField;

    .line 298
    .restart local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "stream-method"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 303
    :cond_0
    return-object v0

    .line 301
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getSupportedProtocols()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 197
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .local v0, "protocols":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string/jumbo v1, "http://jabber.org/protocol/ibb"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    sget-boolean v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v1, :cond_0

    .line 200
    const-string/jumbo v1, "http://jabber.org/protocol/bytestreams"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 202
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static isServiceEnabled(Lorg/jivesoftware/smack/Connection;)Z
    .locals 5
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 149
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    .line 152
    .local v1, "manager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .local v3, "namespaces":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v4, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->NAMESPACE:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 154
    const-string/jumbo v4, "http://jabber.org/protocol/ibb"

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    sget-boolean v4, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v4, :cond_0

    .line 156
    const-string/jumbo v4, "http://jabber.org/protocol/bytestreams"

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 160
    .local v2, "namespace":Ljava/lang/String;
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->includesFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 161
    const/4 v4, 0x0

    .line 164
    .end local v2    # "namespace":Ljava/lang/String;
    :goto_0
    return v4

    :cond_2
    const/4 v4, 0x1

    goto :goto_0
.end method

.method public static setServiceEnabled(Lorg/jivesoftware/smack/Connection;Z)V
    .locals 5
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p1, "isEnabled"    # Z

    .prologue
    .line 119
    invoke-static {p0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v1

    .line 122
    .local v1, "manager":Lorg/jivesoftware/smackx/ServiceDiscoveryManager;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 123
    .local v3, "namespaces":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v4, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->NAMESPACE:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 124
    const-string/jumbo v4, "http://jabber.org/protocol/ibb"

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    sget-boolean v4, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->IBB_ONLY:Z

    if-nez v4, :cond_0

    .line 126
    const-string/jumbo v4, "http://jabber.org/protocol/bytestreams"

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 130
    .local v2, "namespace":Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 131
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->includesFeature(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 132
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    goto :goto_0

    .line 135
    :cond_2
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->removeFeature(Ljava/lang/String;)V

    goto :goto_0

    .line 139
    .end local v2    # "namespace":Ljava/lang/String;
    :cond_3
    return-void
.end method


# virtual methods
.method public getNextStreamID()Ljava/lang/String;
    .locals 4

    .prologue
    .line 360
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 361
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "jsi_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->randomGenerator:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextLong()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public negotiateOutgoingTransfer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;I)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    .locals 12
    .param p1, "userID"    # Ljava/lang/String;
    .param p2, "streamID"    # Ljava/lang/String;
    .param p3, "fileName"    # Ljava/lang/String;
    .param p4, "size"    # J
    .param p6, "desc"    # Ljava/lang/String;
    .param p7, "responseTimeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 401
    new-instance v5, Lorg/jivesoftware/smackx/packet/StreamInitiation;

    invoke-direct {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;-><init>()V

    .line 402
    .local v5, "si":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {v5, p2}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setSesssionID(Ljava/lang/String;)V

    .line 403
    invoke-static {p3}, Ljava/net/URLConnection;->guessContentTypeFromName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setMimeType(Ljava/lang/String;)V

    .line 405
    new-instance v6, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;

    move-wide/from16 v0, p4

    invoke-direct {v6, p3, v0, v1}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;-><init>(Ljava/lang/String;J)V

    .line 406
    .local v6, "siFile":Lorg/jivesoftware/smackx/packet/StreamInitiation$File;
    move-object/from16 v0, p6

    invoke-virtual {v6, v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation$File;->setDesc(Ljava/lang/String;)V

    .line 407
    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFile(Lorg/jivesoftware/smackx/packet/StreamInitiation$File;)V

    .line 409
    invoke-direct {p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createDefaultInitiationForm()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFeatureNegotiationForm(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 411
    iget-object v8, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v8}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setFrom(Ljava/lang/String;)V

    .line 412
    invoke-virtual {v5, p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setTo(Ljava/lang/String;)V

    .line 413
    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v5, v8}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 415
    iget-object v8, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v9, Lorg/jivesoftware/smack/filter/PacketIDFilter;

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/jivesoftware/smack/filter/PacketIDFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Lorg/jivesoftware/smack/Connection;->createPacketCollector(Lorg/jivesoftware/smack/filter/PacketFilter;)Lorg/jivesoftware/smack/PacketCollector;

    move-result-object v2

    .line 417
    .local v2, "collector":Lorg/jivesoftware/smack/PacketCollector;
    iget-object v8, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v8, v5}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 418
    move/from16 v0, p7

    int-to-long v8, v0

    invoke-virtual {v2, v8, v9}, Lorg/jivesoftware/smack/PacketCollector;->nextResult(J)Lorg/jivesoftware/smack/packet/Packet;

    move-result-object v7

    .line 419
    .local v7, "siResponse":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/PacketCollector;->cancel()V

    .line 421
    instance-of v8, v7, Lorg/jivesoftware/smack/packet/IQ;

    if-eqz v8, :cond_2

    move-object v3, v7

    .line 422
    check-cast v3, Lorg/jivesoftware/smack/packet/IQ;

    .line 423
    .local v3, "iqResponse":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v4, v7

    .line 424
    check-cast v4, Lorg/jivesoftware/smackx/packet/StreamInitiation;

    .line 425
    .local v4, "response":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFeatureNegotiationForm()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getStreamMethodField(Lorg/jivesoftware/smackx/packet/DataForm;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getOutgoingNegotiator(Lorg/jivesoftware/smackx/FormField;)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;

    move-result-object v8

    .line 437
    .end local v3    # "iqResponse":Lorg/jivesoftware/smack/packet/IQ;
    .end local v4    # "response":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    :goto_0
    return-object v8

    .line 429
    .restart local v3    # "iqResponse":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v8

    sget-object v9, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 430
    new-instance v8, Lorg/jivesoftware/smack/XMPPException;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v9

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/XMPPException;-><init>(Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v8

    .line 433
    :cond_1
    new-instance v8, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v9, "File transfer response unreadable"

    invoke-direct {v8, v9}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 437
    .end local v3    # "iqResponse":Lorg/jivesoftware/smack/packet/IQ;
    :cond_2
    const/4 v8, 0x0

    goto :goto_0
.end method

.method public rejectStream(Lorg/jivesoftware/smackx/packet/StreamInitiation;)V
    .locals 6
    .param p1, "si"    # Lorg/jivesoftware/smackx/packet/StreamInitiation;

    .prologue
    .line 347
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v2, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->forbidden:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    const-string/jumbo v3, "Offer Declined"

    invoke-direct {v0, v2, v3}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    .line 348
    .local v0, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getTo()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v2, v3, v4, v5}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    .line 350
    .local v1, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 351
    iget-object v2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 352
    return-void
.end method

.method public selectStreamNegotiator(Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    .locals 11
    .param p1, "request"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 261
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;->getStreamInitiation()Lorg/jivesoftware/smackx/packet/StreamInitiation;

    move-result-object v5

    .line 262
    .local v5, "si":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFeatureNegotiationForm()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getStreamMethodField(Lorg/jivesoftware/smackx/packet/DataForm;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v6

    .line 265
    .local v6, "streamMethodField":Lorg/jivesoftware/smackx/FormField;
    if-nez v6, :cond_0

    .line 266
    const-string/jumbo v2, "No stream methods contained in packet."

    .line 267
    .local v2, "errorMessage":Ljava/lang/String;
    new-instance v1, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v7, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->bad_request:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v1, v7, v2}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V

    .line 268
    .local v1, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getTo()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v7, v8, v9, v10}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v3

    .line 270
    .local v3, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 271
    iget-object v7, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 272
    new-instance v7, Lorg/jivesoftware/smack/XMPPException;

    invoke-direct {v7, v2, v1}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/XMPPError;)V

    throw v7

    .line 279
    .end local v1    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    :cond_0
    :try_start_0
    invoke-direct {p0, v6}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getNegotiator(Lorg/jivesoftware/smackx/FormField;)Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 291
    .local v4, "selectedStreamNegotiator":Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    return-object v4

    .line 281
    .end local v4    # "selectedStreamNegotiator":Lorg/jivesoftware/smackx/filetransfer/StreamNegotiator;
    :catch_0
    move-exception v0

    .line 282
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getTo()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v7, v8, v9, v10}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v3

    .line 284
    .restart local v3    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->getXMPPError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v7

    invoke-virtual {v3, v7}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 285
    iget-object v7, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v7, v3}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 286
    throw v0
.end method
