.class public Lde/javawi/jstun/test/DiscoveryTest;
.super Ljava/lang/Object;
.source "DiscoveryTest.java"


# static fields
.field private static final LOGGER:Lorg/apache/commons/logging/Log;


# instance fields
.field ca:Lde/javawi/jstun/attribute/ChangedAddress;

.field di:Lde/javawi/jstun/test/DiscoveryInfo;

.field iaddress:Ljava/net/InetAddress;

.field ma:Lde/javawi/jstun/attribute/MappedAddress;

.field nodeNatted:Z

.field port:I

.field socketTest1:Ljava/net/DatagramSocket;

.field stunServer:Ljava/lang/String;

.field timeoutInitValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const-class v0, Lde/javawi/jstun/test/demo/StunServer;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;Ljava/lang/String;I)V
    .locals 2
    .param p1, "iaddress"    # Ljava/net/InetAddress;
    .param p2, "stunServer"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/16 v0, 0x12c

    iput v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->timeoutInitValue:I

    .line 44
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    .line 45
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    .line 47
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    .line 48
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    .line 52
    iput-object p1, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    .line 53
    iput-object p2, p0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    .line 54
    iput p3, p0, Lde/javawi/jstun/test/DiscoveryTest;->port:I

    .line 55
    return-void
.end method

