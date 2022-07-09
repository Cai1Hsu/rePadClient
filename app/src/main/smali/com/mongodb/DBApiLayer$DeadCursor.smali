.class Lcom/mongodb/DBApiLayer$DeadCursor;
.super Ljava/lang/Object;
.source "DBApiLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBApiLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DeadCursor"
.end annotation


# instance fields
.field final host:Lcom/mongodb/ServerAddress;

.field final id:J


# direct methods
.method constructor <init>(JLcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "a"    # J
    .param p3, "b"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput-wide p1, p0, Lcom/mongodb/DBApiLayer$DeadCursor;->id:J

    .line 210
    iput-object p3, p0, Lcom/mongodb/DBApiLayer$DeadCursor;->host:Lcom/mongodb/ServerAddress;

    .line 211
    return-void
.end method
