.class interface abstract Lcom/mongodb/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation runtime Lorg/bson/util/annotations/ThreadSafe;
.end annotation


# virtual methods
.method public abstract getConnection(JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/Connection;
.end method

.method public abstract getDescription()Lcom/mongodb/ServerDescription;
.end method

.method public abstract invalidate()V
.end method
