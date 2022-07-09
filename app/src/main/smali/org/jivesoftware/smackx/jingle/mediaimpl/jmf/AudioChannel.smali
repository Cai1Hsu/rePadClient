.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
.super Ljava/lang/Object;
.source "AudioChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

.field private dataOutput:Ljavax/media/protocol/DataSource;

.field private failed:Z

.field private format:Ljavax/media/Format;

.field private jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

.field private localIpAddress:Ljava/lang/String;

.field private localPort:I

.field private locator:Ljavax/media/MediaLocator;

.field private portBase:I

.field private processor:Ljavax/media/Processor;

.field private remoteIpAddress:Ljava/lang/String;

.field private rtpMgrs:[Ljavax/media/rtp/RTPManager;

.field private sendStreams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljavax/media/rtp/SendStream;",
            ">;"
        }
    .end annotation
.end field

.field private started:Z

.field private stateLock:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Ljavax/media/MediaLocator;Ljava/lang/String;Ljava/lang/String;IILjavax/media/Format;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V
    .locals 2
    .param p1, "locator"    # Ljavax/media/MediaLocator;
    .param p2, "localIpAddress"    # Ljava/lang/String;
    .param p3, "remoteIpAddress"    # Ljava/lang/String;
    .param p4, "localPort"    # I
    .param p5, "remotePort"    # I
    .param p6, "format"    # Ljavax/media/Format;
    .param p7, "jingleMediaSession"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    .line 85
    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->dataOutput:Ljavax/media/protocol/DataSource;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->sendStreams:Ljava/util/List;

    .line 92
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z

    .line 440
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->stateLock:Ljava/lang/Integer;

    .line 441
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->failed:Z

    .line 111
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->locator:Ljavax/media/MediaLocator;

    .line 112
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localIpAddress:Ljava/lang/String;

    .line 113
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->remoteIpAddress:Ljava/lang/String;

    .line 114
    iput p4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localPort:I

    .line 115
    iput p5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->portBase:I

    .line 116
    iput-object p6, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->format:Ljavax/media/Format;

    .line 117
    iput-object p7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .line 118
    return-void
.end method

