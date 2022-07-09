.class public Lcom/mongodb/MongoServerSelectionException;
.super Lcom/mongodb/MongoClientException;
.source "MongoServerSelectionException.java"


# static fields
.field private static final serialVersionUID:J = -0x14c7836c9db0d416L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/mongodb/MongoClientException;-><init>(Ljava/lang/String;)V

    .line 28
    return-void
.end method
