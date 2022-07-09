.class public interface abstract Lcom/mongodb/MongoConnectionPoolMXBean;
.super Ljava/lang/Object;
.source "MongoConnectionPoolMXBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract getHost()Ljava/lang/String;
.end method

.method public abstract getMaxSize()I
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getPort()I
.end method

.method public abstract getStatistics()Lcom/mongodb/util/ConnectionPoolStatisticsBean;
.end method
