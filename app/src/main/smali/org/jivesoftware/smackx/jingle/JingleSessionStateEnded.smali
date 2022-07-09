.class public Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;
.super Lorg/jivesoftware/smackx/jingle/JingleSessionState;
.source "JingleSessionStateEnded.java"


# static fields
.field private static INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    .line 32
    const/4 v0, 0x0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    return-void
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/JingleSessionState;-><init>()V

    .line 36
    return-void
.end method

.method public static declared-synchronized getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;
    .locals 2

    .prologue
    .line 43
    const-class v1, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;

    .line 47
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->INSTANCE:Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 43
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public enter()V
    .locals 2

    .prologue
    .line 51
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v1, "Session Ended"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 52
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleSessionStateEnded;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v1, "-------------------------------------------------------------------"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public exit()V
    .locals 0

    .prologue
    .line 59
    return-void
.end method

.method public processJingle(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 2
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p3, "action"    # Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .prologue
    .line 65
    const/4 v0, 0x0

    .line 67
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v1, Lorg/jivesoftware/smackx/packet/JingleError;->MALFORMED_STANZA:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-virtual {p1, p2, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 69
    return-object v0
.end method
