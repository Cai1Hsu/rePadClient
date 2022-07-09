.class public abstract Lorg/jivesoftware/smackx/jingle/JingleNegotiator;
.super Ljava/lang/Object;
.source "JingleNegotiator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/JingleNegotiator$1;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private expectedAckId:Ljava/lang/String;

.field private isStarted:Z

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;",
            ">;"
        }
    .end annotation
.end field

.field protected session:Lorg/jivesoftware/smackx/jingle/JingleSession;

.field private state:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    .line 73
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 74
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->state:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 75
    return-void
.end method


# virtual methods
.method public addExpectedId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->expectedAckId:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .prologue
    .line 173
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 174
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    monitor-exit v1

    .line 176
    return-void

    .line 175
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 259
    return-void
.end method

.method public abstract dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/IQ;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/IQ;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method protected abstract doStart()V
.end method

.method public getConnection()Lorg/jivesoftware/smack/Connection;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    .line 108
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getListenersList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 198
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    monitor-enter v2

    .line 199
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 200
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    monitor-exit v2

    .line 202
    return-object v0

    .line 200
    .end local v0    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->state:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    return-object v0
.end method

.method public getSession()Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object v0
.end method

.method public isExpectedId(Ljava/lang/String;)Z
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 148
    if-eqz p1, :cond_0

    .line 149
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->expectedAckId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 151
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 246
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->isStarted:Z

    return v0
.end method

.method public removeExpectedId(Ljava/lang/String;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 161
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->addExpectedId(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public removeListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .prologue
    .line 185
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 186
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 187
    monitor-exit v1

    .line 188
    return-void

    .line 187
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V
    .locals 4
    .param p1, "stateIs"    # Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->state:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 85
    .local v0, "stateWas":Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Negotiator state change: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 87
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiator$1;->$SwitchMap$org$jivesoftware$smackx$jingle$JingleNegotiatorState:[I

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 101
    :pswitch_0
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->state:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 102
    return-void

    .line 87
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setSession(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 127
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 128
    return-void
.end method

.method public start()V
    .locals 1

    .prologue
    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->isStarted:Z

    .line 242
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->doStart()V

    .line 243
    return-void
.end method