.method private test1()Z
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/io/IOException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    .line 79
    const/4 v8, 0x0

    .line 80
    .local v8, "timeSinceFirstTransmission":I
    iget v9, p0, Lde/javawi/jstun/test/DiscoveryTest;->timeoutInitValue:I

    .line 84
    .local v9, "timeout":I
    :goto_0
    :try_start_0
    new-instance v11, Ljava/net/DatagramSocket;

    new-instance v12, Ljava/net/InetSocketAddress;

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    const/4 v14, 0x0

    invoke-direct {v12, v13, v14}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    invoke-direct {v11, v12}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    iput-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    .line 85
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    const/4 v12, 0x1

    invoke-virtual {v11, v12}, Ljava/net/DatagramSocket;->setReuseAddress(Z)V

    .line 86
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    invoke-static {v12}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v12

    iget v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->port:I

    invoke-virtual {v11, v12, v13}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 87
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v11, v9}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 89
    new-instance v6, Lde/javawi/jstun/header/MessageHeader;

    sget-object v11, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-direct {v6, v11}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 90
    .local v6, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v6}, Lde/javawi/jstun/header/MessageHeader;->generateTransactionID()V

    .line 92
    new-instance v0, Lde/javawi/jstun/attribute/ChangeRequest;

    invoke-direct {v0}, Lde/javawi/jstun/attribute/ChangeRequest;-><init>()V

    .line 93
    .local v0, "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    invoke-virtual {v6, v0}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 95
    invoke-virtual {v6}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v1

    .line 96
    .local v1, "data":[B
    new-instance v5, Ljava/net/DatagramPacket;

    array-length v11, v1

    invoke-direct {v5, v1, v11}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 97
    .local v5, "send":Ljava/net/DatagramPacket;
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v11, v5}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 98
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Test 1: Binding Request sent."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 100
    new-instance v4, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v4}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 101
    .local v4, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_1
    invoke-virtual {v4, v6}, Lde/javawi/jstun/header/MessageHeader;->equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 102
    new-instance v3, Ljava/net/DatagramPacket;

    const/16 v11, 0xc8

    new-array v11, v11, [B

    const/16 v12, 0xc8

    invoke-direct {v3, v11, v12}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 103
    .local v3, "receive":Ljava/net/DatagramPacket;
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v11, v3}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 104
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v11

    invoke-static {v11}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;

    move-result-object v4

    .line 105
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v11

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 130
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v3    # "receive":Ljava/net/DatagramPacket;
    .end local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v5    # "send":Ljava/net/DatagramPacket;
    .end local v6    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_0
    move-exception v7

    .line 131
    .local v7, "ste":Ljava/net/SocketTimeoutException;
    const/16 v11, 0x1edc

    if-ge v8, v11, :cond_6

    .line 132
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Test 1: Socket timeout while receiving the response."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 133
    add-int/2addr v8, v9

    .line 134
    mul-int/lit8 v10, v8, 0x2

    .line 135
    .local v10, "timeoutAddValue":I
    const/16 v11, 0x640

    if-le v10, v11, :cond_0

    const/16 v10, 0x640

    .line 136
    :cond_0
    move v9, v10

    .line 137
    goto/16 :goto_0

    .line 108
    .end local v7    # "ste":Ljava/net/SocketTimeoutException;
    .end local v10    # "timeoutAddValue":I
    .restart local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v1    # "data":[B
    .restart local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v5    # "send":Ljava/net/DatagramPacket;
    .restart local v6    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_1
    :try_start_1
    sget-object v11, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MappedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v11

    check-cast v11, Lde/javawi/jstun/attribute/MappedAddress;

    iput-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    .line 109
    sget-object v11, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v11

    check-cast v11, Lde/javawi/jstun/attribute/ChangedAddress;

    iput-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    .line 110
    sget-object v11, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    check-cast v2, Lde/javawi/jstun/attribute/ErrorCode;

    .line 111
    .local v2, "ec":Lde/javawi/jstun/attribute/ErrorCode;
    if-eqz v2, :cond_2

    .line 112
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ErrorCode;->getResponseCode()I

    move-result v12

    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ErrorCode;->getReason()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 113
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Message header contains an Errorcode message attribute."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 114
    const/4 v11, 0x0

    .line 142
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v5    # "send":Ljava/net/DatagramPacket;
    .end local v6    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_2
    return v11

    .line 116
    .restart local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v1    # "data":[B
    .restart local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .restart local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v5    # "send":Ljava/net/DatagramPacket;
    .restart local v6    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_2
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    if-eqz v11, :cond_3

    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    if-nez v11, :cond_4

    .line 117
    :cond_3
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    const/16 v12, 0x2bc

    const-string/jumbo v13, "The server is sending an incomplete response (Mapped Address and Changed Address message attributes are missing). The client should not retry."

    invoke-virtual {v11, v12, v13}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 118
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Response does not contain a Mapped Address or Changed Address message attribute."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 119
    const/4 v11, 0x0

    goto :goto_2

    .line 121
    :cond_4
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v12}, Lde/javawi/jstun/attribute/MappedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v12

    invoke-virtual {v12}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v12

    invoke-virtual {v11, v12}, Lde/javawi/jstun/test/DiscoveryInfo;->setPublicIP(Ljava/net/InetAddress;)V

    .line 122
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v11}, Lde/javawi/jstun/attribute/MappedAddress;->getPort()I

    move-result v11

    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v12

    if-ne v11, v12, :cond_5

    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v11}, Lde/javawi/jstun/attribute/MappedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v11

    invoke-virtual {v11}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v11

    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 123
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Node is not natted."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 124
    const/4 v11, 0x0

    iput-boolean v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    .line 128
    :goto_3
    const/4 v11, 0x1

    goto/16 :goto_2

    .line 126
    :cond_5
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Node is natted."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 139
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v5    # "send":Ljava/net/DatagramPacket;
    .end local v6    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v7    # "ste":Ljava/net/SocketTimeoutException;
    :cond_6
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Test 1: Socket timeout while receiving the response. Maximum retry limit exceed. Give up."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 140
    iget-object v11, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    invoke-virtual {v11}, Lde/javawi/jstun/test/DiscoveryInfo;->setBlockedUDP()V

    .line 141
    sget-object v11, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "STUN test for "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ": Node is not capable of UDP communication."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 142
    const/4 v11, 0x0

    goto/16 :goto_2
.end method