.method private createProcessor()Ljava/lang/String;
    .locals 25

    .prologue
    .line 185
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->locator:Ljavax/media/MediaLocator;

    move-object/from16 v22, v0

    if-nez v22, :cond_0

    .line 186
    const-string/jumbo v22, "Locator is null"

    .line 310
    :goto_0
    return-object v22

    .line 191
    :cond_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->locator:Ljavax/media/MediaLocator;

    move-object/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljavax/media/Manager;->createDataSource(Ljavax/media/MediaLocator;)Ljavax/media/protocol/DataSource;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 205
    .local v8, "ds":Ljavax/media/protocol/DataSource;
    :goto_1
    :try_start_1
    invoke-static {v8}, Ljavax/media/Manager;->createProcessor(Ljavax/media/protocol/DataSource;)Ljavax/media/Processor;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;
    :try_end_1
    .catch Ljavax/media/NoProcessorException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    const/16 v23, 0xb4

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->waitForState(Ljavax/media/Processor;I)Z

    move-result v19

    .line 218
    .local v19, "result":Z
    if-nez v19, :cond_1

    .line 219
    const-string/jumbo v22, "Couldn\'t configure processor"

    goto :goto_0

    .line 193
    .end local v8    # "ds":Ljavax/media/protocol/DataSource;
    .end local v19    # "result":Z
    :catch_0
    move-exception v9

    .line 196
    .local v9, "e":Ljava/lang/Exception;
    :try_start_2
    new-instance v22, Ljavax/media/MediaLocator;

    const-string/jumbo v23, "javasound://"

    invoke-direct/range {v22 .. v23}, Ljavax/media/MediaLocator;-><init>(Ljava/lang/String;)V

    invoke-static/range {v22 .. v22}, Ljavax/media/Manager;->createDataSource(Ljavax/media/MediaLocator;)Ljavax/media/protocol/DataSource;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v8

    .restart local v8    # "ds":Ljavax/media/protocol/DataSource;
    goto :goto_1

    .line 198
    .end local v8    # "ds":Ljavax/media/protocol/DataSource;
    :catch_1
    move-exception v10

    .line 199
    .local v10, "ee":Ljava/lang/Exception;
    const-string/jumbo v22, "Couldn\'t create DataSource"

    goto :goto_0

    .line 207
    .end local v9    # "e":Ljava/lang/Exception;
    .end local v10    # "ee":Ljava/lang/Exception;
    .restart local v8    # "ds":Ljavax/media/protocol/DataSource;
    :catch_2
    move-exception v16

    .line 208
    .local v16, "npe":Ljavax/media/NoProcessorException;
    invoke-virtual/range {v16 .. v16}, Ljavax/media/NoProcessorException;->printStackTrace()V

    .line 209
    const-string/jumbo v22, "Couldn\'t create processor"

    goto :goto_0

    .line 211
    .end local v16    # "npe":Ljavax/media/NoProcessorException;
    :catch_3
    move-exception v14

    .line 212
    .local v14, "ioe":Ljava/io/IOException;
    invoke-virtual {v14}, Ljava/io/IOException;->printStackTrace()V

    .line 213
    const-string/jumbo v22, "IOException creating processor"

    goto :goto_0

    .line 223
    .end local v14    # "ioe":Ljava/io/IOException;
    .restart local v19    # "result":Z
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljavax/media/Processor;->getTrackControls()[Ljavax/media/control/TrackControl;

    move-result-object v21

    .line 226
    .local v21, "tracks":[Ljavax/media/control/TrackControl;
    if-eqz v21, :cond_2

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_3

    .line 227
    :cond_2
    const-string/jumbo v22, "Couldn\'t find tracks in processor"

    goto :goto_0

    .line 233
    :cond_3
    new-instance v5, Ljavax/media/protocol/ContentDescriptor;

    const-string/jumbo v22, "raw.rtp"

    move-object/from16 v0, v22

    invoke-direct {v5, v0}, Ljavax/media/protocol/ContentDescriptor;-><init>(Ljava/lang/String;)V

    .line 234
    .local v5, "cd":Ljavax/media/protocol/ContentDescriptor;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-interface {v0, v5}, Ljavax/media/Processor;->setContentDescriptor(Ljavax/media/protocol/ContentDescriptor;)Ljavax/media/protocol/ContentDescriptor;

    .line 237
    const/4 v6, 0x0

    .line 238
    .local v6, "chosen":Ljavax/media/Format;
    const/4 v4, 0x0

    .line 241
    .local v4, "atLeastOneTrack":Z
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v12, v0, :cond_b

    .line 242
    aget-object v22, v21, v12

    invoke-interface/range {v22 .. v22}, Ljavax/media/control/TrackControl;->isEnabled()Z

    move-result v22

    if-eqz v22, :cond_8

    .line 244
    aget-object v22, v21, v12

    invoke-interface/range {v22 .. v22}, Ljavax/media/control/TrackControl;->getSupportedFormats()[Ljavax/media/Format;

    move-result-object v20

    .line 246
    .local v20, "supported":[Ljavax/media/Format;
    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v22, v0

    if-lez v22, :cond_a

    .line 247
    move-object/from16 v3, v20

    .local v3, "arr$":[Ljavax/media/Format;
    array-length v15, v3

    .local v15, "len$":I
    const/4 v13, 0x0

    .local v13, "i$":I
    :goto_3
    if-ge v13, v15, :cond_5

    aget-object v11, v3, v13

    .line 248
    .local v11, "format":Ljavax/media/Format;
    instance-of v0, v11, Ljavax/media/format/AudioFormat;

    move/from16 v22, v0

    if-eqz v22, :cond_4

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->format:Ljavax/media/Format;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljavax/media/Format;->matches(Ljavax/media/Format;)Z

    move-result v22

    if-eqz v22, :cond_4

    .line 250
    move-object v6, v11

    .line 247
    :cond_4
    add-int/lit8 v13, v13, 0x1

    goto :goto_3

    .line 253
    .end local v11    # "format":Ljavax/media/Format;
    :cond_5
    if-eqz v6, :cond_9

    .line 254
    aget-object v22, v21, v12

    move-object/from16 v0, v22

    invoke-interface {v0, v6}, Ljavax/media/control/TrackControl;->setFormat(Ljavax/media/Format;)Ljavax/media/Format;

    .line 255
    sget-object v22, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Track "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string/jumbo v24, " is set to transmit as:"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 256
    sget-object v22, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "  "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 258
    aget-object v22, v21, v12

    invoke-interface/range {v22 .. v22}, Ljavax/media/control/TrackControl;->getFormat()Ljavax/media/Format;

    move-result-object v22

    move-object/from16 v0, v22

    instance-of v0, v0, Ljavax/media/format/AudioFormat;

    move/from16 v22, v0

    if-eqz v22, :cond_7

    .line 259
    const/16 v17, 0x14

    .line 260
    .local v17, "packetRate":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    const-class v23, Ljavax/media/control/PacketSizeControl;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-interface/range {v22 .. v23}, Ljavax/media/Processor;->getControl(Ljava/lang/String;)Ljavax/media/Control;

    move-result-object v18

    check-cast v18, Ljavax/media/control/PacketSizeControl;

    .line 261
    .local v18, "pktCtrl":Ljavax/media/control/PacketSizeControl;
    if-eqz v18, :cond_6

    .line 263
    :try_start_3
    aget-object v22, v21, v12

    invoke-interface/range {v22 .. v22}, Ljavax/media/control/TrackControl;->getFormat()Ljavax/media/Format;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->getPacketSize(Ljavax/media/Format;I)I

    move-result v22

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-interface {v0, v1}, Ljavax/media/control/PacketSizeControl;->setPacketSize(I)I
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_4

    .line 271
    :cond_6
    :goto_4
    aget-object v22, v21, v12

    invoke-interface/range {v22 .. v22}, Ljavax/media/control/TrackControl;->getFormat()Ljavax/media/Format;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljavax/media/Format;->getEncoding()Ljava/lang/String;

    move-result-object v22

    const-string/jumbo v23, "ULAW/rtp"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 272
    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v7, v0, [Ljavax/media/Codec;

    .line 274
    .local v7, "codec":[Ljavax/media/Codec;
    const/16 v22, 0x0

    new-instance v23, Lcom/ibm/media/codec/audio/rc/RCModule;

    invoke-direct/range {v23 .. v23}, Lcom/ibm/media/codec/audio/rc/RCModule;-><init>()V

    aput-object v23, v7, v22

    .line 275
    const/16 v22, 0x1

    new-instance v23, Lcom/ibm/media/codec/audio/ulaw/JavaEncoder;

    invoke-direct/range {v23 .. v23}, Lcom/ibm/media/codec/audio/ulaw/JavaEncoder;-><init>()V

    aput-object v23, v7, v22

    .line 276
    const/16 v22, 0x2

    new-instance v23, Lcom/sun/media/codec/audio/ulaw/Packetizer;

    invoke-direct/range {v23 .. v23}, Lcom/sun/media/codec/audio/ulaw/Packetizer;-><init>()V

    aput-object v23, v7, v22

    .line 277
    const/16 v22, 0x2

    aget-object v22, v7, v22

    check-cast v22, Lcom/sun/media/codec/audio/ulaw/Packetizer;

    const/16 v23, 0xa0

    invoke-virtual/range {v22 .. v23}, Lcom/sun/media/codec/audio/ulaw/Packetizer;->setPacketSize(I)V

    .line 281
    :try_start_4
    aget-object v22, v21, v12

    move-object/from16 v0, v22

    invoke-interface {v0, v7}, Ljavax/media/control/TrackControl;->setCodecChain([Ljavax/media/Codec;)V
    :try_end_4
    .catch Ljavax/media/UnsupportedPlugInException; {:try_start_4 .. :try_end_4} :catch_5

    .line 290
    .end local v7    # "codec":[Ljavax/media/Codec;
    .end local v17    # "packetRate":I
    .end local v18    # "pktCtrl":Ljavax/media/control/PacketSizeControl;
    :cond_7
    :goto_5
    const/4 v4, 0x1

    .line 241
    .end local v3    # "arr$":[Ljavax/media/Format;
    .end local v13    # "i$":I
    .end local v15    # "len$":I
    .end local v20    # "supported":[Ljavax/media/Format;
    :cond_8
    :goto_6
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_2

    .line 265
    .restart local v3    # "arr$":[Ljavax/media/Format;
    .restart local v13    # "i$":I
    .restart local v15    # "len$":I
    .restart local v17    # "packetRate":I
    .restart local v18    # "pktCtrl":Ljavax/media/control/PacketSizeControl;
    .restart local v20    # "supported":[Ljavax/media/Format;
    :catch_4
    move-exception v9

    .line 266
    .local v9, "e":Ljava/lang/IllegalArgumentException;
    const/16 v22, 0x50

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-interface {v0, v1}, Ljavax/media/control/PacketSizeControl;->setPacketSize(I)I

    goto :goto_4

    .line 283
    .end local v9    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v7    # "codec":[Ljavax/media/Codec;
    :catch_5
    move-exception v9

    .line 284
    .local v9, "e":Ljavax/media/UnsupportedPlugInException;
    invoke-virtual {v9}, Ljavax/media/UnsupportedPlugInException;->printStackTrace()V

    goto :goto_5

    .line 293
    .end local v7    # "codec":[Ljavax/media/Codec;
    .end local v9    # "e":Ljavax/media/UnsupportedPlugInException;
    .end local v17    # "packetRate":I
    .end local v18    # "pktCtrl":Ljavax/media/control/PacketSizeControl;
    :cond_9
    aget-object v22, v21, v12

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Ljavax/media/control/TrackControl;->setEnabled(Z)V

    goto :goto_6

    .line 296
    .end local v3    # "arr$":[Ljavax/media/Format;
    .end local v13    # "i$":I
    .end local v15    # "len$":I
    :cond_a
    aget-object v22, v21, v12

    const/16 v23, 0x0

    invoke-interface/range {v22 .. v23}, Ljavax/media/control/TrackControl;->setEnabled(Z)V

    goto :goto_6

    .line 300
    .end local v20    # "supported":[Ljavax/media/Format;
    :cond_b
    if-nez v4, :cond_c

    .line 301
    const-string/jumbo v22, "Couldn\'t set any of the tracks to a valid RTP format"

    goto/16 :goto_0

    .line 303
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    const/16 v23, 0x12c

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->waitForState(Ljavax/media/Processor;I)Z

    move-result v19

    .line 304
    if-nez v19, :cond_d

    .line 305
    const-string/jumbo v22, "Couldn\'t realize processor"

    goto/16 :goto_0

    .line 308
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljavax/media/Processor;->getDataOutput()Ljavax/media/protocol/DataSource;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->dataOutput:Ljavax/media/protocol/DataSource;

    .line 310
    const/16 v22, 0x0

    goto/16 :goto_0
.end method

.method private createTransmitter()Ljava/lang/String;
    .locals 15

    .prologue
    .line 345
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->dataOutput:Ljavax/media/protocol/DataSource;

    check-cast v7, Ljavax/media/protocol/PushBufferDataSource;

    .line 346
    .local v7, "pbds":Ljavax/media/protocol/PushBufferDataSource;
    invoke-virtual {v7}, Ljavax/media/protocol/PushBufferDataSource;->getStreams()[Ljavax/media/protocol/PushBufferStream;

    move-result-object v8

    .line 348
    .local v8, "pbss":[Ljavax/media/protocol/PushBufferStream;
    array-length v12, v8

    new-array v12, v12, [Ljavax/media/rtp/RTPManager;

    iput-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    .line 352
    new-instance v12, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    iget-object v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-direct {v12, p0, v13}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;-><init>(Ljava/lang/Object;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V

    iput-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    .line 355
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v12, v8

    if-ge v4, v12, :cond_1

    .line 357
    :try_start_0
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    invoke-static {}, Ljavax/media/rtp/RTPManager;->newInstance()Ljavax/media/rtp/RTPManager;

    move-result-object v13

    aput-object v13, v12, v4

    .line 359
    iget v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->portBase:I

    mul-int/lit8 v13, v4, 0x2

    add-int v9, v12, v13

    .line 360
    .local v9, "port":I
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->remoteIpAddress:Ljava/lang/String;

    invoke-static {v12}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v5

    .line 362
    .local v5, "ipAddr":Ljava/net/InetAddress;
    new-instance v6, Ljavax/media/rtp/SessionAddress;

    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localIpAddress:Ljava/lang/String;

    invoke-static {v12}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v12

    iget v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localPort:I

    invoke-direct {v6, v12, v13}, Ljavax/media/rtp/SessionAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 365
    .local v6, "localAddr":Ljavax/media/rtp/SessionAddress;
    new-instance v2, Ljavax/media/rtp/SessionAddress;

    invoke-direct {v2, v5, v9}, Ljavax/media/rtp/SessionAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 367
    .local v2, "destAddr":Ljavax/media/rtp/SessionAddress;
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    iget-object v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    invoke-virtual {v12, v13}, Ljavax/media/rtp/RTPManager;->addReceiveStreamListener(Ljavax/media/rtp/ReceiveStreamListener;)V

    .line 368
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    iget-object v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    invoke-virtual {v12, v13}, Ljavax/media/rtp/RTPManager;->addSessionListener(Ljavax/media/rtp/SessionListener;)V

    .line 370
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    const-string/jumbo v13, "javax.media.control.BufferControl"

    invoke-virtual {v12, v13}, Ljavax/media/rtp/RTPManager;->getControl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/media/control/BufferControl;

    .line 371
    .local v0, "bc":Ljavax/media/control/BufferControl;
    if-eqz v0, :cond_0

    .line 372
    const/16 v1, 0xa0

    .line 373
    .local v1, "bl":I
    int-to-long v12, v1

    invoke-interface {v0, v12, v13}, Ljavax/media/control/BufferControl;->setBufferLength(J)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 378
    .end local v1    # "bl":I
    :cond_0
    :try_start_1
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    invoke-virtual {v12, v6}, Ljavax/media/rtp/RTPManager;->initialize(Ljavax/media/rtp/SessionAddress;)V
    :try_end_1
    .catch Ljavax/media/rtp/InvalidSessionAddressException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 389
    :goto_1
    :try_start_2
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    invoke-virtual {v12, v2}, Ljavax/media/rtp/RTPManager;->addTarget(Ljavax/media/rtp/SessionAddress;)V

    .line 391
    sget-object v12, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "Created RTP session at "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localPort:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " to: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->remoteIpAddress:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 393
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    iget-object v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->dataOutput:Ljavax/media/protocol/DataSource;

    invoke-virtual {v12, v13, v4}, Ljavax/media/rtp/RTPManager;->createSendStream(Ljavax/media/protocol/DataSource;I)Ljavax/media/rtp/SendStream;

    move-result-object v10

    .line 395
    .local v10, "sendStream":Ljavax/media/rtp/SendStream;
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->sendStreams:Ljava/util/List;

    invoke-interface {v12, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    invoke-interface {v10}, Ljavax/media/rtp/SendStream;->start()V

    .line 355
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 381
    .end local v10    # "sendStream":Ljavax/media/rtp/SendStream;
    :catch_0
    move-exception v3

    .line 383
    .local v3, "e":Ljavax/media/rtp/InvalidSessionAddressException;
    new-instance v11, Ljavax/media/rtp/SessionAddress;

    invoke-direct {v11}, Ljavax/media/rtp/SessionAddress;-><init>()V

    .line 384
    .local v11, "sessAddr":Ljavax/media/rtp/SessionAddress;
    new-instance v6, Ljavax/media/rtp/SessionAddress;

    .end local v6    # "localAddr":Ljavax/media/rtp/SessionAddress;
    invoke-virtual {v11}, Ljavax/media/rtp/SessionAddress;->getDataAddress()Ljava/net/InetAddress;

    move-result-object v12

    iget v13, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->localPort:I

    invoke-direct {v6, v12, v13}, Ljavax/media/rtp/SessionAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 386
    .restart local v6    # "localAddr":Ljavax/media/rtp/SessionAddress;
    iget-object v12, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    aget-object v12, v12, v4

    invoke-virtual {v12, v6}, Ljavax/media/rtp/RTPManager;->initialize(Ljavax/media/rtp/SessionAddress;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 400
    .end local v0    # "bc":Ljavax/media/control/BufferControl;
    .end local v2    # "destAddr":Ljavax/media/rtp/SessionAddress;
    .end local v3    # "e":Ljavax/media/rtp/InvalidSessionAddressException;
    .end local v5    # "ipAddr":Ljava/net/InetAddress;
    .end local v6    # "localAddr":Ljavax/media/rtp/SessionAddress;
    .end local v9    # "port":I
    .end local v11    # "sessAddr":Ljavax/media/rtp/SessionAddress;
    :catch_1
    move-exception v3

    .line 401
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 402
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    .line 406
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v12

    :cond_1
    const/4 v12, 0x0

    goto :goto_2
.end method

.method private getPacketSize(Ljavax/media/Format;I)I
    .locals 3
    .param p1, "codecFormat"    # Ljavax/media/Format;
    .param p2, "milliseconds"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 322
    invoke-virtual {p1}, Ljavax/media/Format;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 323
    .local v0, "encoding":Ljava/lang/String;
    const-string/jumbo v1, "gsm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "gsm/rtp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 325
    :cond_0
    mul-int/lit8 v1, p2, 0x4

    .line 329
    :goto_0
    return v1

    .line 327
    :cond_1
    const-string/jumbo v1, "ULAW"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "ULAW/rtp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 329
    :cond_2
    mul-int/lit8 v1, p2, 0x8

    goto :goto_0

    .line 332
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Unknown codec type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static main([Ljava/lang/String;)V
    .locals 11
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 509
    :try_start_0
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v10

    .line 511
    .local v10, "localhost":Ljava/net/InetAddress;
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    new-instance v1, Ljavax/media/MediaLocator;

    const-string/jumbo v2, "javasound://8000"

    invoke-direct {v1, v2}, Ljavax/media/MediaLocator;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x1b5a

    const/16 v5, 0x1b6c

    new-instance v6, Ljavax/media/format/AudioFormat;

    const-string/jumbo v7, "gsm/rtp"

    invoke-direct {v6, v7}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;-><init>(Ljavax/media/MediaLocator;Ljava/lang/String;Ljava/lang/String;IILjavax/media/Format;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V

    .line 512
    .local v0, "audioChannel0":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    new-instance v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    new-instance v2, Ljavax/media/MediaLocator;

    const-string/jumbo v3, "javasound://8000"

    invoke-direct {v2, v3}, Ljavax/media/MediaLocator;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v10}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x1b6c

    const/16 v6, 0x1b5a

    new-instance v7, Ljavax/media/format/AudioFormat;

    const-string/jumbo v8, "gsm/rtp"

    invoke-direct {v7, v8}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;-><init>(Ljavax/media/MediaLocator;Ljava/lang/String;Ljava/lang/String;IILjavax/media/Format;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V

    .line 514
    .local v1, "audioChannel1":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->start()Ljava/lang/String;

    .line 515
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->start()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_1

    .line 518
    const-wide/16 v2, 0x1388

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    .line 524
    :goto_0
    const/4 v2, 0x0

    :try_start_2
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setTrasmit(Z)V

    .line 525
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setTrasmit(Z)V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_1

    .line 528
    const-wide/16 v2, 0x1388

    :try_start_3
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/net/UnknownHostException; {:try_start_3 .. :try_end_3} :catch_1

    .line 534
    :goto_1
    const/4 v2, 0x1

    :try_start_4
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setTrasmit(Z)V

    .line 535
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setTrasmit(Z)V
    :try_end_4
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_4} :catch_1

    .line 538
    const-wide/16 v2, 0x1388

    :try_start_5
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/net/UnknownHostException; {:try_start_5 .. :try_end_5} :catch_1

    .line 544
    :goto_2
    :try_start_6
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->stop()V

    .line 545
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->stop()V

    .line 552
    .end local v0    # "audioChannel0":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .end local v1    # "audioChannel1":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .end local v10    # "localhost":Ljava/net/InetAddress;
    :goto_3
    return-void

    .line 520
    .restart local v0    # "audioChannel0":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .restart local v1    # "audioChannel1":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .restart local v10    # "localhost":Ljava/net/InetAddress;
    :catch_0
    move-exception v9

    .line 521
    .local v9, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_6
    .catch Ljava/net/UnknownHostException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_0

    .line 548
    .end local v0    # "audioChannel0":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .end local v1    # "audioChannel1":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .end local v9    # "e":Ljava/lang/InterruptedException;
    .end local v10    # "localhost":Ljava/net/InetAddress;
    :catch_1
    move-exception v9

    .line 549
    .local v9, "e":Ljava/net/UnknownHostException;
    invoke-virtual {v9}, Ljava/net/UnknownHostException;->printStackTrace()V

    goto :goto_3

    .line 530
    .end local v9    # "e":Ljava/net/UnknownHostException;
    .restart local v0    # "audioChannel0":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .restart local v1    # "audioChannel1":Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
    .restart local v10    # "localhost":Ljava/net/InetAddress;
    :catch_2
    move-exception v9

    .line 531
    .local v9, "e":Ljava/lang/InterruptedException;
    :try_start_7
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 540
    .end local v9    # "e":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v9

    .line 541
    .restart local v9    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_7
    .catch Ljava/net/UnknownHostException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_2
.end method

.method private declared-synchronized waitForState(Ljavax/media/Processor;I)Z
    .locals 4
    .param p1, "p"    # Ljavax/media/Processor;
    .param p2, "state"    # I

    .prologue
    const/4 v1, 0x0

    .line 452
    monitor-enter p0

    :try_start_0
    new-instance v2, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;

    invoke-direct {v2, p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;-><init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;)V

    invoke-interface {p1, v2}, Ljavax/media/Processor;->addControllerListener(Ljavax/media/ControllerListener;)V

    .line 453
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->failed:Z

    .line 456
    const/16 v2, 0xb4

    if-ne p2, v2, :cond_1

    .line 457
    invoke-interface {p1}, Ljavax/media/Processor;->configure()V

    .line 466
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljavax/media/Processor;->getState()I

    move-result v2

    if-ge v2, p2, :cond_3

    iget-boolean v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->failed:Z

    if-nez v2, :cond_3

    .line 467
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->getStateLock()Ljava/lang/Integer;

    move-result-object v2

    monitor-enter v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 469
    :try_start_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->getStateLock()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 474
    :try_start_2
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 452
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1

    .line 459
    :cond_1
    const/16 v2, 0x12c

    if-ne p2, v2, :cond_0

    .line 460
    :try_start_4
    invoke-interface {p1}, Ljavax/media/Processor;->realize()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 471
    :catch_0
    move-exception v0

    .line 472
    .local v0, "ie":Ljava/lang/InterruptedException;
    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 477
    .end local v0    # "ie":Ljava/lang/InterruptedException;
    :cond_2
    :goto_1
    monitor-exit p0

    return v1

    :cond_3
    :try_start_6
    iget-boolean v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->failed:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-nez v2, :cond_2

    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method getStateLock()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 444
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->stateLock:Ljava/lang/Integer;

    return-object v0
.end method

.method setFailed()V
    .locals 1

    .prologue
    .line 448
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->failed:Z

    .line 449
    return-void
.end method

.method public setTrasmit(Z)V
    .locals 5
    .param p1, "active"    # Z

    .prologue
    .line 416
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->sendStreams:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/media/rtp/SendStream;

    .line 418
    .local v2, "sendStream":Ljavax/media/rtp/SendStream;
    if-eqz p1, :cond_0

    .line 419
    :try_start_0
    invoke-interface {v2}, Ljavax/media/rtp/SendStream;->start()V

    .line 420
    sget-object v3, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v4, "START"

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 427
    :catch_0
    move-exception v0

    .line 428
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 423
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :try_start_1
    invoke-interface {v2}, Ljavax/media/rtp/SendStream;->stop()V

    .line 424
    sget-object v3, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v4, "STOP"

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 432
    .end local v2    # "sendStream":Ljavax/media/rtp/SendStream;
    :cond_1
    return-void
.end method

.method public declared-synchronized start()Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 128
    monitor-enter p0

    :try_start_0
    iget-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 151
    :goto_0
    monitor-exit p0

    return-object v2

    .line 131
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->createProcessor()Ljava/lang/String;

    move-result-object v0

    .line 132
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 133
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z

    .line 138
    :cond_1
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->createTransmitter()Ljava/lang/String;

    move-result-object v0

    .line 139
    if-eqz v0, :cond_2

    .line 140
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    invoke-interface {v1}, Ljavax/media/Processor;->close()V

    .line 141
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    .line 142
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z

    .line 149
    :goto_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    invoke-interface {v1}, Ljavax/media/Processor;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 128
    .end local v0    # "result":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 145
    .restart local v0    # "result":Ljava/lang/String;
    :cond_2
    const/4 v1, 0x1

    :try_start_2
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method public stop()V
    .locals 6

    .prologue
    .line 159
    iget-boolean v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z

    if-nez v5, :cond_0

    .line 182
    :goto_0
    return-void

    .line 160
    :cond_0
    monitor-enter p0

    .line 162
    const/4 v5, 0x0

    :try_start_0
    iput-boolean v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->started:Z

    .line 163
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    if-eqz v5, :cond_2

    .line 164
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    invoke-interface {v5}, Ljavax/media/Processor;->stop()V

    .line 165
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->processor:Ljavax/media/Processor;

    .line 167
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->rtpMgrs:[Ljavax/media/rtp/RTPManager;

    .local v0, "arr$":[Ljavax/media/rtp/RTPManager;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 168
    .local v4, "rtpMgr":Ljavax/media/rtp/RTPManager;
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    invoke-virtual {v4, v5}, Ljavax/media/rtp/RTPManager;->removeReceiveStreamListener(Ljavax/media/rtp/ReceiveStreamListener;)V

    .line 169
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->audioReceiver:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioReceiver;

    invoke-virtual {v4, v5}, Ljavax/media/rtp/RTPManager;->removeSessionListener(Ljavax/media/rtp/SessionListener;)V

    .line 170
    const-string/jumbo v5, "Session ended."

    invoke-virtual {v4, v5}, Ljavax/media/rtp/RTPManager;->removeTargets(Ljava/lang/String;)V

    .line 171
    invoke-virtual {v4}, Ljavax/media/rtp/RTPManager;->dispose()V

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 174
    .end local v4    # "rtpMgr":Ljavax/media/rtp/RTPManager;
    :cond_1
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->sendStreams:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    .end local v0    # "arr$":[Ljavax/media/rtp/RTPManager;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_2
    :goto_2
    :try_start_1
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v5

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 178
    :catch_0
    move-exception v1

    .line 179
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2
.end method
