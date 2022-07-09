.class Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;
.super Ljava/util/TimerTask;
.source "BindingLifetimeTest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/javawi/jstun/test/BindingLifetimeTest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BindingLifetimeTask"
.end annotation


# instance fields
.field final synthetic this$0:Lde/javawi/jstun/test/BindingLifetimeTest;


# direct methods
.method public constructor <init>(Lde/javawi/jstun/test/BindingLifetimeTest;)V
    .locals 0

    .prologue
    .line 122
    iput-object p1, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    .line 123
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 124
    return-void
.end method


# virtual methods
.method public lifetimeQuery()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;,
            Lde/javawi/jstun/attribute/MessageAttributeException;,
            Lde/javawi/jstun/header/MessageHeaderParsingException;,
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    .line 137
    :try_start_0
    new-instance v8, Ljava/net/DatagramSocket;

    invoke-direct {v8}, Ljava/net/DatagramSocket;-><init>()V

    .line 138
    .local v8, "socket":Ljava/net/DatagramSocket;
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->stunServer:Ljava/lang/String;

    invoke-static {v11}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v11

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->port:I

    invoke-virtual {v8, v11, v12}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 139
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->timeout:I

    invoke-virtual {v8, v11}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 141
    new-instance v7, Lde/javawi/jstun/header/MessageHeader;

    sget-object v11, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-direct {v7, v11}, Lde/javawi/jstun/header/MessageHeader;-><init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 142
    .local v7, "sendMH":Lde/javawi/jstun/header/MessageHeader;
    invoke-virtual {v7}, Lde/javawi/jstun/header/MessageHeader;->generateTransactionID()V

    .line 143
    new-instance v0, Lde/javawi/jstun/attribute/ChangeRequest;

    invoke-direct {v0}, Lde/javawi/jstun/attribute/ChangeRequest;-><init>()V

    .line 144
    .local v0, "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    new-instance v5, Lde/javawi/jstun/attribute/ResponseAddress;

    invoke-direct {v5}, Lde/javawi/jstun/attribute/ResponseAddress;-><init>()V

    .line 145
    .local v5, "responseAddress":Lde/javawi/jstun/attribute/ResponseAddress;
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v11}, Lde/javawi/jstun/attribute/MappedAddress;->getAddress()Lde/javawi/jstun/util/Address;

    move-result-object v11

    invoke-virtual {v5, v11}, Lde/javawi/jstun/attribute/ResponseAddress;->setAddress(Lde/javawi/jstun/util/Address;)V

    .line 146
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->ma:Lde/javawi/jstun/attribute/MappedAddress;

    invoke-virtual {v11}, Lde/javawi/jstun/attribute/MappedAddress;->getPort()I

    move-result v11

    invoke-virtual {v5, v11}, Lde/javawi/jstun/attribute/ResponseAddress;->setPort(I)V

    .line 147
    invoke-virtual {v7, v0}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 148
    invoke-virtual {v7, v5}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 149
    invoke-virtual {v7}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v1

    .line 151
    .local v1, "data":[B
    new-instance v6, Ljava/net/DatagramPacket;

    array-length v11, v1

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->stunServer:Ljava/lang/String;

    invoke-static {v12}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->port:I

    invoke-direct {v6, v1, v11, v12, v13}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 152
    .local v6, "send":Ljava/net/DatagramPacket;
    invoke-virtual {v8, v6}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 153
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    const-string/jumbo v12, "Binding Request sent."

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 155
    new-instance v4, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v4}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 156
    .local v4, "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    :goto_0
    invoke-virtual {v4, v7}, Lde/javawi/jstun/header/MessageHeader;->equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 157
    new-instance v3, Ljava/net/DatagramPacket;

    const/16 v11, 0xc8

    new-array v11, v11, [B

    const/16 v12, 0xc8

    invoke-direct {v3, v11, v12}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 158
    .local v3, "receive":Ljava/net/DatagramPacket;
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->initialSocket:Ljava/net/DatagramSocket;

    invoke-virtual {v11, v3}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 159
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v11

    invoke-static {v11}, Lde/javawi/jstun/header/MessageHeader;->parseHeader([B)Lde/javawi/jstun/header/MessageHeader;

    move-result-object v4

    .line 160
    invoke-virtual {v3}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v11

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->parseAttributes([B)V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 184
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v3    # "receive":Ljava/net/DatagramPacket;
    .end local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v5    # "responseAddress":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v6    # "send":Ljava/net/DatagramPacket;
    .end local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v8    # "socket":Ljava/net/DatagramSocket;
    :catch_0
    move-exception v9

    .line 185
    .local v9, "ste":Ljava/net/SocketTimeoutException;
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    const-string/jumbo v12, "Read operation at query socket timeout."

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 186
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->upperBinarySearchLifetime:I

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->lowerBinarySearchLifetime:I

    add-int/lit8 v12, v12, 0x1

    if-ne v11, v12, :cond_5

    .line 187
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "BindingLifetimeTest completed. UDP binding lifetime: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 188
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iput-boolean v14, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->completed:Z

    .line 204
    .end local v9    # "ste":Ljava/net/SocketTimeoutException;
    :cond_0
    :goto_1
    return-void

    .line 162
    .restart local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .restart local v1    # "data":[B
    .restart local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v5    # "responseAddress":Lde/javawi/jstun/attribute/ResponseAddress;
    .restart local v6    # "send":Ljava/net/DatagramPacket;
    .restart local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .restart local v8    # "socket":Ljava/net/DatagramSocket;
    :cond_1
    :try_start_1
    sget-object v11, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-virtual {v4, v11}, Lde/javawi/jstun/header/MessageHeader;->getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    check-cast v2, Lde/javawi/jstun/attribute/ErrorCode;

    .line 163
    .local v2, "ec":Lde/javawi/jstun/attribute/ErrorCode;
    if-eqz v2, :cond_2

    .line 164
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    const-string/jumbo v12, "Message header contains errorcode message attribute."

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_1

    .line 167
    :cond_2
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    const-string/jumbo v12, "Binding Response received."

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 168
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->upperBinarySearchLifetime:I

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->lowerBinarySearchLifetime:I

    add-int/lit8 v12, v12, 0x1

    if-ne v11, v12, :cond_3

    .line 169
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "BindingLifetimeTest completed. UDP binding lifetime: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 170
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    const/4 v12, 0x1

    iput-boolean v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->completed:Z

    goto :goto_1

    .line 173
    :cond_3
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    iput v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->lifetime:I

    .line 174
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Lifetime update: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->lifetime:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 175
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    iput v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->lowerBinarySearchLifetime:I

    .line 176
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->upperBinarySearchLifetime:I

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->lowerBinarySearchLifetime:I

    add-int/2addr v12, v13

    div-int/lit8 v12, v12, 0x2

    iput v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    .line 177
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    if-lez v11, :cond_4

    .line 178
    new-instance v10, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;

    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    invoke-direct {v10, v11}, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;-><init>(Lde/javawi/jstun/test/BindingLifetimeTest;)V

    .line 179
    .local v10, "task":Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->timer:Ljava/util/Timer;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    int-to-long v12, v12

    invoke-virtual {v11, v10, v12, v13}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 180
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Timer scheduled: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 182
    .end local v10    # "task":Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;
    :cond_4
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    const/4 v12, 0x1

    iput-boolean v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->completed:Z
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 191
    .end local v0    # "changeRequest":Lde/javawi/jstun/attribute/ChangeRequest;
    .end local v1    # "data":[B
    .end local v2    # "ec":Lde/javawi/jstun/attribute/ErrorCode;
    .end local v4    # "receiveMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v5    # "responseAddress":Lde/javawi/jstun/attribute/ResponseAddress;
    .end local v6    # "send":Ljava/net/DatagramPacket;
    .end local v7    # "sendMH":Lde/javawi/jstun/header/MessageHeader;
    .end local v8    # "socket":Ljava/net/DatagramSocket;
    .restart local v9    # "ste":Ljava/net/SocketTimeoutException;
    :cond_5
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    iput v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->upperBinarySearchLifetime:I

    .line 192
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->upperBinarySearchLifetime:I

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->lowerBinarySearchLifetime:I

    add-int/2addr v12, v13

    div-int/lit8 v12, v12, 0x2

    iput v12, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    .line 193
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    if-lez v11, :cond_6

    .line 194
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    invoke-static {v11}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$100(Lde/javawi/jstun/test/BindingLifetimeTest;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 197
    new-instance v10, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;

    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    invoke-direct {v10, v11}, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;-><init>(Lde/javawi/jstun/test/BindingLifetimeTest;)V

    .line 198
    .restart local v10    # "task":Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v11, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->timer:Ljava/util/Timer;

    iget-object v12, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v12, v12, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    int-to-long v12, v12

    invoke-virtual {v11, v10, v12, v13}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 199
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Timer scheduled: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iget v13, v13, Lde/javawi/jstun/test/BindingLifetimeTest;->binarySearchLifetime:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 201
    .end local v10    # "task":Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;
    :cond_6
    iget-object v11, p0, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->this$0:Lde/javawi/jstun/test/BindingLifetimeTest;

    iput-boolean v14, v11, Lde/javawi/jstun/test/BindingLifetimeTest;->completed:Z

    goto/16 :goto_1
.end method

.method public run()V
    .locals 3

    .prologue
    .line 128
    :try_start_0
    invoke-virtual {p0}, Lde/javawi/jstun/test/BindingLifetimeTest$BindingLifetimeTask;->lifetimeQuery()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :goto_0
    return-void

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lde/javawi/jstun/test/BindingLifetimeTest;->access$000()Lorg/apache/commons/logging/Log;

    move-result-object v1

    const-string/jumbo v2, "Unhandled Exception. BindLifetimeTasks stopped."

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 131
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
