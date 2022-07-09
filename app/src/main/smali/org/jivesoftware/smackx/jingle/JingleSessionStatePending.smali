.class public Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;
.super Lorg/jivesoftware/smackx/jingle/JingleSessionState;
.source "JingleSessionStatePending.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending$1;
    }
.end annotation


# static fields
.field private static INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSessionState;-><init>()V

    .line 34
    return-void
.end method

.method public static declared-synchronized getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;
    .locals 2

    .prologue
    .line 41
    const-class v1, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;

    .line 44
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 1
    .param p1, "inJingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method private receiveSessionAcceptAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "inJingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 114
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateActive;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 115
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    return-object v0
.end method

.method private receiveSessionTerminateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 124
    invoke-virtual {p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    .line 127
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    :try_start_0
    const-string/jumbo v2, "Closed remotely"

    invoke-virtual {p1, v2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->terminate(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 132
    :goto_0
    return-object v1

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public enter()V
    .locals 0

    .prologue
    .line 50
    return-void
.end method

.method public exit()V
    .locals 0

    .prologue
    .line 55
    return-void
.end method

.method public processJingle(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p3, "action"    # Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .prologue
    .line 58
    const/4 v0, 0x0

    .line 60
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending$1;->$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum:[I

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 92
    :goto_0
    :pswitch_0
    return-object v0

    .line 63
    :pswitch_1
    invoke-direct {p0, p2}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 64
    goto :goto_0

    .line 73
    :pswitch_2
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->receiveSessionAcceptAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 74
    goto :goto_0

    .line 80
    :pswitch_3
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->receiveSessionTerminateAction(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 81
    goto :goto_0

    .line 60
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method
