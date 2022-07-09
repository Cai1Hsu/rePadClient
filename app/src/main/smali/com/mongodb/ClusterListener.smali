.class interface abstract Lcom/mongodb/ClusterListener;
.super Ljava/lang/Object;
.source "ClusterListener.java"

# interfaces
.implements Ljava/util/EventListener;


# virtual methods
.method public abstract clusterClosed(Lcom/mongodb/ClusterEvent;)V
.end method

.method public abstract clusterDescriptionChanged(Lcom/mongodb/ClusterDescriptionChangedEvent;)V
.end method

.method public abstract clusterOpened(Lcom/mongodb/ClusterEvent;)V
.end method