.method private test1Redo()Z
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/io/IOException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    .line 225
    const/4 v9, 0x0

    .line 226
    .local v9, "timeSinceFirstTransmission":I
    iget v10, p0, Lde/javawi/jstun/test/DiscoveryTest;->timeoutInitValue:I

    .line 231
    .local v10, "timeout":I
    :goto_0
    :try_start_0
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    iget-object v13, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    invoke-virtual {v13}, Lde/javawi/jstun/attribute/ChangedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v13

    invoke-virtual {v13}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    invoke-virtual {v14}, Lde/javawi/jstun/attribute/ChangedAddress;->getPort()I

    move-result v14

    invoke-virtual {v12, v13, v14}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 232
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v12, v10}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 234
    new-instance v7, Lde/javawi/jstun/header/MessageHeader;

    sget-object v12, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-direct {v7, v12}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 235
    .local v7, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v7}, Lde/javawi/jstun/header/MessageHeader;->generateTransactionID()V

    .line 237
    new-instance v0, Lde/javawi/jstun/attribute/ChangeRequest;

    invoke-direct {v0}, Lde/javawi/jstun/attribute/ChangeRequest;-><init>()V

    .line 238
    .local v0, "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    invoke-virtual {v7, v0}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 240
    invoke-virtual {v7}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v1

    .line 241
    .local v1, "data":[B
    new-instance v6, Ljava/net/DatagramPacket;

    array-length v12, v1

    invoke-direct {v6, v1, v12}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 242
    .local v6, "send":Ljava/net/DatagramPacket;
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v12, v6}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 243
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Test 1 redo with changed address: Binding Request sent."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 245
    new-instance v5, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v5}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 246
    .local v5, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_1
    invoke-virtual {v5, v7}, Lde/javawi/jstun/header/MessageHeader;->equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 247
    new-instance v4, Ljava/net/DatagramPacket;

    const/16 v12, 0xc8

    new-array v12, v12, [B

    const/16 v13, 0xc8

    invoke-direct {v4, v12, v13}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 248
    .local v4, "receive":Ljava/net/DatagramPacket;
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v12, v4}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 249
    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v12

    invoke-static {v12}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;

    move-result-object v5

    .line 250
    invoke-virtual {v4}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v12

    invoke-virtual {v5, v12}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 271
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v4    # "receive":Ljava/net/DatagramPacket;
    .end local v5    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v6    # "send":Ljava/net/DatagramPacket;
    .end local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_0
    move-exception v8

    .line 272
    .local v8, "ste2":Ljava/net/SocketTimeoutException;
    const/16 v12, 0x1edc

    if-ge v9, v12, :cond_6

    .line 273
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Test 1 redo with changed address: Socket timeout while receiving the response."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 274
    add-int/2addr v9, v10

    .line 275
    mul-int/lit8 v11, v9, 0x2

    .line 276
    .local v11, "timeoutAddValue":I
    const/16 v12, 0x640

    if-le v11, v12, :cond_0

    const/16 v11, 0x640

    .line 277
    :cond_0
    move v10, v11

    .line 278
    goto/16 :goto_0

    .line 252
    .end local v8    # "ste2":Ljava/net/SocketTimeoutException;
    .end local v11    # "timeoutAddValue":I
    .restart local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v1    # "data":[B
    .restart local v5    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v6    # "send":Ljava/net/DatagramPacket;
    .restart local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_1
    :try_start_1
    sget-object v12, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MappedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v5, v12}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v3

    check-cast v3, Lde/javawi/jstun/attribute/MappedAddress;

    .line 253
    .local v3, "ma2":Lde/javawi/jstun/attribute/MappedAddress;
    sget-object v12, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v5, v12}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    check-cast v2, Lde/javawi/jstun/attribute/ErrorCode;

    .line 254
    .local v2, "ec":Lde/javawi/jstun/attribute/ErrorCode;
    if-eqz v2, :cond_2

    .line 255
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ErrorCode;->getResponseCode()I

    move-result v13

    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ErrorCode;->getReason()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 256
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Message header contains an Errorcode message attribute."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 257
    const/4 v12, 0x0

    .line 280
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v3    # "ma2":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v5    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v6    # "send":Ljava/net/DatagramPacket;
    .end local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_2
    return v12

    .line 259
    .restart local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v1    # "data":[B
    .restart local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .restart local v3    # "ma2":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v5    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v6    # "send":Ljava/net/DatagramPacket;
    .restart local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_2
    if-nez v3, :cond_3

    .line 260
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    const/16 v13, 0x2bc

    const-string/jumbo v14, "The server is sending an incomplete response (Mapped Address message attribute is missing). The client should not retry."

    invoke-virtual {v12, v13, v14}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 261
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Response does not contain a Mapped Address message attribute."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 262
    const/4 v12, 0x0

    goto :goto_2

    .line 264
    :cond_3
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v12}, Lde/javawi/jstun/attribute/MappedAddress;->getPort()I

    move-result v12

    invoke-virtual {v3}, Lde/javawi/jstun/attribute/MappedAddress;->getPort()I

    move-result v13

    if-ne v12, v13, :cond_4

    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v12}, Lde/javawi/jstun/attribute/MappedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v12

    invoke-virtual {v12}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v12

    invoke-virtual {v3}, Lde/javawi/jstun/attribute/MappedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v13

    invoke-virtual {v13}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 265
    :cond_4
    iget-object v12, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    invoke-virtual {v12}, Lde/javawi/jstun/test/DiscoveryInfo;->setSymmetric()V

    .line 266
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Node is behind a symmetric NAT."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    .line 267
    const/4 v12, 0x0

    goto :goto_2

    .line 270
    :cond_5
    const/4 v12, 0x1

    goto :goto_2

    .line 279
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v3    # "ma2":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v5    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v6    # "send":Ljava/net/DatagramPacket;
    .end local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v8    # "ste2":Ljava/net/SocketTimeoutException;
    :cond_6
    sget-object v12, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "STUN test for "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ": Test 1 redo with changed address: Socket timeout while receiving the response.  Maximum retry limit exceed. Give up."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 280
    const/4 v12, 0x0

    goto/16 :goto_2
