.class Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;
.super Ljava/lang/Object;
.source "ICECandidate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->check(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

.field final synthetic val$checkingCandidate:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

.field final synthetic val$localCandidates:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 229
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$checkingCandidate:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$localCandidates:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 232
    new-instance v7, Lorg/jivesoftware/smackx/jingle/nat/TestResult;

    invoke-direct {v7}, Lorg/jivesoftware/smackx/jingle/nat/TestResult;-><init>()V

    .line 237
    .local v7, "result":Lorg/jivesoftware/smackx/jingle/nat/TestResult;
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v9

    const-string/jumbo v10, "relay"

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 238
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->triggerCandidateChecked(Z)V

    .line 290
    :goto_0
    return-void

    .line 242
    :cond_0
    new-instance v8, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;

    invoke-direct {v8, p0, v7}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;Lorg/jivesoftware/smackx/jingle/nat/TestResult;)V

    .line 251
    .local v8, "resultListener":Lorg/jivesoftware/smackx/jingle/nat/ResultListener;
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$localCandidates:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 252
    .local v1, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getCandidateEcho()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    move-result-object v3

    .line 253
    .local v3, "echo":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    if-eqz v3, :cond_1

    .line 254
    instance-of v9, v1, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v9, :cond_1

    move-object v6, v1

    .line 255
    check-cast v6, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 256
    .local v6, "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v6}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v9

    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 258
    :try_start_0
    invoke-virtual {v3, v8}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->addResultListener(Lorg/jivesoftware/smackx/jingle/nat/ResultListener;)V

    .line 259
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    .line 260
    .local v0, "address":Ljava/net/InetAddress;
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$checkingCandidate:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    iget-object v10, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPassword()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v9, v10}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->testASync(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 262
    .end local v0    # "address":Ljava/net/InetAddress;
    :catch_0
    move-exception v2

    .line 263
    .local v2, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v2}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_1

    .line 270
    .end local v1    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v2    # "e":Ljava/net/UnknownHostException;
    .end local v3    # "echo":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    .end local v6    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :cond_2
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    const/16 v9, 0xa

    if-ge v4, v9, :cond_3

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->isReachable()Z

    move-result v9

    if-nez v9, :cond_3

    .line 272
    :try_start_1
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "ICE Candidate retry #"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 273
    const-wide/16 v10, 0x190

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 270
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 275
    :catch_1
    move-exception v2

    .line 276
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3

    .line 279
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :cond_3
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$localCandidates:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 280
    .restart local v1    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getCandidateEcho()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    move-result-object v3

    .line 281
    .restart local v3    # "echo":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    if-eqz v3, :cond_4

    .line 282
    invoke-virtual {v3, v8}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->removeResultListener(Lorg/jivesoftware/smackx/jingle/nat/ResultListener;)V

    goto :goto_4

    .line 286
    .end local v1    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v3    # "echo":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    :cond_5
    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->isReachable()Z

    move-result v10

    invoke-virtual {v9, v10}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->triggerCandidateChecked(Z)V

    goto/16 :goto_0
.end method
