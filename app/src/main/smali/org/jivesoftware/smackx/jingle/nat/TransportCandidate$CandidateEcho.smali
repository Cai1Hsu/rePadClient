.class public Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
.super Ljava/lang/Object;
.source "TransportCandidate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CandidateEcho"
.end annotation


# instance fields
.field candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

.field enabled:Z

.field ended:Z

.field id:Ljava/lang/String;

.field listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;",
            ">;"
        }
    .end annotation
.end field

.field localUser:Ljava/lang/String;

.field receive:[B

.field remoteUser:Ljava/lang/String;

.field replyTries:J

.field resultListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/ResultListener;",
            ">;"
        }
    .end annotation
.end field

.field send:[B

.field sendPacket:Ljava/net/DatagramPacket;

.field socket:Ljava/net/DatagramSocket;

.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

.field tries:J


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 8
    .param p2, "candidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;,
            Ljava/net/SocketException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 626
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    .line 612
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->localUser:Ljava/lang/String;

    .line 613
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->remoteUser:Ljava/lang/String;

    .line 614
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->id:Ljava/lang/String;

    .line 615
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->send:[B

    .line 616
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->receive:[B

    .line 617
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->sendPacket:Ljava/net/DatagramPacket;

    .line 618
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->listeners:Ljava/util/List;

    .line 619
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->resultListeners:Ljava/util/List;

    .line 620
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    .line 621
    iput-boolean v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->ended:Z

    .line 622
    const-wide/16 v4, 0x2

    iput-wide v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->replyTries:J

    .line 623
    const-wide/16 v4, 0xa

    iput-wide v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->tries:J

    .line 624
    iput-object v6, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 627
    new-instance v4, Ljava/net/DatagramSocket;

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v5

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    .line 628
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->localUser:Ljava/lang/String;

    .line 629
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getResponder()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->remoteUser:Ljava/lang/String;

    .line 630
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSid()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->id:Ljava/lang/String;

    .line 631
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 633
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->id:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v1, v4

    .line 635
    .local v1, "keySplitIndex":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->id:Ljava/lang/String;

    invoke-virtual {v5, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->localUser:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 636
    .local v2, "local":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->id:Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->remoteUser:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 639
    .local v3, "remote":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 641
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->send:[B

    .line 642
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->receive:[B

    .line 653
    :goto_0
    return-void

    .line 644
    :cond_0
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->receive:[B

    .line 645
    const-string/jumbo v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->send:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 648
    :catch_0
    move-exception v0

    .line 649
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;Lorg/jivesoftware/smackx/jingle/nat/TestResult;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/nat/TestResult;
    .param p2, "x2"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 609
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->fireTestResult(Lorg/jivesoftware/smackx/jingle/nat/TestResult;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    return-void
.end method

.method private fireTestResult(Lorg/jivesoftware/smackx/jingle/nat/TestResult;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 3
    .param p1, "testResult"    # Lorg/jivesoftware/smackx/jingle/nat/TestResult;
    .param p2, "candidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 739
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->resultListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/ResultListener;

    .line 740
    .local v1, "resultListener":Lorg/jivesoftware/smackx/jingle/nat/ResultListener;
    invoke-interface {v1, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/ResultListener;->testFinished(Lorg/jivesoftware/smackx/jingle/nat/TestResult;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 741
    .end local v1    # "resultListener":Lorg/jivesoftware/smackx/jingle/nat/ResultListener;
    :cond_0
    return-void
.end method


# virtual methods
.method public addListener(Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;

    .prologue
    .line 833
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 834
    return-void
.end method

.method public addResultListener(Lorg/jivesoftware/smackx/jingle/nat/ResultListener;)V
    .locals 1
    .param p1, "resultListener"    # Lorg/jivesoftware/smackx/jingle/nat/ResultListener;

    .prologue
    .line 841
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->resultListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 842
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 734
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    .line 735
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 736
    return-void
.end method

.method public removeListener(Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;

    .prologue
    .line 837
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 838
    return-void
.end method

.method public removeResultListener(Lorg/jivesoftware/smackx/jingle/nat/ResultListener;)V
    .locals 1
    .param p1, "resultListener"    # Lorg/jivesoftware/smackx/jingle/nat/ResultListener;

    .prologue
    .line 845
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->resultListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 846
    return-void
.end method

.method public run()V
    .locals 26

    .prologue
    .line 657
    :try_start_0
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v21

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Listening for ECHO: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ":"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 660
    :cond_0
    new-instance v15, Ljava/net/DatagramPacket;

    const/16 v21, 0x96

    move/from16 v0, v21

    new-array v0, v0, [B

    move-object/from16 v21, v0

    const/16 v22, 0x96

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v15, v0, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 662
    .local v15, "packet":Ljava/net/DatagramPacket;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 666
    const/4 v2, 0x0

    .line 668
    .local v2, "accept":Z
    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v21

    invoke-static/range {v21 .. v21}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 669
    .local v4, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getLength()I

    move-result v21

    move/from16 v0, v21

    new-array v6, v0, [B

    .line 670
    .local v6, "content":[B
    const/16 v21, 0x0

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getLength()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v4, v6, v0, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 672
    invoke-virtual {v15, v6}, Ljava/net/DatagramPacket;->setData([B)V

    .line 674
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->listeners:Ljava/util/List;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;

    .line 675
    .local v14, "listener":Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;
    invoke-interface {v14, v15}, Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;->datagramReceived(Ljava/net/DatagramPacket;)Z

    move-result v2

    .line 676
    if-eqz v2, :cond_1

    .line 679
    .end local v14    # "listener":Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;
    :cond_2
    const-wide/16 v22, 0x64

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->replyTries:J

    move-wide/from16 v24, v0

    div-long v8, v22, v24

    .line 681
    .local v8, "delay":J
    new-instance v21, Ljava/lang/String;

    invoke-virtual {v15}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v22

    const-string/jumbo v23, "UTF-8"

    invoke-direct/range {v21 .. v23}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string/jumbo v22, ";"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v19

    .line 682
    .local v19, "str":[Ljava/lang/String;
    const/16 v21, 0x0

    aget-object v16, v19, v21

    .line 683
    .local v16, "pass":Ljava/lang/String;
    const/16 v21, 0x1

    aget-object v21, v19, v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 684
    .local v3, "address":[Ljava/lang/String;
    const/16 v21, 0x0

    aget-object v13, v3, v21

    .line 685
    .local v13, "ip":Ljava/lang/String;
    const/16 v21, 0x1

    aget-object v17, v3, v21

    .line 687
    .local v17, "port":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPassword()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5

    move-result v21

    if-eqz v21, :cond_0

    if-nez v2, :cond_0

    .line 689
    const/4 v5, 0x0

    .line 691
    .local v5, "cont":[B
    :try_start_1
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->password:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ";"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ":"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->candidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    const-string/jumbo v22, "UTF-8"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5

    move-result-object v5

    .line 697
    :goto_0
    :try_start_2
    invoke-virtual {v15, v5}, Ljava/net/DatagramPacket;->setData([B)V

    .line 698
    array-length v0, v5

    move/from16 v21, v0

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setLength(I)V

    .line 699
    invoke-static {v13}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 700
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 702
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    int-to-long v0, v10

    move-wide/from16 v22, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->replyTries:J

    move-wide/from16 v24, v0

    cmp-long v21, v22, v24

    if-gez v21, :cond_0

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v15}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 704
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    move/from16 v21, v0
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/net/SocketException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    if-eqz v21, :cond_0

    .line 706
    :try_start_3
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5

    .line 702
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 693
    .end local v10    # "i":I
    :catch_0
    move-exception v7

    .line 694
    .local v7, "e":Ljava/io/UnsupportedEncodingException;
    :try_start_4
    invoke-virtual {v7}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    goto :goto_0

    .line 715
    .end local v2    # "accept":Z
    .end local v3    # "address":[Ljava/lang/String;
    .end local v4    # "buf":Ljava/nio/ByteBuffer;
    .end local v5    # "cont":[B
    .end local v6    # "content":[B
    .end local v7    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v8    # "delay":J
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "ip":Ljava/lang/String;
    .end local v15    # "packet":Ljava/net/DatagramPacket;
    .end local v16    # "pass":Ljava/lang/String;
    .end local v17    # "port":Ljava/lang/String;
    .end local v19    # "str":[Ljava/lang/String;
    :catch_1
    move-exception v20

    .line 716
    .local v20, "uhe":Ljava/net/UnknownHostException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_3

    .line 731
    .end local v20    # "uhe":Ljava/net/UnknownHostException;
    :cond_3
    :goto_3
    return-void

    .line 708
    .restart local v2    # "accept":Z
    .restart local v3    # "address":[Ljava/lang/String;
    .restart local v4    # "buf":Ljava/nio/ByteBuffer;
    .restart local v5    # "cont":[B
    .restart local v6    # "content":[B
    .restart local v8    # "delay":J
    .restart local v10    # "i":I
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v13    # "ip":Ljava/lang/String;
    .restart local v15    # "packet":Ljava/net/DatagramPacket;
    .restart local v16    # "pass":Ljava/lang/String;
    .restart local v17    # "port":Ljava/lang/String;
    .restart local v19    # "str":[Ljava/lang/String;
    :catch_2
    move-exception v7

    .line 709
    .local v7, "e":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-virtual {v7}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_5
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/net/SocketException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_2

    .line 719
    .end local v2    # "accept":Z
    .end local v3    # "address":[Ljava/lang/String;
    .end local v4    # "buf":Ljava/nio/ByteBuffer;
    .end local v5    # "cont":[B
    .end local v6    # "content":[B
    .end local v7    # "e":Ljava/lang/InterruptedException;
    .end local v8    # "delay":J
    .end local v10    # "i":I
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "ip":Ljava/lang/String;
    .end local v15    # "packet":Ljava/net/DatagramPacket;
    .end local v16    # "pass":Ljava/lang/String;
    .end local v17    # "port":Ljava/lang/String;
    .end local v19    # "str":[Ljava/lang/String;
    :catch_3
    move-exception v18

    .line 720
    .local v18, "se":Ljava/net/SocketException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_3

    goto :goto_3

    .line 723
    .end local v18    # "se":Ljava/net/SocketException;
    :catch_4
    move-exception v12

    .line 724
    .local v12, "ioe":Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_3

    goto :goto_3

    .line 727
    .end local v12    # "ioe":Ljava/io/IOException;
    :catch_5
    move-exception v7

    .line 728
    .local v7, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->enabled:Z

    move/from16 v21, v0

    if-eqz v21, :cond_3

    goto :goto_3
.end method

.method public testASync(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;)V
    .locals 2
    .param p1, "transportCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p2, "password"    # Ljava/lang/String;

    .prologue
    .line 745
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;

    invoke-direct {v1, p0, p2, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 829
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 830
    return-void
.end method
