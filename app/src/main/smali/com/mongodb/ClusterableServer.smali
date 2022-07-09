.class interface abstract Lcom/mongodb/ClusterableServer;
.super Ljava/lang/Object;
.source "ClusterableServer.java"

# interfaces
.implements Lcom/mongodb/Server;


# virtual methods
.method public abstract addChangeListener(Lcom/mongodb/ChangeListener;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ChangeListener",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract close()V
.end method

.method public abstract connect()V
.end method

.method public abstract invalidate()V
.end method

.method public abstract isClosed()Z
.end method
