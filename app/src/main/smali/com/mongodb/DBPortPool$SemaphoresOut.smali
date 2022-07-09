.class public Lcom/mongodb/DBPortPool$SemaphoresOut;
.super Lcom/mongodb/MongoWaitQueueFullException;
.source "DBPortPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBPortPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SemaphoresOut"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final message:Ljava/lang/String; = "Concurrent requests for database connection have exceeded limit"

.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 73
    const-string/jumbo v0, "Concurrent requests for database connection have exceeded limit"

    invoke-direct {p0, v0}, Lcom/mongodb/MongoWaitQueueFullException;-><init>(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method constructor <init>(I)V
    .locals 2
    .param p1, "numPermits"    # I

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Concurrent requests for database connection have exceeded limit of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/mongodb/MongoWaitQueueFullException;-><init>(Ljava/lang/String;)V

    .line 78
    return-void
.end method
