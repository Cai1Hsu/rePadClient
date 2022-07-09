.class Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;
.super Ljava/lang/Thread;
.source "StunServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/javawi/jstun/test/demo/StunServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StunServerReceiverThread"
.end annotation


# instance fields
.field private changedIP:Ljava/net/DatagramSocket;

.field private changedPort:Ljava/net/DatagramSocket;

.field private changedPortIP:Ljava/net/DatagramSocket;

.field private receiverSocket:Ljava/net/DatagramSocket;

.field final synthetic this$0:Lde/javawi/jstun/test/demo/StunServer;


# direct methods
.method constructor <init>(Lde/javawi/jstun/test/demo/StunServer;Ljava/net/DatagramSocket;)V
    .locals 4
    .param p2, "datagramSocket"    # Ljava/net/DatagramSocket;

    .prologue
    .line 83
    iput-object p1, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->this$0:Lde/javawi/jstun/test/demo/StunServer;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 84
    iput-object p2, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    .line 85
    iget-object v2, p1, Lde/javawi/jstun/test/demo/StunServer;->sockets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/DatagramSocket;

    .line 86
    .local v1, "socket":Ljava/net/DatagramSocket;
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v3

    if-eq v2, v3, :cond_1

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 88
    iput-object v1, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    .line 89
    :cond_1
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v3

    if-ne v2, v3, :cond_2

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 91
    iput-object v1, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    .line 92
    :cond_2
    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v3

    if-eq v2, v3, :cond_0

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v2

    iget-object v3, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v3}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 94
    iput-object v1, p0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    goto :goto_0

    .line 96
    .end local v1    # "socket":Ljava/net/DatagramSocket;
    :cond_3
    return-void
.end method


