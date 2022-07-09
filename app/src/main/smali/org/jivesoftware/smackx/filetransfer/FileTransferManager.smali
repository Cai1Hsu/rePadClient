.class public Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;
.super Ljava/lang/Object;
.source "FileTransferManager.java"


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private final fileTransferNegotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 1
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 64
    invoke-static {p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->fileTransferNegotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    .line 66
    return-void
.end method

.method private initListeners()V
    .locals 7

    .prologue
    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->connection:Lorg/jivesoftware/smack/Connection;

    new-instance v1, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager$1;-><init>(Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;)V

    new-instance v2, Lorg/jivesoftware/smack/filter/AndFilter;

    const/4 v3, 0x2

    new-array v3, v3, [Lorg/jivesoftware/smack/filter/PacketFilter;

    const/4 v4, 0x0

    new-instance v5, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v6, Lorg/jivesoftware/smackx/packet/StreamInitiation;

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Lorg/jivesoftware/smack/filter/IQTypeFilter;

    sget-object v6, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-direct {v5, v6}, Lorg/jivesoftware/smack/filter/IQTypeFilter;-><init>(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    aput-object v5, v3, v4

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/filter/AndFilter;-><init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 95
    return-void
.end method


# virtual methods
.method public addFileTransferListener(Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    if-nez v0, :cond_0

    .line 79
    invoke-direct {p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->initListeners()V

    .line 81
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 82
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    monitor-exit v1

    .line 84
    return-void

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected createIncomingFileTransfer(Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;)Lorg/jivesoftware/smackx/filetransfer/IncomingFileTransfer;
    .locals 4
    .param p1, "request"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;

    .prologue
    .line 162
    if-nez p1, :cond_0

    .line 163
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "RecieveRequest cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 166
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/IncomingFileTransfer;

    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->fileTransferNegotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    invoke-direct {v0, p1, v1}, Lorg/jivesoftware/smackx/filetransfer/IncomingFileTransfer;-><init>(Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;)V

    .line 168
    .local v0, "transfer":Lorg/jivesoftware/smackx/filetransfer/IncomingFileTransfer;
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;->getFileSize()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/filetransfer/IncomingFileTransfer;->setFileInfo(Ljava/lang/String;J)V

    .line 170
    return-object v0
.end method

.method public createOutgoingFileTransfer(Ljava/lang/String;)Lorg/jivesoftware/smackx/filetransfer/OutgoingFileTransfer;
    .locals 4
    .param p1, "userID"    # Ljava/lang/String;

    .prologue
    .line 135
    if-nez p1, :cond_0

    .line 136
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "userID was null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_0
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->isFullJID(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The provided user id was not a full JID (i.e. with resource part)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_1
    new-instance v0, Lorg/jivesoftware/smackx/filetransfer/OutgoingFileTransfer;

    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->fileTransferNegotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->getNextStreamID()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->fileTransferNegotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    invoke-direct {v0, v1, p1, v2, v3}, Lorg/jivesoftware/smackx/filetransfer/OutgoingFileTransfer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;)V

    return-object v0
.end method

.method protected fireNewRequest(Lorg/jivesoftware/smackx/packet/StreamInitiation;)V
    .locals 5
    .param p1, "initiation"    # Lorg/jivesoftware/smackx/packet/StreamInitiation;

    .prologue
    .line 98
    const/4 v1, 0x0

    .line 99
    .local v1, "listeners":[Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;
    iget-object v4, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    monitor-enter v4

    .line 100
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    new-array v1, v3, [Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;

    .line 101
    iget-object v3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 102
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    new-instance v2, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;

    invoke-direct {v2, p0, p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;-><init>(Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;Lorg/jivesoftware/smackx/packet/StreamInitiation;)V

    .line 104
    .local v2, "request":Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 105
    aget-object v3, v1, v0

    invoke-interface {v3, v2}, Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;->fileTransferRequest(Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;)V

    .line 104
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    .end local v0    # "i":I
    .end local v2    # "request":Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 107
    .restart local v0    # "i":I
    .restart local v2    # "request":Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;
    :cond_0
    return-void
.end method

.method protected rejectIncomingFileTransfer(Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;)V
    .locals 6
    .param p1, "request"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;

    .prologue
    .line 174
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/filetransfer/FileTransferRequest;->getStreamInitiation()Lorg/jivesoftware/smackx/packet/StreamInitiation;

    move-result-object v0

    .line 176
    .local v0, "initiation":Lorg/jivesoftware/smackx/packet/StreamInitiation;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getPacketID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/StreamInitiation;->getTo()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-static {v2, v3, v4, v5}, Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;->createIQ(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/IQ$Type;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    .line 179
    .local v1, "rejection":Lorg/jivesoftware/smack/packet/IQ;
    new-instance v2, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v3, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->no_acceptable:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 180
    iget-object v2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 181
    return-void
.end method

.method public removeFileTransferListener(Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferListener;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    if-nez v0, :cond_0

    .line 123
    :goto_0
    return-void

    .line 120
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 121
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransferManager;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 122
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
