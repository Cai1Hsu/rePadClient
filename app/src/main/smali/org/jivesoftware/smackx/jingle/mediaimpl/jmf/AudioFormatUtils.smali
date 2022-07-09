.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioFormatUtils;
.super Ljava/lang/Object;
.source "AudioFormatUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAudioFormat(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)Ljavax/media/format/AudioFormat;
    .locals 2
    .param p0, "payloadtype"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 42
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 50
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 44
    :pswitch_1
    new-instance v0, Ljavax/media/format/AudioFormat;

    const-string/jumbo v1, "ULAW/rtp"

    invoke-direct {v0, v1}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 46
    :pswitch_2
    new-instance v0, Ljavax/media/format/AudioFormat;

    const-string/jumbo v1, "gsm/rtp"

    invoke-direct {v0, v1}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 48
    :pswitch_3
    new-instance v0, Ljavax/media/format/AudioFormat;

    const-string/jumbo v1, "g723/rtp"

    invoke-direct {v0, v1}, Ljavax/media/format/AudioFormat;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 42
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
