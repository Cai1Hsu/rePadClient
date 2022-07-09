.class interface abstract Lcom/mongodb/ConnectionPoolListener;
.super Ljava/lang/Object;
.source "ConnectionPoolListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract connectionAdded(Lcom/mongodb/ConnectionEvent;)V
.end method

.method public abstract connectionCheckedIn(Lcom/mongodb/ConnectionEvent;)V
.end method

.method public abstract connectionCheckedOut(Lcom/mongodb/ConnectionEvent;)V
.end method

.method public abstract connectionPoolClosed(Lcom/mongodb/ConnectionPoolEvent;)V
.end method

.method public abstract connectionPoolOpened(Lcom/mongodb/ConnectionPoolOpenedEvent;)V
.end method

.method public abstract connectionRemoved(Lcom/mongodb/ConnectionEvent;)V
.end method

.method public abstract waitQueueEntered(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
.end method

.method public abstract waitQueueExited(Lcom/mongodb/ConnectionPoolWaitQueueEvent;)V
.end method
