.class public Lcom/mongodb/MongoWaitQueueFullException;
.super Lcom/mongodb/DBPortPool$NoMoreConnection;
.source "MongoWaitQueueFullException.java"


# static fields
.field private static final serialVersionUID:J = 0x1491751a38175231L


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/mongodb/DBPortPool$NoMoreConnection;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method
