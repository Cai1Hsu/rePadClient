.class public Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;
.super Lorg/jivesoftware/smackx/jingle/JingleSessionState;
.source "JingleSessionStateUnknown.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown$1;
    }
.end annotation


# static fields
.field private static INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSessionState;-><init>()V

    .line 43
    return-void
.end method

.method public static declared-synchronized getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;
    .locals 2

    .prologue
    .line 50
    const-class v1, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;

    if-nez v0, :cond_0

    .line 51
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;

    .line 53
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 50
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private receiveSessionInitiateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 23
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "inJingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 94
    const/16 v18, 0x0

    .line 95
    .local v18, "response":Lorg/jivesoftware/smack/packet/IQ;
    const/16 v19, 0x1

    .line 120
    .local v19, "shouldAck":Z
    if-nez v19, :cond_0

    .line 122
    sget-object v21, Lorg/jivesoftware/smackx/packet/JingleError;->NEGOTIATION_ERROR:Lorg/jivesoftware/smackx/packet/JingleError;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v18

    .line 192
    :goto_0
    return-object v18

    .line 127
    :cond_0
    invoke-virtual/range {p1 .. p2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v18

    .line 129
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 132
    invoke-virtual/range {p2 .. p2}, Lorg/jivesoftware/smackx/packet/Jingle;->getContentsList()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 134
    .local v11, "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    new-instance v4, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/JingleContent;->getCreator()Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/JingleContent;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v4, v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .local v4, "contentNeg":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/JingleContent;->getDescription()Lorg/jivesoftware/smackx/packet/JingleDescription;

    move-result-object v12

    .line 143
    .local v12, "jingleDescription":Lorg/jivesoftware/smackx/packet/JingleDescription;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getMediaManagers()Ljava/util/List;

    move-result-object v21

    const/16 v22, 0x0

    invoke-interface/range {v21 .. v22}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 144
    .local v3, "chosenMediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getMediaManagers()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 145
    .local v15, "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    const/4 v14, 0x1

    .line 146
    .local v14, "matches":Z
    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPayloads()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 147
    .local v16, "mediaPayloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getPayloadTypesList()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 148
    .local v5, "descPayloadType2":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-virtual/range {v16 .. v16}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v21

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v22

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_3

    .line 149
    const/4 v14, 0x0

    goto :goto_3

    .line 152
    .end local v5    # "descPayloadType2":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_4
    if-eqz v14, :cond_2

    .line 153
    move-object v3, v15

    goto :goto_2

    .line 159
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v14    # "matches":Z
    .end local v15    # "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .end local v16    # "mediaPayloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_5
    new-instance v21, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v12}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getPayloadTypesList()Ljava/util/List;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v3, v2, v4}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;Ljava/util/List;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setMediaNegotiator(Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;)V

    .line 164
    invoke-virtual {v11}, Lorg/jivesoftware/smackx/packet/JingleContent;->getJingleTransportsList()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/jivesoftware/smackx/packet/JingleTransport;

    .line 165
    .local v13, "jingleTransport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getMediaManagers()Ljava/util/List;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :cond_7
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 167
    .restart local v15    # "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    invoke-virtual {v15}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getTransportManager()Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    move-result-object v20

    .line 168
    .local v20, "transportManager":Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
    const/16 v17, 0x0

    .line 170
    .local v17, "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    :try_start_0
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;->getResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 175
    :goto_5
    invoke-virtual/range {v17 .. v17}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getType()Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    move-result-object v21

    sget-object v22, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual/range {v21 .. v22}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_8

    .line 176
    new-instance v21, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp;

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V

    .line 178
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getType()Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    move-result-object v21

    sget-object v22, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual/range {v21 .. v22}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_7

    .line 179
    new-instance v21, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;

    move-object/from16 v0, v21

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V

    goto :goto_4

    .line 171
    :catch_0
    move-exception v6

    .line 172
    .local v6, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v6}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_5

    .line 185
    .end local v6    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v13    # "jingleTransport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    .end local v15    # "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .end local v17    # "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .end local v20    # "transportManager":Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
    :cond_9
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addContentNegotiator(Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    goto/16 :goto_1

    .line 189
    .end local v3    # "chosenMediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .end local v4    # "contentNeg":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .end local v11    # "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v12    # "jingleDescription":Lorg/jivesoftware/smackx/packet/JingleDescription;
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setupListeners()V

    goto/16 :goto_0
.end method

.method private receiveSessionTerminateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 201
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    .line 204
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    :try_start_0
    const-string/jumbo v2, "Closed remotely"

    invoke-virtual {p1, v2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    :goto_0
    return-object v1

    .line 205
    :catch_0
    move-exception v0

    .line 206
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public enter()V
    .locals 0

    .prologue
    .line 59
    return-void
.end method

.method public exit()V
    .locals 0

    .prologue
    .line 64
    return-void
.end method

.method public processJingle(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p3, "action"    # Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .prologue
    .line 67
    const/4 v0, 0x0

    .line 69
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown$1;->$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum:[I

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 80
    sget-object v1, Lorg/jivesoftware/smackx/packet/JingleError;->MALFORMED_STANZA:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-virtual {p1, p2, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 84
    :goto_0
    return-object v0

    .line 71
    :pswitch_0
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->receiveSessionInitiateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 72
    goto :goto_0

    .line 75
    :pswitch_1
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateUnknown;->receiveSessionTerminateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 76
    goto :goto_0

    .line 69
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