.end method

.method private test2()Z
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/io/IOException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Lde/javawi/jstun/attribute/MessageAttributeException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v14, 0x0

    .line 150
    .local v14, "timeSinceFirstTransmission":I
    move-object/from16 v0, p0

    iget v15, v0, Lde/javawi/jstun/test/DiscoveryTest;->timeoutInitValue:I

    .line 154
    .local v15, "timeout":I
    :goto_0
    :try_start_0
    new-instance v12, Ljava/net/DatagramSocket;

    new-instance v17, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-direct/range {v17 .. v19}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    move-object/from16 v0, v17

    invoke-direct {v12, v0}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    .line 155
    .local v12, "sendSocket":Ljava/net/DatagramSocket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v17

    move-object/from16 v0, p0

    iget v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->port:I

    move/from16 v18, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 156
    invoke-virtual {v12, v15}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 158
    new-instance v11, Lde/javawi/jstun/header/MessageHeader;

    sget-object v17, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-object/from16 v0, v17

    invoke-direct {v11, v0}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 159
    .local v11, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v11}, Lde/javawi/jstun/header/MessageHeader;->generateTransactionID()V

    .line 161
    new-instance v2, Lde/javawi/jstun/attribute/ChangeRequest;

    invoke-direct {v2}, Lde/javawi/jstun/attribute/ChangeRequest;-><init>()V

    .line 162
    .local v2, "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ChangeRequest;->setChangeIP()V

    .line 163
    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ChangeRequest;->setChangePort()V

    .line 164
    invoke-virtual {v11, v2}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 166
    invoke-virtual {v11}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v3

    .line 167
    .local v3, "data":[B
    new-instance v10, Ljava/net/DatagramPacket;

    array-length v0, v3

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-direct {v10, v3, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 168
    .local v10, "send":Ljava/net/DatagramPacket;
    invoke-virtual {v12, v10}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 169
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 2: Binding Request sent."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 171
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v6

    .line 172
    .local v6, "localPort":I
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v5

    .line 174
    .local v5, "localAddress":Ljava/net/InetAddress;
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->close()V

    .line 176
    new-instance v9, Ljava/net/DatagramSocket;

    invoke-direct {v9, v6, v5}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    .line 177
    .local v9, "receiveSocket":Ljava/net/DatagramSocket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/attribute/ChangedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lde/javawi/jstun/attribute/ChangedAddress;->getPort()I

    move-result v18

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v0, v1}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 178
    invoke-virtual {v9, v15}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 180
    new-instance v8, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v8}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 181
    .local v8, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_1
    invoke-virtual {v8, v11}, Lde/javawi/jstun/header/MessageHeader;->equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z

    move-result v17

    if-nez v17, :cond_1

    .line 182
    new-instance v7, Ljava/net/DatagramPacket;

    const/16 v17, 0xc8

    move/from16 v0, v17

    new-array v0, v0, [B

    move-object/from16 v17, v0

    const/16 v18, 0xc8

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v7, v0, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 183
    .local v7, "receive":Ljava/net/DatagramPacket;
    invoke-virtual {v9, v7}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 184
    invoke-virtual {v7}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;

    move-result-object v8

    .line 185
    invoke-virtual {v7}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 201
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v7    # "receive":Ljava/net/DatagramPacket;
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :catch_0
    move-exception v13

    .line 202
    .local v13, "ste":Ljava/net/SocketTimeoutException;
    const/16 v17, 0x1edc

    move/from16 v0, v17

    if-ge v14, v0, :cond_4

    .line 203
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 2: Socket timeout while receiving the response."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 204
    add-int/2addr v14, v15

    .line 205
    mul-int/lit8 v16, v14, 0x2

    .line 206
    .local v16, "timeoutAddValue":I
    const/16 v17, 0x640

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_0

    const/16 v16, 0x640

    .line 207
    :cond_0
    move/from16 v15, v16

    .line 208
    goto/16 :goto_0

    .line 187
    .end local v13    # "ste":Ljava/net/SocketTimeoutException;
    .end local v16    # "timeoutAddValue":I
    .restart local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v3    # "data":[B
    .restart local v5    # "localAddress":Ljava/net/InetAddress;
    .restart local v6    # "localPort":I
    .restart local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .restart local v10    # "send":Ljava/net/DatagramPacket;
    .restart local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :cond_1
    :try_start_1
    sget-object v17, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v4

    check-cast v4, Lde/javawi/jstun/attribute/ErrorCode;

    .line 188
    .local v4, "ec":Lde/javawi/jstun/attribute/ErrorCode;
    if-eqz v4, :cond_2

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ErrorCode;->getResponseCode()I

    move-result v18

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ErrorCode;->getReason()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 190
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Message header contains an Errorcode message attribute."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 191
    const/16 v17, 0x0

    .line 217
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :goto_2
    return v17

    .line 193
    .restart local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v3    # "data":[B
    .restart local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .restart local v5    # "localAddress":Ljava/net/InetAddress;
    .restart local v6    # "localPort":I
    .restart local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .restart local v10    # "send":Ljava/net/DatagramPacket;
    .restart local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    move/from16 v17, v0

    if-nez v17, :cond_3

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/test/DiscoveryInfo;->setOpenAccess()V

    .line 195
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Node has open access to the Internet (or, at least the node is behind a full-cone NAT without translation)."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 200
    :goto_3
    const/16 v17, 0x0

    goto :goto_2

    .line 197
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/test/DiscoveryInfo;->setFullCone()V

    .line 198
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Node is behind a full-cone NAT."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 209
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    .restart local v13    # "ste":Ljava/net/SocketTimeoutException;
    :cond_4
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 2: Socket timeout while receiving the response. Maximum retry limit exceed. Give up."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 210
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    move/from16 v17, v0

    if-nez v17, :cond_5

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/test/DiscoveryInfo;->setSymmetricUDPFirewall()V

    .line 212
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Node is behind a symmetric UDP firewall."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 213
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 217
    :cond_5
    const/16 v17, 0x1

    goto/16 :goto_2
.end method

.method private test3()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/io/IOException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Lde/javawi/jstun/attribute/MessageAttributeException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    .line 287
    const/4 v14, 0x0

    .line 288
    .local v14, "timeSinceFirstTransmission":I
    move-object/from16 v0, p0

    iget v15, v0, Lde/javawi/jstun/test/DiscoveryTest;->timeoutInitValue:I

    .line 292
    .local v15, "timeout":I
    :cond_0
    :goto_0
    :try_start_0
    new-instance v12, Ljava/net/DatagramSocket;

    new-instance v17, Ljava/net/InetSocketAddress;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-direct/range {v17 .. v19}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    move-object/from16 v0, v17

    invoke-direct {v12, v0}, Ljava/net/DatagramSocket;-><init>(Ljava/net/SocketAddress;)V

    .line 293
    .local v12, "sendSocket":Ljava/net/DatagramSocket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v17

    move-object/from16 v0, p0

    iget v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->port:I

    move/from16 v18, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v12, v0, v1}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 294
    invoke-virtual {v12, v15}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 296
    new-instance v11, Lde/javawi/jstun/header/MessageHeader;

    sget-object v17, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-object/from16 v0, v17

    invoke-direct {v11, v0}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 297
    .local v11, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v11}, Lde/javawi/jstun/header/MessageHeader;->generateTransactionID()V

    .line 299
    new-instance v2, Lde/javawi/jstun/attribute/ChangeRequest;

    invoke-direct {v2}, Lde/javawi/jstun/attribute/ChangeRequest;-><init>()V

    .line 300
    .local v2, "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    invoke-virtual {v2}, Lde/javawi/jstun/attribute/ChangeRequest;->setChangePort()V

    .line 301
    invoke-virtual {v11, v2}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 303
    invoke-virtual {v11}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v3

    .line 304
    .local v3, "data":[B
    new-instance v10, Ljava/net/DatagramPacket;

    array-length v0, v3

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-direct {v10, v3, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 305
    .local v10, "send":Ljava/net/DatagramPacket;
    invoke-virtual {v12, v10}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 306
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 3: Binding Request sent."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 308
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v6

    .line 309
    .local v6, "localPort":I
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v5

    .line 311
    .local v5, "localAddress":Ljava/net/InetAddress;
    invoke-virtual {v12}, Ljava/net/DatagramSocket;->close()V

    .line 313
    new-instance v9, Ljava/net/DatagramSocket;

    invoke-direct {v9, v6, v5}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    .line 314
    .local v9, "receiveSocket":Ljava/net/DatagramSocket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lde/javawi/jstun/attribute/ChangedAddress;->getPort()I

    move-result v18

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v0, v1}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 315
    invoke-virtual {v9, v15}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 317
    new-instance v8, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v8}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 318
    .local v8, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_1
    invoke-virtual {v8, v11}, Lde/javawi/jstun/header/MessageHeader;->equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z

    move-result v17

    if-nez v17, :cond_2

    .line 319
    new-instance v7, Ljava/net/DatagramPacket;

    const/16 v17, 0xc8

    move/from16 v0, v17

    new-array v0, v0, [B

    move-object/from16 v17, v0

    const/16 v18, 0xc8

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-direct {v7, v0, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 320
    .local v7, "receive":Ljava/net/DatagramPacket;
    invoke-virtual {v9, v7}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 321
    invoke-virtual {v7}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;

    move-result-object v8

    .line 322
    invoke-virtual {v7}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 335
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v7    # "receive":Ljava/net/DatagramPacket;
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :catch_0
    move-exception v13

    .line 336
    .local v13, "ste":Ljava/net/SocketTimeoutException;
    const/16 v17, 0x1edc

    move/from16 v0, v17

    if-ge v14, v0, :cond_4

    .line 337
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 3: Socket timeout while receiving the response."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 338
    add-int/2addr v14, v15

    .line 339
    mul-int/lit8 v16, v14, 0x2

    .line 340
    .local v16, "timeoutAddValue":I
    const/16 v17, 0x640

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_1

    const/16 v16, 0x640

    .line 341
    :cond_1
    move/from16 v15, v16

    .line 342
    goto/16 :goto_0

    .line 324
    .end local v13    # "ste":Ljava/net/SocketTimeoutException;
    .end local v16    # "timeoutAddValue":I
    .restart local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v3    # "data":[B
    .restart local v5    # "localAddress":Ljava/net/InetAddress;
    .restart local v6    # "localPort":I
    .restart local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .restart local v10    # "send":Ljava/net/DatagramPacket;
    .restart local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :cond_2
    :try_start_1
    sget-object v17, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v4

    check-cast v4, Lde/javawi/jstun/attribute/ErrorCode;

    .line 325
    .local v4, "ec":Lde/javawi/jstun/attribute/ErrorCode;
    if-eqz v4, :cond_3

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ErrorCode;->getResponseCode()I

    move-result v18

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ErrorCode;->getReason()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lde/javawi/jstun/test/DiscoveryInfo;->setError(ILjava/lang/String;)V

    .line 327
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Message header contains an Errorcode message attribute."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 346
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :goto_2
    return-void

    .line 330
    .restart local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v3    # "data":[B
    .restart local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .restart local v5    # "localAddress":Ljava/net/InetAddress;
    .restart local v6    # "localPort":I
    .restart local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .restart local v10    # "send":Ljava/net/DatagramPacket;
    .restart local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v12    # "sendSocket":Ljava/net/DatagramSocket;
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    move/from16 v17, v0

    if-eqz v17, :cond_0

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/test/DiscoveryInfo;->setRestrictedCone()V

    .line 332
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Node is behind a restricted NAT."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 343
    .end local v2    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v3    # "data":[B
    .end local v4    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v5    # "localAddress":Ljava/net/InetAddress;
    .end local v6    # "localPort":I
    .end local v8    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v9    # "receiveSocket":Ljava/net/DatagramSocket;
    .end local v10    # "send":Ljava/net/DatagramPacket;
    .end local v11    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v12    # "sendSocket":Ljava/net/DatagramSocket;
    .restart local v13    # "ste":Ljava/net/SocketTimeoutException;
    :cond_4
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Test 3: Socket timeout while receiving the response. Maximum retry limit exceed. Give up."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 344
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lde/javawi/jstun/test/DiscoveryInfo;->setPortRestrictedCone()V

    .line 345
    sget-object v17, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "STUN test for "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ": Node is behind a port restricted NAT."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_2
.end method


# virtual methods
.method public test()Lde/javawi/jstun/test/DiscoveryInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Ljava/io/IOException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Lde/javawi/jstun/attribute/MessageAttributeException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 58
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    .line 59
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->ca:Lde/javawi/jstun/attribute/ChangedAddress;

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->nodeNatted:Z

    .line 61
    iput-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    .line 62
    new-instance v0, Lde/javawi/jstun/test/DiscoveryInfo;

    iget-object v1, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-direct {v0, v1}, Lde/javawi/jstun/test/DiscoveryInfo;-><init>(Ljava/net/InetAddress;)V

    iput-object v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    .line 64
    sget-object v0, Lde/javawi/jstun/test/DiscoveryTest;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "JSTUN intf test: addr: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryTest;->iaddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " server: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/javawi/jstun/test/DiscoveryTest;->stunServer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lde/javawi/jstun/test/DiscoveryTest;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 65
    invoke-direct {p0}, Lde/javawi/jstun/test/DiscoveryTest;->test1()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    invoke-direct {p0}, Lde/javawi/jstun/test/DiscoveryTest;->test2()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-direct {p0}, Lde/javawi/jstun/test/DiscoveryTest;->test1Redo()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0}, Lde/javawi/jstun/test/DiscoveryTest;->test3()V

    .line 73
    :cond_0
    iget-object v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->socketTest1:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 75
    iget-object v0, p0, Lde/javawi/jstun/test/DiscoveryTest;->di:Lde/javawi/jstun/test/DiscoveryInfo;

    return-object v0
.end method