# virtual methods
.method public run()V
    .locals 23

    .prologue
    .line 101
    :cond_0
    :goto_0
    :try_start_0
    new-instance v12, Ljava/net/DatagramPacket;

    const/16 v20, 0xc8

    move/from16 v0, v20

    new-array v0, v0, [B

    move-object/from16 v20, v0

    const/16 v21, 0xc8

    move-object/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v12, v0, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 102
    .local v12, "receive":Ljava/net/DatagramPacket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 103
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " datagram received from "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 104
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_6

    move-result-object v13

    .line 106
    .local v13, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :try_start_1
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V

    .line 107
    invoke-virtual {v13}, Lde/javawi/jstun/header/MessageHeader;->getType()Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-result-object v20

    sget-object v21, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 108
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " Binding Request received from "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 109
    sget-object v20, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangeRequest:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v4

    check-cast v4, Lde/javawi/jstun/attribute/ChangeRequest;

    .line 110
    .local v4, "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    if-nez v4, :cond_1

    new-instance v20, Lde/javawi/jstun/attribute/MessageAttributeException;

    const-string/jumbo v21, "Message attribute change request is not set."

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/attribute/MessageAttributeException;-><init>(Ljava/lang/String;)V

    throw v20
    :try_end_1
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_6

    .line 200
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    :catch_0
    move-exception v19

    .line 201
    .local v19, "umae":Lde/javawi/jstun/attribute/UnknownMessageAttributeException;
    :try_start_2
    invoke-virtual/range {v19 .. v19}, Lde/javawi/jstun/attribute/UnknownMessageAttributeException;->printStackTrace()V

    .line 203
    new-instance v16, Lde/javawi/jstun/header/MessageHeader;

    sget-object v20, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingErrorResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 204
    .local v16, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v13}, Lde/javawi/jstun/header/MessageHeader;->getTransactionID()[B

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lde/javawi/jstun/header/MessageHeader;->setTransactionID([B)V

    .line 207
    new-instance v17, Lde/javawi/jstun/attribute/UnknownAttribute;

    invoke-direct/range {v17 .. v17}, Lde/javawi/jstun/attribute/UnknownAttribute;-><init>()V

    .line 208
    .local v17, "ua":Lde/javawi/jstun/attribute/UnknownAttribute;
    invoke-virtual/range {v19 .. v19}, Lde/javawi/jstun/attribute/UnknownMessageAttributeException;->getType()Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-result-object v20

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lde/javawi/jstun/attribute/UnknownAttribute;->addAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V

    .line 209
    invoke-virtual/range {v16 .. v17}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 211
    invoke-virtual/range {v16 .. v16}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v5

    .line 212
    .local v5, "data":[B
    new-instance v15, Ljava/net/DatagramPacket;

    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v15, v5, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 213
    .local v15, "send":Ljava/net/DatagramPacket;
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 214
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 216
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " send Binding Error Response to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_6

    goto/16 :goto_0

    .line 218
    .end local v5    # "data":[B
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v17    # "ua":Lde/javawi/jstun/attribute/UnknownAttribute;
    .end local v19    # "umae":Lde/javawi/jstun/attribute/UnknownMessageAttributeException;
    :catch_1
    move-exception v6

    .line 219
    .local v6, "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 111
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_1
    :try_start_3
    sget-object v20, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ResponseAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v11

    check-cast v11, Lde/javawi/jstun/attribute/ResponseAddress;

    .line 113
    .local v11, "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    new-instance v16, Lde/javawi/jstun/header/MessageHeader;

    sget-object v20, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 114
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v13}, Lde/javawi/jstun/header/MessageHeader;->getTransactionID()[B

    move-result-object v20

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lde/javawi/jstun/header/MessageHeader;->setTransactionID([B)V

    .line 117
    new-instance v7, Lde/javawi/jstun/attribute/MappedAddress;

    invoke-direct {v7}, Lde/javawi/jstun/attribute/MappedAddress;-><init>()V

    .line 118
    .local v7, "ma":Lde/javawi/jstun/attribute/MappedAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lde/javawi/jstun/attribute/MappedAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 119
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v7, v0}, Lde/javawi/jstun/attribute/MappedAddress;->setPort(I)V

    .line 120
    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 122
    new-instance v3, Lde/javawi/jstun/attribute/ChangedAddress;

    invoke-direct {v3}, Lde/javawi/jstun/attribute/ChangedAddress;-><init>()V

    .line 123
    .local v3, "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lde/javawi/jstun/attribute/ChangedAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Lde/javawi/jstun/attribute/ChangedAddress;->setPort(I)V

    .line 125
    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 126
    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangePort()Z

    move-result v20

    if-eqz v20, :cond_3

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangeIP()Z

    move-result v20

    if-nez v20, :cond_3

    .line 127
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    const-string/jumbo v21, "Change port received in Change Request attribute"

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 129
    new-instance v14, Lde/javawi/jstun/attribute/SourceAddress;

    invoke-direct {v14}, Lde/javawi/jstun/attribute/SourceAddress;-><init>()V

    .line 130
    .local v14, "sa":Lde/javawi/jstun/attribute/SourceAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setPort(I)V

    .line 132
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 133
    invoke-virtual/range {v16 .. v16}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v5

    .line 134
    .restart local v5    # "data":[B
    new-instance v15, Ljava/net/DatagramPacket;

    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v15, v5, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 135
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    if-eqz v11, :cond_2

    .line 136
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 137
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 142
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 143
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPort:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " send Binding Response to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_3
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_6

    goto/16 :goto_0

    .line 220
    .end local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v5    # "data":[B
    .end local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_2
    move-exception v9

    .line 221
    .local v9, "mape":Lde/javawi/jstun/attribute/MessageAttributeParsingException;
    invoke-virtual {v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;->printStackTrace()V

    goto/16 :goto_0

    .line 139
    .end local v9    # "mape":Lde/javawi/jstun/attribute/MessageAttributeParsingException;
    .restart local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v5    # "data":[B
    .restart local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_2
    :try_start_4
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 140
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V
    :try_end_4
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_1

    .line 222
    .end local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v5    # "data":[B
    .end local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_3
    move-exception v8

    .line 223
    .local v8, "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    invoke-virtual {v8}, Lde/javawi/jstun/attribute/MessageAttributeException;->printStackTrace()V

    goto/16 :goto_0

    .line 144
    .end local v8    # "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    .restart local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_3
    :try_start_5
    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangePort()Z

    move-result v20

    if-nez v20, :cond_5

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangeIP()Z

    move-result v20

    if-eqz v20, :cond_5

    .line 145
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    const-string/jumbo v21, "Change ip received in Change Request attribute"

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 147
    new-instance v14, Lde/javawi/jstun/attribute/SourceAddress;

    invoke-direct {v14}, Lde/javawi/jstun/attribute/SourceAddress;-><init>()V

    .line 148
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 149
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setPort(I)V

    .line 150
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 151
    invoke-virtual/range {v16 .. v16}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v5

    .line 152
    .restart local v5    # "data":[B
    new-instance v15, Ljava/net/DatagramPacket;

    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v15, v5, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 153
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    if-eqz v11, :cond_4

    .line 154
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 155
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 160
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 161
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " send Binding Response to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_5
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_6

    goto/16 :goto_0

    .line 224
    .end local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v5    # "data":[B
    .end local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_4
    move-exception v10

    .line 225
    .local v10, "mhpe":Lde/javawi/jstun/header/MessageHeaderParsingException;
    invoke-virtual {v10}, Lde/javawi/jstun/header/MessageHeaderParsingException;->printStackTrace()V

    goto/16 :goto_0

    .line 157
    .end local v10    # "mhpe":Lde/javawi/jstun/header/MessageHeaderParsingException;
    .restart local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v5    # "data":[B
    .restart local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_4
    :try_start_6
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 158
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V
    :try_end_6
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_2

    .line 226
    .end local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v5    # "data":[B
    .end local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_5
    move-exception v18

    .line 227
    .local v18, "ue":Lde/javawi/jstun/util/UtilityException;
    invoke-virtual/range {v18 .. v18}, Lde/javawi/jstun/util/UtilityException;->printStackTrace()V

    goto/16 :goto_0

    .line 162
    .end local v18    # "ue":Lde/javawi/jstun/util/UtilityException;
    .restart local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_5
    :try_start_7
    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangePort()Z

    move-result v20

    if-nez v20, :cond_7

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangeIP()Z

    move-result v20

    if-nez v20, :cond_7

    .line 163
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    const-string/jumbo v21, "Nothing received in Change Request attribute"

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 165
    new-instance v14, Lde/javawi/jstun/attribute/SourceAddress;

    invoke-direct {v14}, Lde/javawi/jstun/attribute/SourceAddress;-><init>()V

    .line 166
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 167
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setPort(I)V

    .line 168
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 169
    invoke-virtual/range {v16 .. v16}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v5

    .line 170
    .restart local v5    # "data":[B
    new-instance v15, Ljava/net/DatagramPacket;

    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v15, v5, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 171
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    if-eqz v11, :cond_6

    .line 172
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 173
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 178
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 179
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->receiverSocket:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " send Binding Response to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_7
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_7 .. :try_end_7} :catch_6

    goto/16 :goto_0

    .line 228
    .end local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .end local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v5    # "data":[B
    .end local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .end local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v12    # "receive":Ljava/net/DatagramPacket;
    .end local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    .end local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :catch_6
    move-exception v2

    .line 229
    .local v2, "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    invoke-virtual {v2}, Ljava/lang/ArrayIndexOutOfBoundsException;->printStackTrace()V

    goto/16 :goto_0

    .line 175
    .end local v2    # "aioobe":Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v3    # "ca":Lde/javawi/jstun/attribute/ChangedAddress;
    .restart local v4    # "cr":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v5    # "data":[B
    .restart local v7    # "ma":Lde/javawi/jstun/attribute/MappedAddress;
    .restart local v11    # "ra":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v12    # "receive":Ljava/net/DatagramPacket;
    .restart local v13    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    .restart local v16    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    :cond_6
    :try_start_8
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 176
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    goto :goto_3

    .line 180
    .end local v5    # "data":[B
    .end local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    .end local v15    # "send":Ljava/net/DatagramPacket;
    :cond_7
    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangePort()Z

    move-result v20

    if-eqz v20, :cond_0

    invoke-virtual {v4}, Lde/javawi/jstun/attribute/ChangeRequest;->isChangeIP()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 181
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    const-string/jumbo v21, "Change port and ip received in Change Request attribute"

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 183
    new-instance v14, Lde/javawi/jstun/attribute/SourceAddress;

    invoke-direct {v14}, Lde/javawi/jstun/attribute/SourceAddress;-><init>()V

    .line 184
    .restart local v14    # "sa":Lde/javawi/jstun/attribute/SourceAddress;
    new-instance v20, Lde/javawi/jstun/util/Address;

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lde/javawi/jstun/util/Address;-><init>([B)V

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v14, v0}, Lde/javawi/jstun/attribute/SourceAddress;->setPort(I)V

    .line 186
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 187
    invoke-virtual/range {v16 .. v16}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v5

    .line 188
    .restart local v5    # "data":[B
    new-instance v15, Ljava/net/DatagramPacket;

    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v15, v5, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 189
    .restart local v15    # "send":Ljava/net/DatagramPacket;
    if-eqz v11, :cond_8

    .line 190
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 191
    invoke-virtual {v11}, Lde/javawi/jstun/attribute/ResponseAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 196
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 197
    invoke-static {}, Lde/javawi/jstun/test/demo/StunServer;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v20

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/javawi/jstun/test/demo/StunServer$StunServerReceiverThread;->changedPortIP:Ljava/net/DatagramSocket;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, " send Binding Response to "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 193
    :cond_8
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getPort()I

    move-result v20

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 194
    invoke-virtual {v12}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V
    :try_end_8
    .catch Lde/javawi/jstun/attribute/UnknownMessageAttributeException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Lde/javawi/jstun/attribute/MessageAttributeParsingException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_8 .. :try_end_8} :catch_3
    .catch Lde/javawi/jstun/header/MessageHeaderParsingException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_8 .. :try_end_8} :catch_6

    goto :goto_4
.end method
