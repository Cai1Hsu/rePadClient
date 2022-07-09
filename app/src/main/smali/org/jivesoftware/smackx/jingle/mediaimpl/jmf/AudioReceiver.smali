.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;
.super Ljava/lang/Object;
.source "AudioReceiver.java"

# interfaces
.implements Ljavax/media/rtp/ReceiveStreamListener;
.implements Ljavax/media/rtp/SessionListener;
.implements Ljavax/media/ControllerListener;


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field dataReceived:Z

.field dataSync:Ljava/lang/Object;

.field jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V
    .locals 1
    .param p1, "dataSync"    # Ljava/lang/Object;
    .param p2, "jingleMediaSession"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->dataReceived:Z

    .line 61
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->dataSync:Ljava/lang/Object;

    .line 62
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .line 63
    return-void
.end method


# virtual methods
.method public declared-synchronized controllerUpdate(Ljavax/media/ControllerEvent;)V
    .locals 4
    .param p1, "ce"    # Ljavax/media/ControllerEvent;

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljavax/media/ControllerEvent;->getSourceController()Ljavax/media/Controller;

    move-result-object v0

    check-cast v0, Ljavax/media/Player;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    .local v0, "p":Ljavax/media/Player;
    if-nez v0, :cond_1

    .line 170
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 161
    :cond_1
    :try_start_1
    instance-of v1, p1, Ljavax/media/RealizeCompleteEvent;

    if-eqz v1, :cond_2

    .line 162
    invoke-interface {v0}, Ljavax/media/Player;->start()V

    .line 165
    :cond_2
    instance-of v1, p1, Ljavax/media/ControllerErrorEvent;

    if-eqz v1, :cond_0

    .line 166
    invoke-interface {v0, p0}, Ljavax/media/Player;->removeControllerListener(Ljavax/media/ControllerListener;)V

    .line 167
    sget-object v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Receiver internal error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 155
    .end local v0    # "p":Ljavax/media/Player;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized update(Ljavax/media/rtp/event/ReceiveStreamEvent;)V
    .locals 9
    .param p1, "evt"    # Ljavax/media/rtp/event/ReceiveStreamEvent;

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljavax/media/rtp/event/ReceiveStreamEvent;->getParticipant()Ljavax/media/rtp/Participant;

    move-result-object v4

    .line 81
    .local v4, "participant":Ljavax/media/rtp/Participant;
    invoke-virtual {p1}, Ljavax/media/rtp/event/ReceiveStreamEvent;->getReceiveStream()Ljavax/media/rtp/ReceiveStream;

    move-result-object v5

    .line 83
    .local v5, "stream":Ljavax/media/rtp/ReceiveStream;
    instance-of v6, p1, Ljavax/media/rtp/event/RemotePayloadChangeEvent;

    if-eqz v6, :cond_1

    .line 84
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "  - Received an RTP PayloadChangeEvent."

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 85
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "Sorry, cannot handle payload change."

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 148
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 88
    :cond_1
    :try_start_1
    instance-of v6, p1, Ljavax/media/rtp/event/NewReceiveStreamEvent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v6, :cond_5

    .line 91
    :try_start_2
    invoke-virtual {p1}, Ljavax/media/rtp/event/ReceiveStreamEvent;->getReceiveStream()Ljavax/media/rtp/ReceiveStream;

    move-result-object v5

    .line 92
    invoke-interface {v5}, Ljavax/media/rtp/ReceiveStream;->getDataSource()Ljavax/media/protocol/DataSource;

    move-result-object v1

    .line 95
    .local v1, "ds":Ljavax/media/protocol/DataSource;
    const-string/jumbo v6, "javax.jmf.rtp.RTPControl"

    invoke-virtual {v1, v6}, Ljavax/media/protocol/DataSource;->getControl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/media/rtp/RTPControl;

    .line 96
    .local v0, "ctl":Ljavax/media/rtp/RTPControl;
    if-eqz v0, :cond_2

    .line 97
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "  - Recevied new RTP stream: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljavax/media/rtp/RTPControl;->getFormat()Ljavax/media/Format;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 102
    :goto_1
    if-nez v4, :cond_3

    .line 103
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "      The sender of this stream had yet to be identified."

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 109
    :goto_2
    invoke-static {v1}, Ljavax/media/Manager;->createPlayer(Ljavax/media/protocol/DataSource;)Ljavax/media/Player;

    move-result-object v3

    .line 110
    .local v3, "p":Ljavax/media/Player;
    if-eqz v3, :cond_0

    .line 113
    invoke-interface {v3, p0}, Ljavax/media/Player;->addControllerListener(Ljavax/media/ControllerListener;)V

    .line 114
    invoke-interface {v3}, Ljavax/media/Player;->realize()V

    .line 115
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    if-eqz v4, :cond_4

    invoke-interface {v4}, Ljavax/media/rtp/Participant;->getCNAME()Ljava/lang/String;

    move-result-object v6

    :goto_3
    invoke-virtual {v7, v6}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceived(Ljava/lang/String;)V

    .line 118
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->dataSync:Ljava/lang/Object;

    monitor-enter v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 119
    const/4 v6, 0x1

    :try_start_3
    iput-boolean v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->dataReceived:Z

    .line 120
    iget-object v6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->dataSync:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 121
    monitor-exit v7

    goto :goto_0

    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 124
    .end local v0    # "ctl":Ljavax/media/rtp/RTPControl;
    .end local v1    # "ds":Ljavax/media/protocol/DataSource;
    .end local v3    # "p":Ljavax/media/Player;
    :catch_0
    move-exception v2

    .line 125
    .local v2, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "NewReceiveStreamEvent exception "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto/16 :goto_0

    .line 80
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "participant":Ljavax/media/rtp/Participant;
    .end local v5    # "stream":Ljavax/media/rtp/ReceiveStream;
    :catchall_1
    move-exception v6

    monitor-exit p0

    throw v6

    .line 100
    .restart local v0    # "ctl":Ljavax/media/rtp/RTPControl;
    .restart local v1    # "ds":Ljavax/media/protocol/DataSource;
    .restart local v4    # "participant":Ljavax/media/rtp/Participant;
    .restart local v5    # "stream":Ljavax/media/rtp/ReceiveStream;
    :cond_2
    :try_start_6
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "  - Recevied new RTP stream"

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 105
    :cond_3
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "      The stream comes from: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljavax/media/rtp/Participant;->getCNAME()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 115
    .restart local v3    # "p":Ljavax/media/Player;
    :cond_4
    const-string/jumbo v6, ""
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_3

    .line 130
    .end local v0    # "ctl":Ljavax/media/rtp/RTPControl;
    .end local v1    # "ds":Ljavax/media/protocol/DataSource;
    .end local v3    # "p":Ljavax/media/Player;
    :cond_5
    :try_start_7
    instance-of v6, p1, Ljavax/media/rtp/event/StreamMappedEvent;

    if-eqz v6, :cond_7

    .line 132
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljavax/media/rtp/ReceiveStream;->getDataSource()Ljavax/media/protocol/DataSource;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 133
    invoke-interface {v5}, Ljavax/media/rtp/ReceiveStream;->getDataSource()Ljavax/media/protocol/DataSource;

    move-result-object v1

    .line 135
    .restart local v1    # "ds":Ljavax/media/protocol/DataSource;
    const-string/jumbo v6, "javax.jmf.rtp.RTPControl"

    invoke-virtual {v1, v6}, Ljavax/media/protocol/DataSource;->getControl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/media/rtp/RTPControl;

    .line 136
    .restart local v0    # "ctl":Ljavax/media/rtp/RTPControl;
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v7, "  - The previously unidentified stream "

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 137
    if-eqz v0, :cond_6

    .line 138
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "      "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljavax/media/rtp/RTPControl;->getFormat()Ljavax/media/Format;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 139
    :cond_6
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "      had now been identified as sent by: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljavax/media/rtp/Participant;->getCNAME()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 142
    .end local v0    # "ctl":Ljavax/media/rtp/RTPControl;
    .end local v1    # "ds":Ljavax/media/protocol/DataSource;
    :cond_7
    instance-of v6, p1, Ljavax/media/rtp/event/ByeEvent;

    if-eqz v6, :cond_0

    .line 144
    sget-object v6, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "  - Got \"bye\" from: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljavax/media/rtp/Participant;->getCNAME()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto/16 :goto_0
.end method

.method public declared-synchronized update(Ljavax/media/rtp/event/SessionEvent;)V
    .locals 4
    .param p1, "evt"    # Ljavax/media/rtp/event/SessionEvent;

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    instance-of v1, p1, Ljavax/media/rtp/event/NewParticipantEvent;

    if-eqz v1, :cond_0

    .line 70
    check-cast p1, Ljavax/media/rtp/event/NewParticipantEvent;

    .end local p1    # "evt":Ljavax/media/rtp/event/SessionEvent;
    invoke-virtual {p1}, Ljavax/media/rtp/event/NewParticipantEvent;->getParticipant()Ljavax/media/rtp/Participant;

    move-result-object v0

    .line 71
    .local v0, "p":Ljavax/media/rtp/Participant;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "  - A new participant had just joined: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljavax/media/rtp/Participant;->getCNAME()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    .end local v0    # "p":Ljavax/media/rtp/Participant;
    :cond_0
    monitor-exit p0

    return-void

    .line 69
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
