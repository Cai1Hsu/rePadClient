.class public Lcom/mongodb/util/ConnectionPoolStatisticsBean;
.super Ljava/lang/Object;
.source "ConnectionPoolStatisticsBean.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final inUse:I

.field private final inUseConnections:[Lcom/mongodb/InUseConnectionBean;

.field private final total:I


# direct methods
.method public constructor <init>(II[Lcom/mongodb/InUseConnectionBean;)V
    .locals 0
    .param p1, "total"    # I
    .param p2, "inUse"    # I
    .param p3, "inUseConnections"    # [Lcom/mongodb/InUseConnectionBean;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput p1, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->total:I

    .line 36
    iput p2, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->inUse:I

    .line 37
    iput-object p3, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->inUseConnections:[Lcom/mongodb/InUseConnectionBean;

    .line 38
    return-void
.end method


# virtual methods
.method public getInUse()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->inUse:I

    return v0
.end method

.method public getInUseConnections()[Lcom/mongodb/InUseConnectionBean;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->inUseConnections:[Lcom/mongodb/InUseConnectionBean;

    return-object v0
.end method

.method public getTotal()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/mongodb/util/ConnectionPoolStatisticsBean;->total:I

    return v0
.end method
