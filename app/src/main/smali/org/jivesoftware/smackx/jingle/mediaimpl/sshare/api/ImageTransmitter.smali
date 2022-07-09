.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;
.super Ljava/lang/Object;
.source "ImageTransmitter.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final KEYFRAME:I = 0xa

.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field public static final tileWidth:I = 0x19


# instance fields
.field private area:Ljava/awt/Rectangle;

.field private encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

.field private localHost:Ljava/net/InetAddress;

.field private localPort:I

.field private maxI:I

.field private maxJ:I

.field private on:Z

.field private remoteHost:Ljava/net/InetAddress;

.field private remotePort:I

.field private robot:Ljava/awt/Robot;

.field private socket:Ljava/net/DatagramSocket;

.field private tiles:[[[I

.field private transmit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/net/DatagramSocket;Ljava/net/InetAddress;ILjava/awt/Rectangle;)V
    .locals 6
    .param p1, "socket"    # Ljava/net/DatagramSocket;
    .param p2, "remoteHost"    # Ljava/net/InetAddress;
    .param p3, "remotePort"    # I
    .param p4, "area"    # Ljava/awt/Rectangle;

    .prologue
    const/4 v1, 0x1

    const-wide/high16 v4, 0x4039000000000000L    # 25.0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->on:Z

    .line 51
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->transmit:Z

    .line 63
    :try_start_0
    new-instance v1, Ljava/awt/Robot;

    invoke-direct {v1}, Ljava/awt/Robot;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->robot:Ljava/awt/Robot;

    .line 65
    invoke-virtual {p4}, Ljava/awt/Rectangle;->getWidth()D

    move-result-wide v2

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    iput v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxI:I

    .line 66
    invoke-virtual {p4}, Ljava/awt/Rectangle;->getHeight()D

    move-result-wide v2

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v1, v2

    iput v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxJ:I

    .line 68
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxI:I

    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxJ:I

    const/16 v3, 0x271

    filled-new-array {v1, v2, v3}, [I

    move-result-object v1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[[I

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->tiles:[[[I

    .line 70
    iput-object p4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->area:Ljava/awt/Rectangle;

    .line 71
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->socket:Ljava/net/DatagramSocket;

    .line 72
    invoke-virtual {p1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->localHost:Ljava/net/InetAddress;

    .line 73
    invoke-virtual {p1}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v1

    iput v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->localPort:I

    .line 74
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->remoteHost:Ljava/net/InetAddress;

    .line 75
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->remotePort:I

    .line 76
    new-instance v1, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultEncoder;

    invoke-direct {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultEncoder;-><init>()V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .line 78
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->transmit:Z
    :try_end_0
    .catch Ljava/awt/AWTException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :goto_0
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "e":Ljava/awt/AWTException;
    invoke-virtual {v0}, Ljava/awt/AWTException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getEncoder()Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    return-object v0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 183
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->start()V

    .line 184
    return-void
.end method

.method public setEncoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;)V
    .locals 0
    .param p1, "encoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .line 211
    return-void
.end method

.method public setTransmit(Z)V
    .locals 0
    .param p1, "transmit"    # Z

    .prologue
    .line 192
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->transmit:Z

    .line 193
    return-void
.end method

.method public start()V
    .locals 24

    .prologue
    .line 88
    const/16 v4, 0x400

    new-array v12, v4, [B

    .line 89
    .local v12, "buf":[B
    new-instance v20, Ljava/net/DatagramPacket;

    const/16 v4, 0x400

    move-object/from16 v0, v20

    invoke-direct {v0, v12, v4}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 91
    .local v20, "p":Ljava/net/DatagramPacket;
    const/16 v19, 0x0

    .line 93
    .local v19, "keyframe":I
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->on:Z

    if-eqz v4, :cond_7

    .line 94
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->transmit:Z

    if-eqz v4, :cond_0

    .line 96
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->robot:Ljava/awt/Robot;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->area:Ljava/awt/Rectangle;

    invoke-virtual {v4, v5}, Ljava/awt/Robot;->createScreenCapture(Ljava/awt/Rectangle;)Ljava/awt/image/BufferedImage;

    move-result-object v14

    .line 98
    .local v14, "capture":Ljava/awt/image/BufferedImage;
    new-instance v16, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;

    invoke-direct/range {v16 .. v16}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;-><init>()V

    .line 99
    .local v16, "filter":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;
    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v14, v4}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;->filter(Ljava/awt/image/BufferedImage;Ljava/awt/image/BufferedImage;)Ljava/awt/image/BufferedImage;

    move-result-object v14

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    .line 103
    .local v22, "trace":J
    add-int/lit8 v19, v19, 0x1

    const/16 v4, 0xa

    move/from16 v0, v19

    if-le v0, v4, :cond_1

    .line 104
    const/16 v19, 0x0

    .line 106
    :cond_1
    sget-object v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "KEYFRAME:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 108
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxI:I

    move/from16 v0, v17

    if-ge v0, v4, :cond_6

    .line 109
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_2
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->maxJ:I

    move/from16 v0, v18

    if-ge v0, v4, :cond_5

    .line 111
    mul-int/lit8 v4, v17, 0x19

    mul-int/lit8 v5, v18, 0x19

    const/16 v6, 0x19

    const/16 v7, 0x19

    invoke-virtual {v14, v4, v5, v6, v7}, Ljava/awt/image/BufferedImage;->getSubimage(IIII)Ljava/awt/image/BufferedImage;

    move-result-object v3

    .line 113
    .local v3, "bufferedImage":Ljava/awt/image/BufferedImage;
    const/16 v4, 0x271

    new-array v8, v4, [I

    .line 115
    .local v8, "pixels":[I
    new-instance v2, Ljava/awt/image/PixelGrabber;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x19

    const/16 v7, 0x19

    const/4 v9, 0x0

    const/16 v10, 0x19

    invoke-direct/range {v2 .. v10}, Ljava/awt/image/PixelGrabber;-><init>(Ljava/awt/Image;IIII[III)V

    .line 118
    .local v2, "pg":Ljava/awt/image/PixelGrabber;
    :try_start_0
    invoke-virtual {v2}, Ljava/awt/image/PixelGrabber;->grabPixels()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 120
    const/16 v4, 0xa

    move/from16 v0, v19

    if-eq v0, v4, :cond_2

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->tiles:[[[I

    aget-object v4, v4, v17

    aget-object v4, v4, v18

    invoke-static {v4, v8}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v4

    if-nez v4, :cond_4

    .line 122
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    invoke-interface {v4, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;->encode(Ljava/awt/image/BufferedImage;)Ljava/io/ByteArrayOutputStream;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v11

    .line 124
    .local v11, "baos":Ljava/io/ByteArrayOutputStream;
    if-eqz v11, :cond_4

    .line 128
    const-wide/16 v4, 0x1

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 130
    move/from16 v0, v17

    invoke-virtual {v11, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 131
    move/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 133
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    .line 135
    .local v13, "bytesOut":[B
    array-length v4, v13

    const/16 v5, 0x3e8

    if-le v4, v5, :cond_3

    .line 136
    sget-object v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Bytes out > 1000. Equals "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    array-length v6, v13

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 138
    :cond_3
    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/net/DatagramPacket;->setData([B)V

    .line 139
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->remoteHost:Ljava/net/InetAddress;

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/net/DatagramPacket;->setAddress(Ljava/net/InetAddress;)V

    .line 140
    move-object/from16 v0, p0

    iget v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->remotePort:I

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/net/DatagramPacket;->setPort(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2

    .line 143
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->socket:Ljava/net/DatagramSocket;

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 149
    :goto_3
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->tiles:[[[I

    aget-object v4, v4, v17

    aput-object v8, v4, v18

    .line 109
    .end local v11    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v13    # "bytesOut":[B
    :cond_4
    :goto_4
    add-int/lit8 v18, v18, 0x1

    goto/16 :goto_2

    .line 145
    .restart local v11    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "bytesOut":[B
    :catch_0
    move-exception v15

    .line 146
    .local v15, "e":Ljava/io/IOException;
    invoke-virtual {v15}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    .line 152
    .end local v13    # "bytesOut":[B
    .end local v15    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v4

    goto :goto_4

    .line 161
    .end local v11    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_2
    move-exception v15

    .line 162
    .local v15, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v15}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_4

    .line 108
    .end local v2    # "pg":Ljava/awt/image/PixelGrabber;
    .end local v3    # "bufferedImage":Ljava/awt/image/BufferedImage;
    .end local v8    # "pixels":[I
    .end local v15    # "e":Ljava/lang/InterruptedException;
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_1

    .line 167
    .end local v18    # "j":I
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v22, v4, v22

    .line 168
    sget-object v4, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Loop Time:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v22

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 170
    const-wide/16 v4, 0x1f4

    cmp-long v4, v22, v4

    if-gez v4, :cond_0

    .line 172
    const-wide/16 v4, 0x1f4

    sub-long v4, v4, v22

    :try_start_4
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_3

    goto/16 :goto_0

    .line 174
    :catch_3
    move-exception v15

    .line 175
    .restart local v15    # "e":Ljava/lang/InterruptedException;
    invoke-virtual {v15}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    .line 180
    .end local v14    # "capture":Ljava/awt/image/BufferedImage;
    .end local v15    # "e":Ljava/lang/InterruptedException;
    .end local v16    # "filter":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/QuantizeFilter;
    .end local v17    # "i":I
    .end local v22    # "trace":J
    :cond_7
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 217
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->transmit:Z

    .line 218
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->on:Z

    .line 219
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageTransmitter;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    .line 220
    return-void
.end method
