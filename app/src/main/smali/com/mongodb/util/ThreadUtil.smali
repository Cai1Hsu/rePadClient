.class public Lcom/mongodb/util/ThreadUtil;
.super Ljava/lang/Object;
.source "ThreadUtil.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final _threads:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/mongodb/util/FastStack",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/mongodb/util/ThreadUtil;->_threads:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearStatus()V
    .locals 1

    .prologue
    .line 58
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/util/ThreadUtil;->clearStatus(Ljava/lang/Thread;)V

    .line 59
    return-void
.end method

.method public static clearStatus(Ljava/lang/Thread;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Thread;

    .prologue
    .line 62
    invoke-static {p0}, Lcom/mongodb/util/ThreadUtil;->getStatus(Ljava/lang/Thread;)Lcom/mongodb/util/FastStack;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/util/FastStack;->clear()V

    .line 63
    return-void
.end method

.method public static getStatus()Lcom/mongodb/util/FastStack;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mongodb/util/FastStack",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/util/ThreadUtil;->getStatus(Ljava/lang/Thread;)Lcom/mongodb/util/FastStack;

    move-result-object v0

    return-object v0
.end method

.method public static getStatus(Ljava/lang/Thread;)Lcom/mongodb/util/FastStack;
    .locals 4
    .param p0, "t"    # Ljava/lang/Thread;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Thread;",
            ")",
            "Lcom/mongodb/util/FastStack",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    sget-object v1, Lcom/mongodb/util/ThreadUtil;->_threads:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/util/FastStack;

    .line 71
    .local v0, "s":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 72
    new-instance v0, Lcom/mongodb/util/FastStack;

    .end local v0    # "s":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<Ljava/lang/String;>;"
    invoke-direct {v0}, Lcom/mongodb/util/FastStack;-><init>()V

    .line 73
    .restart local v0    # "s":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<Ljava/lang/String;>;"
    sget-object v1, Lcom/mongodb/util/ThreadUtil;->_threads:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    :cond_0
    return-object v0
.end method

.method public static printStackTrace()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    .line 34
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->fillInStackTrace()Ljava/lang/Throwable;

    .line 35
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 36
    return-void
.end method

.method public static pushStatus(Ljava/lang/String;)V
    .locals 1
    .param p0, "what"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mongodb/util/ThreadUtil;->pushStatus(Ljava/lang/Thread;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public static pushStatus(Ljava/lang/Thread;Ljava/lang/String;)V
    .locals 1
    .param p0, "t"    # Ljava/lang/Thread;
    .param p1, "what"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-static {p0}, Lcom/mongodb/util/ThreadUtil;->getStatus(Ljava/lang/Thread;)Lcom/mongodb/util/FastStack;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/util/FastStack;->push(Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public static sleep(J)V
    .locals 2
    .param p0, "time"    # J

    .prologue
    .line 43
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    goto :goto_0
.end method
