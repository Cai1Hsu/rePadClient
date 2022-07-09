.class Lcom/mongodb/NoOpConnectionPoolListener;
.super Ljava/lang/Object;
.source "NoOpConnectionPoolListener.java"

# interfaces
.implements Lcom/mongodb/ConnectionPoolListener;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionAdded(Lcom/mongodb/ConnectionEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 47
    return-void
.end method

.method public connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 35
    return-void
.end method

.method public connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 31
    return-void
.end method

.method public connectionPoolClosed(Lcom/mongodb/ConnectionPoolEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolEvent;

    .prologue
    .line 27
    return-void
.end method

.method public connectionPoolOpened(Lcom/mongodb/ConnectionPoolOpenedEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolOpenedEvent;

    .prologue
    .line 23
    return-void
.end method

.method public connectionRemoved(Lcom/mongodb/ConnectionEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionEvent;

    .prologue
    .line 51
    return-void
.end method

.method public waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 39
    return-void
.end method

.method public waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/mongodb/ConnectionPoolWaitQueueEvent;

    .prologue
    .line 43
    return-void
.end method
