.class Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;
.super Ljava/lang/Object;
.source "TransportNegotiator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->delayedCheckBestCandidate(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

.field final synthetic val$jin:Lorg/jivesoftware/smackx/packet/Jingle;

.field final synthetic val$js:Lorg/jivesoftware/smackx/jingle/JingleSession;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V
    .locals 0

    .prologue
    .line 293
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$js:Lorg/jivesoftware/smackx/jingle/JingleSession;

    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$jin:Lorg/jivesoftware/smackx/packet/Jingle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 299
    const/16 v13, 0x1b58

    .line 300
    .local v13, "totalTime":I
    const/4 v15, 0x7

    int-to-double v0, v15

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v16

    move-wide/from16 v0, v16

    double-to-int v14, v0

    .line 302
    .local v14, "tries":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    add-int/lit8 v15, v14, -0x1

    if-ge v9, v15, :cond_1

    .line 304
    const-wide/16 v16, 0x3e8

    :try_start_0
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 311
    :goto_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    .line 314
    .local v2, "bestRemote":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v15

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 317
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 318
    new-instance v12, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v15, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v12, v15}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 319
    .local v12, "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$200(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    move-result-object v15

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;

    move-result-object v4

    .line 320
    .local v4, "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15, v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v15

    invoke-virtual {v4, v15}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    .line 321
    invoke-virtual {v12, v4}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$js:Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$jin:Lorg/jivesoftware/smackx/packet/Jingle;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v12}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendFormattedJingle(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;

    .line 325
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 327
    .end local v4    # "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v12    # "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$300(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Z

    move-result v15

    if-eqz v15, :cond_3

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v15

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 328
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 329
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getAcceptedLocalCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v15, v0, v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$400(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 337
    .end local v2    # "bestRemote":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    .line 339
    .restart local v2    # "bestRemote":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    if-nez v2, :cond_a

    .line 340
    const/4 v8, 0x0

    .line 341
    .local v8, "foundRemoteRelay":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$500(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 342
    .local v3, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v15, v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v15, :cond_2

    move-object v11, v3

    .line 343
    check-cast v11, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 344
    .local v11, "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v15

    const-string/jumbo v16, "relay"

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 346
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15, v11}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 347
    const/4 v8, 0x1

    goto :goto_2

    .line 305
    .end local v2    # "bestRemote":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v8    # "foundRemoteRelay":Z
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :catch_0
    move-exception v5

    .line 306
    .local v5, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v5}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_1

    .line 302
    .end local v5    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "bestRemote":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0

    .line 354
    .restart local v8    # "foundRemoteRelay":Z
    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_4
    if-nez v8, :cond_a

    .line 355
    const/4 v6, 0x0

    .line 356
    .local v6, "foundLocalRelay":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$600(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_5
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 357
    .restart local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v15, v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v15, :cond_5

    move-object v11, v3

    .line 358
    check-cast v11, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 359
    .restart local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v15

    const-string/jumbo v16, "relay"

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 360
    const/4 v6, 0x1

    goto :goto_3

    .line 364
    .end local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :cond_6
    if-eqz v6, :cond_a

    .line 365
    const/4 v7, 0x0

    .line 366
    .local v7, "foundRemotePublic":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$500(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_7
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_8

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 367
    .restart local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v15, v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v15, :cond_7

    move-object v11, v3

    .line 368
    check-cast v11, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 369
    .restart local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v15

    sget-object v16, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->srflx:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 370
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15, v11}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 371
    const/4 v7, 0x1

    goto :goto_4

    .line 375
    .end local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :cond_8
    if-nez v7, :cond_a

    .line 376
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$500(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_9
    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 377
    .restart local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v15, v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v15, :cond_9

    move-object v11, v3

    .line 378
    check-cast v11, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 379
    .restart local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15, v11}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_5

    .line 387
    .end local v3    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v6    # "foundLocalRelay":Z
    .end local v7    # "foundRemotePublic":Z
    .end local v8    # "foundRemoteRelay":Z
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "iceCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    :cond_a
    const/4 v9, 0x0

    :goto_6
    const/4 v15, 0x6

    if-ge v9, v15, :cond_c

    .line 389
    const-wide/16 v16, 0x1f4

    :try_start_1
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 394
    :goto_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    .line 396
    if-eqz v2, :cond_e

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v15

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-object/from16 v0, v16

    if-ne v15, v0, :cond_e

    .line 398
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_b

    .line 399
    new-instance v12, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v15, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v12, v15}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 400
    .restart local v12    # "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$200(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    move-result-object v15

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;

    move-result-object v4

    .line 401
    .restart local v4    # "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15, v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v15

    invoke-virtual {v4, v15}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    .line 402
    invoke-virtual {v12, v4}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    .line 405
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$js:Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->val$jin:Lorg/jivesoftware/smackx/packet/Jingle;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v12}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendFormattedJingle(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;

    .line 406
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;

    move-result-object v15

    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 408
    .end local v4    # "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v12    # "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$300(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Z

    move-result v15

    if-eqz v15, :cond_e

    .line 409
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 415
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v15

    sget-object v16, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-object/from16 v0, v16

    if-eq v15, v0, :cond_d

    .line 417
    :try_start_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v15}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$700(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v15

    const-string/jumbo v16, "Unable to negotiate session. This may be caused by firewall configuration problems."

    invoke-virtual/range {v15 .. v16}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_2 .. :try_end_2} :catch_2

    .line 423
    :cond_d
    :goto_8
    return-void

    .line 390
    :catch_1
    move-exception v5

    .line 391
    .restart local v5    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v5}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_7

    .line 387
    .end local v5    # "e":Ljava/lang/InterruptedException;
    :cond_e
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6

    .line 419
    :catch_2
    move-exception v5

    .line 420
    .local v5, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v5}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_8
.end method
