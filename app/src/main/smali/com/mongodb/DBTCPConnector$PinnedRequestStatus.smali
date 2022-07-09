.class Lcom/mongodb/DBTCPConnector$PinnedRequestStatus;
.super Ljava/lang/Object;
.source "DBTCPConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBTCPConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PinnedRequestStatus"
.end annotation


# instance fields
.field public nestedBindings:I

.field requestPort:Lcom/mongodb/DBPort;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
