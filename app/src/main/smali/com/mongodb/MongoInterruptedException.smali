.class public Lcom/mongodb/MongoInterruptedException;
.super Lcom/mongodb/MongoException;
.source "MongoInterruptedException.java"


# static fields
.field private static final serialVersionUID:J = -0x390b2345d3c65dc4L


# direct methods
.method public constructor <init>(Ljava/lang/InterruptedException;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/InterruptedException;

    .prologue
    .line 29
    const-string/jumbo v0, "A driver operation has been interrupted"

    invoke-direct {p0, v0, p1}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/InterruptedException;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/InterruptedException;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    return-void
.end method
