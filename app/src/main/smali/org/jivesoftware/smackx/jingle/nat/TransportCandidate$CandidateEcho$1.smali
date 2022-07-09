.class Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;
.super Ljava/lang/Object;
.source "TransportCandidate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->testASync(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

.field final synthetic val$password:Ljava/lang/String;

.field final synthetic val$transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0

    .prologue
    .line 745
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->val$password:Ljava/lang/String;

    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->val$transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 749
    new-instance v5, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1$1;

    invoke-direct {v5, p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;)V

    .line 781
    .local v5, "listener":Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    invoke-virtual {v7, v5}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->addListener(Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;)V

    .line 783
    const/4 v0, 0x0

    .line 785
    .local v0, "content":[B
    :try_start_0
    new-instance v7, Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->val$password:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iget-object v9, v9, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iget-object v9, v9, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "UTF-8"

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 791
    :goto_0
    new-instance v6, Ljava/net/DatagramPacket;

    array-length v7, v0

    invoke-direct {v6, v0, v7}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 794
    .local v6, "packet":Ljava/net/DatagramPacket;
    :try_start_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->val$transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    .line 799
    :goto_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->val$transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/net/DatagramPacket;->setPort(I)V

    .line 801
    const-wide/16 v2, 0xc8

    .line 804
    .local v2, "delay":J
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    int-to-long v8, v4

    :try_start_2
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iget-wide v10, v7, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->tries:J

    cmp-long v7, v8, v10

    if-gez v7, :cond_0

    .line 805
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iget-object v7, v7, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v7, v6}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 806
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    iget-boolean v7, v7, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->ended:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    if-eqz v7, :cond_1

    .line 820
    :cond_0
    :goto_3
    const-wide/16 v8, 0x7d0

    :try_start_3
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_4

    .line 826
    :goto_4
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    invoke-virtual {v7, v5}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->removeListener(Lorg/jivesoftware/smackx/jingle/nat/DatagramListener;)V

    .line 827
    return-void

    .line 787
    .end local v2    # "delay":J
    .end local v4    # "i":I
    .end local v6    # "packet":Ljava/net/DatagramPacket;
    :catch_0
    move-exception v1

    .line 788
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 796
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v6    # "packet":Ljava/net/DatagramPacket;
    :catch_1
    move-exception v1

    .line 797
    .local v1, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v1}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_1

    .line 808
    .end local v1    # "e":Ljava/net/UnknownHostException;
    .restart local v2    # "delay":J
    .restart local v4    # "i":I
    :cond_1
    :try_start_4
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 804
    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 810
    :catch_2
    move-exception v1

    .line 811
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    .line 815
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v7

    goto :goto_3

    .line 822
    :catch_4
    move-exception v1

    .line 823
    .restart local v1    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_4
.end method
